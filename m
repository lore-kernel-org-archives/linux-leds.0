Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B848C4A6CFA
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375061; cv=pass; b=QHHv7mYYJXwJvdPvuIB722dbu418YNYyP5FRtrbmfYIVrO3BLFs9re6iiUFwzpNXNvbjtmo47rnNebmR7NdXZFVe4H89MiaW9u3AujRvYHosHdeUTZdy0E66yaKvYty1Wmyke2j0q+uPx94eM3PkLawklZjvh3nKi1nBgTSrr6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375061; c=relaxed/simple;
	bh=pE3G2v0wPmP89tByToqMOLN7gXu1HPzK9zcTdEo9Rzw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oiQWSHNry21rt7EdacTHSe0Hv/8GeXISXJVrgG8ekGf2YBp1iLNYJdwhCeCwHw6ppNli9ZMZyoGFuyQvVKXxJfqflt7pxXL1pb6+MAe6OqhX8HoHBAaiNhoh9GeoUCaAfoxMoSKkvytnZSkQi63tC3gExysNlYXbDqMrD5jvr0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=bSGtsWBD; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="bSGtsWBD"
ARC-Seal: i=1; a=rsa-sha256; t=1788375051; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fYD72Tr2YBqgZgeBvO+kIVS/bngZnhDT3Amh4mEQe/PUHUnTJzkOUjarE4pGCEsgHjXPXLKPjG7Q3uPncYMYT5Cg3Ihf7rSzE6T2UlZoSOQ53WxJisjDI9F60L+4HcJfJm1X4S8e1RwoMblryYS0ou4AJK/Z/mGHI3S9FyUtF8Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788375051; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Aag7H12WKpn4ZD41xX27DjPg4P7S8bGohIfY2/3i2zE=; 
	b=O7aOiO+GbQ83Tm9MFhSGARIBQH/yVM8XXM6MfchZxIneOcjT7KQg5Xs4aqGPbf5p1BwcaeO8/1heu7eP2VlzER2drty524EeOcgRQjzd8Hpnmfov32sdTFj3tJRzRIeFWxDl6qy/0aSpvIEXojyGvijZyxOtx1/AKhaC1A65+6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788375051;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Aag7H12WKpn4ZD41xX27DjPg4P7S8bGohIfY2/3i2zE=;
	b=bSGtsWBDv5bB8iwDrXKdOHoN2NwtmnMPhtWer00mfOeWJZOUaK8scjeHNI3PLo3x
	rR041uNF9ig5DGW/bX5WZNGaFz3j4OXSVmaRyWdyF25WIBs0tOBY59FIRYgHytFNzoX
	6eQOF1G2pagB3dlYSNVBawjlPMpJcgYrCX2NwIF/riDrykx/t5k05jrGv0Ul781IODa
	FGn1NdtLsiqc7GiIxKHWh86/zkwlAMSx3dp+A+9WpbEeZ0liOJymC3ogMABFXMG7a/q
	/ervupL65yKpgjIKfJA9zy5LOEw4KQWZYn+pAvizeXiNp+TAny57EAqsG3C+OWsJHdJ
	Jp8sUyhOGQ==
Received: by mx.zohomail.com with SMTPS id 1788375047792175.52240182004698;
	Wed, 2 Sep 2026 11:50:47 -0700 (PDT)
Message-ID: <5ad506e292d3137d095e25b3779656358c0192fc.camel@rong.moe>
Subject: Re: [PATCH v6 05/12] leds: cros_ec: Implement offloaded() trigger
 callback
From: Rong Zhang <i@rong.moe>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902181552.49E051F00A3D@smtp.kernel.org>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
	 <20260902-leds-trigger-hw-changed-v6-5-55693cd78877@rong.moe>
	 <20260902181552.49E051F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 02:45:43 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Lee,

On Wed, 2026-09-02 at 18:15 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [High] Registering a global static `led_trigger` structure in a driver'=
s probe function causes list corruption and lock re-initialization if the d=
river is probed multiple times.

Real hardware doesn't trigger the pre-existing issue, and the series has
nothing to do with the issue. Therefore, fixing it is out of the scope of
the series.

Thanks,
Rong

> --
>=20
> commit bc24951be035009b57d7197b147b7679371f913d
> Author: Rong Zhang <i@rong.moe>
>=20
> leds: cros_ec: Implement offloaded() trigger callback
>=20
> "chromeos-auto" is a private hardware control trigger which always stays
> in hardware control. Implement offloaded() callback with its return
> value to be always true to reflect this.
>=20
> > diff --git a/drivers/leds/leds-cros_ec.c b/drivers/leds/leds-cros_ec.c
> > index 1844d0cd5f528..6db83d0152775 100644
> > --- a/drivers/leds/leds-cros_ec.c
> > +++ b/drivers/leds/leds-cros_ec.c
> > @@ -85,12 +85,18 @@ static int cros_ec_led_trigger_activate(struct led_=
classdev *led_cdev)
> >  	return cros_ec_led_send_cmd(priv->cros_ec, &arg);
> >  }
> > =20
> > +static bool cros_ec_led_trigger_offloaded(struct led_classdev *led_cde=
v)
> > +{
> > +	return true;
> > +}
> > +
> >  static struct led_hw_trigger_type cros_ec_led_trigger_type;
> > =20
> >  static struct led_trigger cros_ec_led_trigger =3D {
> >  	.name =3D "chromeos-auto",
> >  	.trigger_type =3D &cros_ec_led_trigger_type,
> >  	.activate =3D cros_ec_led_trigger_activate,
> > +	.offloaded =3D cros_ec_led_trigger_offloaded,
> >  };
>=20
> [Severity: High]
> This is a pre-existing issue, but does registering this global static
> led_trigger structure in a driver's probe function cause list corruption =
and
> lock re-initialization if the driver is probed multiple times?
>=20
> If cros_ec_led_probe() runs multiple times (for example, if a user manual=
ly
> binds the driver to a secondary device via sysfs, or if multiple matching
> devices are present), devm_led_trigger_register() would be called multipl=
e
> times on this same global structure.
>=20
> In led_trigger_register():
>=20
> 	spin_lock_init(&trig->leddev_list_lock);
> 	INIT_LIST_HEAD(&trig->led_cdevs);
>=20
> This unconditional initialization corrupts the in-use lock and list head
> before checking for duplicates and returning -EEXIST. Could this memory
> corruption lead to a kernel panic or use-after-free when iterating the li=
st
> or tearing down the trigger?
