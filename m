From: Tony Makkiel <tony.makkiel@daqri.com>
Subject: Brightness control irrespective of blink state.
Date: Fri, 6 May 2016 19:25:52 +0100
Message-ID: <572CE1B0.8040001@daqri.com>
References: <1461881020-13964-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1461881020-13964-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <57230B26.9010300@samsung.com> <572C5DEE.3070307@samsung.com>
 <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36088 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755867AbcEFSZ6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 6 May 2016 14:25:58 -0400
Received: by mail-wm0-f51.google.com with SMTP id n129so67711758wmn.1
        for <linux-leds@vger.kernel.org>; Fri, 06 May 2016 11:25:57 -0700 (PDT)
Received: from [192.168.1.25] ([81.139.40.162])
        by smtp.gmail.com with ESMTPSA id r8sm9693872wme.14.2016.05.06.11.25.55
        for <linux-leds@vger.kernel.org>
        (version=TLSv1/SSLv3 cipher=OTHER);
        Fri, 06 May 2016 11:25:56 -0700 (PDT)
In-Reply-To: <CAAEAJfD_U1Z=wXQbK+DNdhZj5KEDkd3sK8mbBLNOvtKbZd1zYg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linux LED Subsystem <linux-leds@vger.kernel.org>

Hi All,
	Is there a reason for rejecting brightness change requests when either 
of the blink_delays are set? Shouldn't the function be allowed to call 
"led_set_brightness_sync"?

I am referring to "led_set_brightness" in led-core.c.

With the following change, the brightness of led can be varied 
irrespective of blinking state. But wanted to check if that is a bad idea?

Many Thanks,
Tony


--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -190,7 +191,15 @@ EXPORT_SYMBOL_GPL(led_stop_software_blink);
  void led_set_brightness(struct led_classdev *led_cdev,
                         enum led_brightness brightness)
  {
-       int ret = 0;
+       int ret = -EINVAL;
+
+       if (led_cdev->flags & SET_BRIGHTNESS_SYNC){
+               ret = led_set_brightness_sync(led_cdev, brightness);
+               if (ret < 0)
+                       dev_dbg(led_cdev->dev,
+                               "Setting LED brightness failed (%d)\n", 
ret);
+               return;
+       }

         /* delay brightness if soft-blink is active */
         if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
@@ -203,14 +212,8 @@ void led_set_brightness(struct led_classdev *led_cdev,
         if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
                 led_set_brightness_async(led_cdev, brightness);
                 return;
-       } else if (led_cdev->flags & SET_BRIGHTNESS_SYNC)
-               ret = led_set_brightness_sync(led_cdev, brightness);
-       else
-               ret = -EINVAL;
-
-       if (ret < 0)
-               dev_dbg(led_cdev->dev, "Setting LED brightness failed 
(%d)\n",
-                       ret);
+       }
+       dev_dbg(led_cdev->dev, "Setting LED brightness failed (%d)\n", ret);
  }
  EXPORT_SYMBOL(led_set_brightness);
