From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: Change uevent whenever brightness is set to 0
Date: Tue, 04 Aug 2015 12:52:28 +0200
Message-ID: <55C0996C.6020905@gmail.com>
References: <5500469A22567C4BAF673A6E86AFA3A40227C1D640EC@IR-CENTRAL.corp.innerrange.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:34216 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932331AbbHDKwb (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 4 Aug 2015 06:52:31 -0400
Received: by wibud3 with SMTP id ud3so171343889wib.1
        for <linux-leds@vger.kernel.org>; Tue, 04 Aug 2015 03:52:30 -0700 (PDT)
In-Reply-To: <5500469A22567C4BAF673A6E86AFA3A40227C1D640EC@IR-CENTRAL.corp.innerrange.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Craig McQueen <craig.mcqueen@innerrange.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Craig,

On 08/04/2015 05:56 AM, Craig McQueen wrote:
> I've written a udev rule to catch uevent "change" events, with the goal of setting LED user/group/permissions whenever trigger settings are changed.
>
> http://unix.stackexchange.com/a/202870/34376
>
> However, I've noticed that a TRIGGER uevent "change" event is generated every time an LED is turned off.
>
> E.g. in one terminal:
>      udevadm monitor -p
>
> In another terminal:
>      echo 0 > /sys/class/leds/beaglebone:green:usr3/brightness
>
> The first terminal shows:
>
>      KERNEL[15446.374466] change   /devices/leds/leds/beaglebone:green:usr3 (leds)
>      ACTION=change
>      DEVPATH=/devices/leds/leds/beaglebone:green:usr3
>      SEQNUM=39147
>      SUBSYSTEM=leds
>      TRIGGER=none
>
> This behaviour is not ideal, because I really only want this uevent if the trigger really has changed.
>
> I presume this is due to these two lines in brightness_store() in led-class.c:
> 	if (state == LED_OFF)
> 		led_trigger_remove(led_cdev);
>
> What would be the recommended way to improve this, so a TRIGGER uevent "change" event is only generated if the trigger is actually reset to 'none' in this scenario?
>
> I've noticed this on kernel 3.14.48 running on BeagleBone Black.
>

You can define your rule so that it would not be matched when
TRIGGER=none.

-- 
Best Regards,
Jacek Anaszewski
