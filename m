Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558900;
	b=D7iga7cOheQ3qXaa/+k9KhJ9kaPR4wTGKjVr//4bsdaXogYXDBrlaqbMqwmJ56ti6Glm
	 QxgeFJNuzHx6EyURS7ngU7QuQTP4SF7Rn+na9hTMqQv0sRaJadSf5KFwdPw/dI6KffODg
	 c10ylpZGGfu7pyZD5dN68k8R0WAbJqxJWkuP5JSaLcjcaqxvbjJDustu048pz1Nh27bLJ
	 hHkz3aXLG4mrdK7sx3BX1SEUPbDKs1+gEnsxLDnBMRFkiZmrd5Mtc081qsrz2MIFqazya
	 DN2BE+oxx06FBR1HKbgyqgLX/per68kZDNRKKofI/2u8nysir6lTvAdsXpffOe0bCPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558900;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VE8JR5Ksae8KXlqaKtuhqh4hsUSCqrUn2RlTIxzSIpI=;
	b=zmkEyyMz4vSiFpRxAqEhAt4Xj0v5k8d0snfeEldh1LZH8To2R7ZMRkGxD+vUWS4hgBfV
	 UZTKksXMfTaO8qPj7dn6n4QRWOdl2SmJgBZz0+bSfO1ByuvMFKv+OnZZ+GnkptRCrldvP
	 aXY385eRaRI/tUs+8a0HHj2RFxsvY1AReNcTlOtOvo9BxTUI8lbSXcoyrmyar9zQZ8gbL
	 lgt6S3QbL9+53iNbvO9xra0BchGd97P8xiuAvGgwc3JMcW8vIKTGb6dcZZe1DUucUw7cR
	 WNWYQlAGVZCp46MqH5WL89y718tewyHF2PNII3FSkx4IdPVkA2qaSda3PFYSngNYDMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LZJFx1QS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7E606A31A
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LZJFx1QS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA061F000C9;
	Wed, 21 Oct 2026 05:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792558899;
	bh=VE8JR5Ksae8KXlqaKtuhqh4hsUSCqrUn2RlTIxzSIpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LZJFx1QSdFdQroLetmyP1OQYxvpyhN4oGEaJKhWIT7uagnQUYZU5QmNCEDKi2LVej
	 HwOU/Ivfcu0uCnY9qHo713DisYjwLq63t5zsF6fKdU53DbDnXcUBSNftJsG8vinIVx
	 Ghp+3GxslbP/cTpaflQdu4IxUdLdG+Dyo2YuPfresOpbYkzjHiOWldW4NNwadDPDKr
	 TdyOLxlpJ3O0KWbnqw7HthkGO1xPbRq08MqHQjfZrWhzdtyoiNFdT80b0Ub1a4DyUC
	 jJDTO+ooYZ821S6msE5C1gSfttcBAEsSj13kmxIrG9upPEgdD6Bo1tlvYAep7HwmRx
	 XaB3ekIWtmNzg==
Message-ID: <sashiko-outbox-179796@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] leds: lm3532: Propagate enable GPIO errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261021045832.16356-1-phucduc.bui@gmail.com>
References: <20261021045832.16356-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 05:01:37 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> devm_gpiod_get_optional() returns NULL when the optional GPIO is not
> present, but may return -EPROBE_DEFER or other errors.
>=20
> lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
> were not present.
>=20
> Check the return value and propagate errors from the enable GPIO lookup.
>=20
> Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021045832.1635=
6-1-phucduc.bui@gmail.com?part=3D1

