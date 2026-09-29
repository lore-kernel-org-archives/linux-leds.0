Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E9A50B8CB;
	Tue, 29 Sep 2026 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679975; cv=none; b=lykpF6Z3Iz+eBP60tr23GHP9fyrGS7HmdMdY2gg7f2Yz8+xn8APCKsPdMERXEmKhrwfErs+bNQLfK77gZfLdk7z2ggM/+FWyNiTzkyyt1r2FpT/Likb2wQlcmNlguXhD8gXX9Dij/bkX9C0+MIQQDWIewxAbFfKBUTyD0wQ6Qrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679975; c=relaxed/simple;
	bh=+53xHOOxkU6voMCgJy22aOZ2f+nJ5+HlyXKUXPpB6eQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m0msOSqL5v2C/Zesa/D0gjHevg4jPxfD5sVmTfnMd8IrawmqNUW3TGNQs31FdzdCQlOB0PQIYVaXhZHLGC0jlBV4wlsi6IYpz7qTdtUcFxgTZC20l4yHWQBm1hSY8yEKZ4egXet3y83Y0kXBlmV5yJfF71uqUyCcxCMlnIWOLe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AY9FFkqI; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AY9FFkqI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WLzG/lrH/KAV6ePyzFVqcNtFRURr2G/UzUJznxpsZno=; b=AY9FFkqIlcqs8CojrdUilP9yZu
	kZI8dJpfEw8I2ffZcg8JrO4Ax+j4fjcFryttRMCDnf8dtOPQNW1GxpfEXgRpu9onDqVRmIf3biVzo
	NC/k/LGqpKnqUPlVJHpv0xHV0KjvCpfESnxOMChmpR0mGsPnfISNZ+dEbe4r8wvlLEG1E5VJWBgpW
	WIq1ZIpt43vg/4oeYHu/1v6+tnUIkdDooVlW2LbdDef/Byf1qe6li/futPytD8ai5DpTwZx/sQsA2
	olsNv4UZ8FsvpgHszxtxmQxepIVN4Tukm457ObWrinrp8vMATxDxYPkmVNIKwAD631Q/tBpEOZrye
	B9znfTiQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBVet-0001CM-1x;
	Tue, 29 Sep 2026 13:06:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBVet-0000Ar-1Y;
	Tue, 29 Sep 2026 13:06:03 +0200
Message-ID: <c2988d6f77c6630f8e01096b93fae8b9c6f684f8.camel@ew.tq-group.com>
Subject: Re: [PATCH v3 10/10] leds: pca995x: Add support for group
 brightness control
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek
 Vasut <marex@denx.de>, Pieterjan Camerlynck <pieterjanca@gmail.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>,  linux@ew.tq-group.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 13:06:02 +0200
In-Reply-To: <179025020617.457255.2187144572484405270@kernel.org>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <391973ce0168438612861bfe8570b6890af0f44e.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <179025020617.457255.2187144572484405270@kernel.org>
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

On Tue, 2026-09-29 at 11:13 +0100, Lee Jones wrote:
> --- checkpatch.pl: clean (0 issues) ---
>=20
> On Tue, 22 Sep 2026, Nora Schiffer wrote:
>=20
> > When LEDs are set to PWM mode with group control enabled, their
> > brightness can control using a global "group PWM" setting, modulating
> > the individual LEDs' brightness with a second PWM running at a differen=
t
> > frequency. This lowers the minimum duty cycle from 1/256 to 1/65536
> > (averaged over the modulated signal). Group brightness control is
> > particularly useful to adjust for different levels of ambient light.
> >=20
> > For simplicity, group PWM mode is always enabled, with the reset defaul=
t
> > of 255 as group brightness. This reduces the effective duty cycle by
> > 1/256 at all individual brightness levels (the individual PWM signals
> > are modulated with the 255/256 duty cycle group PWM), which should be
> > imperceptible.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  drivers/leds/leds-pca995x.c | 46 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 43 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> > index 61d2581b976ce..d6438b576b186 100644
> > --- a/drivers/leds/leds-pca995x.c
> > +++ b/drivers/leds/leds-pca995x.c
> > @@ -35,6 +35,7 @@
> >  #define PCA995X_LED_OFF			0x0
> >  #define PCA995X_LED_ON			0x1
> >  #define PCA995X_LED_PWM_MODE		0x2
> > +#define PCA995X_LED_PWM_MODE_GRP	0x3
> >  #define PCA995X_LDRX_MASK		0x3
> >  #define PCA995X_LDRX_BITS		2
> >=20
> > @@ -52,6 +53,7 @@
> >  struct pca995x_chipdef {
> >  	unsigned int num_leds;
> >  	u8 pwm_base;
> > +	u8 grppwm;
> >  	u8 irefall;
> >  	u8 eflag_base;
> >  };
> > @@ -59,6 +61,7 @@ struct pca995x_chipdef {
> >  static const struct pca995x_chipdef pca9952_chipdef =3D {
> >  	.num_leds	=3D 16,
> >  	.pwm_base	=3D 0x0a,
> > +	.grppwm		=3D 0x08,
> >  	.irefall	=3D 0x43,
> >  	.eflag_base	=3D 0x44,
> >  };
> > @@ -66,6 +69,7 @@ static const struct pca995x_chipdef pca9952_chipdef =
=3D {
> >  static const struct pca995x_chipdef pca9955b_chipdef =3D {
> >  	.num_leds	=3D 16,
> >  	.pwm_base	=3D 0x08,
> > +	.grppwm		=3D 0x06,
> >  	.irefall	=3D 0x45,
> >  	.eflag_base	=3D 0x46,
> >  };
> > @@ -73,6 +77,7 @@ static const struct pca995x_chipdef pca9955b_chipdef =
=3D {
> >  static const struct pca995x_chipdef pca9956b_chipdef =3D {
> >  	.num_leds	=3D 24,
> >  	.pwm_base	=3D 0x0a,
> > +	.grppwm		=3D 0x08,
> >  	.irefall	=3D 0x40,
> >  	.eflag_base	=3D 0x41,
> >  };
> > @@ -114,11 +119,10 @@ static int pca995x_brightness_set(struct led_clas=
sdev *led_cdev,
> >=20
> >  	/*
> >  	 * Change LDRx configuration to individual brightness via PWM.
> > -	 * LED will stop blinking if it's doing so.
> >  	 */
> >  	return regmap_update_bits(chip->regmap, ledout_addr,
> >  				  PCA995X_LDRX_MASK << shift,
> > -				  PCA995X_LED_PWM_MODE << shift);
> > +				  PCA995X_LED_PWM_MODE_GRP << shift);
>=20
> If we use group PWM mode to scale brightness, what happens when 'brightne=
ss' is
> 'LED_FULL'?  The 'switch' statement above sets 'PCA995X_LED_ON', which ty=
pically
> bypasses PWM entirely.  Won't this cause an LED set to 255 to ignore the =
group
> brightness and be fully on, while an LED at 254 is scaled down?

Patch 9/10 removes the use of PCA995X_LED_ON to avoid this issue, using
PCA995X_LED_PWM_MODE_GRP for all brightness values 1..255 instead.


>=20
> >  }
> >=20
> >  static ssize_t status_show(struct device *dev, struct device_attribute=
 *attr, char *buf)
> > @@ -190,10 +194,41 @@ static ssize_t has_errors_store(struct device *de=
v, struct device_attribute *att
> >  	return ret ?: count;
> >  }
> >=20
> > +static ssize_t group_brightness_show(struct device *dev, struct device=
_attribute *attr, char *buf)
> > +{
> > +	struct pca995x_chip *chip =3D i2c_get_clientdata(to_i2c_client(dev));
>=20
> 'dev_get_drvdata(dev)' again?
>=20
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(chip->regmap, chip->chipdef->grppwm, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return sysfs_emit(buf, "%u\n", val);
> > +}
> > +
> > +static ssize_t group_brightness_store(struct device *dev, struct devic=
e_attribute *attr,
> > +				       const char *buf, size_t count)
> > +{
> > +	struct pca995x_chip *chip =3D i2c_get_clientdata(to_i2c_client(dev));
> > +	u8 val;
> > +	int ret;
> > +
> > +	ret =3D kstrtou8(buf, 0, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D regmap_write(chip->regmap, chip->chipdef->grppwm, val);
> > +
> > +	return ret ?: count;
> > +}
> > +
> >  static DEVICE_ATTR_RW(has_errors);
> > +static DEVICE_ATTR_RW(group_brightness);
> >=20
> >  static struct attribute *pca995x_attrs[] =3D {
> >  	&dev_attr_has_errors.attr,
> > +	&dev_attr_group_brightness.attr,
> >  	NULL,
> >  };
> >  ATTRIBUTE_GROUPS(pca995x);
> > @@ -270,11 +305,16 @@ static int pca995x_probe(struct i2c_client *clien=
t)
> >  	if (ret)
> >  		goto err_put_nodes;
> >=20
> > -	/* Clear errors on probe */
> > +	/* Clear errors on probe, use GRPPWM register for group brightness co=
ntrol */
> >  	ret =3D regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
> >  	if (ret)
> >  		goto err_put_nodes;
> >=20
> > +	/* Full group brightness */
> > +	ret =3D regmap_write(chip->regmap, chipdef->grppwm, U8_MAX);
> > +	if (ret)
> > +		goto err_put_nodes;
> > +
> >  	/* IREF Output current value for all LEDn outputs */
> >  	ret =3D regmap_write(chip->regmap, chipdef->irefall, iref);
> >  	if (ret)
> > --=20
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
> >=20
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
