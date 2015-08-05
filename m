From: Craig McQueen <craig.mcqueen@innerrange.com>
Subject: RE: Change uevent whenever brightness is set to 0
Date: Wed, 5 Aug 2015 11:08:19 +1000
Message-ID: <5500469A22567C4BAF673A6E86AFA3A40227C1D641F5@IR-CENTRAL.corp.innerrange.com>
References: <5500469A22567C4BAF673A6E86AFA3A40227C1D640EC@IR-CENTRAL.corp.innerrange.com>
 <55C0996C.6020905@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from 122-143-146.dsl.connexus.net.au ([203.122.143.146]:51553 "EHLO
	remote.innerrange.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751188AbbHEBI3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 4 Aug 2015 21:08:29 -0400
In-Reply-To: <55C0996C.6020905@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

> -----Original Message-----
> From: Jacek Anaszewski [mailto:jacek.anaszewski@gmail.com]
> 
> Hi Craig,
> 
> On 08/04/2015 05:56 AM, Craig McQueen wrote:
> > I've written a udev rule to catch uevent "change" events, with the goal of
> setting LED user/group/permissions whenever trigger settings are changed.
> >
> > http://unix.stackexchange.com/a/202870/34376
> >
> > However, I've noticed that a TRIGGER uevent "change" event is generated
> every time an LED is turned off.
> >
> > E.g. in one terminal:
> >      udevadm monitor -p
> >
> > In another terminal:
> >      echo 0 > /sys/class/leds/beaglebone:green:usr3/brightness
> >
> > The first terminal shows:
> >
> >      KERNEL[15446.374466] change
> /devices/leds/leds/beaglebone:green:usr3 (leds)
> >      ACTION=change
> >      DEVPATH=/devices/leds/leds/beaglebone:green:usr3
> >      SEQNUM=39147
> >      SUBSYSTEM=leds
> >      TRIGGER=none
> >
> > This behaviour is not ideal, because I really only want this uevent if the
> trigger really has changed.
> >
> > I presume this is due to these two lines in brightness_store() in led-class.c:
> > 	if (state == LED_OFF)
> > 		led_trigger_remove(led_cdev);
> >
> > What would be the recommended way to improve this, so a TRIGGER
> uevent "change" event is only generated if the trigger is actually reset to
> 'none' in this scenario?
> >
> > I've noticed this on kernel 3.14.48 running on BeagleBone Black.
> >
> 
> You can define your rule so that it would not be matched when
> TRIGGER=none.

I tried adding TRIGGER!="none" as in this rule:

SUBSYSTEM=="leds", ACTION=="change", TRIGGER!="none", RUN+="/bin/chgrp -R leds /sys%p", RUN+="/bin/chmod -R g=u /sys%p"

But the rule never seems to run. I can't figure out why not. Unless the older version of udev I'm using (182) doesn't support !=.


Meanwhile, I have made the following local change to the kernel, which does avoid generating a uevent every time brightness is set to 0:

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 9d9c79f..e5700c4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -143,7 +143,8 @@ EXPORT_SYMBOL_GPL(led_trigger_set);
 void led_trigger_remove(struct led_classdev *led_cdev)
 {
        down_write(&led_cdev->trigger_lock);
-       led_trigger_set(led_cdev, NULL);
+       if (led_cdev->trigger)
+               led_trigger_set(led_cdev, NULL);
        up_write(&led_cdev->trigger_lock);
 }
 EXPORT_SYMBOL_GPL(led_trigger_remove);


It has the minor side-effect of not generating a uevent more than once if 'echo none > trigger' is done repeatedly. I don't think this is a problem. (But repeated 'echo timer > trigger' would still generate a uevent every time. I think this is in the realm of no-one-cares.)

-- 
Craig McQueen
