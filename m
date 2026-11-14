Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681104;
	b=rdH3z/ASr7s0oSk46DosZHy2LRYO1Oks7bbppKhDxLDZYOtgBihBlBAzvM1RXDXxlHab
	 aUceTAlX0x+hR8+dOYAhvupEt4UViAj/aaWg39sp8A1MqrJEUKOLowHy/LS9eh4OcaDFj
	 xvvPEsvINfdLbaKScxOUPqBiEjvhq4WsrF/jhgd0yKvIrkGLIB3oqEZWgGRveiFldkQDF
	 Jv4FuSoVXABZ+QWOfZHJ52N+T8dZG9ibYxbxx3TrHEnv+iFQsYBU4J2Bi4daneiFzcn81
	 Yjuosc5UJfQnUa2MqZ5TylV35XazCiT+ZXGF9KCvSx3r2heOTbm2KoezDzfp6yLHXbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681104;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2ZqLAiq/31fl4lr1W8a13mVKhM7arBtXqcwZdZQmjDQ=;
	b=A0pQ0gvVJNsckeMtXiuvIfG4tSLorWL+n0TskHcbzHekc7vZ9uE0uP12hVvhjPBN36PV
	 12fDqO2F6lXAq5qctN9Dbr/NvFhZJCxpuWp+tgFq5gpLDWlIYI8z5i0I7RTCNWKtnzoB4
	 1HyZDSf1FEahmDyXww8fX5bJbVYyCjGfvYmLLdI6VFIPkUNjDvfFBVauaxVYFkXhp5Cqt
	 E3p0FRuKmcvXTCCfEM+oVmUxWynqAIALhqtEpqh/zXfblK4zESqeWR2R0BmGam1ZQwvUl
	 3SbYxYe4xDS0LOA7zdvqfgz5o7hEyiHo07P4t5m7dVrBXQqr49VtMufimV/HPa7zj0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flxfUIlj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600DA606A323;
	Sat, 14 Nov 2026 18:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=flxfUIlj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8A71F000C4;
	Sat, 14 Nov 2026 18:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794681104;
	bh=2ZqLAiq/31fl4lr1W8a13mVKhM7arBtXqcwZdZQmjDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=flxfUIljYcqY1gad1VQARX95loB0tnmGGVSmyXw5PrOqqzcD4+S9yZEDq31f+/AkP
	 /eskcht6f0f/qko6C5Uwq4VB9U7Sjy6aeWPZWSl/8YTVLl9fNX6Q8zMBia7zpV4lZt
	 dIwAMr/FEASH26Z86LjuUtr4F/FA3NGRcUDmFJMAnFmGAeH2fZcXRXrM9ylIqzhESu
	 jzUIkRkIoHOjmXXnkrFrAMpJm49SopmXAKmnBtXiLo/Nb0lEz0Tj1IqRJU0BQN8NNF
	 AfBz9SG0J6P7ER/m3pUjeQJulcryyOhTm8B80UYIxcYLkSVNHn2v/xsWk2pIny2NC+
	 Y5wvQXnch4aaw==
Message-ID: <sashiko-outbox-214903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: pca9532: Propagate I2C errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniil Demakov" <t3127430@gmail.com>, linux-leds@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114181438.22204-1-t3127430@gmail.com>
References: <20261114172431.11075-1-t3127430@gmail.com>
 <20261114181438.22204-1-t3127430@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:31:43 +0000
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
- [High] leds: pca9532: sleeping mutex acquired in atomic
  pca9532_event() callback
--

commit c7d1a2a939904c415bec23e00e60cb3b774b087c
Author: Daniil Demakov <t3127430@gmail.com>

leds: pca9532: Propagate I2C errors

This commit checks and propagates SMBus read and write errors across LED,
PWM, blink, and GPIO operations while serializing shared state under
update_lock.

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index c8085427696ff..eb9020e77b46d 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c

[ ... ]

> @@ -255,15 +369,32 @@ static int pca9532_set_blink(struct led_classdev *l=
ed_cdev,

[ ... ]

>  static int pca9532_event(struct input_dev *dev, unsigned int type,
> -	unsigned int code, int value)
> +			 unsigned int code, int value)
>  {
>  	struct pca9532_data *data =3D input_get_drvdata(dev);
> =20
> @@ -271,11 +402,15 @@ static int pca9532_event(struct input_dev *dev, uns=
igned int type,
>  		return -1;
> =20
>  	/* XXX: allow different kind of beeps with psc/pwm modifications */
> +	mutex_lock(&data->update_lock);
> +
>  	if (value > 1 && value < 32767)
>  		data->pwm[PCA9532_PWM_ID_1] =3D 127;
>  	else
>  		data->pwm[PCA9532_PWM_ID_1] =3D 0;
> =20
> +	mutex_unlock(&data->update_lock);
> +
>  	schedule_work(&data->work);
> =20
>  	return 0;

[Severity: High]
Does acquiring data->update_lock here sleep in atomic context?

pca9532_event() is the struct input_dev::event callback, which input core
invokes while holding spin_lock_irqsave(&dev->event_lock) (for example via
input_inject_event() -> input_handle_event() -> input_event_dispose()).
Delivering an EV_SND event when a pin is configured as
PCA9532_TYPE_N2100_BEEP will sleep while atomic and can hang or panic the
kernel if data->update_lock is contended.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114181438.2220=
4-1-t3127430@gmail.com?part=3D1
