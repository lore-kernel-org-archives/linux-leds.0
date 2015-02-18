From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Tue, 17 Feb 2015 18:45:39 -0800
Message-ID: <54E3FCD3.4000304@codeaurora.org>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>	<1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>	<54DD7CE5.5000302@codeaurora.org> <CAJAp7OgD3+mGZ02o6xAWkJvKoD4BcQWVD1GS87Niw_fcReBMMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJAp7OgD3+mGZ02o6xAWkJvKoD4BcQWVD1GS87Niw_fcReBMMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn@kryo.se>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 02/17/15 15:02, Bjorn Andersson wrote:
> On Thu, Feb 12, 2015 at 8:26 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> On 01/23/15 16:54, Bjorn Andersson wrote:
>>> +
>>> +static int pm8941_wled_set(struct led_classdev *cdev,
>>> +                        enum led_brightness value)
>>> +{
>>> +     struct pm8941_wled *wled;
>>> +     u8 ctrl = 0;
>>> +     u16 val;
>>> +     int rc;
>>> +     int i;
>>> +
>>> +     wled = container_of(cdev, struct pm8941_wled, cdev);
>>> +
>>> +     if (value != 0)
>>> +             ctrl = PM8941_WLED_REG_MOD_EN_BIT;
>>> +
>>> +     val = value * PM8941_WLED_REG_VAL_MAX / LED_FULL;
>>> +
>>> +     rc = regmap_update_bits(wled->regmap,
>>> +                     wled->addr + PM8941_WLED_REG_MOD_EN,
>>> +                     PM8941_WLED_REG_MOD_EN_MASK, ctrl);
>>> +     if (rc)
>>> +             return rc;
>>> +
>>> +     for (i = 0; i < wled->cfg.num_strings; ++i) {
>>> +             u8 v[2] = { val & 0xff, (val >> 8) & 0xf };
>>> +
>>> +             rc = regmap_bulk_write(wled->regmap,
>>> +                             wled->addr + PM8941_WLED_REG_VAL_BASE + 2 * i,
>>> +                             v, 2);
>>> +             if (rc)
>>> +                     return rc;
>>> +     }
>>> +
>>> +     rc = regmap_update_bits(wled->regmap,
>>> +                     wled->addr + PM8941_WLED_REG_SYNC,
>>> +                     PM8941_WLED_REG_SYNC_MASK, PM8941_WLED_REG_SYNC_ALL);
>>> +     if (rc)
>>> +             return rc;
>>> +
>>> +     rc = regmap_update_bits(wled->regmap,
>>> +                     wled->addr + PM8941_WLED_REG_SYNC,
>>> +                     PM8941_WLED_REG_SYNC_MASK, PM8941_WLED_REG_SYNC_CLEAR);
>>> +     return rc;
>>> +}
>> This doesn't seem to do anything for the OVP spike mentioned in this
>> patch[1]. Do you see that problem on your device? I imagine the PMIC is
>> the same.
>>
>> [1]
>> https://www.codeaurora.org/cgit/quic/la/kernel/msm/commit/?id=fef9e15072562f0f28dc7066dcdd69388df81ed3
>>
> That's odd, I can't find that fix in any officially supported releases
> for 8974 - which Courtney used as reference for this driver.
>
> Just to make sure I understand the solution; when disabling the sinks
> the over-voltage-protection sometimes triggers, so we should detect
> that and reset the ovp configuration?
>
> I presume the side effect would be that the sinks would not give any
> output until this is done?
>

It seems that commit is not very good at describing the problem. From
what I can tell, the inductor current may spike when the WLED is turned
off and the switch is stuck on (the circuit is a boost convertor). To
make sure this doesn't happen, we force an OVP so that the switch is
known to be open (i.e. off) and thus can't cause the current spike when
we disable.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
