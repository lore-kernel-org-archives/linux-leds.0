Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732598;
	b=WmGXkAopEszkn51TqhahPU3COwPpV5ThE+2oZvjcyrcN29GK/UDQ6kzam6NI5xME64SX
	 tmXXM54nNPrhVqhehKjMT0NjSWClxsC4lzE+CjkZ8F12QXoP0j1o43c2Qfu8m3hMbAE+0
	 n3wOHKeM/TKx/zh8RMbhAgX6AqZwSd8e/gIZtrL+G3/zw31COdC+48Ir09KIWCws8BU1h
	 Wj1qylwFV8H7Xg5rwV0/rItHAcisHBaiqvA59oygc9THc0Zzx1PZD6FjMUSaBDkL5KDia
	 zICcuj/FPewDukTdXg3dXvOG6xIZWFv0k+hDMOung3k9aN/NtOZ6LlETZOMDFVg2zBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732598;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jaWcKU75GkB26GSGJJu2fdyRNdLvcNGy2GkPjJEd528=;
	b=kS73j/DokpEGWBO3ZxTD2ZOY3/idQOb/i9UQcN5SN7x7F9m56fYyzHrCy8vtL0jYR+0C
	 VA25sXgAxyhQXTDtxnPIC0Vh3Y47AGRLGF6AsAwa1OGLYfit8FYiN1aMNTI+4hVZlIqNe
	 HWN6VVeK/jjCp3w3TzhPtJKLM4nz3rs7hiN1JXvoibWdH96q1tDrwZiuHN2aPoveTNNf1
	 gkVycaQpGbD4Mt/bw+vVj1QdNzKtdsRWtPUsnjtMbM5Nml6VRBpVU15I0eFFtm3KjTWZh
	 2+6ProYJenSY5ODgY/V62wwaUB5qiolRdHivFPCzLwWerUB9pqqrpTJ4ewpwzMuMHjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lz7JuGvU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8439B606A31A
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lz7JuGvU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0781F000C5;
	Sun, 15 Nov 2026 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732598;
	bh=jaWcKU75GkB26GSGJJu2fdyRNdLvcNGy2GkPjJEd528=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lz7JuGvUxXQzk4J+Whm5500V3qrhG6UQjrAg6+fA6N0QI8Jm9AHIT/1oFGL8E0ZUD
	 xGKx7MlvYb/bz+g6kEI/R8cL9m3F8K9oi7yspU2EJlisIH1KC9yr0TbOUFzJxqKd+O
	 nYEQviYuM8c03kgx9cHeiodgQKOffLbeSpuSHU6+YIjeht09WwT9X6ILZY1l3xfRkP
	 LiwZSzCTEKnlyLvNtmRkSBjtNylyDTM0w4eonT35QSAiUlTk3jhRmK81Y6LnivopIf
	 Xdqf5kbFlsEu7Lm1SYD0uy/ElhyhWxwBVFJeqJFkH6Z0YethUcnlh7T88BNIa+vd9E
	 a47MBF9i5F4+g==
Message-ID: <sashiko-outbox-215307@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] leds: lm3533: Support getting LED sources from
 DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261115084347.70592-3-clamor95@gmail.com>
References: <20261115084347.70592-1-clamor95@gmail.com>
 <20261115084347.70592-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:49:56 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Add support for the standard `led-sources` device tree property to
> configure the mapping between control banks and physical low-voltage LED
> (LVLED) outputs.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115084347.7059=
2-1-clamor95@gmail.com?part=3D2

