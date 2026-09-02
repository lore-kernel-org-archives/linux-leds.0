Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F344A3E7;
	Wed,  2 Sep 2026 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788352524; cv=none; b=HBN43RqQ1CEjAu+Bf3K9OX6YsmNSPW6/XommdaMtSbAuNR1k2o77WIU9JsomH2CVTgGcyXzK3lnM2lmJFWDcR9QziL4dbiMEBpAQ+dQymwDz7iUVVuTKrDk6BeJkE5rts4SD2GcWfjkicgHIQfco47CP8L5OydKv55JQpu7nhzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788352524; c=relaxed/simple;
	bh=O/q6suFLUvgfrhpwgZQFD5lA59N1IyrUGoMcSE0S3Lw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KZxc6puJY6L5wUEur+QF9mJTm/RpE1KNr/Kzr0O8gJxtRhZb5C6Uxz0klhYRrPouglzzOEeHqThE86zSSiWpmuWAxJz+1XNTnuCn1JvsA6jOMDcG+KjFO+FRQCORzv8cNh0d8NhZwiYEyOki3cePrx4M6P8lAtE+muTN0WYXXFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQEnmmCK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQEnmmCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982691F000E9;
	Wed,  2 Sep 2026 12:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788352523;
	bh=IAhN23I2NjJTnEj6PJYjhUMsGZWZJiy5XGE3H+/osss=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GQEnmmCKu5H/19IN2VEp1pp5jzYL/As8J+BOC9RCqMrN6h4CqZKsxvJYFK/mvOGWc
	 MOr9jZY8GzdeRF93RQCAw1qZ3sgFTvTtyicCdTXHU/FqL3p2TYLgN+3l0+CsD3ubxX
	 TtPgOIoCuZD+Qtdxqz2Uigb8WHT8tznCDfbrZIhpfuFRdzNdeDKMOberbnkHuAFyVC
	 B6CurfpMoHbw9yoXfQ/dnJaEO4lURY0joo1qjH5IrqmmJmRD2HyBGoSJAJRRY78pNl
	 3ICu9lk0LUSYQ2USWnswABC2MQmOPDJCgtI9s/zFSB9M+R6Xcz/I2kvAgpa1tIQ37R
	 sJ8PvcrIynznQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] leds: pca995x: make output gain configurable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <0c7e5cd44bb73d8680d30e1ae912b1cfcdab332f.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <0c7e5cd44bb73d8680d30e1ae912b1cfcdab332f.1788350618.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 12:35:22 +0000
Message-Id: <20260902123522.982691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The patch introduces an un-prefixed, hardware-specific Device Tr=
ee property `output-gain` that exposes a raw register value instead of usin=
g a standard physical property or a vendor prefix.
- [Medium] Mismatch between the driver fallback logic and the commit messag=
e regarding the default `output-gain` value.
- [Medium] The commit message description is not capitalized, violating the=
 LED subsystem commit message formatting rules.
--

commit 68a1c0b2bd97402769422bdcabf4d7451b72efcb
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

leds: pca995x: make output gain configurable

This commit makes the output gain of the pca995x LED driver configurable
via the Device Tree. It allows reading a value to adjust the LED current
for different hardware designs instead of using a hardcoded value.

> leds: pca995x: make output gain configurable

[Severity: Medium]
This isn't a bug, but the commit message subject does not follow the LED
subsystem's capitalization rules. Should the description after the prefix
be capitalized, for example "leds: pca995x: Make output gain configurable"?

> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index 8eb9847b9709f..b069b93d39a54 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
[ ... ]
> @@ -153,6 +154,11 @@ static int pca995x_probe(struct i2c_client *client)
> =20
>  	i2c_set_clientdata(client, chip);
> =20
> +	if (device_property_read_u32(dev, "output-gain", &iref))

[Severity: Medium]
Does introducing the un-prefixed "output-gain" property pollute the global
Device Tree namespace? Should this use a standard physical property or a
vendor prefix instead, to avoid long-term ABI maintenance debt?

> +		iref =3D PCA995X_IREFALL_HALF_CFG;

[Severity: Medium]
The commit message explicitly claims the default output gain value was
hardcoded to 128. However, PCA995X_IREFALL_HALF_CFG is used here as the
fallback, which evaluates to 127. Is this mismatch between the commit
message and the implemented logic intended?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6d3600f99c77c31166f=
0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=3D4
