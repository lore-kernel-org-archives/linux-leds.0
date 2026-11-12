Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472072;
	b=GczKj5JNXTcFLC63dUqXvOYQ4bOEwoiaZ9Yk6ZdzXOeOwz5mttmh92Lc343nIs6E0v14
	 eCvkEPCCmT0yFwMGX8JXwHEzoq6fW6KbZpptYZQO4o5WymKyRKvSW7TcPHdL270Po1W3A
	 AP+5OyF7U4Yq/zaSxivoUnqoWsJXQq83A/xGWxhFwGNiYyrmzlMUiYaKy6/o4Iwkqorqa
	 UmE7KMHcfLigrWLM/+9q1XWqkftoMcjAScuseHHKODjZnV2fB9LhLEMqzUWtJAnU3f6cD
	 ssHDk4psMhIJlUnCyzCsLXSlNkkr8nLkR+wDKnDbDYkzvfxLcWGzSaOesDSdmP9qZdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fes0n6I1tjoShBY7MgU04sGD1AGig2f52N40TW3w7IQ=;
	b=ZnCjEjIaRoq8WrG308FtCHejvtIASVgEOEgf4jkXavFW/tyiLqWVSSyNpsu5aYSyreLh
	 ZZv1Nte9Wk8ElrolPGRdAXPxLDeJ3SF/6umh+cRtCIuvzxoute6ooD7ooVPAqfvviavLg
	 VG/ohZW+ysca+6w0arlmfvQIdzYUnr6avrk4T7wEFLYRrWAe8v02QYu2OeGTJ9Deg01Y+
	 1u62iKxmM5OQzLAVMjOnmVZcfK+7CIS/waY1w6DC2JeGr2F7WDLBj3RUE6sVIiT1RkiCt
	 WjwKqfeHoUKFot6DHFAFH0Vq/xqhHK12Nbrb5ksKyCreeuXzErnQb8UQ5wt+V/Tt6FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYhZD506;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66628606A327
	for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2026 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KYhZD506
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF72D1F00A05;
	Thu, 12 Nov 2026 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472072;
	bh=Fes0n6I1tjoShBY7MgU04sGD1AGig2f52N40TW3w7IQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KYhZD506cRY43dHhRAlCBKa9DjY4cyJ9sr5Pq/f8aLnqazmNVqYjuN+oUwx/G4dbV
	 j/dYkK1BzsnE4GXqVWI6ZGfU3bjZO5yRyxkJmw40JD5SJVAXQv3dEbUcfAvoYPA33S
	 TNo9zOGYoGe1Iu2PhZ5SlySYoZVAwziDebGUowdwXJyIffjGuL+PCnFzFfXFt6d1Eg
	 taK10ya/oauFbTBhpb4CAmMG/CBNaLdoqEksX/Be92dYxv2R3w8rK9I/QeHSMaRzZ8
	 6/2bTXYA7zZAISK5hj7xQEuXjUMWuBjuUlq59DyItZMQ8qfrvTidrmXkJhA1Lcl9Ip
	 RWw0HKhnIQh+Q==
Message-ID: <sashiko-outbox-210718@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] video: leds: backlight: lm3533: Support getting LED
 sources from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org
In-Reply-To: <20261112081941.41363-1-clamor95@gmail.com>
References: <20261112081941.41363-1-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:27:51 +0000
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
- [High] leds: lm3533: logical AND instead of bitwise AND in
  lm3533_led_setup()
--

commit 2dcd9488633f844daaa29902962d2a0a3e964633
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: leds: backlight: lm3533: Support getting LED sources from DT

This commit adds support for configuring LM3533 Control Bank to HVLED and
LVLED output muxing from the led-sources Device Tree property.

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index d5997cbd88dfc..72fc839d8b604 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
> @@ -26,6 +26,13 @@
>  #define LM3533_ALS_CHANNEL_LV_MIN	1
>  #define LM3533_ALS_CHANNEL_LV_MAX	2
> =20
> +#define LM3533_REG_OUTPUT_CONF1			0x10
> +#define   OUTPUT_CONF1_SHIFT			2
> +#define   OUTPUT_LVLED_MASK			0x3
> +#define   OUTPUT_CONF1_PREP(x)			(((x) << OUTPUT_CONF1_SHIFT) && 0xff)
> +#define LM3533_REG_OUTPUT_CONF2			0x11
> +#define   OUTPUT_CONF2_SHIFT			6
> +#define   OUTPUT_CONF2_PREP(x)			(((x) >> OUTPUT_CONF2_SHIFT) && 0xff)

[Severity: High]
Should OUTPUT_CONF1_PREP() and OUTPUT_CONF2_PREP() use bitwise AND (& 0xff)
instead of logical AND (&& 0xff)?

With && 0xff, both macros evaluate to 0 or 1, so lm3533_led_setup() passes a
mask of 0x01 to regmap_update_bits() on LM3533_REG_OUTPUT_CONF1 and
LM3533_REG_OUTPUT_CONF2.  That leaves LVLED1..LVLED5 unconfigured and
overwrites bit 0 of LM3533_REG_OUTPUT_CONF1, which controls HVLED1 backlight
muxing.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112081941.4136=
3-1-clamor95@gmail.com?part=3D1
