From: Craig McQueen <craig.mcqueen@innerrange.com.au>
Subject: RE: Bug when using both "set" and "blink" functions
Date: Tue, 28 Nov 2017 04:32:03 +0000
Message-ID: <d17eaa11b9d746d1aa12648f8c8ea4dd@innerrange.com.au>
References: <5c59633100dd45e2b28e46d78cbf930c@innerrange.com.au>
 <c967ba03-320e-8abd-6b6a-f2380ab2752b@gmail.com>
 <7d558c3c1f374177b441e4070f0b6665@innerrange.com.au>
 <d1bdbb28-6575-e4c1-6137-83c532714168@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.innerrange.com.au ([203.222.77.226]:44560 "EHLO
        mail.innerrange.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752488AbdK1EcI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Nov 2017 23:32:08 -0500
In-Reply-To: <d1bdbb28-6575-e4c1-6137-83c532714168@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Jacek Anaszewski wrote:
> On 11/27/2017 07:51 AM, Craig McQueen wrote:
> > Jacek Anaszewski wrote:
> >> I checked earlier discussed case i.e. disabling trigger and
> >> immediately setting brightness to non-zero value and it seems to work
> >> fine. Checked with uleds
> >> driver:
> >>
> >> # echo "timer" > trigger
> >> # echo 0 > brightness; echo 100 > brightness
> >>
> >> Brightness always is 100 after that, even when setting delay_on/off to 1.
> >
> > I still think there's a race condition, but you don't discover it when using
> userspace, because there's sufficient time between setting the brightness to
> 0 and later 100, for LED_BLINK_DISABLE to be processed in-between.
> >
> > But I'm using a custom kernel driver that tries to go from blinking to steady-
> on using these function calls:
> >
> > 		led_trigger_event(trigger, LED_OFF);   /* which calls
> led_set_brightness(led_cdev, LED_OFF) */
> > 		led_trigger_event(trigger, LED_FULL);  /* which calls
> > led_set_brightness(led_cdev, LED_FULL) */
> >
> > In this case, LED_BLINK_DISABLE is not yet processed before the second
> function call, so the second function call becomes ineffective, because the
> pending LED_BLINK_DISABLE is later processed, turning off the LED and
> leaving it off.
> 
> Have you verified it by inserting printks in the led_set_brightness() and
> brightness_set op of your driver?

No, I didn't verify it. I deduced it by code review of led-core.c, and its use of LED_BLINK_DISABLE in led_set_brightness() and set_brightness_delayed().

Then, I made a patch (in an earlier email) which modified led_set_brightness(), and that fixed the issue. However, I was concerned that there still could be a race condition if set_brightness_delayed() happened to run in the middle of a call to led_set_brightness(led_cdev, LED_FULL). In that case, the call led_set_brightness(led_cdev, LED_FULL) could still fail.

> Regardless of that, I strongly advise backporting the mainline patches.
> If that doesn't help then make sure that brightness_set op of your driver
> implements proper locking scheme.

The problem seems to be nothing to do with the brightness_set op of the driver.

> If that doesn't help too, then you could
> try to come up with your patch for the LED core, that fixes the issue for you.
> It can be hard to address your particular case otherwise.

This code in led-core.c seems quite tricky to avoid any race conditions, without using a spinlock or semaphore. Here is another proposal which I am considering:

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index ef1360445413..5fe7826deab2 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -109,8 +109,8 @@ static void set_brightness_delayed(struct work_struct *ws)
        int ret = 0;
 
        if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
-               led_cdev->delayed_set_value = LED_OFF;
                led_stop_software_blink(led_cdev);
+               led_cdev->delayed_set_value = led_cdev->new_blink_brightness;
        }
 
        ret = __led_set_brightness(led_cdev, led_cdev->delayed_set_value);
@@ -239,15 +239,24 @@ void led_set_brightness(struct led_classdev *led_cdev,
                 * work queue task to avoid problems in case we are called
                 * from hard irq context.
                 */
+               led_cdev->new_blink_brightness = brightness;
                if (brightness == LED_OFF) {
                        set_bit(LED_BLINK_DISABLE, &led_cdev->work_flags);
                        schedule_work(&led_cdev->set_brightness_work);
                } else {
                        set_bit(LED_BLINK_BRIGHTNESS_CHANGE,
                                &led_cdev->work_flags);
-                       led_cdev->new_blink_brightness = brightness;
                }
-               return;
+
+               if (test_bit(LED_BLINK_SW, &led_cdev->work_flags)) {
+                       /*
+                        * Test LED_BLINK_SW again, to handle race condition
+                        * with set_brightness_delayed(). If it's no longer
+                        * set, then blink has just been stopped, so continue
+                        * with led_set_brightness_nosleep() below.
+                        */
+                       return;
+               }
        }
 
        led_set_brightness_nosleep(led_cdev, brightness);


-- 
Craig McQueen
