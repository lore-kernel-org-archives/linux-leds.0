Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA514E5331;
	Tue, 29 Sep 2026 09:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674047; cv=none; b=jO17d5sg+hPdUZOQovcbDOL4mGU/JWYac5vdBST2DeuFC77OyX8CBEBibW3PgvCNVECZQbrtg4EC1ZLSm8CGL0ItQAnUXChHAoci6xYLS0p7UFHQR+oPjSwHeOYcNp/wuBNB+m6H998M5kWm+0wgNN41nhCjbhROFdIfO8r3r/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674047; c=relaxed/simple;
	bh=uZnwL9mwrmur0vHEMWEEwWNSeteVcxeC32QE2NWQOjk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ox8Tce5Uh4GDgZE1pLczDtyX9gaRKquLauGPKTHKUlQsWmZLe4PBtDSFtCZ5yBEsGAIIupIzUaDVr5UbFWq/jjUv4r38URJtxlw6NpXAV3R5ytFm60zKKthfzul86FQm/g/REBS5LcnmSVp6yuei1t9biHqa7XCpzAHh4Za1N9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TA+nVprn; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TA+nVprn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ijrOHhCN7oa5Qm7hU1nW+Tu2/lZ0PHw9bM6SdNnuOlw=; b=TA+nVprnOMCVGLStMe84nKIY4X
	N5bFPe5VoO5PxY+qQEVTE8hQVsGZsurPJEr5X8ItbW+Au44TKYhSSoNpV3i+/MKhx6A2dvaaQe1eT
	pr4SKyunCmB/Vrm6dZEmK0had/l3WNXlT33vrRve04+0eDgKk8Gmjah7xI0PoNTcTF0NcIxFU6qui
	dQflidFK/W7UrjrQfDyxhobV2qSejkWTUpmNjFLArHD7yjhQMqxOst81piJFY/zIa1vilAgWtz7fH
	O7UrCa1xeJHi+5ug98DkvCBHmZXtPw80mSJDxzgkr4sSENug7Jz20+18DJJ/NoqMA5XWTT90ym+ud
	zAcOq93A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBU7K-0003jA-2f;
	Tue, 29 Sep 2026 11:27:18 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBU7K-000ATb-2I;
	Tue, 29 Sep 2026 11:27:18 +0200
Message-ID: <a6f07d24fda8c7482c91e54b92fc8a7029f91eb6.camel@ew.tq-group.com>
Subject: Re: [PATCH v3 04/10] leds: pca995x: Fix fwnode handle leaks in
 error paths
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>, Marek
 Vasut <marex@denx.de>, Pieterjan Camerlynck <pieterjanca@gmail.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>,  linux@ew.tq-group.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 11:27:17 +0200
In-Reply-To: <179025017981.457255.5791421193775684526@kernel.org>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <3d38609c96d387aec7eaff7cdb19fc2d8eb32a3e.1790087890.git.nora.schiffer@ew.tq-group.com>
	 <179025017981.457255.5791421193775684526@kernel.org>
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

On Tue, 2026-09-29 at 10:20 +0100, Lee Jones wrote:
> --- checkpatch.pl: clean (0 issues) ---
>=20
> On Tue, 22 Sep 2026, Nora Schiffer wrote:
>=20
> > Each entry in led_fwnodes needs to be put as long as no LED device has
> > been created for it yet - not just in the creation loop, but also in th=
e
> > first loop that iterates over the child nodes.
> >=20
> > By clearing entries in led_fwnodes once they have been used, the same
> > cleanup loop can be used to handle errors in both loops.
> >=20
> > Fixes: 82c5ada1f9d0 ("leds: pca995x: Fix device child node usage in pca=
995x_probe()")
> > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > ---
> >  drivers/leds/leds-pca995x.c | 26 +++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> > index 8b05b3f12cf38..079ce3d8f1e49 100644
> > --- a/drivers/leds/leds-pca995x.c
> > +++ b/drivers/leds/leds-pca995x.c
> > @@ -123,7 +123,7 @@ static int pca995x_probe(struct i2c_client *client)
> >  	const struct pca995x_chipdef *chipdef;
> >  	struct pca995x_chip *chip;
> >  	struct pca995x_led *led;
> > -	int i, j, reg, ret;
> > +	int i, reg, ret;
> >=20
> >  	chipdef =3D device_get_match_data(&client->dev);
> >=20
> > @@ -144,10 +144,12 @@ static int pca995x_probe(struct i2c_client *clien=
t)
> >  	device_for_each_child_node_scoped(dev, child) {
> >  		ret =3D fwnode_property_read_u32(child, "reg", &reg);
> >  		if (ret)
> > -			return ret;
> > +			goto err_put_nodes;
> >=20
> > -		if (reg < 0 || reg >=3D chipdef->num_leds || led_fwnodes[reg])
> > -			return -EINVAL;
> > +		if (reg < 0 || reg >=3D chipdef->num_leds || led_fwnodes[reg]) {
> > +			ret =3D -EINVAL;
> > +			goto err_put_nodes;
> > +		}
> >=20
> >  		led =3D &chip->leds[reg];
> >  		led_fwnodes[reg] =3D fwnode_handle_get(child);
> > @@ -169,12 +171,12 @@ static int pca995x_probe(struct i2c_client *clien=
t)
> >  						     &chip->leds[i].ldev,
> >  						     &init_data);
> >  		if (ret < 0) {
> > -			for (j =3D i; j < chipdef->num_leds; j++)
> > -				fwnode_handle_put(led_fwnodes[j]);
> > -			return dev_err_probe(dev, ret,
> > -					     "Could not register LED %s\n",
> > -					     chip->leds[i].ldev.name);
> > +			dev_err_probe(dev, ret, "Could not register LED %s\n",
> > +				      chip->leds[i].ldev.name);
> > +			goto err_put_nodes;
> >  		}
> > +
> > +		led_fwnodes[i] =3D NULL;
>=20
> Shouldn't we put this before removing it?

The handle is only consumed when the LED has been registered successfully. =
On
error (ret < 0), led_fwnodes[i] must not have been unset yet to avoid the l=
eak.


>=20
> >  	}
> >=20
> >  	/* Disable LED all-call address and set normal mode */
> > @@ -184,6 +186,12 @@ static int pca995x_probe(struct i2c_client *client=
)
> >=20
> >  	/* IREF Output current value for all LEDn outputs */
> >  	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_H=
ALF_CFG);
> > +
> > +err_put_nodes:
> > +	for (i =3D 0; i < chipdef->num_leds; i++)
> > +		fwnode_handle_put(led_fwnodes[i]);
> > +
> > +	return ret;
> >  }
> >=20
> >  static const struct i2c_device_id pca995x_id[] =3D {
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
