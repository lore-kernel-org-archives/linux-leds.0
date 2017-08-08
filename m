From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 8 Aug 2017 12:31:04 +0100
Message-ID: <20170808113104.kb6kcos22stmdkqm@dell>
References: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
 <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
 <20170807155836.uqa2nezqqheg6so6@dell>
 <AM4PR05MB3330A1043B618D723EFF4C8DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808070211.ikxbzkygymlolavv@dell>
 <AM4PR05MB33301E39B8BB39F68D49B30DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808074523.GA12854@amd>
 <AM4PR05MB33300159962297EEC58F1BDAA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808081711.GE12854@amd>
 <AM4PR05MB3330A3B5F71CCD4A21682320A28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:36013 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752035AbdHHLbK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Aug 2017 07:31:10 -0400
Received: by mail-wr0-f174.google.com with SMTP id y43so11712552wrd.3
        for <linux-leds@vger.kernel.org>; Tue, 08 Aug 2017 04:31:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <AM4PR05MB3330A3B5F71CCD4A21682320A28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Pavel Machek <pavel@ucw.cz>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>

On Tue, 08 Aug 2017, Vadim Pasternak wrote:

> 
> 
> > -----Original Message-----
> > From: Pavel Machek [mailto:pavel@ucw.cz]
> > Sent: Tuesday, August 08, 2017 11:17 AM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: Lee Jones <lee.jones@linaro.org>; robh+dt@kernel.org;
> > devicetree@vger.kernel.org; j.anaszewski@samsung.com;
> > rpurdie@rpsys.net; linux-leds@vger.kernel.org; jiri@resnulli.us;
> > jacek.anaszewski@gmail.com
> > Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
> > 
> > Hi!
> > 
> > > > > And such code can't be placed under drivers/platform/x86/.
> > > >
> > > > So aim for drivers/platform/mlx ...?
> > > >
> > >
> > > So you suggest to move drivers/platform/x86/mlxcpld-hotplug.c to
> > > drivers/platform/mellanox/mlxcpld-hotplug.c and extend thr driver with
> > > DTS support (mlxreg_core_dev_enable/mlxreg_core_dev_disable)?
> > 
> > If this leads to less code duplication -- yes, by all means do that.
> 
> OK.
> So, I will remove from mlxreg-core IC related part and send the patches for your
> review.
> In parallel I'll start to work with platform maintainers for moving mlxcpld-hotplug 
> and further extension for DTS support. After this is ready, I'll extend mlxreg-core
> with IC activation.
> 
> Is sounds OK with you?

This sounds very reasonable to me, thanks.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
