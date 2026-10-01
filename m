Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A603AFCF3;
	Thu,  1 Oct 2026 08:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841813; cv=none; b=D+21IHs53l+QTL9E2nF3tb6Wfy8odhffR7R9ub624klR7mrXbQKMo/F16Hhi5xSRV/yoceWm/jIUFcSMAwsD3DRHNhhRBsrJxr7fBbixR4H4ImSc06fTKtCdWqOIc8yeBBMCk9Bb7kpJj9xOmn+2XUvg6ZNhtv7T9QxVGRXOfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841813; c=relaxed/simple;
	bh=0h0aexifzoPXfbUZClj0yqJPccXtsYDA5KZI5w0hEmY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QLGil8MlG7QCDWJvjCXsJTot6QDS5O+1uQy5FEOgporaPA98tHXPb/KbqOKpMjxGH8+i8pJmCun8z0U5GEAaNSWlb3LZN4s29zkpI2WRTYqwVxcYhg1SLDy+wIgSZZb4sEe5vFSIrauCxVoiJT2H5sA96YlmTnteK448ma+MS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=kJqDj22S; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="kJqDj22S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=394NVBA+I3aKDJvMtsiHLQQOBJKP9/gvjWUusXvjJFA=; b=kJqDj22StpD/Ysk8rs5g+GW/0A
	5BS1xzWABhab3V5O8jqlUqMqDrdS9KQCtqgwa4vwRrAElBhT3qFw1M9Lh6oi6QEIWe4kZRSad5GJe
	3yYVCKC47KkFQwpRKsH6zfZsVI+Hp24xFdIUAq8kIpHxoHpa5lkv0FGYKMl+VbSgUk3vuafGiPTKA
	wvSyq6+vkuanaVOYU82sVhIY/6kxepciDjtwU3EtAYZMuHem1ZCFYlTe5e8GWbNTO1mFc2RTYqInQ
	R//idZ2lvq8AJMYBtixsgeik5JLO8xPx5GdcsWnY/u8IjHsNze30MtAYmp/RiKZgChGHcUxIPnbva
	emen9CNw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xCBlI-0002Wj-18;
	Thu, 01 Oct 2026 10:03:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xCBlH-000ISz-34;
	Thu, 01 Oct 2026 10:03:28 +0200
Message-ID: <addd45d2eed383ba0885fe841ba5fafc2be7accb.camel@ew.tq-group.com>
Subject: Re: [PATCH v4 08/10] leds: pca995x: Add sysfs files for error
 reporting
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev, lee@kernel.org
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
  conor+dt@kernel.org, linux@ew.tq-group.com
Date: Thu, 01 Oct 2026 10:03:27 +0200
In-Reply-To: <20260930154824.5083C1F000FF@smtp.kernel.org>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
	 <3232b9b6f3574b19082281c0d03873e80bc8e2e5.1790684839.git.nora.schiffer@ew.tq-group.com>
	 <20260930154824.5083C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28140/Thu Oct  1 08:24:38 2026)

On Wed, 2026-09-30 at 15:48 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] leds: pca995x: unintentional overwrite of MODE2 register during =
probe
> --
>=20
> commit 1bf2389241c12cac5965e7df3db32ae52db81482
> Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>
>=20
> leds: pca995x: Add sysfs files for error reporting
>=20
> The PCA995x has builtin failure detection. Provide sysfs files for
> individual LED status (reporting "okay", "short-circuit" or
> "open-circuit") as well as a global "has_errors" flag. has_errors is
> sticky and must be cleared by writing "clear" to the sysfs file.
>=20
> > diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> > index df3f7ab2e1f87..1fc8de5a77bbc 100644
> > --- a/drivers/leds/leds-pca995x.c
> > +++ b/drivers/leds/leds-pca995x.c
> [ ... ]
> > @@ -185,11 +279,20 @@ static int pca995x_probe(struct i2c_client *clien=
t)
> >  	if (ret)
> >  		goto err_put_nodes;
> > =20
> > +	/* Clear errors on probe */
> > +	ret =3D regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);
>=20
> [Severity: High]
> Does this unconditional write clobber the entire MODE2 register?
>=20
> Using regmap_write() instead of regmap_update_bits() zeroes out all other
> bits in the MODE2 register.
>=20
> This clobbers the power-on reset defaults of the hardware, specifically t=
he
> OUTDRV bit (typically bit 2), which defaults to 1 (totem-pole output).
>=20
> Clearing it changes the output driver to open-drain, which can cause the
> LEDs to fail to light up or behave erratically.
>=20
> Could regmap_update_bits() be used here instead to only set the CLRERR bi=
t,
> similar to how it is handled in has_errors_store()?

Okay, while the description of the specific flag is nonsense (none of the
PCA995x have an "OUTDRV" bit), the unconditional initialization of MODE2 wi=
ll
have to differ between the PCA9952 and PCA9955B/PCA9956B, and only the latt=
er
implement the error reporting as handled by my patch - I'll fix this in the=
 next
revision.

One question: The AI reviews made conflicting suggestions in different revi=
sions
of my series. First it suggested to fully initialize MODE2 instead of relyi=
ng on
reset defaults. Now it suggested the opposite. Which should I go with?

@Lee Jones: Patches 8-10 will definitely need another revision, but if patc=
hes
1-7 look good to you, they could be applied by themselves, so the next seri=
es
would be smaller.

Best,
Nora




>=20
> > +	if (ret)
> > +		goto err_put_nodes;
> > +
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
