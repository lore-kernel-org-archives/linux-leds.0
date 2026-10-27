Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088860;
	b=KjYEd/HvOcL9dUAsa0jId4SdH9vohpYdV+AR+yffRz/em+JADAxbIP6dPtPBewXFe6SA
	 jCJmPjkltDfCb1IvNH8SL4mFLHcwzLMe33A92dEWutwle9ETAkPp9IDunv7jvwi1P7rHA
	 2KzcrbqWp4/Kc8ZSVCmmzC0SnPnBMF/LbNdUqahFiFbt4nrSXVH0otxnr/nntUycRGv7q
	 NU6q4qBHdGuQdPaDWvUPTIlXIZpMt1FL1gu8CoZJFZUeg9jg4UfdBrgmV3CXdjZ8o6AcK
	 tMnWD5wMTQEq4yoTeu3nOSelPRApzkd/sBVoqYOzyVla7TiVRljd8fFUtKsooHWUGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088860;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-Virus-Scanned;
	bh=hiF6cXI3agkYyku3rSyd2OOmEROL56RdvaFl7yHcXqU=;
	b=XUBUyMYVWLn1H48i5I8uPTjriNK8EqH6cNAfPblqgG/HfqyKatLTz9IebbMEN6MNEDOI
	 Te9pIqNfe+/KonzNlu7ucBiDMU4dipoauVIOnOpt2DUMZJNW+axPhQ1cU+XzlY6tURcc+
	 qJz9zU6TySA4yCgcR8fnVd2b8+VLcgrGc5CP5pGTQO1xp1rAvTW5mendYPXE8He48iumd
	 +W6x6owPcbNPGUWki5dWqwGXnCjei4rYlIQx3eKOAhqHVe/NxdbHsFdmC17OTEG21Up5n
	 DC7cEesWO6m7bjrZ8NtbrMsXA2NN4VNSH0e18wPWyLMPM6IzR9z3zkPTnTSzO7jqWfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b="pCnc/ldS";
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED278606A324;
	Tue, 27 Oct 2026 08:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED278606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=pCnc/ldS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=hiF6cXI3agkYyku3rSyd2OOmEROL56RdvaFl7yHcXqU=; b=pCnc/ldScfXAZKsP43bxJVnw2K
	7FwCJmgqQLQIraGdSvdNpkpIxa2Z97Tkc86YLGbMWqGAyjurCP6LtRK0cXJxPaUV06uvfKnDzJiRs
	RwgUnQ8nIWaE0fyz2WURQWBq0Buy2jE1Mw1GhmMGR0gZJI8GkqPvkgwggck7h8yIfNge3/wWKucAw
	UxxT2lBRex8/ivIlWFbn2aU1d9mUadq+yndE80ajagHRUIoIqXLeoEAwjTjWQ5cCQAFpnL5ARItMJ
	rS0SHtNTqVhgmMHfaCyi0/ctfxd9AOosJRZv+GpoHIM4+reFNAoRmOwJrHnipAXpYCLTv9FfC9VLE
	vsH7bqaw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xLcK0-000GVU-2B;
	Tue, 27 Oct 2026 09:14:16 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xLcJz-000P5W-2Z;
	Tue, 27 Oct 2026 09:14:16 +0100
Message-ID: <e1d1f2ba1c5191c93ed7c5ad737740780a506676.camel@ew.tq-group.com>
Subject: Re: [PATCH v5 09/11] leds: pca995x: Add sysfs files for error
 reporting
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar	 <isaiezequiel.gaspar@nxp.com>, Marek
 Vasut <marex@denx.de>, Pieterjan Camerlynck <pieterjanca@gmail.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, 	linux@ew.tq-group.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 27 Oct 2026 09:14:14 +0100
In-Reply-To: <179198432570.839288.16507714780245784283@kernel.org>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
	 <5ec0d621cc430d730e51845d4aafb1c2be166fbc.1791207391.git.nora.schiffer@ew.tq-group.com>
	 <179198432570.839288.16507714780245784283@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.6/28166/Tue Oct 27 07:24:12 2026)

On Thu, 2026-10-15 at 16:47 +0100, Lee Jones wrote:
> On Mon, 05 Oct 2026, Nora Schiffer wrote:
>=20
> > The PCA9955B/PCA9956B have builtin failure detection. Provide sysfs fil=
es
> > for individual LED status (reporting "okay", "short-circuit" or
> > "open-circuit") as well as a global "has_errors" flag. has_errors is
> > sticky and must be cleared by writing "clear" to the sysfs file.
> >=20
> > Failure detection on the PCA9952/PCA9955 (without "B") works differentl=
y
> > and is currently unsupported.
> >=20
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  drivers/leds/leds-pca995x.c | 112 ++++++++++++++++++++++++++++++++++--
> >  1 file changed, 108 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> > index 3d6053625b1c9..359803d0030fb 100644
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
> > @@ -24,6 +25,9 @@
> >  /* Auto-increment disabled. Normal mode */
> >  #define PCA995X_MODE1_CFG		0x00
> >=20
> > +#define PCA995X_MODE2_CLRERR		BIT(4)
> > +#define PCA995X_MODE2_ERROR		BIT(6)
> > +
> >  /* LED select registers determine the source that drives LED outputs *=
/
> >  #define PCA995X_LED_OFF			0x0
> >  #define PCA995X_LED_ON			0x1
> > @@ -37,19 +41,37 @@
> >  #define PCA995X_IREFALL_FULL_CFG	0xFF
> >  #define PCA995X_IREFALL_HALF_CFG	(PCA995X_IREFALL_FULL_CFG / 2)
> >=20
> > +#define PCA995X_EFLAG_UNSUPPORTED	U8_MAX
> > +
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
> >  	u8 mode2_cfg;
> > +	const struct attribute_group **attr_groups;
> >  };
> >=20
> > +static ssize_t status_show(struct device *dev, struct device_attribute=
 *attr, char *buf);
>=20
> Please avoid forward declaring functions.
>=20
> Shuffle things around so that it is not required.

I found it a bit ugly to define status_show() above the pca995x_chipdef str=
ucts,
far away from all other function definitions, but if you prefer it that way=
,
I'll change it.

>=20
> > +
> > +static DEVICE_ATTR_RO(status);
> > +
> > +static struct attribute *pca995x_led_error_attrs[] =3D {
> > +	&dev_attr_status.attr,
> > +	NULL,
> > +};
> > +ATTRIBUTE_GROUPS(pca995x_led_error);
>=20
> Are these documented as per the guidance?

Ah, I forgot about that, will fix.

>=20
> > +
> >  static const struct pca995x_chipdef pca9952_chipdef =3D {
> >  	.num_leds	=3D 16,
> >  	.pwm_base	=3D 0x0a,
> >  	.irefall	=3D 0x43,
> > +	.eflag_base	=3D PCA995X_EFLAG_UNSUPPORTED,
> >  	/* Reset default */
> >  	.mode2_cfg	=3D 0x05,
> >  };
> > @@ -58,16 +80,20 @@ static const struct pca995x_chipdef pca9955b_chipde=
f =3D {
> >  	.num_leds	=3D 16,
> >  	.pwm_base	=3D 0x08,
> >  	.irefall	=3D 0x45,
> > -	/* Reset default */
> > -	.mode2_cfg	=3D 0x01,
> > +	.eflag_base	=3D 0x46,
> > +	/* Reset default + clear errors on probe */
> > +	.mode2_cfg	=3D 0x01 | PCA995X_MODE2_CLRERR,
> > +	.attr_groups	=3D pca995x_led_error_groups,
> >  };
> >=20
> >  static const struct pca995x_chipdef pca9956b_chipdef =3D {
> >  	.num_leds	=3D 24,
> >  	.pwm_base	=3D 0x0a,
> >  	.irefall	=3D 0x40,
> > -	/* Reset default */
> > -	.mode2_cfg	=3D 0x05,
> > +	.eflag_base	=3D 0x41,
> > +	/* Reset default + clear errors on probe */
> > +	.mode2_cfg	=3D 0x05 | PCA995X_MODE2_CLRERR,
> > +	.attr_groups	=3D pca995x_led_error_groups,
> >  };
> >=20
> >  struct pca995x_led {
> > @@ -119,6 +145,77 @@ static int pca995x_brightness_set(struct led_class=
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
> > +static ssize_t has_errors_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> > +{
> > +	struct pca995x_chip *chip =3D dev_get_drvdata(dev);
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	ret =3D regmap_read(chip->regmap, PCA995X_MODE2, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return sysfs_emit(buf, "%d\n", !!(val & PCA995X_MODE2_ERROR));
> > +}
> > +
> > +static ssize_t has_errors_store(struct device *dev, struct device_attr=
ibute *attr,
> > +				const char *buf, size_t count)
> > +{
> > +	struct pca995x_chip *chip =3D dev_get_drvdata(dev);
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
> > +static struct attribute *pca995x_error_attrs[] =3D {
> > +	&dev_attr_has_errors.attr,
> > +	NULL,
> > +};
> > +
> > +static const struct attribute_group pca995x_error_group =3D {
> > +	.attrs =3D pca995x_error_attrs,
> > +};
> > +
> >  static const struct regmap_config pca995x_regmap =3D {
> >  	.reg_bits =3D 8,
> >  	.val_bits =3D 8,
> > @@ -185,6 +282,7 @@ static int pca995x_probe(struct i2c_client *client)
> >  		led->led_no =3D reg;
> >  		led->ldev.brightness_set_blocking =3D pca995x_brightness_set;
> >  		led->ldev.max_brightness =3D 255;
> > +		led->ldev.groups =3D chipdef->attr_groups;
> >  	}
> >=20
> >  	/* Disable LED all-call address and set normal mode */
> > @@ -202,6 +300,12 @@ static int pca995x_probe(struct i2c_client *client=
)
> >  	if (ret)
> >  		goto err_put_nodes;
> >=20
> > +	if (chipdef->eflag_base !=3D PCA995X_EFLAG_UNSUPPORTED) {
> > +		ret =3D devm_device_add_group(dev, &pca995x_error_group);
> > +		if (ret)
> > +			goto err_put_nodes;
> > +	}
> > +
> >  	for (i =3D 0; i < chipdef->num_leds; i++) {
> >  		struct led_init_data init_data =3D {};
> >=20
> > --=20
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
> >=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
