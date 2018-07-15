From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: REGRESSION: [RESEND PATCH v3 1/4] backlight: pwm_bl: linear
 interpolation between brightness-levels
Date: Sun, 15 Jul 2018 08:57:32 +0100
Message-ID: <20180715075732.GA2989@wychelm.lan>
References: <20180409083333.1249-1-enric.balletbo@collabora.com>
 <20180409083333.1249-2-enric.balletbo@collabora.com>
 <1531580895.7579.7.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531580895.7579.7.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: "dianders@google.com" <dianders@google.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>, "briannorris@google.com" <briannorris@google.com>, "amstan@google.com" <amstan@google.com>, "groeck@google.com" <groeck@google.com>
List-Id: linux-leds@vger.kernel.org

On Sat, Jul 14, 2018 at 03:08:17PM +0000, Marcel Ziswiler wrote:
> On Mon, 2018-04-09 at 10:33 +0200, Enric Balletbo i Serra wrote:
> > diff --git a/drivers/video/backlight/pwm_bl.c
> > b/drivers/video/backlight/pwm_bl.c
> > index 8e3f1245f5c5..f0a108ab570a 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -147,7 +147,11 @@ static int pwm_backlight_parse_dt(struct device
> > *dev,
> >  				  struct platform_pwm_backlight_data
> > *data)
> >  {
> >  	struct device_node *node = dev->of_node;
> > +	unsigned int num_levels = 0;
> > +	unsigned int levels_count;
> > +	unsigned int num_steps;

num_steps is not initialized...


> >  	struct property *prop;
> > +	unsigned int *table;
> >  	int length;
> >  	u32 value;
> >  	int ret;
> > @@ -167,6 +171,7 @@ static int pwm_backlight_parse_dt(struct device
> > *dev,
> >  	/* read brightness levels from DT property */
> >  	if (data->max_brightness > 0) {
> >  		size_t size = sizeof(*data->levels) * data-
> > >max_brightness;
> > +		unsigned int i, j, n = 0;
> >  
> >  		data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
> >  		if (!data->levels)
> > @@ -184,6 +189,84 @@ static int pwm_backlight_parse_dt(struct device
> > *dev,
> >  			return ret;
> >  
> >  		data->dft_brightness = value;
> > +
> > +		/*
> > +		 * This property is optional, if is set enables
> > linear
> > +		 * interpolation between each of the values of
> > brightness levels
> > +		 * and creates a new pre-computed table.
> > +		 */
> > +		of_property_read_u32(node, "num-interpolated-steps",
> > +				     &num_steps);

... this is not guaranteed to initialized num_steps ...

> > +
> > +		/*
> > +		 * Make sure that there is at least two entries in
> > the
> > +		 * brightness-levels table, otherwise we can't
> > interpolate
> > +		 * between two points.
> > +		 */
> > +		if (num_steps) {

... and we make a decision on it here.

Marcel: Can you try the following quick fix? It's untested on my side
        but very simple...

>From 6fa2fbeb017086147ac61981107a95cb8ae7b4e7 Mon Sep 17 00:00:00 2001
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Sun, 15 Jul 2018 08:49:05 +0100
Subject: [PATCH] backlight: pwm_bl: Fix uninitialized variable

Currently, if the DT does not define num-interpolated-steps then
num_steps is undefined meaning the interpolation code will deploy
randomly. Fix this.

Fixes: 573fe6d1c25c ("backlight: pwm_bl: Linear interpolation between
brightness-levels")
Reported-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/pwm_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 9ee4c1b735b2..bdfcc0a71db1 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -250,7 +250,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
 	struct device_node *node = dev->of_node;
 	unsigned int num_levels = 0;
 	unsigned int levels_count;
-	unsigned int num_steps;
+	unsigned int num_steps = 0;
 	struct property *prop;
 	unsigned int *table;
 	int length;
-- 
2.17.1
