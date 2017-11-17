From: "Jingoo Han" <jingoohan1@gmail.com>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x LED driver
Date: Fri, 17 Nov 2017 11:30:09 -0500
Message-ID: <000b01d35fc1$57ad0500$07070f00$@gmail.com>
References: <20171115194203.13572-1-dmurphy@ti.com> <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com> <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com> <20171115222323.GA18290@amd> <82336eb7-2b89-d37b-d688-4e4302766346@gmail.com> <16189eab-5541-9550-c027-1c9d2b5fa6d7@ti.com> <20171117112032.GA13855@amd>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171117112032.GA13855@amd>
Content-Language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Pavel Machek' <pavel@ucw.cz>, 'Dan Murphy' <dmurphy@ti.com>
Cc: 'Jacek Anaszewski' <jacek.anaszewski@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 'Lee Jones' <lee.jones@linaro.org>, 'Daniel Thompson' <daniel.thompson@linaro.org>
List-Id: linux-leds@vger.kernel.org

On Friday, November 17, 2017 6:21 AM, Pavel Machek wrote:
> 
> Hi!
> 
> > >> If that does not yet exist... you want to create glue layer to be
> able
> > >> to use LED as a display backlight. (It may already exist, no idea).
> > >>
> > >> ...
> > >>
> > >> Actually or maybe a LED trigger. Just set LED's trigger to "this is
> > >> display backlight".
> > >
> > > There is one already:
> > >
> > > drivers/leds/trigger/ledtrig-backlight.c
> > >
> > > It adds a LED class device to the fb_notifier_list
> > > (drivers/video/fbdev/core/fb_notify.c)
> > >
> > > using fb_register_client(). The same is used in
> > > backlight_device_register (drivers/video/backlight/backlight.c).
> > >
> > > Actually why do you want to have this driver in the LED subsystem,
> > > if it is advertised as "designed for LCD display backlighting"?
> >
> > Well this is also advertised as a driver for Smart phone and tablet
> devices.  And having worked with the Android lighting
> > solutions this is the preferred subsystem for Android.  The Android OS
> manages the led brightness based on ALS values and in
> > turn calls into the driver to control the brightness register through
> the vendor provided lighting HAL.
> >
> 
> Well.. if it can control other LEDs than just backlight, I believe it
> can stay in the LED subsystem.

I also agree with your opinion.

Best regards,
Jingoo Han

> 
> > I am going to look at the backlight source to figure out how to get the
> same functionality using the backlight subsystem.
> > Otherwise I will plug in this driver to the backlight subsystem through
> the notifier.
> >
> 
> The backlight trigger should be ok.
> 
> Best regards,
>
Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
