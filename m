Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055940;
	b=xemHPPqSCC9qEX+jldTkuM/M7h3Q7q3YSTTq0rSievRIQpkvzwRfQldSrz6hZVtc2rns
	 IpQEQIaOBqv6ty8MiqoJrINEu80C8+Dbcu1qi5n1e0ESLEPfXRg/6WZlGAxXYUgPVR6ly
	 gmExKQfbibC9xh+pYqJ8Dkl1BOxndMwLQ+i70/RkgdzAIHNuAlI7TGiCWCcNafTSmLPZb
	 CK0BiGeR2S5o+RxSI1DobcMyqkY5c3awDeRk1qOMiq8aPCIdQGPElNA1cMFa2l1FWACF2
	 VEOIwarOoCL4FNJmqKiec7336vEKZ0W3DsrYXc3htmdtxliV/0SYsp/eFxXrAFP572g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055940;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Pd0VlXq83vP80gRoiD5mi7P83iIZDTN2RG+K4rAlNUc=;
	b=RFqD35dElT+5o3XNrBJdqJ02DFhvt8UniJhyOn9lEYvnTumNo01F9vjYoV2R/vlnwAMq
	 FZjqtvN9LvfnJbjUJxDkcNW4RvASD3lhGjOlU1LDz6hogirvevtRS4AfgwMlgp/QSCSuG
	 jSvFka6fqP4kHxaX0A7wniT5ProfpmLVJru5N0jLWqccIAzpL5FjTf/DxoyIZh09Yi1hO
	 E4gTftuf5LW6GiigS1rdShKHqwMHz0I3ScdbISCrwm/9/SHasSyhozwsC8CsS3wCqG18u
	 EXNQVOzF9LLP6/6ntDxqGuzBlNOdNc7iHu3DVU9kAGoAzZe/AeKYCDCAZTqQuBP2ZQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brwpg73B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D237606A32A
	for <linux-leds@vger.kernel.org>; Thu, 19 Nov 2026 02:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=brwpg73B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C5E1F000C5;
	Thu, 19 Nov 2026 02:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795055939;
	bh=Pd0VlXq83vP80gRoiD5mi7P83iIZDTN2RG+K4rAlNUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=brwpg73BHn9RdCEhHGSUOFICwNUsK8XOPixdMabZ6qpMea1ojJfgIgyA8ayTUqBox
	 iK4BkXgDgnyLgpH1OeR9KTKn9W3f/genmnHxaEbeNlK0lFqvdoJ6p3iuehUFWIj/J1
	 PNwbWBwpz2MIv+m34DmD9mxTenw7/bd1vuxr8iO4SgFeodIgJJ1Lg30Z+ms1NMLwfM
	 bW3FHpkav7eCB0vTGNNY8L/c0b1nxJg+Exsj7IS3uux7wIpZSv1jIGt48bhfSJB/2N
	 NvjD1lC4AGdyPXtnN/xVt1BZNO9+lR+w2eRYNFPS/+ivduqAclTRc7pkeDfhDLpeMy
	 45xhZuI5poKZw==
Message-ID: <sashiko-outbox-222327@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: pwm: Fix active-low brightness with
 default-state keep
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <3EE90AC92BE07EA9+20261119023351.3933065-1-raoxu@uniontech.com>
References: <3EE90AC92BE07EA9+20261119023351.3933065-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 02:38:59 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Xu Rao <raoxu@uniontech.com>
>=20
> With default-state set to "keep", led_pwm_add() derives the initial
> brightness from the PWM duty cycle without accounting for active-low
> LEDs. However, led_pwm_set() inverts the duty cycle for these LEDs.
>=20
> For an enabled active-low PWM, zero duty corresponds to maximum LED
> brightness, while full duty corresponds to off. The current calculation
> reports the opposite values. This exposes an incorrect cached brightness
> to userspace and can restore the wrong value after suspend. With an
> optional enable GPIO, the cached brightness also determines the initial
> GPIO value.
>=20
> Invert the computed brightness for active-low LEDs, matching the
> conversion in led_pwm_set(). Only derive brightness when the PWM is
> [ ... ]
> so retaining LED_OFF for a disabled PWM also deasserts that GPIO.
>=20
> Fixes: 3d3d65bd2764 ("leds: pwm: add support for default-state device pro=
perty")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/3EE90AC92BE07EA9+20=
261119023351.3933065-1-raoxu@uniontech.com?part=3D1

