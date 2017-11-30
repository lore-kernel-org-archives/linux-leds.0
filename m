From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Fri, 1 Dec 2017 10:14:03 +1100
Message-ID: <20171201101351.3e57f2b1@canb.auug.org.au>
References: <20171130113516.42c8bde2@canb.auug.org.au>
        <20171130030543.1071-1-bjorn.andersson@linaro.org>
        <20171130094019.GA21887@amd>
        <545eb1a6-3235-9fe6-1d0d-958aa13e5170@gmail.com>
        <20171130223406.GC2808@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47809 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750921AbdK3XOF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 30 Nov 2017 18:14:05 -0500
In-Reply-To: <20171130223406.GC2808@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>

Hi Pavel,

On Thu, 30 Nov 2017 23:34:07 +0100 Pavel Machek <pavel@ucw.cz> wrote:
>
> On Thu 2017-11-30 22:58:55, Jacek Anaszewski wrote:
> > On 11/30/2017 10:40 AM, Pavel Machek wrote:  
> > > On Wed 2017-11-29 19:05:43, Bjorn Andersson wrote:  
> > >> The pointer returned by of_device_get_match_data() doesn't have the same
> > >> size as u32 on 64-bit architectures, causing issues when compile testing
> > >> the driver on such platform. Make ledtype unsigned long instead, to
> > >> solve this problem.
> > >>
> > >> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> > >> Cc: Linus Walleij <linus.walleij@linaro.org>
> > >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>  
> > > 
> > > Ummm... no?
> > > 
> > > extern const void *of_device_get_match_data(const struct device *dev);
> > > 
> > >   
> > >> diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
> > >> index a52674327857..cc2afe81720d 100644
> > >> --- a/drivers/leds/leds-pm8058.c
> > >> +++ b/drivers/leds/leds-pm8058.c
> > >> @@ -29,7 +29,7 @@
> > >>  struct pm8058_led {
> > >>  	struct regmap *map;
> > >>  	u32 reg;
> > >> -	u32 ledtype;
> > >> +	unsigned long ledtype;  
> > > 
> > > Make it void *. u32 is buggy. unsigned long is merely ugly code. void
> > > * is not nice, but certainly better than unsigned long.  
> > 
> > unsigned long is correct, see below:
> > 
> > static const struct of_device_id pm8058_leds_id_table[] = {
> >         {
> >                 .compatible = "qcom,pm8058-led",
> >                 .data = (void *)PM8058_LED_TYPE_COMMON
> >         },
> >         {
> >                 .compatible = "qcom,pm8058-keypad-led",
> >                 .data = (void *)PM8058_LED_TYPE_KEYPAD
> >         },
> >         {
> >                 .compatible = "qcom,pm8058-flash-led",
> >                 .data = (void *)PM8058_LED_TYPE_FLASH
> >         },
> >         { },
> > };
> > 
> > of_device_get_match_data will return PM8058_LED_TYPE_*
> > which clearly is a led type identifier.
> > 
> > Thus unsigned long looks reasonable.  
> 
> Hmm. Ok. So u32 would actually make even more sense there (because
> PM8058_LED_TYPE_* does not really need to be 64-bit), but it would
> cause a warning.
> 
> I don't like this. This fix actually makes code waste memory and is
> uglier.
> 
> ...but we get a warning fix. So I don't like the patch, but it is an
> improvement...

I *think* you can get away with (u32)(unsigned long)ptr ...
-- 
Cheers,
Stephen Rothwell
