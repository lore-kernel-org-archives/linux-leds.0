Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A2496D31;
	Tue, 29 Sep 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679877; cv=none; b=sAvEsOMDxsc9rZi5EuOd6LWVz/J1a80KAMZIi/x1bvJiQko9jh1pTcp/3E3vu3s6hS9yxyagDayRZAwJCQi3aGDdujzMHMSYBZPU69o9P69I0E0TR6Y8sQgQS5qSh18gAhsC5n4Qy0I5XitIkxUaeIuAK0piY3I8AmcYbuQ5Oc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679877; c=relaxed/simple;
	bh=DryEJ4YZE8dqkNXYgFQlsbYfmRCBf0nX03WIUzsmp5c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Hl0aI0D9Yl2DVi5SZSiqQ51Y67/7pjxJKJg0CbBN3DW54Kea/qaGOzWzeg4OHTOV4QSynC7dkqbkkCtLE6wDE10l6nGPBx1j3STdYi/nBU0w0f+Fwx+6ifELEZUKvwQajOdRKZL1TIO1vgCxMJZHrww4jdbX3uyC9+Tgzxr+9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=O24LSkMk; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="O24LSkMk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VhWBcgkJPO+flDLKTdf49YOPGNHiW1yEFX3ELKRv7T0=; b=O24LSkMkI4OGSSU0WEi2IVWBrK
	0jbM3L62RH60raIGP7Q2ncTZ5Wh3LoUPAnqbSw17VFlR1S2TErhvj9iTzpsOmDfDd2grMhJvbRqtJ
	6Vyc9EJM/jVYMuo6VEPVICgZKdaAo06mDHxDn6J0TnA0MHxLcbg6k1+J2QxXCIa3TsBTAlS5whHnx
	6Tb5VFIgLkgHz3SPk9zB1zwnS6/hsB3eqFpFQeqSU8J1Luvn1JQeJJdlgKrzpRW6K+L4itJ04CJR1
	8Z4wdlotyzfufUKjLlugomdGYbcm+5YykArGvO7CaFgSVsPrEqvnHxNgO4qPzR+aa+IrV3qizhQno
	OTPrEiQQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBVdJ-0000d1-1V;
	Tue, 29 Sep 2026 13:04:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBVdJ-0009jG-15;
	Tue, 29 Sep 2026 13:04:24 +0200
Message-ID: <85d8a95f737971eef0d8525f568e40426546a4e9.camel@ew.tq-group.com>
Subject: Re: [PATCH v3 08/10] leds: pca995x: Add sysfs files for error
 reporting
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek
 Vasut <marex@denx.de>, Pieterjan Camerlynck <pieterjanca@gmail.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>,  linux@ew.tq-group.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 13:04:23 +0200
In-Reply-To: <179025018163.457255.7741092289370888752@kernel.org>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <9c5bb10d247abc5acb752a4b884c2c3612abecdb.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <179025018163.457255.7741092289370888752@kernel.org>
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

On Tue, 2026-09-29 at 11:12 +0100, Lee Jones wrote:
> On Tue, 22 Sep 2026, Nora Schiffer wrote:
>=20
> > The PCA995x has builtin failure detection. Provide sysfs files for
> > individual LED status (reporting "okay", "short-circuit" or
> > "open-circuit") as well as a global "has_errors" flag. has_errors is
> > sticky and must be cleared by writing "clear" to the sysfs file.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  drivers/leds/leds-pca995x.c | 112 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 111 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> > index 13cce0c3fdc19..57b5d2d6e035d 100644
> > --- a/drivers/leds/leds-pca995x.c
> > +++ b/drivers/leds/leds-pca995x.c
> > @@ -8,6 +8,7 @@
> >   * Copyright 2023 Marek Vasut
> >   */
> >=20
> > +#include <linux/bits.h>
> >  #include <linux/delay.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> > @@ -24,6 +25,12 @@
> >  /* Auto-increment disabled. Normal mode */
> >  #define PCA995X_MODE1_CFG		0x00
> >=20
> > +#define PCA995X_MODE2_CLRERR		BIT(4)
> > +#define PCA995X_MODE2_ERROR		BIT(6)
> > +
> > +/* Clear errors on probe, group brightness control, linear adjustment =
*/
> > +#define PCA995X_MODE2_CFG		PCA995X_MODE2_CLRERR
> > +
> >  /* LED select registers determine the source that drives LED outputs *=
/
> >  #define PCA995X_LED_OFF			0x0
> >  #define PCA995X_LED_ON			0x1
> > @@ -37,30 +44,37 @@
> >  #define PCA995X_IREFALL_FULL_CFG	0xFF
> >  #define PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_FULL_CFG / 2)
> >=20
> > +#define PCA995X_EFLAG_BITS		2
> > +#define PCA995X_EFLAG_MASK		GENMASK(1, 0)
> > +
> >  #define ldev_to_led(c)	container_of(c, struct pca995x_led, ldev)
> >=20
> >  struct pca995x_chipdef {
> >  	unsigned int num_leds;
> >  	u8 pwm_base;
> >  	u8 irefall;
> > +	u8 eflag_base;
> >  };
> >=20
> >  static const struct pca995x_chipdef pca9952_chipdef =3D {
> >  	.num_leds	=3D 16,
> >  	.pwm_base	=3D 0x0a,
> >  	.irefall	=3D 0x43,
> > +	.eflag_base	=3D 0x44,
> >  };
> >=20
> >  static const struct pca995x_chipdef pca9955b_chipdef =3D {
> >  	.num_leds	=3D 16,
> >  	.pwm_base	=3D 0x08,
> >  	.irefall	=3D 0x45,
> > +	.eflag_base	=3D 0x46,
> >  };
> >=20
> >  static const struct pca995x_chipdef pca9956b_chipdef =3D {
> >  	.num_leds	=3D 24,
> >  	.pwm_base	=3D 0x0a,
> >  	.irefall	=3D 0x40,
> > +	.eflag_base	=3D 0x41,
> >  };
> >=20
> >  struct pca995x_led {
> > @@ -112,6 +126,83 @@ static int pca995x_brightness_set(struct led_class=
dev *led_cdev,
> >  	}
> >  }
> >=20
> > +static ssize_t status_show(struct device *dev, struct device_attribute=
 *attr, char *buf)
> > +{
> > +	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
> > +	struct pca995x_led *led =3D ldev_to_led(led_cdev);
> > +	struct pca995x_chip *chip =3D led->chip;
> > +	const struct pca995x_chipdef *chipdef =3D chip->chipdef;
> > +	const char *status =3D "unknown";
> > +	unsigned int val;
> > +	int shift, ret;
> > +	u8 reg;
> > +
> > +	reg =3D chipdef->eflag_base + (led->led_no / PCA995X_OUTPUTS_PER_REG)=
;
> > +	shift =3D PCA995X_EFLAG_BITS * (led->led_no % PCA995X_OUTPUTS_PER_REG=
);
> > +
> > +	ret =3D regmap_read(chip->regmap, reg, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	switch ((val >> shift) & PCA995X_EFLAG_MASK) {
> > +	case 0:
> > +		status =3D "okay";
> > +		break;
> > +	case 1:
> > +		status =3D "short-circuit";
> > +		break;
> > +	case 2:
> > +		status =3D "open-circuit";
> > +	}
> > +
> > +	return sysfs_emit(buf, "%s\n", status);
> > +}
> > +
> > +static DEVICE_ATTR_RO(status);
> > +
> > +static struct attribute *pca995x_led_attrs[] =3D {
> > +	&dev_attr_status.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(pca995x_led);
> > +
> > +static ssize_t has_errors_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> > +{
> > +	struct pca995x_chip *chip =3D i2c_get_clientdata(to_i2c_client(dev));
>=20
> Why not 'dev_get_drvdata(dev)' instead of bouncing through the i2c_client=
?
>=20
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(chip->regmap, PCA995X_MODE2, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +
>=20
> Stray blank line.
>=20
> > +	return sysfs_emit(buf, "%d\n", !!(val & PCA995X_MODE2_ERROR));
> > +}
> > +
> > +static ssize_t has_errors_store(struct device *dev, struct device_attr=
ibute *attr,
> > +				const char *buf, size_t count)
> > +{
> > +	struct pca995x_chip *chip =3D i2c_get_clientdata(to_i2c_client(dev));
>=20
> As above.
>=20
> > +	int ret;
> > +
> > +	if (!sysfs_streq(buf, "clear"))
> > +		return -EINVAL;
> > +
> > +	ret =3D regmap_update_bits(chip->regmap, PCA995X_MODE2,
> > +				 PCA995X_MODE2_CLRERR, PCA995X_MODE2_CLRERR);
> > +
> > +	return ret ?: count;
> > +}
> > +
> > +static DEVICE_ATTR_RW(has_errors);
> > +
> > +static struct attribute *pca995x_attrs[] =3D {
> > +	&dev_attr_has_errors.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(pca995x);
> > +
> >  static const struct regmap_config pca995x_regmap =3D {
> >  	.reg_bits =3D 8,
> >  	.val_bits =3D 8,
> > @@ -176,6 +267,7 @@ static int pca995x_probe(struct i2c_client *client)
> >  		led->led_no =3D reg;
> >  		led->ldev.brightness_set_blocking =3D pca995x_brightness_set;
> >  		led->ldev.max_brightness =3D 255;
> > +		led->ldev.groups =3D pca995x_led_groups;
> >  	}
> >=20
> >  	/* Disable LED all-call address and set normal mode */
> > @@ -183,11 +275,20 @@ static int pca995x_probe(struct i2c_client *clien=
t)
> >  	if (ret)
> >  		goto err_put_nodes;
> >=20
> > +	/* Clear errors on probe */
> > +	ret =3D regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
> > +	if (ret)
> > +		goto err_put_nodes;
> > +
> >  	/* IREF Output current value for all LEDn outputs */
> >  	ret =3D regmap_write(chip->regmap, chipdef->irefall, iref);
> >  	if (ret)
> >  		goto err_put_nodes;
> >=20
> > +	ret =3D device_add_groups(dev, pca995x_groups);
>=20
> Why not devm_* and remove the clean-up?

Ahh, the AI had suggested this too, but it was referring to a non-exisitent=
 API.
I didn't know the function was called devm_device_add_group() - found it no=
w,
will fix in the next revision.


>=20
> > +	if (ret)
> > +		goto err_put_nodes;
> > +
> >  	for (i =3D 0; i < chipdef->num_leds; i++) {
> >  		struct led_init_data init_data =3D {};
> >=20
> > @@ -202,7 +303,7 @@ static int pca995x_probe(struct i2c_client *client)
> >  		if (ret < 0) {
> >  			dev_err_probe(dev, ret, "Could not register LED %s\n",
> >  				      chip->leds[i].ldev.name);
> > -			goto err_put_nodes;
> > +			goto err_remove_groups;
> >  		}
> >=20
> >  		led_fwnodes[i] =3D NULL;
> > @@ -210,6 +311,9 @@ static int pca995x_probe(struct i2c_client *client)
> >=20
> >  	return 0;
> >=20
> > +err_remove_groups:
> > +	device_remove_groups(dev, pca995x_groups);
> > +
>=20
> You can remove this if you move to devm_*.
>=20
> >  err_put_nodes:
> >  	for (i =3D 0; i < chipdef->num_leds; i++)
> >  		fwnode_handle_put(led_fwnodes[i]);
> > @@ -217,6 +321,11 @@ static int pca995x_probe(struct i2c_client *client=
)
> >  	return ret;
> >  }
> >=20
> > +static void pca995x_remove(struct i2c_client *client)
> > +{
> > +	device_remove_groups(&client->dev, pca995x_groups);
> > +}
> > +
>=20
> As above.
>=20
> >  static const struct i2c_device_id pca995x_id[] =3D {
> >  	{ .name =3D "pca9952", .driver_data =3D (kernel_ulong_t)&pca9952_chip=
def },
> >  	{ .name =3D "pca9955b", .driver_data =3D (kernel_ulong_t)&pca9955b_ch=
ipdef },
> > @@ -239,6 +348,7 @@ static struct i2c_driver pca995x_driver =3D {
> >  		.of_match_table =3D pca995x_of_match,
> >  	},
> >  	.probe =3D pca995x_probe,
> > +	.remove =3D pca995x_remove,
> >  	.id_table =3D pca995x_id,
> >  };
> >  module_i2c_driver(pca995x_driver);
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
