Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654366;
	b=NRifSSSr05Hw6C/TjYA2NfEuq7+l9H5dDh5WguksmpWmh2GHme4ZVRdeK8wFXJioEYro
	 zDJXSqy0MfiysJ6I/LvrdDtN5D3AG8jXqp8W+q10OiL72/KfG6tuXtDQg9+A1sZ9Lv1xr
	 jzlULiylinyp3D4Vn2dRrWFRtKPzRmAq4xL+85f485EjYBhiWzWODX+NKOtQfsDG4OlXN
	 mNCTHCihWwOBR5jdt+YPPRH7ao6EIMOlSf89R54ZDrTboAlk06Ebgvl3fISZPOg9WpoFy
	 1FQbIJv1kSGXPfnLtzKnhCPEuu6CZWQimR2c/ehdxFuWdMyuOqRL0w0l3RBFHs6AcOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mRw8XwkFRNBNrg8GsjmrXIwA4dtcyBv4FNY7NNh4OAk=;
	b=anui6qYPiy4dcte74tiELiKdUTKILE4pwji6p4lrRcSMOOEtB+7yvUwwNUMukimcjLGx
	 sKegSwoRl/9nayBw5pP2sECvlisyDWmjgtbK8fIr79/5IUfLnEtbrCTY3PkAK4a4pmBQb
	 b9eXuIk3AGv7X/+fnFh7cccVTQewQ0Q2PDcnd6nomeZ0hnTqdt1nH8chEfSi6X87XebVz
	 8BfeT2V6/ATZbODLgvbdPdkPTrtd+Qo43+kfvUzYlAkPLmbnJHKlFaq+jxX3NOdWAsSc6
	 I96zJTwHRQbBfSz94mqgHEGF669b5hSN0tOAt9nS9BclNK3gqVhlSWnDVOeswaPuiTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFeMNeEb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319BF606A32E;
	Sat, 14 Nov 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFeMNeEb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62A91F000C5;
	Sat, 14 Nov 2026 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794654366;
	bh=mRw8XwkFRNBNrg8GsjmrXIwA4dtcyBv4FNY7NNh4OAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FFeMNeEbKfkybzczamHcFQBcoPPyiys8sSY6C18RnaMHGf4kpDLrUlCD3fDMkxlUA
	 +TQ8S0S24CI1xYLK3P25wqAaPw/LbjuHWRFYnj3qkeyhP8VNgcGT05oe8fk8tx3t35
	 I6ZkaBKb5jx4Kpuooi49rYb5OAtLqTnua2hQikKFBrVQo9lEX9kAI1mMBdPDEnb6xW
	 C9p0f1Eb5BM1h8ICFlqEQcl7mbgx5df2/llefy0D3OmOC+W049Q3AFxyNAYrLe/cx9
	 mVrxi1gl/0h680bfgX2sfj0WdpzcYTXcCN7GfHErwkJir7IYjhTFL0sqgMJBT44gnb
	 TFibrx/EF/1bw==
Message-ID: <sashiko-outbox-214382@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: phy: dap8211r: add extended register
 write helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261113110546.173624-3-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-3-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 11:06:05 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] net: phy: dap8211r: inverted locking comment on
  dap8211r_write_ext()
--

commit 80c461dbd61c7143cfae371b80c6ab5797de75b3
Author: Artem Shimko <a.shimko.dev@gmail.com>

net: phy: dap8211r: add extended register write helper

This commit adds the dap8211r_write_ext() helper to write extended PHY
registers via indirect addressing.

> diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
> index 0bf770f8ebbb4..4eb50c26397fb 100644
> --- a/drivers/net/phy/dap8211r.c
> +++ b/drivers/net/phy/dap8211r.c
> @@ -88,6 +88,32 @@ static int dap8211r_read_ext(struct phy_device *phydev=
, u16 reg)
>  	return ret;
>  }
> =20
> +/**
> + * dap8211r_write_ext() - Write extended register
> + * @phydev: PHY device structure
> + * @reg: Extended register address
> + * @data: Data to write
> + *
> + * Writes a PHY extended register using the indirect access method.
> + * The caller must hold the MDIO bus lock.
> + *
> + * Return: 0 on success, or negative error code
> + */
> +static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 da=
ta)
> +{
> +	int ret;
> +
> +	phy_lock_mdio_bus(phydev);
> +	ret =3D __phy_write(phydev, DAP8211R_EXT_ADD, reg);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D __phy_write(phydev, DAP8211R_EXT_DATA, data);
> +out:
> +	phy_unlock_mdio_bus(phydev);
> +	return ret;
> +}

[Severity: Low]
Does the kernel-doc comment for dap8211r_write_ext() state the opposite of
its locking requirement?  dap8211r_write_ext() takes the MDIO bus mutex via
phy_lock_mdio_bus(phydev), so a caller that already holds the lock will
deadlock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113110546.1736=
24-1-a.shimko.dev@gmail.com?part=3D2
