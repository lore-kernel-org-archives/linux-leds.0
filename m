Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101191;
	b=Ae1zficJFaGHTJQr7D7GQi/E/UMArWHefb8AVD2EoNOmW4ABu+BOX+OJJMhpKmzQHXeb
	 TGuKBWE0j9tqYeyiHWHOdX/5Fwjz6nQkab4zlW+LkilYrkhCrQID8hG7WkK4L42bf50M8
	 66QENPPzPT3m2ZVPLXAWDVjywkVl2J7f6Khw7MbkXsK6s9rRWu1m11zKA4y1kNB5HmBhY
	 wu1vILM6dqp8VIxyhbGdD9O/ufVQNEXfqq3+kCP8mpfCBdf3qcWEqW4rXR8xL3GiZAOJL
	 qMm5KHvxSpkRPTQH8uMWR6r1FQ84W8v4xvBQN8nBixNBomVc7gGuRrPvoFhgbT0i5iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ICRESX/KuIp12HkeWKHvYCQjSH63s7t149Snr0DOzPU=;
	b=U8xN9d7GfyyNZ4gtMYwFMxRdaJUQaf2HXhmKJ0jyDFFB08r/8h5Hqm8Jg8lgA7L3YVWW
	 J2pCDzgKg1XHhWkveN+awJK2+gZpz+kaSBDXN3LUpjwOToCm/J+4nJeetNGriPfrO/Etm
	 FMlAcoRvwrqbQa69SS4TB5QnSrjHmhcOlQ7NPdowdUgcLns5SWPu8CKGDGwcBqxK7dE0L
	 Ra2xs8ap2HVZhGlRQ8jMA0D5Ah6w7LnbFpbx9UAVRYEa0CRDmT1kV9BQPP4zYIBk4l9by
	 PgMpTg+MNV/Ae5fdm0tuma/wSpkYyDrtNd6TMVINUYroLGnu7ptJ8AvyAQX56sNcXeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZlwvmgp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6F1606B5E2;
	Tue, 27 Oct 2026 11:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mZlwvmgp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F3A1F01440;
	Tue, 27 Oct 2026 11:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101190;
	bh=ICRESX/KuIp12HkeWKHvYCQjSH63s7t149Snr0DOzPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mZlwvmgptcmxa+cy7AZqgScG8inX9GHscuJqMXtkweT4GWlV7bbSth1Yh5xVLEd5N
	 WuldMQioRsbXynG1jAJQSFkkO4U4AXPirDnZXFhitv+X5pS35y0Gkpf4rkzJUXU1Gg
	 F8FyMDw/49IacWkymF0kxx3hwm0fnYcY5OsjmmS+a655ZFxIwCpckWgusp3KI6ULxs
	 9u0UMXnAYfXT043u31k4is16JFGGTW0eD4DKX+B7u24tPLYia06GWgdX+Xp7Jq2kyW
	 +BrUpeu9pciadRWYpMJLP3NuP9xBnOU3MYcDYfnXXXlAJFPsLGRFDLAXGaWGNU/6Q3
	 KirT4DA34dnQQ==
Message-ID: <sashiko-outbox-186466@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] backlight: aat2870: Derive brightness steps from
 max current
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261027113230.47538-3-clamor95@gmail.com>
References: <20261027113230.47538-1-clamor95@gmail.com>
 <20261027113230.47538-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:39:49 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The AAT2870 allows only 32 steps of brightness, with this amount defined
> by the maximum supported current. Remove the need for max_brightness by
> calculating the allowed number of steps from the maximum current.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113230.4753=
8-1-clamor95@gmail.com?part=3D2

