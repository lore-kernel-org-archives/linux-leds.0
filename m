Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794730016;
	b=wgb+qPHaSlasImNtd2QDOah18SaMjdzxLkemTOoP86pE5bdslMDAv0UKnSu1p97oU7sy
	 Bcfr7UQI2f9UDzykZhNJpFaL3oqwWeki8qYnu2weg/GyzQIdgmdkBZgINr3St+uBC/fwB
	 hfk/clvfCpSaNeyQCeoBmb3XhXKqhiRVp595URSLkFXv3PhGsNzHPhzEq3krKlDC7TEE0
	 6k2zLl2iuUueOnhKAJxt3/TdnOwWVvh1jLE1smInrGJRGcDVClXk4Vm8q4VCdXXX0CrJl
	 ixak0HKIE1td+Gb2siJyphcE99ezM/22LuftWTzt8fVasyBQE7TwRkig10JpxZ+IRSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794730016;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9Nrw9K0ADCxMBRLzPLCNI72JE596p+Bpj0OEtBngQHM=;
	b=M0QbGWBpk2TCaLbQHccKNKPTSAtnCPK4gKv12/8NraSSsKviqyhE2u6VyMdLXBqPVkLt
	 T5biL1BB6+981QHSEsJjhtA+VaUsW6iI6q98ru6m+ozVXdb1XqJh8AhXatIKpzuCDOKhM
	 FQShfVV5DFbyx/mgp2UEA9TfU9rWtSGcMSrTGkwVlU95DsVlfEmJ8s9ivVy3UWvIf08I3
	 bx9YBmFjCuG6CNyEqwIgDc/Tdc976LQjxFF1C9UCIrLiTp9uXn/gVRH6NcabKRmJeB8zB
	 pIIPiIPgHRlIjIOXUKbNfVyRjHzEL1rKqHM4tWH8n/lVyhDtM9Kcb3F8JijoCLXdfuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nozcMnLG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EC9606A31D
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nozcMnLG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F96F1F000C4;
	Sun, 15 Nov 2026 08:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794730015;
	bh=9Nrw9K0ADCxMBRLzPLCNI72JE596p+Bpj0OEtBngQHM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nozcMnLGYaaf5jAjzYbN89+vSMS7ZSVQ7FTgRaW2+1PIoBIB/iGfnJZbhZhFsxSQD
	 /jsXFdlRxdbaj7ehnrgBsal0NYp6ZxmyHPHkFB3D6jfhMpLK3C6kUP3YuYicPTHgdv
	 LiVLZ4V0EfMVMe1tzDv97lrIM/w4BjWdCArIO1fn7WeZg/Hsel1DK0ctZfgaljerst
	 dvf9gZGMFy39GA/Tg3GVRPN/orS+b2yfAWAqg+M1wd27ZmIU/8ZVIbPwc09WSlFCtr
	 bbmcGt+QNcqjOem3S4aDXD9IY4f0yCM3zajqvnlLMrbSxF3dYhkpdLCkK/MRdDprRf
	 n6FmCiRPG1ASg==
Message-ID: <sashiko-outbox-215283@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lm3642: Fix container_of() member confusion in
 pin attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziheng Wei" <zihengw03@163.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261115080213.910112-1-zihengw03@163.com>
References: <20261115080213.910112-1-zihengw03@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:06:55 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The strobe_pin and torch_pin sysfs attributes are registered on the
> flash and torch LED class devices respectively, but their store
> callbacks recover the chip data by container_of() on cdev_indicator.
>=20
> dev_get_drvdata() in the attribute callbacks returns the led_classdev
> that owns the attribute group:
>=20
>   - strobe_pin is in lm3642_flash_groups, so drvdata is &chip->cdev_flash
>   - torch_pin is in lm3642_torch_groups, so drvdata is &chip->cdev_torch
>=20
> Both strobe_pin_store() and torch_pin_store() however use
> container_of(led_cdev, struct lm3642_chip_data, cdev_indicator).
>=20
> cdev_indicator comes after cdev_flash and cdev_torch in struct
> lm3642_chip_data, so the resulting pointer lands before the start of
> [ ... ]
> no in-tree board provides lm3642 platform data.
>=20
> Fixes: 8b7cfbec052d ("leds: Add new LED driver for lm3642 chips")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ziheng Wei <zihengw03@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115080213.9101=
12-1-zihengw03@163.com?part=3D1

