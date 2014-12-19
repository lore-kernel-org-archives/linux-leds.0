From: "Ivan T. Ivanov" <iivanov@mm-sol.com>
Subject: Re: [PATCH 2/2] leds: add Qualcomm PM8941 WLED driver
Date: Fri, 19 Dec 2014 10:15:29 +0200
Message-ID: <1418976929.27549.5.camel@mm-sol.com>
References: <1418084551-28946-1-git-send-email-bjorn.andersson@sonymobile.com>
	 <1418084551-28946-2-git-send-email-bjorn.andersson@sonymobile.com>
	 <CAK5ve-LujSrARfyi6nvO1EDLyz_cqso93H2irUf9NPbke1XPdQ@mail.gmail.com>
	 <20141218234352.GE19036@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20141218234352.GE19036@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn <bjorn@sonymobile.com>
Cc: Bryan Wu <cooloney@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Grant Likely <grant.likely@linaro.org>, "Cavin, Courtney" <Courtney.Cavin@sonymobile.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org


On Thu, 2014-12-18 at 15:43 -0800, Bjorn wrote:
> On Tue 16 Dec 16:54 PST 2014, Bryan Wu wrote:
> 
> > On Mon, Dec 8, 2014 at 4:22 PM, Bjorn Andersson
> 
> [..]
> 
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> 
> [..]
> 
> > > +config LEDS_PM8941_WLED
> > > +       tristate "LED support for the Qualcomm PM8941 WLED block"
> > > +       depends on LEDS_CLASS
> > > +       depends on REGMAP
> > Here should be "select REGMAP"
> > 
> 
> Thanks
> > > 


If not mistaken the correct way was:

        depends on SPMI
        select REGMAP_SPMI

or
        depends on MFD_SPMI_PMIC

Regards,
Ivan

https://patchwork.kernel.org/patch/4566591/
