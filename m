From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 14:18:55 -0800
Message-ID: <20171130221855.GW28761@minitux>
References: <20171130113516.42c8bde2@canb.auug.org.au>
 <20171130030543.1071-1-bjorn.andersson@linaro.org>
 <20171130094019.GA21887@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34852 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750984AbdK3WTC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 30 Nov 2017 17:19:02 -0500
Received: by mail-pf0-f195.google.com with SMTP id j124so3731530pfc.2
        for <linux-leds@vger.kernel.org>; Thu, 30 Nov 2017 14:19:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171130094019.GA21887@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>

On Thu 30 Nov 01:40 PST 2017, Pavel Machek wrote:

> On Wed 2017-11-29 19:05:43, Bjorn Andersson wrote:
> > The pointer returned by of_device_get_match_data() doesn't have the same
> > size as u32 on 64-bit architectures, causing issues when compile testing
> > the driver on such platform. Make ledtype unsigned long instead, to
> > solve this problem.
> > 
> > Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Ummm... no?
> 
> extern const void *of_device_get_match_data(const struct device *dev);
> 

Right, this returns a pointer, which is of architecture dependent size.

> 
> > diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
> > index a52674327857..cc2afe81720d 100644
> > --- a/drivers/leds/leds-pm8058.c
> > +++ b/drivers/leds/leds-pm8058.c
> > @@ -29,7 +29,7 @@
> >  struct pm8058_led {
> >  	struct regmap *map;
> >  	u32 reg;
> > -	u32 ledtype;
> > +	unsigned long ledtype;
> 
> Make it void *. u32 is buggy. unsigned long is merely ugly code. void
> * is not nice, but certainly better than unsigned long.
> 

unsigned long is the integer type in the kernel that has the same size
as a pointer, similar to the C-standard's intptr_t. So this is the
idiomatic way to pass an integer data type via a pointer variable in the
kernel.

Regards,
Bjorn
