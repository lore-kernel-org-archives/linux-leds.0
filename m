From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Thu, 12 Feb 2015 11:20:13 -0800
Message-ID: <CAK5ve-L5VoXAO-XJsc2ewZchcTpXT2n2u---cz=rw3Ocfkq3TQ@mail.gmail.com>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
 <1422535712.28891.3.camel@mm-sol.com> <20150129190753.GN11960@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f178.google.com ([209.85.213.178]:34137 "EHLO
	mail-ig0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751246AbbBLTUe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Feb 2015 14:20:34 -0500
In-Reply-To: <20150129190753.GN11960@sonymobile.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, "Cavin, Courtney" <Courtney.Cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Thu, Jan 29, 2015 at 11:07 AM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Thu 29 Jan 04:48 PST 2015, Ivan T. Ivanov wrote:
>
>>
>> Hi Bjorn,
>>
>> Just few nitpick comments.
>>
>
> Thanks.
>
>> On Fri, 2015-01-23 at 16:54 -0800, Bjorn Andersson wrote:
>> > From: Courtney Cavin cavin@sonymobile.com>
>> >
>> > This adds support for the WLED ('White' LED) block on Qualcomm's
>> > PM8941 PMICs.
>> >
>> > Signed-off-by: Courtney Cavin cavin@sonymobile.com>
>> > Signed-off-by: Bjorn Andersson andersson@sonymobile.com>


I'm good with this patch and will merge it into my tree.

Thanks,
-Bryan

>> > ---
>> >  drivers/leds/Kconfig            |   8 +
>> >  drivers/leds/Makefile           |   1 +
>> >  drivers/leds/leds-pm8941-wled.c | 459 ++++++++++++++++++++++++++++++++++++++++
>> >  3 files changed, 468 insertions(+)
>> >  create mode 100644 drivers/leds/leds-pm8941-wled.c
>> >
>>
>> <snip>
>>
>> > +
>> > +#define PM8941_WLED_REG_VAL_BASE               0x40
>> > +#define  PM8941_WLED_REG_VAL_MAX               0xFFF
>> > +
>> > +#define PM8941_WLED_REG_MOD_EN                 0x46
>> > +#define  PM8941_WLED_REG_MOD_EN_BIT            BIT(7)
>> > +#define  PM8941_WLED_REG_MOD_EN_MASK           BIT(7)
>>
>> Is it possible bit definitions to have same indentation like registers offsets?
>>
>
> Well, yes ;)
>
> But I like the separation, so unless Bryan would like me to change it I prefer
> to leave it as is.
>
>> >
>> > +struct pm8941_wled_config {
>> > +       u32 i_boost_limit;
>> > +       u32 ovp;
>> > +       u32 switch_freq;
>> > +       u32 num_strings;
>> > +       u32 i_limit;
>> > +       bool cs_out_en;
>> > +       bool ext_gen;
>> > +       bool cabc_en;
>> > +};
>> > +
>>
>> Could this be further squashed to bellow structure?
>>
>
> It could, but I see that it would simplify things.
>
>> > +struct pm8941_wled {
>> > +       struct regmap *regmap;
>> > +       u16 addr;
>> > +
>> > +       struct led_classdev cdev;
>> > +
>> > +       struct pm8941_wled_config cfg;
>> > +};
>> > +
>> >
>>
>> <snip>
>>
>> > +static void pm8941_wled_set_brightness(struct led_classdev *cdev,
>> > +                                                                                       enum
>> > led_brightness value)
>> > +{
>> > +       if (pm8941_wled_set(cdev, value)) {
>>
>> pm8941_wled_set() is used only here, could it be merged into this function?
>>
>
> It could, but that would just mean that we move these lines into the tail of
> pm8941_wled_set and replace all the returns with a bunch of gotos. So I don't
> think it's cleaner.
>
>> > +               dev_err(cdev->dev, "Unable to set brightness\n");
>> > +               return;
>> > +       }
>> > +       cdev->brightness = value;
>> > +}
>> > +
>> >
>>
>> Otherwise it looks good. Driver is loaded and device is detected
>> properly (i have added readings for type and subtype registers).
>> Do you know where I can measure result from changing brightness
>> sysfs entry. I am using 8074 dragonboard?
>>
>
> I'm not sure how this is exposed on the dragonboard. I've tested it on Xperia
> Z1 (honami) and the display lights up nicely.
>
> Regards,
> Bjorn
