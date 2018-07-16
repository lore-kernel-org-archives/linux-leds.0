From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: REGRESSION: [RESEND PATCH v3 1/4] backlight: pwm_bl: linear
 interpolation between brightness-levels
Date: Mon, 16 Jul 2018 14:51:27 +0100
Message-ID: <20180716135127.2hvlqxi6mibp7yrh@holly.lan>
References: <20180409083333.1249-1-enric.balletbo@collabora.com>
 <20180409083333.1249-2-enric.balletbo@collabora.com>
 <1531580895.7579.7.camel@toradex.com>
 <20180715075732.GA2989@wychelm.lan>
 <1531664796.7579.13.camel@toradex.com>
 <20180716094223.syzwviia4wdx74yh@holly.lan>
 <1531742247.6547.4.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531742247.6547.4.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dianders@google.com" <dianders@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>, "briannorris@google.com" <briannorris@google.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "amstan@google.com" <amstan@google.com>, "groeck@google.com" <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Mon, Jul 16, 2018 at 11:57:29AM +0000, Marcel Ziswiler wrote:
> On Mon, 2018-07-16 at 10:42 +0100, Daniel Thompson wrote:
> > > 
> > > From dbb31d00c9f2873affedbceae917c9d7fce5f832 Mon Sep 17 00:00:00
> > > 2001
> > > Message-Id:
> > > <dbb31d00c9f2873affedbceae917c9d7fce5f832.1531664663.git.ma
> > > rcel.ziswiler@toradex.com>
> > > From: Daniel Thompson <daniel.thompson@linaro.org>
> > > Date: Sun, 15 Jul 2018 08:49:05 +0100
> > > Subject: [PATCH] backlight: pwm_bl: Fix uninitialized variable
> > > 
> > > Currently, if the DT does not define num-interpolated-steps then
> > > num_steps is undefined meaning the interpolation code will deploy
> > > randomly. Fix this.
> > > 
> > > Fixes: 573fe6d1c25c ("backlight: pwm_bl: Linear interpolation
> > > between
> > > brightness-levels")
> > > Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > Is it Tested-by: too? It would be good to confirm I was right about
> > the
> > cause of the problem.
> 
> Yes and I confirm you were right.

Thanks.


> > >  drivers/video/backlight/pwm_bl.c | 18 ++++++++----------
> > >  1 file changed, 8 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/pwm_bl.c
> > > b/drivers/video/backlight/pwm_bl.c
> > > index 9ee4c1b735b2..e884d589378d 100644
> > > --- a/drivers/video/backlight/pwm_bl.c
> > > +++ b/drivers/video/backlight/pwm_bl.c
> > > @@ -250,7 +250,7 @@ static int pwm_backlight_parse_dt(struct device
> > > *dev,
> > >  	struct device_node *node = dev->of_node;
> > >  	unsigned int num_levels = 0;
> > >  	unsigned int levels_count;
> > > -	unsigned int num_steps;
> > > +	unsigned int num_steps = 0;
> > 
> > This can go. If we check the return code them this variable is no
> > longer
> > used uninitialized [I'm OK to make the change though... since you've
> > kept my name at the top ;-) ].
> 
> Yes, I confirm that this works for me. Are you gona send a proper patch
> out or should I do it?

I can send it out.


Daniel.
