Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734000;
	b=PcGJbtivWzQkyoyndCPM5i0TktEPmswQwCEBiEzAVeK7skfS3uWYPJ78naCycdVMbcFI
	 dxzZ+USW0f5G8zPd9/OP+GhQK9yQXmzEOQljBLGg9ctnNfLvFpX2P0NcScNjILg3KtGuJ
	 4xmKDo0GtjtY5/HiItT4wmd1NpnUYE/8nGMa1vibwtbD415o7hm7BfU3+hGUuHQbcu0HN
	 M1YNPO1exe+E5HITu4WuWWI09glMPKGQxzvmVI9Z2eG2hAet2usnYscACZFKGxpJjLpt6
	 CFca4ZY6HF0nBWDyFopoORtH54gbkJ4LwRkXF2nfQnUs1Q/KRBfCZ5chiL4w1rbqiGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734000;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6bPeUePB3ff5V0dRLimJVVrrgqf9AGX+qYNtQzN8OqQ=;
	b=DGCMv4RFtW+SoIJm2tJjExMRLg/6rbbwXc5biDsUl9a8cpFSeJqJsIEr7OjUMGRqw9O1
	 hyXEXiV/fHWg5z8WI7cd0oILWnPewUq2U328lyLe+VsSVBPQQRXXoak8tskDoiO0x6sGz
	 FRQPaxCg7mAZbhB3FGai/jQGCz8uYxIEFBQW/5WB+mO6eq/FNmgkjVWFNorOzfSXYFBop
	 2vDbNgpa4m2Ss4cr/ui6s85LNVKnVolY8+kak/WcxnLJxJWD5NM9YelKAU2awYEUeejRO
	 2Il6rf0Q1WgpNpgna4ivLwX23tgzoAB2KtUaw61QJrXeZPhJ23qNp+MFClZejlZZLDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmCeFLeK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D83606A31A;
	Sun, 15 Nov 2026 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cmCeFLeK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA481F000C4;
	Sun, 15 Nov 2026 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733999;
	bh=6bPeUePB3ff5V0dRLimJVVrrgqf9AGX+qYNtQzN8OqQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cmCeFLeKKrVVv5f8lH2bUU/Vl6porKZdOcLhNQElwKcEtP59/0r6HWpliH/yibmQ9
	 PPIBI71JKWoMFVgAEJu5QDLsaCdNrvd0RSeP8YrV/j0sQOisN3bq4C8q6KPh4kZYva
	 Hh5sNRxsKOkIiMEYcjLEzk7kDKI0qDZaPIwdBNt42i01kkBsPRJWnxNmiKdAkE+VkT
	 c9ll+uUd/0dI/EIirAQR1KBTMaatBruxv6xCtcrxx13HBWTwzDA9zrK6YBeJiB9CrO
	 QlKi2GZqDjd8x8Na4V2USKPk6CP8/iBlhoU+m5TGCwyWfUCkz3FixqkKKxx329eEL5
	 JZ2yC7TYrz3bw==
Message-ID: <sashiko-outbox-215333@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] mfd: aat2870: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115085826.89641-4-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
 <20261115085826.89641-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:13:19 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Conversion of the AAT2870 driver to use OF bindings requires a few complex
> changes that should be done simultaneously.
>=20
> The AAT2870 essentially provides two functions via child devices:
> backlight and regulators. Both functions are fairly self-sufficient and
> may not be populated on the final board. Consequently, the MFD
> registration API was replaced with of_platform_populate(), and each
> sub-device was given its own compatible string.
>=20
> Additionally, aat2870-core utilizes an enable GPIO. Obtaining this GPIO
> was converted to use modern gpiod/OF helpers, allowing the redundant
> aat2870_enable() and aat2870_disable() helpers to be removed.
>=20
> The aat2870-regulator driver was updated to register each of the four LDOs
> from a dedicated OF node using modern regulator framework.
>=20
> The aat2870-backlight driver was changed to populate all required
> properties from a dedicated Device Tree node. Its channel map was updated
> to use u8 instead of int. Furthermore, because the maximum current is now
> parsed as an absolute value rather than an enum entry, the calculation and
> application of the maximum current were updated accordingly.
>=20
> All of the changes above allow platform data to be removed entirely.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> # for backli=
ght
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115085826.8964=
1-1-clamor95@gmail.com?part=3D3

