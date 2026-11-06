Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959766;
	b=CDhLpFrnxT1LS+I0trld4/YsGU9lM1ayqcDzmFwbCWU/kkxX0up/mrC5rehm9gTs77CW
	 QIMXNdjQ6uhGLhdTqqsYBEci3LVb1Ncn8OlFAD3akzVXGHZbZzkUbFL9GokqtPXkAdSiJ
	 1sa+2wWj2qlsXFbFh5vAHl9kkzo9rK9hwfCQVnvX8BB/T/J56RHEaF6yEuxZ5Z/M3k3qO
	 Hk9qlwpx8g39PSCJ7SAclOROumuODj4wJOYFRwXCtZ+E/Cnkzmlk5edrlvuS83cQy1Tfi
	 q52lvSL8fi3qqsjjXGzA5BWUFw5niJ4t7hFPJ9V3hgLtmuCIa8+iqZnjU7/RI+jzeMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959766;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BbHLRcFhYKtRnaAfRKn5nfKPs8qDiLVfyAD7bdSqBJQ=;
	b=BGdiMGibYE4hzrKiLFMmAqHbh91nZi1Ot3YJfAWLFVfFUU11ODyqDETaCIhIxdmYCeXE
	 HqTRj5AJbEdfAzQKCuiEzcPsCtjIQfb0wkgg0YHFJD4sN7CuAK/y7pOwkTD0d6MEEA5PO
	 gcfUS5nCLBUMfJ1JFZTE5h45CAjXXFG/nHRQIq8WotXtKCytAmiXCC8/L/+MLcBbIdZu5
	 78pw0Kj2TqfJnfaDWHJeqNfjMpq/JITnrouwEE1Fxr+jhkN50HnaLN+uOhRMdfIug8pvV
	 p+Qzr5pT/ZZgVGTzpJRtyF8Looloj2gf0UCerue6BV3YB0n85xA8LsLH/uik0uOj3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e478rE4v;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0234C606A326
	for <linux-leds@vger.kernel.org>; Fri,  6 Nov 2026 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e478rE4v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5744C1F0089F;
	Fri,  6 Nov 2026 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793959765;
	bh=BbHLRcFhYKtRnaAfRKn5nfKPs8qDiLVfyAD7bdSqBJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e478rE4vbAVVpwK3f0ksXn7r2gdqvBmFQQp8pq41MhK7lZRmfNGNav0FsPrltnA5a
	 q8UQT7XmmcwMu8KLkX6yRpDCXZCGBWqri5Erz2EVZ5YlcafinobBkwruIeYJdzuQKv
	 1WgAeeygjvCJclhZ5ssbNIxBIsXxlrfqqNGGT29JdgFRgrLx7SJCOo1XHX0XDOov/r
	 LIlEdB40YF64G7uNKXxV1Hon1xQ/7L9BdoLd2XP2Swd1dkpQDL6CyEETlQjjRZkpWK
	 AmAcBUCAyRu9NXXbj+7Okxq+ZhMknF+ryRn2KSKFQYJzppIS2nSeKWvXUoD1s9fPGH
	 h5NnXq4fMohUA==
Message-ID: <sashiko-outbox-201187@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] tools/leds/uledmon: force NUL-termination of device
 name
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gu Bin" <gubin@cmss.chinamobile.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
References: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:09:24 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> strncpy() does not NUL-terminate when the source is at least as long
> as the bound. uleds_dev.name is passed to the kernel with
> write(fd, &uleds_dev, sizeof(uleds_dev)), so a >=3D LED_MAX_NAME_SIZE
> byte argv[1] leaves name without a terminator and the write sends
> trailing bytes that are not part of a valid device name.
>=20
> Force NUL-termination after the strncpy.
>=20
> Fixes: fa7f32422ea1 ("tools/leds: Add uledmon program for monitoring user=
space LEDs")
> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106100614.2312=
-1-gubin@cmss.chinamobile.com?part=3D1

