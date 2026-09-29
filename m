Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CE24E5359;
	Tue, 29 Sep 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673938; cv=none; b=bTsl19jvTT7T9aBxsXeT0oFb8CX6PFZt0PuKTJmeEEg7yXZHP43Db7EQjjYlM9yhbA7VhJnbnR+v/XlSLESS9HNFsRCXewMf4gQvDvAbHeH/g38J6+nVoCNGL0ilIXa2e3lml1y/YJak0BECYWoKtJHGHAeiJlzovf4wupJ1X4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673938; c=relaxed/simple;
	bh=1ebFvCkPdGwK1XWzERMm32eRY9/xFogwF3EyTsERAQ8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lHDguQfYqGrDg1l7KQMeVFw+3ppJHiXWZ88Hw6N6hAFUTjFsMhZ+OkPtKh+2X7U8xzV1xirEW44mS1dzZJc8xQg0UcmXmAR9SxBg3pFHrN9porVPDwJRezs2uLphSwqCWYXoHu0bnMmaw4xkevNx0hrJUl9Bki3A6LPIAZCkFtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=m/hvgsiY; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="m/hvgsiY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tFswUodyOJ45iAg/pEVuXCSp8bBCpsODnMlSqoBVUxE=; b=m/hvgsiYxRWxWf8kvIDdZATMwM
	w8YlmtDW5U2VmD3X4yvaHbTj/n4tnGX/yIW6D6BBPg0Ocn8OxgAlE2SYpzPkCe2X+UISLGHzubP5f
	7RVHIqqEpgGfaGe2xC38KMfgcK5fOc/Zhwl1EiSVOV0Gu6ScjGBF6i7TWdmvrNwZ29iXHXM8E48+d
	XkAv/TnPLaukSLgkEExB5gYqLP5rx+q9wQxs4USXk5CpbSz4JFbuALwwsutIv/y2vzSxUB3UhdY41
	sO2kFLM4P/ZuFrlIqU2hd6uFSepnTjU/GA+UKhm8hSvH00+91UTVOk7GO4yajgRyU32egdKDDwmSD
	6QOZXp9A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBU5U-0002of-2E;
	Tue, 29 Sep 2026 11:25:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBU5U-000FPY-1q;
	Tue, 29 Sep 2026 11:25:24 +0200
Message-ID: <f90d0a7853d5e2489ea491e7c87bad3ce77aeeb1.camel@ew.tq-group.com>
Subject: Re: [PATCH v3 06/10] leds: pca995x: Add support for reset GPIO
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek
 Vasut <marex@denx.de>, Pieterjan Camerlynck <pieterjanca@gmail.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>,  linux@ew.tq-group.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 11:25:23 +0200
In-Reply-To: <20260929091428.GE2112133@google.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <ffbbfaf03a2b7b859a4ee01e18a161026ca319cd.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <20260929091428.GE2112133@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28138/Tue Sep 29 08:26:15 2026)

On Tue, 2026-09-29 at 10:14 +0100, Lee Jones wrote:
> On Tue, 22 Sep 2026, Nora Schiffer wrote:
>=20
> > The PCA9952/9955B/9956B have a reset pin. Use it to reset the LED drive=
r
> > if provided in the Device Tree.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  drivers/leds/leds-pca995x.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >=20
> > diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> > index e6122b33451ed..b528b2b4990a7 100644
> > --- a/drivers/leds/leds-pca995x.c
> > +++ b/drivers/leds/leds-pca995x.c
> > @@ -8,6 +8,8 @@
> >   * Copyright 2023 Marek Vasut
> >   */
> > =20
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/leds.h>
> >  #include <linux/module.h>
> > @@ -121,6 +123,7 @@ static int pca995x_probe(struct i2c_client *client)
> >  	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] =3D { 0 };
> >  	struct device *dev =3D &client->dev;
> >  	const struct pca995x_chipdef *chipdef;
> > +	struct gpio_desc *reset_gpio;
> >  	struct pca995x_chip *chip;
> >  	struct pca995x_led *led;
> >  	int i, reg, ret;
> > @@ -130,6 +133,16 @@ static int pca995x_probe(struct i2c_client *client=
)
> >  	if (!dev_fwnode(dev))
> >  		return -ENODEV;
> > =20
> > +	reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(reset_gpio),
> > +				     "failed to request reset GPIO\n");
> > +	if (reset_gpio) {
> > +		udelay(3);
>=20
> It's strange to see delays _before_ actions.

devm_gpiod_get*() with GPIOD_OUT_HIGH asserts the reset GPIO if it was in a
different state before. We keep the chip in reset for 3us, de-assert the re=
set,
and then wait for ~1.5ms until the chip is back up. This is a common patter=
n
seen in various drivers.

>=20
> What are you delaying for exactly?
>=20
> > +		gpiod_set_value_cansleep(reset_gpio, 0);
> > +		usleep_range(1500, 1600);
> > +	}
> > +
> >  	chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> >  	if (!chip)
> >  		return -ENOMEM;
> > --=20
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
