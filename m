Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162733;
	b=MbcqYRqDlhridAhHmi3XuGeJp80tBnwwRYAeLwnt88aVD4N+kAlXaQIHMKXBrJGQKy1V
	 TPeB79aXdhVQQXOVg3JorwDcd/hEve67eNjejpvNDJgkJ7CK+rb/PwGrBsgcZTuXCYXXr
	 EXOlct7Vcgbujd4r027J/VioeMvEFpTvAdzScsCmKeYvtzxcc0Gp0zSxZM9E4lNhwC5sq
	 bAq5jBe4RyoOz0ExAKgfHUzyXxkU/pblZdyhgn9ctYnNDS0OJ2ALpPEu3E4/rVKll2YZR
	 Pg92jvpSPBzFE7pvbxqUVyZw8PHNDvmwcuLBbnQAkKBsz/8DBHXgiK+SGIzV8/PxIGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162733;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pUldvkrP5dn+sctpXnUyCT+PSP9XS4DRPiMs5tA3imQ=;
	b=yOox1yHx9AGOtRKF9ocPF8gfQd7w2dgElgQc2tkpG1+YM6pwzPba2c7CrGYEpA6OBXTs
	 +H+GzLluGuBZrohbvsXR3/DYpkn43N9IDC49/lDOIkTSh2hgNViBU1sxPTuAohWZFoCne
	 qNnjYqNpeUqopdQyQaLgLOZxbkrDGyAfgQRlPnornN8BOLQLiXN8q+ZsMKCoLZgDmt1pz
	 QbzOnTtAY10o6eq3ChQjJKdf2ESB9fQYRVvUQbEAU6+v5XSHSq7eKI4SqixR56qLHhO5I
	 t9YfWliE3JtrxL4dDHnfBlzLSH77seLtpm9njp8En5JxA6GUqvhEYRgXEZYGxeDgGAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CcX9vmv2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0BB606A320
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CcX9vmv2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E1F1F000D1;
	Fri, 20 Nov 2026 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795162733;
	bh=pUldvkrP5dn+sctpXnUyCT+PSP9XS4DRPiMs5tA3imQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CcX9vmv2KCfPFFL5OeZFcQriLtvTY1xjDPKIvYm1XTC0Fhkyo5Z311bTXMfLh4XP+
	 XgO4S9biNVAd5YuFdnIrPwRDKE5/4LiHFhOrTtZH5pOhEX1+mTDu7Z05FhGBfWGdnl
	 NzbPdpt88QJNB2ctYVcZJmQCWceqDklW1agS/UoIH10r9h+ETLJ4fODj87Q1QWLinr
	 YOFMS9mG468Jo4GK6wDGXjKpZuJZsLQYKAerZMmnZ9cTkJsJ/zdcj5sPXx8js/1U4q
	 Bc7gn4FPZtzZ56n2ZcH35K5Cj+i2Ku/e4I5htlV9cbnco8BTPs+dlJt8HoYaVDaKYk
	 SGxvrzeBr4TFQ==
Message-ID: <sashiko-outbox-224707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 4/4] net: phy: dap8211r: add PHY LED control
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120081106.2919010-5-a.shimko.dev@gmail.com>
References: <y> <20261120081106.2919010-1-a.shimko.dev@gmail.com>
 <20261120081106.2919010-5-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 08:18:52 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Add support for hardware-controlled LEDs and brightness on the DAP8211R
> PHY. The chip exposes three LEDs that can be programmed to react to link,
> speed, duplex, and TX/RX activity or be driven via the force mode.
>=20
> Implement callbacks for led_brightness_set(), led_hw_is_supported(),
> led_hw_control_set(), led_hw_control_get().
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120081106.2919=
010-1-a.shimko.dev@gmail.com?part=3D4

