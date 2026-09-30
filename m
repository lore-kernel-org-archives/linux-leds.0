Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC164F85BE;
	Wed, 30 Sep 2026 15:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783309; cv=none; b=WoKf/g8x2AgAAuCTiwoH8du6rGWadtut4R+tPk6x0Pk76pL7jpbG2wp+yRPFyK0r+8FLcWUbzeeu1FmtKL+eDjxofvMIgKDpKpG88jKysMpHhzV5T5ZKKvIDkCH6kErspuVgCAP9rEWvsgooCwIRiGPLuvra/w9tlrPXZrfEPkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783309; c=relaxed/simple;
	bh=k2XRzr5RpQDRdeXeJXBMfjwcfS3Vhvit9loWRA3Eb6M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=runQGQpJxnXMOB4BtiZO4GKatqBwiIxUnaLcJMrxb3ndg4KXS69ah/YzTQOdys2sdXkPgT7HCGe8RBfaKV/WQu1/sH3PqsNDevYCTLxvYUGUKst4iMwFLYgWJFEVF8h3hYEZK2/Vk95HXRzvBzSxUmVwYwU2NXXFJRtxwhoTcoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1kmzPa5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1kmzPa5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5083C1F000FF;
	Wed, 30 Sep 2026 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790783304;
	bh=0Mzl8p9LryAYu6VHY6dRsZOoPe2EPgUPAvjC11z8Eso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j1kmzPa5LhV817yCJy6BvoaGNQltd52DCwYBEyGO7idRIeE0scMXvD32UCueEt6z7
	 Tx1pw/6R4Dh9J0D9R3cXDHExXArM9/iWys/NEBIm1Wnx42xYRGRsB5HWSKKe+Fhm0n
	 mq4I20bmkZjr+xJNXm3wCmQbG0JHA0muQAoJL/sr8FDcKjP5V/7X0Wvy9IzSU21y0y
	 JpgA4dTOH345i1wYZW/QUI5BAf84C5gFrmOWKGk1qZdFgRsIv8h0cInaP1wRaui22N
	 2bmAe0aL5TjoHaRe9yxUESzV8mGafIDEeQqlVM8JogU9oa1ECciNb8R7o5y7F1setp
	 yGJjmTp2z2a5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/10] leds: pca995x: Add sysfs files for error
 reporting
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <3232b9b6f3574b19082281c0d03873e80bc8e2e5.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <3232b9b6f3574b19082281c0d03873e80bc8e2e5.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:48:23 +0000
Message-Id: <20260930154824.5083C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] leds: pca995x: unintentional overwrite of MODE2 register during pr=
obe
--

commit 1bf2389241c12cac5965e7df3db32ae52db81482
Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>

leds: pca995x: Add sysfs files for error reporting

The PCA995x has builtin failure detection. Provide sysfs files for
individual LED status (reporting "okay", "short-circuit" or
"open-circuit") as well as a global "has_errors" flag. has_errors is
sticky and must be cleared by writing "clear" to the sysfs file.

> diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
> index df3f7ab2e1f87..1fc8de5a77bbc 100644
> --- a/drivers/leds/leds-pca995x.c
> +++ b/drivers/leds/leds-pca995x.c
[ ... ]
> @@ -185,11 +279,20 @@ static int pca995x_probe(struct i2c_client *client)
>  	if (ret)
>  		goto err_put_nodes;
> =20
> +	/* Clear errors on probe */
> +	ret =3D regmap_write(chip->regmap, PCA995X_MODE2, PCA995X_MODE2_CFG);

[Severity: High]
Does this unconditional write clobber the entire MODE2 register?

Using regmap_write() instead of regmap_update_bits() zeroes out all other
bits in the MODE2 register.

This clobbers the power-on reset defaults of the hardware, specifically the
OUTDRV bit (typically bit 2), which defaults to 1 (totem-pole output).

Clearing it changes the output driver to open-drain, which can cause the
LEDs to fail to light up or behave erratically.

Could regmap_update_bits() be used here instead to only set the CLRERR bit,
similar to how it is handled in has_errors_store()?

> +	if (ret)
> +		goto err_put_nodes;
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D8
