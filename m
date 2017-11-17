From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH V1 1/4] qcom: spmi-wled: Add support for qcom wled driver
Date: Thu, 16 Nov 2017 22:56:40 -0800
Message-ID: <20171117065640.GU28761@minitux>
References: <1510834717-21765-1-git-send-email-kgunda@codeaurora.org>
 <1510834717-21765-2-git-send-email-kgunda@codeaurora.org>
 <20171116165510.GP28761@minitux>
 <208c7332234581909f159ddb33ede32b@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:45473 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933854AbdKQG4o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Nov 2017 01:56:44 -0500
Received: by mail-pg0-f53.google.com with SMTP id 207so1276296pgc.12
        for <linux-leds@vger.kernel.org>; Thu, 16 Nov 2017 22:56:44 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <208c7332234581909f159ddb33ede32b@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: kgunda@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org

On Thu 16 Nov 22:36 PST 2017, kgunda@codeaurora.org wrote:

> On 2017-11-16 22:25, Bjorn Andersson wrote:
> > On Thu 16 Nov 04:18 PST 2017, Kiran Gunda wrote:
> > 
> > > WLED driver provides the interface to the display driver to
> > > adjust the brightness of the display backlight.
> > > 
> > 
> > Hi Kiran,
> > 
> > This driver has a lot in common with the already upstream pm8941-wled.c,
> > because it's just a new revision of the same block.
> > 
> > Please extend the existing driver rather than providing a new one
> > (and yes, renaming the file is okay).
> > 
> > Regards,
> > Bjorn
> 
> Hi Bjorn,
> 
> Yes this driver design is similar to pm8941, however the WLED HW block
> has undergone quite a few changes in analog and digital from PM8941 to
> PM8998.

I can see that, looking at the documentation.

> Few of them include splitting one module into wled-ctrl and wled-sink
> peripherals, changes in the register offsets and the bit
> interpretation.

This is typical and something we need to handle in all these drivers, to
avoid having one driver per platform.

> Hence we concluded that it was better to have a new driver to support
> this new gen WELD module and decouple it from the pm8941.

Okay, I can see how it's easier to not have to case about anything but
pmi8998 in this driver, but where do you add the support for other WLED
versions? What about PMI8994? Will there not be similar differences
(registers that has moved around) in the future?

> Also, going forward this driver will support AMOLED AVDD rail (not
> supported by pm8941) touching a few more registers/configuration and
> newer PMICs.

Is this a feature that was introduced in PMI8998? Will this support not
be dependent on the pmic version?

> So spinning off a new driver would make it cleaner and easier to
> extend further.
> 

It's for sure easier at this point in time, but your argumentation
implies that PMI8998+1 should go into it's own driver as well.

I suspect that if you're going to reuse this driver for future PMIC
versions you will have to deal with register layout differences and new
feature set, and as such I'm not convinced that a new driver is needed.


Can you give any concrete examples of where it is not possible or
undesirable to maintain the pm8941 support in the same driver?

Regards,
Bjorn
