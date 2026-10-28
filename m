Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176073;
	b=jmp3Abj2qOIJ6N/akPiJt4l3KZdKTATtbbTa9z4rc4SJhD2SWY+JOULwSfm1cMVQqzFx
	 OyavhNZucVv5imTBldZOm1jnmK5HFkbeJFPvS7J3ZPfcKl1x7vWalBTtsqgG5TbGQah9I
	 yeFHec97Tp+LwEd6HbdJBqATMIiVyE80R83etS6OaYcdfYS03ZB+4DD1ECrkQgbun3Ia4
	 8swFl4rfPs+X1slPNkMNX8e/fDK4A+0YgFMQfbDVZzBpgBIVnmGAhiGGiWSKgillNW3oy
	 4QELq3XLfINBALvQ4ooRVIOojEg+rCcXcEWx7WqYPChX4SJHsVNjlLWSvVztwcjyXzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176073;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y4LgdfMK9VZEhgI3ky493rSsmXcoU6KVmli0Sq5EuyY=;
	b=RJBJFU8J495RaQym6j+8PDLb83pDlY4QeGZHJbfaYcHVpvjDAymztW2I1mqGhSxpJkVn
	 LdlsAV17bXYMbjbqW5UtYp8UwSAGdk7YLqxXQF50oisDpW5BzGeARh+0EolSmU9uUr1E7
	 lNlCl+3bkjEQV6VM4QlUxB9v+I6mMzunMvIUNqkDDp7fk/wA3r4d/yXtYs1bMxgpK2QE8
	 btxgJtCV/seZn/zsTPgfWTuyKYOekbdFAdqWLMKXcuF96r8hiQDv+VJ7kaVdjVwmJg+yd
	 PfpDR3fSpG0hP2H3Q6UmvkN1A02JuoTgcBYzuTHroEa6J28Zzxu6UyI0V/1r1364H+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7K7JqXg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5841606A323
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7K7JqXg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702AC1F031E3;
	Wed, 28 Oct 2026 08:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176072;
	bh=Y4LgdfMK9VZEhgI3ky493rSsmXcoU6KVmli0Sq5EuyY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L7K7JqXgYjYr+qM0666rhz37B/k90lq6Tec2ucsAKHIG8Aoa3wJdZp6QF9XpPpqNO
	 o+qx81mlsMzoj+BHV7Os6iyqQXzSup8mYMe5g1tHSOLKivh5/3HEpGttFYArbBY22P
	 N/459K6nBhT4o5abeMxiTzMmvE8E/SbD+zMdP+jCfQQ301nYuKevQD8P/SU+sUVc3Y
	 krGlWMJULa4iY6Yec0kpbnE2FHiTo5f3HJhEV0gUGmM7qJTlNpCaXATD+lW8781zTR
	 okKUIRGQV5iNF+My9qskBPTFiJYwFNM1hCK63c9FaeSWFCx0xqMMK1kjT4NNWjngFt
	 eGgVABFAaFqQg==
Message-ID: <sashiko-outbox-187625@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] leds: pwm: Switch to __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:52 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>=20
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.
>=20
> Suggested-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Signed-off-by: Dmitry Ilvokhin <d@ilvokhin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793027261.gi=
t.d@ilvokhin.com?part=3D8

