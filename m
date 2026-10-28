Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223532;
	b=DQjtLtQMaBrUE5YrLgi0Z+S37M9yUVxkqZL6xAGhXeIYWbDriDLSTPcZr0t36bcAZV44
	 GaHv1z59y3ocJBelD74nEcrsdaQeiolBZm7rx2YnUED85+OZJaGND6/O/FzmgAN7OJEnS
	 OAU5i15gQPgzVatfNjXrfeVTPjVwxXW6VMxHEREfCZZb8A1PMagk2sDac3sdfPOpjyU03
	 pbzG66jVwZE1hBgvq/581KZkByJmStXB7Mz187ZZp8/4i6WpjGpnUuvRbbwaRucKwQsld
	 2Wenm1UEyRQEAaFDGpw0emw4HruhB+mAmnx3ZX7tGU/t9B2JJbFJq4ZKpXYNMqvrKnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223532;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VgGdFGQYSpf4e/IRYDUX6IUOCc+aflgLzIexJMSFc7c=;
	b=rRhB5P6L9BJ5N55hpbcgJ1BP8j6C2n8qBd8LPwwapx556NvQpOFk4qe5pg8+bo/h16Hh
	 QQ74aRFWZ8kpU90Xu/UMSG70SC/zaCpphJJPi8NYbGxwyoSDyGhzsuRpBfknCFrOVMJZy
	 Mo1Y/Vf//o42HDbngh1/lDk4AJUv64OmIRanFYFn6h6a/QxnJXuZnIFNOxL1wOB4xnJMB
	 8hk4qagRtZYZ9N3JU1ULViGFOeTKzVUXQdB89DNnY7PzMDZm0mnKZLegzRXKRkKYI5q2/
	 pqeWypRLpEC2p95E7zWc5kUc5+d2lNGGEzjxouVYjE48aYsW97dk7PACcT4jpAdUToQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ky2airvI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54860606A31A
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ky2airvI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4CC1F01825;
	Wed, 28 Oct 2026 21:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793223531;
	bh=VgGdFGQYSpf4e/IRYDUX6IUOCc+aflgLzIexJMSFc7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ky2airvIRotKOULHEeX3BbNxgjyctgy9034x1wXdfEfYn05CToZ7eqFGUppx8dMGZ
	 FdNJtFd5k/7ovVpc7++mQ+FqmTX3mjmmft39yRSqLJVxVTbvGmEITytMVd4zs9+Jh1
	 baEBI6ky8rwgjPP+TP+PQYRa6V1JcMHX7AxeFmQvXhB5GW67kuHqHpajeI2z7Qq7Fm
	 9359LfSVlD9LHj6sBfBZ/nhPqr+qd7uOEGFVwZw9oh4EB+Ds1YEXKKxhbi+ThDdPr2
	 GKA95VO6S065ywEXl+uYJ9RK0EOhJ7f/s2ZrWVDlMV7FfyUr5Fq4rAwIC58EcPn3KU
	 fjWYBpE8qsALg==
Message-ID: <sashiko-outbox-188462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] leds: is31f132xx: Add support for is31fl3206
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
 <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 21:38:51 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> This chip has a different layout for the LED Control Register when
> compared to the other variants. This register contains the enable bit
> (in the highest nibble) but also the current control (in the lowest
> nibble).
>=20
> According to the datasheet, a value of 010000 (0x10) in the register
> enables an LED with the output current set to maximum.
>=20
> This commit adds support for this IC allowing the chipdef to define an
> offset for the enable bits inside the LED Control Register.
>=20
> The limitation that already existed for other variants is still in
> this one: all LEDs are enabled and set with maximum current, letting
> brightness be controlled by the PWM registers.
>=20
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-add-is31fl=
3206-support-v4-0-e331cee9fcb3@amieiro.net?part=3D2

