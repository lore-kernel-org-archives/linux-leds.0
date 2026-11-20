Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194151;
	b=kmHDmdDTh68yZ4QAp5/vaa6RzaqjwjbffmF8T8xsDqUFoLtCFecPw04Dl3YeNy5bpulx
	 t4JQfm4gNjWrcf+gi2Z9TtVFKPJE1yLhC2nLsRGYl/NRHzMSxI+nWsOFBFaypFd/GWn/x
	 9Fxo3Z+VFGMuPHMWZxzf4NGfQVkiR3uD9J5FqTtZJ8ICYe5KyXFMfFaO5FwrR0PJ+pdud
	 /izxGImbLgizKtYBLutiHVYe522S8kj2DGinFylJuPypE49tGpzl7E/SzARSLikSCy1qg
	 KXzPZrWxd39aqN9epahzcSMoASMEST2hklUIalpcwRBgk5UHASldnmibvgLKPUM86WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194151;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HpP+NqIgAXK9Vfk6DLIY4bJoKWW6eoSvYOqyo9/abVo=;
	b=HCokldcaZ/L4CcAmTuqf6sFWWzih0x6Ml+yatmckRotfqBppYaraXoo7NCZzaKiioET8
	 /x66N9oQPfLk3NQ/MdqSU4yZo1sj0CILM3khhUIT0qPOZq4he77/BjiG1PyY/b52HTS8N
	 +2LrmWhQNhw/przMh51WOxb7s4sLhpSbuxXXgyJGFRZjo2ywtw2iBn/a3a7L4IpnTwo7v
	 qf2nqjYE7YuKRpk4r6k6JiLkpuxc8PVfUk8P/uZufnrUNCWh8OxHiIxNhaG3X8v3LOtWI
	 Vb4xTQL+3ORiiUgDxRWWJlokHHQpu5GoluEziUOV1wDzDDbEWgv/uH1ESFZrvXln9WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXAI0UmN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6860A2611
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 17:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXAI0UmN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545D01F000D4;
	Fri, 20 Nov 2026 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795194150;
	bh=HpP+NqIgAXK9Vfk6DLIY4bJoKWW6eoSvYOqyo9/abVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WXAI0UmNgW89OMtEkRLCi/aCMBj0rOsaKchOZnihX1z34EaNJimMCOX6871MmI3xT
	 GxoljEBGTeRKc15qk+TlpL9IFr99MWlsYaqFum9s/2DxP10LSPm4ovRgSC7Y4bsuCZ
	 XK3CwMPMTgHFg3R4tCrve+ogOS+jWodTLZApZpeVsPSbv3w3nQuRNOYWlq2tcSgEjg
	 F2mUXCWul5cprcBmmKZPMfxpR/UvnzUEtsZsJwtxgtFEZlh45tpLAYZWWCOMZQkqBC
	 m3ZHmjS99xcv+0J7p5VKId+RdtGEmgOnnHDtUal20Md5rIg8PxFnGUBUFLVDAhK7hR
	 KDVEV5gUBPOIw==
Message-ID: <sashiko-outbox-225618@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp5860: Add I2C interface support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter LaDow" <pladow@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120-add-i2c-support-for-lp5860-v1-1-30bc97dcbf78@gmail.com>
References: <20261120-add-i2c-support-for-lp5860-v1-1-30bc97dcbf78@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:02:29 +0000
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
- [Low] leds: lp5860: positional initializer in lp5860_i2c_ids device ID
  table
--

commit b60cc329b5ce4824a3e19368031ceb4e1c01c7d5
Author: Peter LaDow <pladow@gmail.com>

leds: lp5860: Add I2C interface support

This commit adds an I2C bus driver for the Texas Instruments LP5860 RGB
LED matrix driver.

> diff --git a/drivers/leds/rgb/leds-lp5860-i2c.c b/drivers/leds/rgb/leds-l=
p5860-i2c.c
> new file mode 100644
> index 0000000000000..2744ac3258621
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-lp5860-i2c.c
> @@ -0,0 +1,139 @@

[ ... ]

> +static const struct i2c_device_id lp5860_i2c_ids[] =3D {
> +	{ "lp5860" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, lp5860_i2c_ids);

[Severity: Low]
This isn't a bug, but I2C convention is to use a named initializer
({ .name =3D "lp5860" }) for new struct i2c_device_id entries in
lp5860_i2c_ids[].

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-add-i2c-su=
pport-for-lp5860-v1-1-30bc97dcbf78@gmail.com?part=3D1
