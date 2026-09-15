Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B264A263A;
	Tue, 15 Sep 2026 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485562; cv=none; b=H69sa8gKY7RV5M1a4/w2HIVkH671ty0uru6sDBNY1NoInQ7avooOXKEua7/cWVkTVUJo4r7rBdwhpIcbBp+3P9p0TZRkq19m3MtSRFg+UQupr90bmIQ2vmQzqFbHs2/cOf1ieKAll44NPuS0DtWHHMUPwNsEWk0m1QjSYt81gu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485562; c=relaxed/simple;
	bh=g5HqM7yPLjirh+s3nqf4vMs32yicp0M2q0rb2DGhU0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SkRHtf6aVYOc9h1C7dPWh0JBQzaVC+NE88I8/oshBkIA5yX4Utx+xHAQIh82sXCKD/uJv7a62+2ChlnYhHV5kXNjpNIN0Gom1zW1y605U9v6p+QG7OgXZ/MnEsabSAieSWdv+3lTJp+JMCCa66AIUpQsXWgoMm9sts+ManEsCzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NAZwoyib; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NAZwoyib"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=byMjB5chuhzE/XcjSn+EC4LzxGFkdqkyfUk/oRh+C88=; b=NAZwoyib02g6Xe87lVB6rK/+BY
	fncpVtWxq8JnwUXuIzpmR2KRqjUZDueWR/ZlCRVgFRtdsyp8nXK++OczllH42rd3wIw3K8Ajp7Vo6
	4ZrKyIlzfHM59kA9n1LVODiFdhUexNk5F0Wr5eLDzv2X4uQLAB8C1MK6ApWPkdy7jv5hNZSEGGll0
	iv7L9NiOcr9ypdROKFsdaSIjoSZeGCB8mrETdHjCKTWtuAtRjVSsuLxyk4vQDeg1WU3gLLFhHT88U
	M0mGO2mtsiFG6usmaaAFOj2AI+x/BYpmuaByFGZgNyF2tBrtxlNWfxj5Cq9b12f1hn+8Cxp2ZEUms
	Xs7CLAcQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6USY-000JBD-2W;
	Tue, 15 Sep 2026 16:48:34 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6USY-000FHM-0M;
	Tue, 15 Sep 2026 16:48:34 +0200
Message-ID: <b83958e0b2b1b506b90fd368434dc2e52719a3c1.camel@ew.tq-group.com>
Subject: Re: [PATCH v2 8/8] leds: pca995x: Add support for group brightness
 control
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org,
  lee@kernel.org, conor+dt@kernel.org, linux@ew.tq-group.com
Date: Tue, 15 Sep 2026 16:48:33 +0200
In-Reply-To: <20260915143246.CF3C01F000FF@smtp.kernel.org>
References: 
	<bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
	 <bb9d86b8891d58eab135038dfde70ae024f244c1.1789477502.git.nora.schiffer@ew.tq-group.com>
	 <20260915143246.CF3C01F000FF@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28124/Tue Sep 15 08:27:28 2026)

On Tue, 2026-09-15 at 14:32 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] sysfs: race condition between LED registration and parent attr=
ibutes creation
> --
>=20
> commit 519bef49574c49d4cda0dcf149ce7b8d6e09657e
> Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>
>=20
> leds: pca995x: Add support for group brightness control
>=20
> When LEDs are set to PWM mode with group control enabled, their
> brightness can control using a global "group PWM" setting, modulating
> the individual LEDs' brightness with a second PWM running at a different
> frequency. This patch introduces sysfs attributes to expose group
> brightness control and clear error flags.
>=20
> > diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> > index 963e453ce117d..33da3cd9cbbbf 100644
> > --- a/drivers/leds/leds-pca995x.c
> > +++ b/drivers/leds/leds-pca995x.c
> [ ... ]
> > @@ -190,10 +194,41 @@ static ssize_t has_errors_store(struct device *de=
v, struct device_attribute *att
> >  	return ret ?: count;
> >  }
> > =20
> > +static ssize_t group_brightness_show(struct device *dev, struct device=
_attribute *attr, char *buf)
> > +{
> [ ... ]
> > +static ssize_t group_brightness_store(struct device *dev, struct devic=
e_attribute *attr,
> > +				       const char *buf, size_t count)
> > +{
> [ ... ]
> >  static DEVICE_ATTR_RW(has_errors);
> > +static DEVICE_ATTR_RW(group_brightness);
> > =20
> >  static struct attribute *pca995x_attrs[] =3D {
> >  	&dev_attr_has_errors.attr,
> > +	&dev_attr_group_brightness.attr,
> >  	NULL,
> >  };
>=20
> [Severity: Medium]
> Does this attribute registration order create a race condition with users=
pace?
>=20
> Looking at pca995x_probe(), devm_led_classdev_register_ext() is called to
> register the LEDs, which emits KOBJ_ADD uevents. Later in the function,
> sysfs_create_groups() is called to create these parent attributes.
>=20
> Because the attributes are created after the uevent is emitted, udev rule=
s
> triggered by the LED addition might fail to read the new group_brightness
> attribute because it is not yet created.
>=20
> Similarly on device removal, sysfs_remove_groups() is called in
> pca995x_remove() before the managed devres cleanup unregisters the child
> LED devices. This causes the attributes to disappear while the LEDs are
> still registered and potentially active.
>=20
> Could we avoid this race during teardown and initialization by using
> devm_device_add_groups() before registering the LED class devices?
>=20

Ignoring the fact that devm_device_add_groups() does not exist (and as far =
as I
can tell, there is no other generic devm interface for sysfs attributes), u=
sing
device_add_groups() instead of sysfs_create_groups() seems nice. There is a=
lso a
pre-existing race-condition between LED device registration and initializat=
ion
of hardware registers, which I'll fix in v3.

I can also move the creation of the parent device's sysfs attributes, so th=
e
attributes are already available when the LED devices are registered.

Best,
Nora


--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
