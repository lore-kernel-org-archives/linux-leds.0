Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADB3B0AC6;
	Thu,  3 Sep 2026 06:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417790; cv=none; b=U6gnhneklEiJwNGpWYxXvqKUb4obZCGL+KqAX9ZkTd3eo6TUIEvtGyCJN3z1LstAcyHnCZYGH+oG5pPWYJiNxfxB3YusdVyhXov/m6VJV+QXfgqAQkzbFuNnThF4orA7IrPTiQOImaDcotCoOoq+nnOf3VV/V3BOPNhDXjokF/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417790; c=relaxed/simple;
	bh=zLDDEDOoPOZyiwGuhTcSuwpOsFNXAy79JRkPpolVxd4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBvInU/5JbwZvUDszNnTQRw0OacWXnqHmxS+kHDY3sXFafgkjWTdLfy899zae+VcSChphAep70OwK6eI24/Asc9UVKhYvwXkEUA1JCJhSoxJhhVvEEPByiJmOt2qG6bFi5ziOIpxDV5sTgkJd98pqygN5JoevuaicRe9oGCXREs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ex2T0fKj; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ex2T0fKj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=h6xXnBIM//A962BwFEXD/J8go0ydGTpBGTmxqMZMF1c=; b=Ex2T0fKjQrVj6KSE7L3b3jqFAV
	0jPQMx0XBp2mbfRSefriKvdT2pz9g4qEy15bcxB4eL6GUW4bn602jKAAUV/UFmv+MMEuMiggA8oaG
	l+F7RKrTUMGtl+Ozq8ro5TIl4qadhy4XLGwFPTLy9ctjqzTorpngTPG8LrCd//nzUOhLh8+F1Xw+9
	WS0gHzvICoCajQvauNZd6n9boeGdl9Oq5tWbFQc0b64TbVuesWS8CZcjZb3pUiLa0pIU/aiW3F0iZ
	mPzf9CeLfiEKrqnS2QhcOjxhqygrue7vQ+DxkmeRnNMoXBO2EnM68tgS6a/LFAIXVImLbuesEmf3b
	vVg6fi3w==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x219x-000Jzu-0F;
	Thu, 03 Sep 2026 08:42:53 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x219w-0003Og-2C;
	Thu, 03 Sep 2026 08:42:52 +0200
Message-ID: <62bb7c8527dea0e8af4e23e59dddb49c56d12853.camel@ew.tq-group.com>
Subject: Re: [PATCH 1/7] dt-bindings: leds: pca995x: describe reset-gpios
 property
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org,  robh@kernel.org
Date: Thu, 03 Sep 2026 08:42:51 +0200
In-Reply-To: <20260902161653.GB2133376@google.com>
References: 
	<6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
	 <20260902123759.DC6841F00A3A@smtp.kernel.org>
	 <20260902161653.GB2133376@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)

On Wed, 2026-09-02 at 17:16 +0100, Lee Jones wrote:
> On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:
>=20
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> >=20
> > New issues:
> > - [Low] The commit message description is not capitalized, violating th=
e LED subsystem guidelines.
>=20
> Please review, explain or fix the Sashiko review(s).

Hi Lee,

please see my reply to the Sashiko review on PATCH 2/7, as that one require=
s a
decision how we want to model the output-gain in the Device Tree. All other
Sashiko review comments look correct and will be addressed in v2.

Best,
Nora


>=20
> If this is a set, this request includes the other patches too.
>=20
> > Pre-existing issues:
> > - [High] This problem wasn't introduced by this patch, but the driver v=
alidates the child `reg` property against `PCA995X_MAX_OUTPUTS` (24) instea=
d of the chip-specific `num_leds`. This allows 16-channel variants to confi=
gure out-of-bounds LEDs.
> > --
> >=20
> > commit ead1262f70ad0044c0eca7c693a6d898fbcc4d44
> > Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> >=20
> > dt-bindings: leds: pca995x: describe reset-gpios property
> >=20
> > This commit adds the reset-gpios property to the PCA995x device tree bi=
nding.
> > It allows the reset pin of the PCA995x to be described in the Device Tr=
ee.
> >=20
> > > dt-bindings: leds: pca995x: describe reset-gpios property
> >=20
> > [Severity: Low]
> > This isn't a bug, but does this commit message subject violate the LED
> > subsystem capitalization rules? The description after the subsystem pre=
fix
> > should be capitalized.
> >=20
> > This is a pre-existing issue, but the driver validates the child reg
> > property against PCA995X_MAX_OUTPUTS (24) instead of the chip-specific
> > num_leds:
> >=20
> > drivers/leds/leds-pca995x.c:pca995x_probe() {
> >     ...
> > 	device_for_each_child_node_scoped(dev, child) {
> > 		ret =3D fwnode_property_read_u32(child, "reg", &reg);
> > 		if (ret)
> > 			return ret;
> >=20
> > 		if (reg < 0 || reg >=3D PCA995X_MAX_OUTPUTS || led_fwnodes[reg])
> > 			return -EINVAL;
> >     ...
> > }
> >=20
> > [Severity: High]
> > Does this allow 16-channel variants to configure out-of-bounds LEDs?
> >=20
> > Changing the brightness of out-of-bounds LED channels (16-23) on 16-cha=
nnel
> > variants (e.g. PCA9955B) calculates a pwmout_addr that overlaps with th=
e
> > IREF registers (output current control) for channels 0-7.
> >=20
> > Could this cause silent hardware state corruption and potential physica=
l
> > damage to LEDs?
> >=20
> > --=20
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31=
166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=
=3D1
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
