Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C95481FCC;
	Thu, 13 Aug 2026 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786630661; cv=none; b=Ht7eiQgyE5SX7w8vUS0Um2x8lE4gJ12gc25CFrl9oAl0gmKlLESG0+Ezo4j8wGQ0lfHi7LbmKRMzxM3F/UKpauPQRqW09ksN55mCaV1S6Es/MCF2fzhRel7OnpKP1PwX/meVQqJCDchMhql6tuvtsHPngzEO4Qs09sQD8M3dO6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786630661; c=relaxed/simple;
	bh=GIfS1hR/LEikInfLHNyaTYEibepa5AJsfsrMUv3NTqg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FSHDkywvQz8IMgBDcy/0EwfFNFVTxj1MnvV+2D/FM25vJeV8lZorhhwVqlybJyFtLTrbtZZ6n3ydLKqAQ3PCVVZbbSdwVySzyQ+a6BlFHQ1M8KFFLF+pVPcU0FVVQdipSGMMHmtUPwkf+SI0kyQwtdu5YNDI0HpgqSQoEr9GJeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auSpr9+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auSpr9+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1031F00A3D;
	Thu, 13 Aug 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786630659;
	bh=hI8h5Ebqv8Tb8m+u9jyuOG2+HhHfatM64/5pV68LRJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=auSpr9+paVWA34yHRN1INxaxNFemoNLViw5+RHiKwiwBXCDrM51Aq2ntXBDC1NtCu
	 0R2nxkLt9RWtXsCDj1CEb9jfeR1TBLJAkeGuDPtO5dBAY8gLKAgLoEm2ls00cqezGL
	 gpy2L/EuR334RxeS+7n2R76gizJ1VM5H12z8ttMDQymADmAp4Oreq9XHldcQ5QD+CZ
	 cBokrElwL/L03gPzl36sW62DzZa9Gy4z1RpvRiFs33e9tmLxytqJ7EUJ24J28cG52H
	 U7bPiQY6rf8NW9CpcML4nZFdC2NMebddMIQll7roN2PvVdJWGvodRMi0vAlOh5e4VL
	 YHhFYGndfzkoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/5] i2c: mux: Propagate software nodes to
 channel adapters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <e962f3ba58a44cbec8e1f0cfae321d5c8d99d8b6.1786543681.git.ahmadexp@gmail.com>
References: <cover.1786543681.git.ahmadexp@gmail.com>
 <e962f3ba58a44cbec8e1f0cfae321d5c8d99d8b6.1786543681.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 14:17:38 +0000
Message-Id: <20260813141739.2D1031F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing device_remove_software_node() during normal adapter teardo=
wn leads to Use-After-Free.
--

--- Patch [3]: [PATCH net-next v4 3/5] i2c: mux: Propagate software nodes t=
o channel adapters ---
commit dcd183b53494f861ae352813bfad4b50641126b5
Author: Ahmad Byagowi <ahmadexp@gmail.com>

i2c: mux: Propagate software nodes to channel adapters

This commit associates equivalent software-node descriptions with adapters
created by i2c-mux. It finds the software-node child whose reg value matches
the channel and assigns it to the new adapter.

> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 681a201c239ba..040284236275f 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
[ ... ]
> @@ -374,6 +429,16 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
>  				      ACPI_COMPANION(muxc->dev),
>  				      chan_id);
> =20
> +	if (channel_node) {
> +		ret =3D device_add_software_node(&priv->adap.dev,
> +					       to_software_node(channel_node));
> +		if (!ret)
> +			priv->swnode =3D channel_node;
> +		fwnode_handle_put(channel_node);
> +		if (ret)
> +			goto err_free_priv;
> +	}
> +
[ ... ]
> @@ -430,6 +496,7 @@ void i2c_mux_del_adapters(struct i2c_mux_core *muxc)
> =20
>  		sysfs_remove_link(&priv->adap.dev.kobj, "mux_device");
>  		i2c_del_adapter(adap);
> +		fwnode_handle_put(priv->swnode);

[Severity: High]
Does this create a dangling fwnode pointer in the device object, leading to=
 a
use-after-free?

In i2c_mux_add_adapter(), the software node is attached to the adapter using
device_add_software_node(), which takes an internal reference and sets the
device's secondary fwnode. The driver properly drops its local reference
immediately via fwnode_handle_put(channel_node).

During normal teardown here in i2c_mux_del_adapters(), should this call
device_remove_software_node(&priv->adap.dev) instead of bypassing the API a=
nd
manually calling fwnode_handle_put(priv->swnode)?

Manually calling fwnode_handle_put() here drops the internal reference
acquired by the device core, freeing the software node while the device's
secondary fwnode pointer still points to it (because
device_remove_software_node() was never called to clear it). If the
unregistered device object is kept alive by other concurrent reference
holders, accessing its fwnode will result in a use-after-free.

>  		of_node_put(np);
>  		kfree(priv);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786543681.gi=
t.ahmadexp@gmail.com?part=3D3
