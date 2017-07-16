From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Sat, 15 Jul 2017 22:35:29 -0700
Message-ID: <20170716053529.GS1618@tuxbook>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-4-bjorn.andersson@linaro.org>
 <20170715091439.GC26602@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:34222 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751084AbdGPFfa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Jul 2017 01:35:30 -0400
Received: by mail-pf0-f174.google.com with SMTP id q85so62567751pfq.1
        for <linux-leds@vger.kernel.org>; Sat, 15 Jul 2017 22:35:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20170715091439.GC26602@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>

On Sat 15 Jul 02:14 PDT 2017, Pavel Machek wrote:

> Hi!
> 
> > This adds the binding document describing the three hardware blocks
> > related to the Light Pulse Generator found in a wide range of Qualcomm
> > PMICs.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > Changes since v1:
> > - Dropped custom pattern properties
> > - Renamed cell-index to qcom,lpg-channel to clarify its purpose
> > 
> >  .../devicetree/bindings/leds/leds-qcom-lpg.txt     | 145 +++++++++++++++++++++
> >  1 file changed, 145 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > new file mode 100644
> > index 000000000000..cc9ffee6586b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
> > @@ -0,0 +1,145 @@
> > +Binding for Qualcomm Light Pulse Generator
> > +
> 
> Can we use similar format to other files in the directory?
> 

Sure thing, I'll rework this patch.

Regards,
Bjorn
