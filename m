From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [patch v2 1/2] mfd: Add Mellanox regmap core driver
Date: Tue, 8 Aug 2017 07:59:34 +0000
Message-ID: <AM4PR05MB33300159962297EEC58F1BDAA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1501108094-16898-1-git-send-email-vadimp@mellanox.com>
 <1501108094-16898-2-git-send-email-vadimp@mellanox.com>
 <20170807155836.uqa2nezqqheg6so6@dell>
 <AM4PR05MB3330A1043B618D723EFF4C8DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808070211.ikxbzkygymlolavv@dell>
 <AM4PR05MB33301E39B8BB39F68D49B30DA28A0@AM4PR05MB3330.eurprd05.prod.outlook.com>
 <20170808074523.GA12854@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-eopbgr20070.outbound.protection.outlook.com ([40.107.2.70]:36534
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750818AbdHHH7j (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 8 Aug 2017 03:59:39 -0400
In-Reply-To: <20170808074523.GA12854@amd>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Lee Jones <lee.jones@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "j.anaszewski@samsung.com" <j.anaszewski@samsung.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "jiri@resnulli.us" <jiri@resnulli.us>, "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>



> -----Original Message-----
> From: Pavel Machek [mailto:pavel@ucw.cz]
> Sent: Tuesday, August 08, 2017 10:45 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: Lee Jones <lee.jones@linaro.org>; robh+dt@kernel.org;
> devicetree@vger.kernel.org; j.anaszewski@samsung.com;
> rpurdie@rpsys.net; linux-leds@vger.kernel.org; jiri@resnulli.us;
> jacek.anaszewski@gmail.com
> Subject: Re: [patch v2 1/2] mfd: Add Mellanox regmap core driver
>=20
> Hi!
>=20
> > > Why don't you extend the support you already provide in
> drivers/platform?
> > > This seems like a logical place for an all encompassing device which
> > > cannot be split out to individual subsystems.
> >
> > There is a problem to extend for that the existing driver
> > drivers/platform/x86/mlxcpld-hotplug.c.
> > It has been provided for x86 arch and I am planning to extend it with
> > ACPI support.
> >
> > But in mlxreg-core I am using DTS, which is not supported for x86.
> > Here I am using the next functions for probing and removing hotplug
> > entities:
> > static void mlxreg_core_dev_enable(struct device_node *np) {
> > 	/* Enable and create device. */
> > 	of_update_property(np, &mlxreg_core_device_en); }
> >
> > static void mlxreg_core_dev_disable(struct device_node *np) {
> > 	/* Disable and unregister platform device. */
> > 	of_update_property(np, &mlxreg_core_device_dis);
> > 	of_node_clear_flag(np, OF_POPULATED); }
> >
> > And such code can't be placed under drivers/platform/x86/.
>=20
> So aim for drivers/platform/mlx ...?
>=20

So you suggest to move drivers/platform/x86/mlxcpld-hotplug.c to
drivers/platform/mellanox/mlxcpld-hotplug.c and extend thr driver
with DTS support (mlxreg_core_dev_enable/mlxreg_core_dev_disable)?

> 									Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures)
> http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
