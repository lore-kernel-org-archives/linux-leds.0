Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B697448F03D;
	Tue, 13 Oct 2026 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870423; cv=none; b=vE078mi0a0hNgfu9+HHW9oNsCKL3qZWhR0wCGwbalnt3nDm9R9R6RRnUvU/k/jWaK9PCqw6uIKdCNRNSQSWVHFYJb+iPvbKWqxOA78ux2G2VrSr7xEAWi3hvC9JKtnKV4mGodjJQ5ysPf1zdHMzB6+z/PfDAewVNSsGf1OrVtWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870423; c=relaxed/simple;
	bh=CBPCuL8U0TsGb4GEszzoU0ytkaR9kaOQhhtNWG1SSBw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hcmDE88mUlEapUuiOCeZ3R8d9foBlQuD/lAApVMI3kuGhvRlXOsIn0FVHrFXLqnVSGH8l6MVFCMVyWlK4R1azpc5E1JH3AlEs0EEExHvPJvwF0ZpVgqQyQhxT3ZMwqRZ91Bdf5G8FRJPyB0+mZYSnr/6TkA9KxK6jRHLraj0QCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2Poz1gs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2Poz1gs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A0C1F000FF;
	Tue, 13 Oct 2026 05:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870414;
	bh=hfoty2myeeNDg4UHIGPtwOev+qiCrpet+Uf8g0/6qTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a2Poz1gssLYrcKpG5LdLQA/8u4KwTJlSepawFf0pcWUvL3uTDmbhbBjCVkbOYxydW
	 L5WecK5eD6yJ2y60M3kYwFMxWfzUDhn2VJJ9fPk9YAAOK+FSY15EbpU0J7TtzrfY/5
	 XGGwGWvd/MEfkmVVgjdflg0kqjy4JVD7vICXdUqfDPrztB6dYD6z8q0cfkmU8uJ4+s
	 guQiLhX+2PbwyfXrruVvuUahzrik9pq8GceqE5QZoeDVNW2aju8kSj5Bdg4UGRf3Li
	 P6+y0wQVOK1I27Ex3u04dXH3P7Jdf+gQQ+GWAyXW0vFZvau1e4o3zLrd318ePmCAee
	 JV21IxUsnGiCA==
Message-ID: <sashiko-outbox-169010@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/6] leds: aw2013: Move reset register write
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-6-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-6-cab1fdd050b6@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:46:53 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] leds: aw2013: Double mutex unlock on error paths in aw2013_probe()
- [Low] leds: aw2013: Use of dev_err() instead of dev_err_probe() for probe=
 failures
--

commit 96e8f9d5ce7deeb0752d6125191c77378696f3e4
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: Move reset register write

This patch moves the chip reset register write from aw2013_probe_dt() to
aw2013_probe(), and unlocks the mutex before calling aw2013_probe_dt() to
avoid a deadlock. The deadlock would otherwise occur when LED classdev
registration triggers a brightness set callback.

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 6e661afd77755..8d1d649064c71 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c
[ ... ]
> @@ -504,6 +502,14 @@ static int aw2013_probe(struct i2c_client *client)
>  	if (ret)
>  		goto error_reg;
> =20
> +	ret =3D regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
> +	if (ret) {
> +		dev_err(&chip->client->dev, "Failed to reset the chip: %d\n", ret);

[Severity: Low]
Is dev_err() the right function to use here for reporting a probe failure?
The subsystem guidelines recommend using dev_err_probe() in probe paths
to ensure proper handling of -EPROBE_DEFER and correct kernel log formattin=
g.

> +		goto error_reg;
> +	}
> +
> +	mutex_unlock(&chip->mutex);
> +
>  	ret =3D aw2013_probe_dt(chip);
>  	if (ret < 0)
>  		goto error_reg;

[Severity: High]
Can jumping to error_reg here cause a double unlock of chip->mutex?

By moving mutex_unlock(&chip->mutex) to execute before aw2013_probe_dt(),
the mutex is now unlocked on this error path. However, jumping to error_reg
causes it to fall through to the error label, which unconditionally unlocks
the mutex again:

error_reg:
	regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
			       chip->regulators);

error:
	mutex_unlock(&chip->mutex);
	return ret;

Additionally, if aw2013_probe_dt() succeeds but the subsequent
regulator_bulk_disable() fails, it also jumps to the error label and unlocks
the already-unlocked mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-aw2013-aw2=
0xx-rename-v3-0-cab1fdd050b6@postmarketos.org?part=3D6
