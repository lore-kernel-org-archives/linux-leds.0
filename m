From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x LED driver
Date: Thu, 16 Nov 2017 21:19:37 -0500
Message-ID: <000001d35f4a$84b0e340$8e12a9c0$@gmail.com>
References: <20171115194203.13572-1-dmurphy@ti.com> <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com> <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com> <20171115222323.GA18290@amd> <82336eb7-2b89-d37b-d688-4e4302766346@gmail.com> <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:42841 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932080AbdKQCTk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Nov 2017 21:19:40 -0500
In-Reply-To: <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com>
Content-Language: en-us
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: 'Dan Murphy' <dmurphy@ti.com>, 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, 'Pavel Machek' <pavel@ucw.cz>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 'Lee Jones' <lee.jones@linaro.org>, 'Daniel Thompson' <daniel.thompson@linaro.org>

On Thursday, November 16, 2017 4:42 PM, Dan Murphy wrote:
> 
> Jacek
> 
> On 11/16/2017 02:14 PM, Jacek Anaszewski wrote:
> > Hi Dan and Pavel,
> >
> > On 11/15/2017 11:23 PM, Pavel Machek wrote:
> >> Hi!
> >>
> >>>> Shouldn't the driver be targeted for backlight subsystem then?
> >>>>
> >>>> Adding backlight maintainers.
> >>>>
> >>>
> >>> Great point!  I was not aware of the backlight subsystem.
> >>>
> >>> Looks like I need to create a back light version as well.
> >>>
> >>> Like the lp8788 did since this can be used as a LED driver beyond
> >>> display back lighting.
> >>
> >> No, definitely not two drivers for lp8788 hardware.
> >
> > I agree.
> >
> >> If that does not yet exist... you want to create glue layer to be able
> >> to use LED as a display backlight. (It may already exist, no idea).
> >>
> >> ...
> >>
> >> Actually or maybe a LED trigger. Just set LED's trigger to "this is
> >> display backlight".
> >
> > There is one already:
> >
> > drivers/leds/trigger/ledtrig-backlight.c
> >
> > It adds a LED class device to the fb_notifier_list
> > (drivers/video/fbdev/core/fb_notify.c)
> >
> > using fb_register_client(). The same is used in
> > backlight_device_register (drivers/video/backlight/backlight.c).
> >
> > Actually why do you want to have this driver in the LED subsystem,
> > if it is advertised as "designed for LCD display backlighting"?
> 
> Well this is also advertised as a driver for Smart phone and tablet
> devices.  And having worked with the Android lighting
> solutions this is the preferred subsystem for Android.  The Android OS
> manages the led brightness based on ALS values and in
> turn calls into the driver to control the brightness register through the
> vendor provided lighting HAL.
> 
> I am going to look at the backlight source to figure out how to get the
> same functionality using the backlight subsystem.
> Otherwise I will plug in this driver to the backlight subsystem through
> the notifier.


I also developed Android devices for a long time.
I think that modifying HAL will not be difficult.

Also, backlight subsystem will be similar with LED subsystem.
You can grasp it easily.

Best regards,
Jingoo Han

> 
> >
> > As a side note I can say that I've been always wondering why the two
> > subsystems for similar type of hardware.
> 
> This is my worry too.  Why do we need both subsystems to do the same
thing?
> 
> I don't see either having one advantage over the other.
> 
> 
> Dan
> >
> 
> 
> --
> ------------------
> Dan Murphy
