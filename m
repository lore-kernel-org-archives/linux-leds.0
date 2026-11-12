Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468537;
	b=BqWA2KQsxVk5qVnUf8+4/UPMTdLbvl03Zn2aaRzWvKdxMfp4bVt7GCC7Le+vzkdbFfif
	 RdGps7P6ezn+lzZuORrAc1nDJfJYZc8pBfDf6RDWtCqrcT10v0UOCqmwKC4Vhrn5ittSE
	 TwGKJx3mqIxQSQidgQ55GS0mXfKU3qxPnJDKg4FGD44PeU71LdDPeC5MiVzgmGJHgb7oG
	 f5GPkVjCsLmo9U41nyssuzfsIL2KOFwzNMUUYTn4An0GIlm1c7p5+S8SaddJWNAUQ0cdX
	 B2y9e3Q+4uKuLYhckeCenYUdbDUh/tde8VB7okCOisFpoBrjwflvnBfbmJy8DY+x+SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468537;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o1EKKL+/XAl3ZAha9TUSU1iSLDnPG94nWJL9cFGL8SE=;
	b=gLqRrAZValDKKFvoDw1rmcaNzTeszW9gySlkBxE7Fd+irsCDhl8s8VkcwgOFufZC3VhT
	 +REkliHBGttx8ANJWNpdGBGrucdXSQhEKcLUDrbWf5P6RElv8rLJ6LV7FRj0b35Hwcpih
	 oKP2KDfCPRPksYMf/H0Csy5dMycD+4nO6pNGVvqKRGDXMr0vL2M8flDotb73CgyoOQR1F
	 2RirNY/WEGtqpZAgO47DOLEbHacxW14/WzqrsHVZ0ecef8WMrFTi1ivsDcjHlM05OTCn3
	 NoKSKjTp8iKEejbMdmhPsrve/jOYTNGLgl2wQlzMQlEg1G6qVfu9sMYJM0zpBwLR+XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfGyp2M4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AF1606A321
	for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2026 07:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hfGyp2M4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B611F00A05;
	Thu, 12 Nov 2026 07:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794468537;
	bh=o1EKKL+/XAl3ZAha9TUSU1iSLDnPG94nWJL9cFGL8SE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hfGyp2M4a4LMiQl7lTnRdNX+vPwgkrd7cqkRVgEvIq2bHDUcfvv8xmqBzoG2C1tXc
	 jdYYTqzEngU/DiU1aEcVh+lnYNAeY6HeG/OWL7bmnyDGaN5rmkiG/sCsuWW+bajHwT
	 IZpR8bAyvK8foLUbloUJRvZxA2MDq0zPhcKoNmNcgW6WbiFBTUJR/5Wa+qzFMPmods
	 5xDa6dYBzIJw3kYMeKibs7HKC34/R3NwiO8sn/9VDZDuJLi9z7OaUV8QpZoYe1hrSn
	 PJUeQ9Z85NoFga5CF99fekd1twh9T3s0cfCZ550ASvTYqQgZFnHnJ0EC7EkWQEh1f8
	 rmRergljq5/BA==
Message-ID: <sashiko-outbox-210610@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: pca963x: Preserve SMBus errors in power
 management callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261112071732.154585-1-zhujun2@cmss.chinamobile.com>
References: <20261112071732.154585-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 07:28:56 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The suspend and resume callbacks store an SMBus read result in u8,
> discarding negative error codes, and then write the resulting value
> back to MODE1. They also ignore errors from that write. A failed read
> can therefore overwrite unrelated mode bits with an error-derived value.
>=20
> Keep the read result in an int, stop on a read error and return the
> write result to the PM core.
>=20
> Fixes: 46f02b681ba2 ("leds: pca963x: Add support for suspend and resume")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112071732.1545=
85-1-zhujun2@cmss.chinamobile.com?part=3D1

