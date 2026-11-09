Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229758;
	b=BTiOfCBDoB4tle41i1G9o9Q3NEOUEYZxEXhdhMNxdybDmC61XtYXTUDWE7WsefSmclyI
	 mmhlzUf7ky8wYTdJuKsRq+Nb9WCBJ7lrFOSPkwBqd6Chq440viBmfZdohPVr5BZ0p/lru
	 jbaeHywSDqd9MjGPB8q1TcPtZNv0xvIR2fBPBdUbsRs7BwpixIpM4LP1A0ouEm+LAvVCo
	 bJ3Lv7Pik43usn76Lzda02ekmfOQuJh2akMqkQDQTUtvhWGYo+09DAUSX2db3UNpeUbYk
	 J/Zwyf7AdvfxgrT2CvBSDZEwZmZs8aSzEJAW4sloFfMmwaYnle9NNW+/u9R9RrIF7PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YHIRBxd6NXhOyMh+mmKbWMSaeFRfqamhg4/z0l4sXe0=;
	b=QL0+dfinicauzwsvzhuOiFmpRI3wLw3Mk8OIo60tdllmWPpEhssxRHYE8VxkePdYQg8v
	 HVl5ze21FPNzV1RFbE3Vn9gq+qjMVNpGebwSa7drwhd22j8xiyDJwBcv4JdHjZPKhZdR4
	 0+fU/pmdtHm88Sc5em9yrqOT3/At/iKZrPdTcfunLdi9AfubfIj47JiD9Ik6X5Wbu3rW4
	 9i2AzSTQ3k6d/JTFGJ/pSD8rX14HZqqdriI7ZWijgLF9RF2kDYCtjun7EVx1nuWp10Xy7
	 TrAnrz/qsdSUHCSsQc5Gx65gCmhVj/G3WyLFOQzHKHfwlTqkSGBLlTWl9G2Jn0BgkwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUrYyIBO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B26606A321
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUrYyIBO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92B71F0089F;
	Mon,  9 Nov 2026 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794229757;
	bh=YHIRBxd6NXhOyMh+mmKbWMSaeFRfqamhg4/z0l4sXe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WUrYyIBOmDhsUhj1FanO73wyY0lo0Tnx2+aaPXC/DpQzVLhCwP91EyVV6vYYDVIyf
	 +qMxLnqX1tBEC4O1+1E9PeNCgLpiH1rkrbOgr7Kdyxbvuqa20nBuAE+VenrsIaHAed
	 02RkWWCfNtD8rFHwIwvnr0WMEP11MWseN53N4VT8F8ADEXmhes0SjvqOg4mBhto9bN
	 lRekP8F+kAxSbU5IQMv6m5AZFdQBOfd+2SbERv4rGUtUH/ng1yZY0T1tcZGQV81MU3
	 Olflb0ZC7otALgwE/B7ALVwVL5XWmTMl3pW5AZVr5yurj+oIcXSzFlbSKEWRZ7xKJH
	 xKzCkV+I3it9Q==
Message-ID: <sashiko-outbox-204991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp50xx: Read default intensity from devicetree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tobias Johansson" <tobias.johansson@axis.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com>
References: <20261109-b4-leds-lp50xx-default-intensity-v1-1-0a04a3533df6@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 13:09:17 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] leds: lp50xx: heap out-of-bounds access in
  lp50xx_brightness_set() [1]
--

commit 79b801d6a9355ec03170294fd226b03df2a33733
Author: Tobias Johansson <tobias.johansson@axis.com>

leds: lp50xx: Read default intensity from devicetree

This commit reads the default-intensity property from device tree for each
LP50xx multicolor sub-LED component during probe.

> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 20bfb315bda1d..019a3e3cad057 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -522,6 +522,8 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  				dev_err(priv->dev, "reg %i out of range\n", multi_index);
>  				return -EINVAL;
>  			}
> +			fwnode_property_read_u32(led_node, "default-intensity",
> +						 &mc_led_info[multi_index].intensity);
> =20
>  			mc_led_info[multi_index].color_index =3D color_id;
>  			mc_led_info[multi_index].max_intensity =3D 255;

[Severity: Critical]
This problem wasn't introduced by this patch, but can num_colors exceed
LP50XX_LEDS_PER_MODULE and cause an out-of-bounds access on mc_led_info[]
[1]?

mc_led_info is allocated with LP50XX_LEDS_PER_MODULE (3) elements, and
lp50xx_probe_dt() checks that multi_index < LP50XX_LEDS_PER_MODULE, but
num_colors is incremented unconditionally for every child node. If a
device tree defines more than three sub-LED nodes that reuse valid reg
indices, led->mc_cdev.num_colors will exceed 3, causing
multi_intensity_store() and lp50xx_brightness_set() to read and write past
the end of subled_info[].

[1] https://sashiko.dev/#/bug/linux-a0c116ab-2f34-4f53-a007-d7a42f28677b

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-b4-leds-lp=
50xx-default-intensity-v1-1-0a04a3533df6@axis.com?part=3D1
