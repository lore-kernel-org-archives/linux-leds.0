From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Problem with resetting LED in led_classdev_unregister in case of
 USB LED device removal
Date: Mon, 18 Jan 2016 21:52:26 +0100
Message-ID: <569D508A.8010906@gmail.com>
References: <569AB77D.3020909@gmail.com> <569C2FDB.8090005@ti.com>
 <569C8822.2000203@gmail.com> <569CA67F.3070204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:35866 "EHLO
	mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756504AbcARUwf (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 18 Jan 2016 15:52:35 -0500
Received: by mail-wm0-f44.google.com with SMTP id l65so114251307wmf.1
        for <linux-leds@vger.kernel.org>; Mon, 18 Jan 2016 12:52:34 -0800 (PST)
In-Reply-To: <569CA67F.3070204@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Milo Kim <milo.kim@ti.com>, linux-leds@vger.kernel.org

Am 18.01.2016 um 09:46 schrieb Jacek Anaszewski:
> Hi Heiner, Milo,
> 
> On 01/18/2016 07:37 AM, Heiner Kallweit wrote:
>> Am 18.01.2016 um 01:20 schrieb Milo Kim:
>>> On 01/17/2016 06:34 AM, Heiner Kallweit wrote:
>>>> In led_classdev_unregister the LED gets switched off.
>>>> This is fine when the driver module is removed but causes issues
>>>> when the physical LED device is removed (e.g. USB LED devices).
>>>>
>>>> In case of the thingm driver (hid/hid-thingm.c) it complains with
>>>> ENODEV because the physical LED device is no longer available.
>>>
>>> I'd like to understand this situation clearly.
>>>
>>> rmmod hid_thingm
>>> -> detach the USB LED device
>>> -> -ENODEV is reported.
>>>
>>> Is it correct? I think -ENODEV seems reasonable because HID device is gone. Could you tell us what the problem is?
>>>
>> Sure, this is reasonable. The problem is that this causes dev_err messages.
>> And if it's a normal situation it shouldn't result in error messages (at least not on error level).
>>
>>>> When I switched this driver to use the generic workqueue in the
>>>> LED core then this error was also propagated to set_brightness_delayed
>>>> and it complains with "Setting an LED's brightness failed (-19)".
>>>>
>>>> Recent commit d1aa577f5e19 [turn off the LED and wait for completion
>>>> on unregistering LED class device] tackled a first potential issue
>>>> in led_classdev_unregister but it seems like the case of removal
>>>> of the physical LED device hasn't been considered yet.
>>>
>>> What happens if resetting only this commit?
>>>
>> It's not that something with this commit is wrong. The behaviour was the same before, I just mention it
>> because you addressed the same part of the code and maybe stumbled across the same issue.
>>
>>>> At a first glance I see no way for the LED core to tell between
>>>> the two unregister cases (driver module removal vs. physical LED
>>>> device removal), but maybe I miss something.
>>>>
>>>> If we can't tell between the two cases them I'm not sure what's the
>>>> best solution: Not touching the brightness is general in
>>>> led_classdev_unregister, live with the situation as it is or add
>>>> a special handling for ENODEV.
>>>
>>> We may handle this by using internal flag in LED subsystem, but I'd like to understand what the problem is and what expected behavior is.
> 
> Yes, this seems to be the best solution. Driver should set this flag
> before calling led_classdev_unregister. If the flag is set the -ENODEV
> error will not be reported. It could be named LED_HW_ABSENT for
> instance. Feel free to propose other ideas.
> 
Setting such a flag from the driver might cause significant effort in different layers.
When we talk about thingm as an example, it uses the hid subsystem with the usbhid low level driver.
We would need a callback in the usbhid driver (to be notified when the device is unplugged)
and a way to propagate this event to the hid core.

Maybe simpler: We could ignore ENODEV errors if a function is called from led_classdev_unregister.
This way we wouldn't have to touch drivers. I think of something like this:

---
 drivers/leds/led-class.c | 2 ++
 drivers/leds/led-core.c  | 4 +++-
 include/linux/leds.h     | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 14139c3..aa84e5b 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -245,6 +245,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	up_write(&led_cdev->trigger_lock);
 #endif
 
+	led_cdev->flags |= LED_UNREGISTERING;
+
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 19e1e60..7a1bd98 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -98,7 +98,9 @@ static void set_brightness_delayed(struct work_struct *ws)
 						led_cdev->delayed_set_value);
 	else
 		ret = -ENOTSUPP;
-	if (ret < 0)
+	if (ret < 0 &&
+	    /* LED HW might have been unplugged, therefore don't warn */
+	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING)))
 		dev_err(led_cdev->dev,
 			"Setting an LED's brightness failed (%d)\n", ret);
 }
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 4429887..b8ee1ad 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -39,6 +39,7 @@ struct led_classdev {
 
 	/* Lower 16 bits reflect status */
 #define LED_SUSPENDED		(1 << 0)
+#define LED_UNREGISTERING	(1 << 1)
 	/* Upper 16 bits reflect control information */
 #define LED_CORE_SUSPENDRESUME	(1 << 16)
 #define LED_BLINK_ONESHOT	(1 << 17)
-- 
2.7.0
