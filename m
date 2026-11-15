Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702209;
	b=snr2kcVGJM7HHUHTOHb9yYL7PrWPYqWtkiR3Q1dJ+V1r9uIwpjZEyj9L31RG5LjPldmw
	 9qHBsv9YXo5jsmiBzMSicxJhr17+lzULdZ8p3oWmbnnl/jjLcLuNP7eVIygPUk3RrhVEt
	 QYR/nMd1sfjdCgHL7Ov9F3oiczN0WkjHDxHWkPJFxdJKOI89bfseE+kK5jerDCm4SXRzz
	 ykXup+GtpL6TKxpt+PvjZQtUm2D8XIoWMTvfBCzMBN3ZYmsA+XXMT7Qo5kMpXaF8qO0uy
	 W+5JItdEoKdjJEjnlpkn6T7xc7mMa5OwOmtc4wUuBkH8I4t1+WiqJIWzk+1XPSIfxZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702209;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vPjuZxPHIadu6+SkZt0iZSoDaPgK2pLYoGBV8/o+38E=;
	b=wECkGUp3mpDjs/uJlTSFvXhv1mmzWca5NKMvrqwYHuugDjJU1f6u+I/HAPlVp19Dzrjb
	 JwYgHcd0c4vpRuK3DVU/kGXYIoZXl0vwyoFa+tMjF1vVn+IuQB7l9eC21Sfa/rEHFI1tt
	 CKUE/5PUBOOgbCmJCynNNG5J4l5QCPoAZI7ljIKm91Qmpa4SRbTENBQdEjt0pFScF+BsI
	 GwpcU9J/koIkL5rzFAungqu5prRyVIq+q1B4yXPvSeasohMQPoYkdy4tPSBGs7ApwJKbV
	 35qW1exp0MQPxWoMJnjB/p8mU4cUJqSxGddc/899JO0giexdfqlnUH2wMqliURQrIIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqJx2HXX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8DC606A336;
	Sun, 15 Nov 2026 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqJx2HXX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B411C1F000C4;
	Sun, 15 Nov 2026 00:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794702209;
	bh=vPjuZxPHIadu6+SkZt0iZSoDaPgK2pLYoGBV8/o+38E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqJx2HXXk2VY0oYLX4lY+FzAsNvTXS9ZYXl6qFHp8suspi5+yLXu8/Trj9MyyndYL
	 Kkt+YTj/ft+hcVoxU6D6zjbjkJeFUxf2CQzq6JI0i5KUkd6PwJUV6kOY7ybLNzYmmh
	 CbzdxUbmoFl0mPBqgeyvl+EzOT+xnzC8Gr6ekOVVJrNeZYU8Y1ylRFs4na0nvQhPkh
	 hzMrvvoiQDLCUauc+pfcA25nFkFeEryIemSXLa/m4tF0TodgialNnXEATAP8iOuafD
	 kIQFOlAqm6iWbYnbdFCL28rzjFET/Kp8gdn2exoIVC5ZLtU2ynkKZzYy1RoBtx8kta
	 A4THSV5iqsvyw==
Message-ID: <sashiko-outbox-215144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] leds: is31f132xx: Add support for is31fl3206
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261114-add-is31fl3206-support-v5-2-332db80233df@amieiro.net>
References: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
 <20261114-add-is31fl3206-support-v5-2-332db80233df@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 00:23:28 +0000
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
- [Low] leds: is31fl32xx: mixed declarations and code in
  is31fl32xx_init_regs()
--

commit 17585c728364ffbaee88a6c09e1a1085eccc5391
Author: Flavio Amieiro <flavio@amieiro.net>

leds: is31f132xx: Add support for is31fl3206

This commit adds support for the ISSI IS31FL3206 LED controller by allowing
the chip definition to specify a bit offset for the enable bits in the LED
control register.

> diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32x=
x.c
> index 581c05bab9697..1c76b0fb1f159 100644
> --- a/drivers/leds/leds-is31fl32xx.c
> +++ b/drivers/leds/leds-is31fl32xx.c

[ ... ]

> @@ -350,8 +358,10 @@ static int is31fl32xx_init_regs(struct is31fl32xx_pr=
iv *priv)
>  	 * We will control state with PWM registers alone.
>  	 */
>  	if (cdef->led_control_register_base !=3D IS31FL32XX_REG_NONE) {
> -		u8 value =3D
> -		    GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
> +		u8 value =3D GENMASK(cdef->enable_bits_per_led_control_register-1, 0);
> +
> +		value <<=3D cdef->enable_bits_offset_in_led_control_reg;
> +
>  		u8 num_regs =3D cdef->channels /
>  				cdef->enable_bits_per_led_control_register;
>  		int i;

[Severity: Low]
As reported by Lee Jones on v4 [1], placing the shift of value before the
declarations of num_regs and i mixes declarations and statements in
is31fl32xx_init_regs(). Could the shift be moved below the variable
declarations or folded into the initializer?

[1] https://lore.kernel.org/r/179370064610.793788.8239015594326628135@kerne=
l.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-add-is31fl=
3206-support-v5-0-332db80233df@amieiro.net?part=3D2
