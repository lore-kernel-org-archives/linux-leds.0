Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196903;
	b=wPaZbx3Ta4vZKtBnXBx4IiONipBCMKraf+zR38GffmPoMPtjzRN9QGySvtAzY0xhFlY+
	 svROl35YHZGJX8eDcJhYclOA+zo+0fhHZwggD+jIoBMpjc1WZhL+Jtmiq07DpUNkrcIOS
	 583rooFhVbQiC/R0hNATFPy6wGRyilbbcuxazr/B8eK4KTDvGYzvDB5uSMyihgQsWkrV7
	 6uEvCKcduGHkeJ0vWRZW+hCQcwaEa4EkF8vw7NY/m0VaoesEEzaHs2/0xTCrmxtNz0YrK
	 QWfhPzupZ3Lf3vpH45I+tHNlP/ULG28D6NmmBD+OqgdjuAbKpy0zdmU/pDSIBo9wegA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196903;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pCBhuphNykqsDCi/YYqAL2bYnbxjThR/h4QQ8rSXtuM=;
	b=V1txVHri2qsmOq+syigM75P/u2ZolE6aTQomn3tVhEBGIKDT5Q6YRsQdcIGr3f+FazA2
	 zJw19SQ43cTNeL/jnkwMCkKxKGKK5h+UKXBhtShrMbW+zV4H9V+JGO6BnxDklzHfEPEJk
	 pUx1H465u+PvJl+vc7triHUEOf9QoL/aReGpz1MxiO58CrN2YlBRDfH9SnNr6/h63wJUV
	 IMy9WTnK1SwLuAi20pIxgwWTuBlJ7+x1ciGsKMTHGrf0JVgBR6H69/HCOYnRaXxRDlbHv
	 0ukgoyUDMr8jIT3DcxTFMpFtIwEflGfwtPpPaB9/cB/yWlbXPWrduZ/ZC+t+2dD2l3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGvdl5kY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90C606A331
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGvdl5kY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C021F000C0;
	Fri, 20 Nov 2026 17:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196903;
	bh=pCBhuphNykqsDCi/YYqAL2bYnbxjThR/h4QQ8rSXtuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cGvdl5kYZ5TvK+nHpnXPWz+Gjo7XsW8CgtLD9nh9h3Vxlt1AQgzBCkjAsZeh7SP51
	 1rxJwmgZgIT7zXhSHiWmQSQrB/WJM5v0HTTpauTbNKeckjSOeyq88VAoeuu4DvCzXj
	 tvSWAxrYmfWsgXDDcpNuv2V/MZTovx/zotu7dh38qfO/dPXPVlPu7kJdmlxXC/ckuh
	 +7l7Ka59sCeU3mQIwU2mGzXch11VFiuueM5AanXnqg/olLDxVyHRcEEQZvVdRb6f2K
	 C75HzrqLeLlWf0/AbdgiAAYF6A2TK+JF5kOymVSUTrTsS44TcuAoEuZqCKON84j7ak
	 ndsi0KkZLNwNQ==
Message-ID: <sashiko-outbox-225718@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: lp5860: Add I2C interface support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter LaDow" <pladow@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120-add-i2c-support-for-lp5860-v2-1-bcb2ce00a7f5@gmail.com>
References: <20261120-add-i2c-support-for-lp5860-v2-1-bcb2ce00a7f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:48:22 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Peter LaDow <pladow@gmail.com>
>=20
> This patch adds I2C bus support to the Texas Instruments LP5860 RGB LED
> matrix driver.
>=20
> The LP5860 supports both SPI and I2C interfaces depending on the hardware
> IFS pin configuration, but the existing driver only implements the SPI
> bus interface (leds-lp5860-spi).
>=20
> Changes include:
> - Adding the leds-lp5860-i2c bus driver module to handle the LP5860's
>   10-bit register addressing scheme over I2C.
> - Updating Kconfig and Makefile so I2C and SPI bus support can be built
>   independently or together.
>=20
> Tested on ZymqMP (ZU3) with an LP5860 connected over an AXI IIC at
> base address 0x40 (A1=3D0, A0=3D0) at 400kHz.
>=20
> Signed-off-by: Peter LaDow <pladow@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-add-i2c-su=
pport-for-lp5860-v2-1-bcb2ce00a7f5@gmail.com?part=3D1

