Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176071;
	b=wIP6bsK5wc9njsAiGGXVeAyc3rSEbH5Z6wz7Z5zekUw73HlunmC/DlmkXX0U9eV9CpxX
	 EgfG6qK2THD/7ByFeRf+sslQQcTEH/R+N83f/8B4CcG71QrsaK+ylGUz/MU7I0cM3PT34
	 MGDJ6N5Z6bZ+cylr66qlrnXq/RQ16Dt8PcF7xQJ2eEz4h5XxaZvfZVMNbx5DaiAEsfRRY
	 WJ542igkC1ILfRygSqOoNlPJuEtuYTvcaxFi/IsE6TgFrxvW9FiDmEnV3f9avIy2AMs9W
	 JijcYbI60WxCvcgQdmWHZfmYQuO5Mpd+eXSC3xH66GAj5cN82SZJp/SdaSTNLd6q9BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176071;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dcM/iUrPWa8AlONOtNGdJwOV4Xqie2naekBCmnjw1Kc=;
	b=KGU9TwumhWbBRr29kVyylP3gC39zteC+m7kfVu39tHS1Up6ogPcd0gESb3x5mU1aIWRH
	 pKEMvqTxeD9V8mV7j5DYpc9+t04jzuHIZZYnA4JMl+Rkdqyd5XceDGGOLWUtqjbSjGjBf
	 peWXR78dijNv7ihwRVOPG2P2Hgu6NFE99MeWqU2ju/gb3lA8wyzlGWAMdP1uHKvznM/nU
	 koToNViJ95FB3rPxseXwDX0J+DowkdddIE8fb/qeCXMXvH4mDIIWTe5vE2EbFbuC0LsaL
	 wPIJW53PtAO7m+0qgUa/9bDDsUfkyE7c+/CDm8JjCEsIr5PjEPGJIv4ZGZUs2605gUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSPAzE8a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CB0606A31D
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSPAzE8a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5841F031E3;
	Wed, 28 Oct 2026 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793176071;
	bh=dcM/iUrPWa8AlONOtNGdJwOV4Xqie2naekBCmnjw1Kc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iSPAzE8aI4bsm5lynfGF2b5O/01Bskanm7SxbExTei+PzyS/yYtj4WjrAMm/Mobsd
	 zF/EI94vK1lf6liOl4S7itqdQGfCPhXdtcm7I6rN1elPxPIdkEpumrZNegNxSdEsyw
	 wpo7xCXsng6F/5Rh1Of4AhtA9b6G9EF1yp52zIssbZsPFhDYyR4asvfucbA9LPvIqw
	 RuM5PTu159PyykVNZ9gRldr6Bzx162kld8HXOwgXQAwLOJ5Ftabh7cySSBnhk2zclC
	 23Ys/Z4RdQ0W4wFd3byNWDaZjRblPR0R1lIw0DUGgKQ7wMnRgReWY/gXnfswlcoP5Y
	 faLJocO4FHocA==
Message-ID: <sashiko-outbox-187623@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] drm/amdgpu: switch to __nonnull_args() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Ilvokhin" <d@ilvokhin.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <d57489b8bec240794a7a8aaac6e1e3e0d78ea331.1793027261.git.d@ilvokhin.com>
References: <cover.1793027261.git.d@ilvokhin.com>
 <d57489b8bec240794a7a8aaac6e1e3e0d78ea331.1793027261.git.d@ilvokhin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 08:27:50 +0000
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
t.d@ilvokhin.com?part=3D6

