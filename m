From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Thu, 16 Nov 2017 21:14:13 +0100
Message-ID: <82336eb7-2b89-d37b-d688-4e4302766346@gmail.com>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com>
 <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com> <20171115222323.GA18290@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:45244 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932144AbdKPUPM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Nov 2017 15:15:12 -0500
In-Reply-To: <20171115222323.GA18290@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>

Hi Dan and Pavel,

On 11/15/2017 11:23 PM, Pavel Machek wrote:
> Hi!
> 
>>> Shouldn't the driver be targeted for backlight subsystem then?
>>>
>>> Adding backlight maintainers.
>>>
>>
>> Great point!  I was not aware of the backlight subsystem.
>>
>> Looks like I need to create a back light version as well.
>>
>> Like the lp8788 did since this can be used as a LED driver beyond
>> display back lighting.
> 
> No, definitely not two drivers for lp8788 hardware.

I agree.

> If that does not yet exist... you want to create glue layer to be able
> to use LED as a display backlight. (It may already exist, no idea).
> 
> ...
> 
> Actually or maybe a LED trigger. Just set LED's trigger to "this is
> display backlight".

There is one already:

drivers/leds/trigger/ledtrig-backlight.c

It adds a LED class device to the fb_notifier_list
(drivers/video/fbdev/core/fb_notify.c)

using fb_register_client(). The same is used in
backlight_device_register (drivers/video/backlight/backlight.c).

Actually why do you want to have this driver in the LED subsystem,
if it is advertised as "designed for LCD display backlighting"?

As a side note I can say that I've been always wondering why the two
subsystems for similar type of hardware.

-- 
Best regards,
Jacek Anaszewski
