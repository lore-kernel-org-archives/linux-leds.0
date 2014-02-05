From: Bryan Wu <cooloney@gmail.com>
Subject: Re: Implementing a platform driver w/ LEDs
Date: Wed, 5 Feb 2014 11:25:19 -0800
Message-ID: <CAK5ve-K53uBu-7aCF9=FZdKBDcRN=1EeA-hdR8S2+L_mrvFTBA@mail.gmail.com>
References: <52F28640.8080907@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:65100 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198AbaBETZk (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 5 Feb 2014 14:25:40 -0500
Received: by mail-lb0-f176.google.com with SMTP id w7so674475lbi.21
        for <linux-leds@vger.kernel.org>; Wed, 05 Feb 2014 11:25:39 -0800 (PST)
In-Reply-To: <52F28640.8080907@dell.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On Wed, Feb 5, 2014 at 10:43 AM, Mario Limonciello
<mario_limonciello@dell.com> wrote:
> Hi,
>
> I recently submitted a patch to add a platform driver for Alienware that one
> of the functions will be to control some lighting zones on the machine.  I
> originally started implementing it using the LED class but started to find
> it didn't really fit the LED class well so decided to do a custom sysfs
> interface.
>
> After submitting it, the platform driver maintainer (mjg59) recommended that
> I instead reach out to you to extend the LED class to better fit how the
> system is architected.
>
> The system has 3 lighting zones (HEAD, Left, Right).  Each of those lighting
> zones can independently customize the shades of red, green, blue, as well as
> the brightness intensity for the zone.
>
> So each zone has:
> 0x00 - 0xFF red shade
> 0x00 - 0xFF blue shade
> 0x00 - 0xFF green shade
> 0x00 - 0xFF brightness intensity
>
> Additionally the zone can be configured for different lighting combinations
> for three different states: Running, Booting, Suspended.  Running
> immediately modifies the colors in the zone. Booting modifies the colors
> when turned on but before the next modification of "running".  Suspended
> modifies the colors while the system is in S3.
>

I think for this use case, we need 2 drivers:

1. LED device driver for each lighting zone, it will supports red,
blue, green and brightness operation.

2. LED trigger driver provides events trigger when system running,
booting and suspended. It can send out event to your Alienware LED
device driver to do proper LED operations.

So the basic concept is splitting out real LED operations and event triggers.

> When I first started to implement this using the LED class I create it with
> 36 different LED nodes:
>
> alienware-wmi::running::head_red
> alienware-wmi::running::head_blue
> alienware-wmi::running::head_green
> alienware-wmi::running::head_brightness
> alienware-wmi::running::left_red
> alienware-wmi::running::left_blue
> alienware-wmi::running::left_green
> alienware-wmi::running::left_brightness
> alienware-wmi::running::right_red
> alienware-wmi::running::right_blue
> alienware-wmi::running::right_green
> alienware-wmi::running::right_brightness
>
> alienware-wmi::booting::head_red
> alienware-wmi::booting::head_blue
> alienware-wmi::booting::head_green
> alienware-wmi::booting::head_brightness
> alienware-wmi::booting::left_red
> alienware-wmi::booting::left_blue
> alienware-wmi::booting::left_green
> alienware-wmi::booting::left_brightness
> alienware-wmi::booting::right_red
> alienware-wmi::booting::right_blue
> alienware-wmi::booting::right_green
> alienware-wmi::booting::right_brightness
>
> alienware-wmi::suspend::head_red
> alienware-wmi::suspend::head_blue
> alienware-wmi::suspend::head_green
> alienware-wmi::suspend::head_brightness
> alienware-wmi::suspend::left_red
> alienware-wmi::suspend::left_blue
> alienware-wmi::suspend::left_green
> alienware-wmi::suspend::left_brightness
> alienware-wmi::suspend::right_red
> alienware-wmi::suspend::right_blue
> alienware-wmi::suspend::right_green
> alienware-wmi::suspend::right_brightness
>
> I thought this was rather confusing though because each individual node only
> has a single "brightness" member which doesn't really identify what is being
> changed.  The brightness node changes the overall brightness of the whole
> zone.  The color shades selected for each node are mixed to come up with the
> overall color for the zone.
>
> The three different modes (running/booting/suspend) all modify the same LEDs
> too, so it didn't seem to make sense to me that they had their own nodes.
>
> So given all of that, can you advise how you think this should be
> implemented?  Would it make sense to extend the LED class to better adapt to
> this?  Or do you think this is better suited for a custom sysfs interface as
> I've already done?  I'll attach the patch for the driver so you can see how
> I put it together with the custom sysfs interface.
>

I just went through the patch you attached quickly, but failed to find
anything related to system booting/running/suspended. So you plan to
do that by using user space script to talk with those sysfs interface?

Thanks,
-Bryan
