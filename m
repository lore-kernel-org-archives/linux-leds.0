From: Bjorn Andersson <bjorn@kryo.se>
Subject: Re: [PATCH v2 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Tue, 17 Feb 2015 15:13:19 -0800
Message-ID: <CAJAp7Ojfa=OfRHWGmc0e0tWoP6Y5VNXLUkGetzJYcnnv0MKE_Q@mail.gmail.com>
References: <1422060853-1067-1-git-send-email-bjorn.andersson@sonymobile.com>
	<1422060853-1067-2-git-send-email-bjorn.andersson@sonymobile.com>
	<54DD77BA.5020808@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54DD77BA.5020808@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, Courtney Cavin <courtney.cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Feb 12, 2015 at 8:04 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
[..]
>> +
>> +static int pm8941_wled_remove(struct platform_device *pdev)
>> +{
>> +     struct pm8941_wled *wled;
>> +
>> +     wled = platform_get_drvdata(pdev);
>> +     led_classdev_unregister(&wled->cdev);
>
> Would be nice to have a devm for this one too.
>

I agree, will hack one up.

>> +
>> +     return 0;
>> +}
>> +
>> +static const struct of_device_id pm8941_wled_match_table[] = {
>> +     { .compatible = "qcom,pm8941-wled" },
>> +     {}
>> +};
>> +MODULE_DEVICE_TABLE(of, pm8941_wled_match_table);
>> +
>> +static struct platform_driver pm8941_wled_driver = {
>> +     .probe  = pm8941_wled_probe,
>> +     .remove = pm8941_wled_remove,
>> +     .driver = {
>> +             .name           = "pm8941-wled",
>> +             .owner          = THIS_MODULE,
>
> THIS_MODULE should be removed.
>

Right, we've had this patch in purgatory for too long time... Will update.

Regards,
Bjorn
