Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175212;
	b=cs3xxukQhrJ8zy/d8DoTez09m1mzb9OEeBPlHtBqaZErs5ian/1oKeo207B32d/fukr+
	 g/MkZCVlqmTIt2UM6SLjWDILrn5Eyg0X646VH1A5ppmauXTyVRFekE93LsUwcDvEZ/I0B
	 IZ7JwVBeYOQ/k3Q2lFL+OBIhinlcDlv/URpCzECbBaRdkZ8FUbX5tDaqj51aqbkPummVR
	 XrNNe74pvmYl6EtZmbLNvkVRbhz+IhW9eZ93Rlk4h0jrhFP4sjjiRywvqsHGSdRvCUPPE
	 Azkh3uQaT3ZKTWMKIkVRo0263kl88ZmehNjovbuyVt573mEnuWVv+sNt9dI43tZ9dCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175212;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4vbH3Yk9icP6Ev4kqICoptnLr7WLybn+OoOluX5jTQU=;
	b=utRM5fvt7Q9axnYpen+wpzRthAapZcNYhAxe3mcw+2b3GPjL93ODxEQQcpvYuvuZMqcL
	 M6tmi6LPp8O0ZxH4Ym8fT+Hm3vVvkjz+cIDihTdiHYq+Gm3RvKzoL+dCMBCSP22QHbmAR
	 Rr3xm3QXzO7vsKG2TIypv+7eJncP/AgmwnbAPc8qmvoJa8q1SDLavkYeIYku7CZxiYJ64
	 RNnvSsT+tuJRvwbP8IvXyYFPpFYDCqwzhxBOO6Zm8ibXhtwflwSby7eLEuumR6J3bM+GH
	 FJhqSQYGjigFJRpx+TrkTZgbJbEPa+BQ+QBaP2ghsMOkI11NdXgMQeur93hixVOBmng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIgmkp6I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EFA606A322;
	Sun,  8 Nov 2026 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIgmkp6I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EF71F0089F;
	Sun,  8 Nov 2026 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794175211;
	bh=4vbH3Yk9icP6Ev4kqICoptnLr7WLybn+OoOluX5jTQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mIgmkp6IaWcFqCdO1BsCj1lAfhQ5AxAT8kEZ7iLuFgpqv7Jy5xBv/xKRGEzJN6cA4
	 g98jqIqdDOazsJG5d4livI8Qvy5+/RQlZ3d454zK/iLSifmmD7YE66jJKSe8Ouvue0
	 07WrkSNRc3U2yyDtgL7uO9rGzrTGFmrIL+DxnM3NAv3h/R11/Zr3VwOP5HfTK1T/O3
	 uiCeh3PyyxiqwB1r1WqVVCM/hK4Xu9Oi9z5fwL9bEhOiIy7uDGfaY24R5LGuGr0Zj7
	 N+mO4CRvS/O1PPCNYOdO/FQ8s53pAVspBz5bQ3FYFzpvmr+1hFyII0dOaAOpEsE/nI
	 ALPowuApmJ8SQ==
Message-ID: <sashiko-outbox-204102@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] leds: aw2013: Move assignment of chip->num_leds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-4-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
 <20261108-aw2013-aw20xx-rename-v4-4-826529beeb52@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 22:00:10 +0000
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
- [Medium] leds: aw2013: commit message rationale does not match driver
  locking or code
--

commit 1ce6b90ecf6b0a7b5d8097b414e8e137a3fe0609
Author: Paul Sajna <sajattack@postmarketos.org>

> leds: aw2013: Move assignment of chip->num_leds
>
> devm_led_classdev_register_ext() executes default triggers
> synchronously, which call aw20xx_brightness_set().
> aw20xx_chip_in_use() silently returns false, skipping chip enablement and
> causing unbalanced regulator disables while probe is still running.
>
> Increment chip->num_leds inside the loop, so that each call gets the
> correct value for it's default trigger.
>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

[Severity: Medium]
Does this commit message match the locking and execution flow in
leds-aw2013?

aw2013_probe_dt() sets brightness_set_blocking to aw2013_brightness_set()
and leaves brightness_set NULL, so default triggers activated during
devm_led_classdev_register_ext() queue set_brightness_work instead of
calling aw2013_brightness_set() synchronously.

Furthermore, aw2013_probe() holds chip->mutex across aw2013_probe_dt(), and
aw2013_brightness_set() locks chip->mutex before calling
aw2013_chip_in_use().  Any queued work therefore waits until
aw2013_probe_dt() has finished and chip->num_leds is already set.

Also, aw2013_chip_disable() returns early when !chip->enabled, preventing
an unbalanced regulator_bulk_disable() if aw2013_chip_enable() was skipped,
and the driver functions are named aw2013_brightness_set() and
aw2013_chip_in_use() rather than aw20xx_*.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108-aw2013-aw2=
0xx-rename-v4-0-826529beeb52@postmarketos.org?part=3D4
