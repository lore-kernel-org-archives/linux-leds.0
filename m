From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Thu, 29 Jan 2015 11:07:55 -0800
Message-ID: <20150129190753.GN11960@sonymobile.com>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
 <1422535712.28891.3.camel@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1422535712.28891.3.camel-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Cavin, Courtney" <Courtney.Cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Thu 29 Jan 04:48 PST 2015, Ivan T. Ivanov wrote:

> 
> Hi Bjorn,
> 
> Just few nitpick comments. 
> 

Thanks.

> On Fri, 2015-01-23 at 16:54 -0800, Bjorn Andersson wrote:
> > From: Courtney Cavin cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > 
> > This adds support for the WLED ('White' LED) block on Qualcomm's
> > PM8941 PMICs.
> > 
> > Signed-off-by: Courtney Cavin cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > Signed-off-by: Bjorn Andersson andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> > ---
> >  drivers/leds/Kconfig            |   8 +
> >  drivers/leds/Makefile           |   1 +
> >  drivers/leds/leds-pm8941-wled.c | 459 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 468 insertions(+)
> >  create mode 100644 drivers/leds/leds-pm8941-wled.c
> > 
> 
> <snip>
> 
> > +
> > +#define PM8941_WLED_REG_VAL_BASE               0x40
> > +#define  PM8941_WLED_REG_VAL_MAX               0xFFF
> > +
> > +#define PM8941_WLED_REG_MOD_EN                 0x46
> > +#define  PM8941_WLED_REG_MOD_EN_BIT            BIT(7)
> > +#define  PM8941_WLED_REG_MOD_EN_MASK           BIT(7)
> 
> Is it possible bit definitions to have same indentation like registers offsets?
> 

Well, yes ;)

But I like the separation, so unless Bryan would like me to change it I prefer
to leave it as is.

> > 
> > +struct pm8941_wled_config {
> > +       u32 i_boost_limit;
> > +       u32 ovp;
> > +       u32 switch_freq;
> > +       u32 num_strings;
> > +       u32 i_limit;
> > +       bool cs_out_en;
> > +       bool ext_gen;
> > +       bool cabc_en;
> > +};
> > +
> 
> Could this be further squashed to bellow structure?
> 

It could, but I see that it would simplify things.

> > +struct pm8941_wled {
> > +       struct regmap *regmap;
> > +       u16 addr;
> > +
> > +       struct led_classdev cdev;
> > +
> > +       struct pm8941_wled_config cfg;
> > +};
> > +
> > 
> 
> <snip>
> 
> > +static void pm8941_wled_set_brightness(struct led_classdev *cdev,
> > +                                                                                       enum 
> > led_brightness value)
> > +{
> > +       if (pm8941_wled_set(cdev, value)) {
> 
> pm8941_wled_set() is used only here, could it be merged into this function?
>  

It could, but that would just mean that we move these lines into the tail of
pm8941_wled_set and replace all the returns with a bunch of gotos. So I don't
think it's cleaner.

> > +               dev_err(cdev->dev, "Unable to set brightness\n");
> > +               return;
> > +       }
> > +       cdev->brightness = value;
> > +}
> > +
> > 
> 
> Otherwise it looks good. Driver is loaded and device is detected
> properly (i have added readings for type and subtype registers).
> Do you know where I can measure result from changing brightness 
> sysfs entry. I am using 8074 dragonboard?
> 

I'm not sure how this is exposed on the dragonboard. I've tested it on Xperia
Z1 (honami) and the display lights up nicely.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
