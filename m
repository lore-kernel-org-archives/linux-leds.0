Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187112;
	b=A66wmWTXhvsq0US4ppyN8dZsxSanj9Miq9rbs1evLJgaQQ9bkeSntfIRzTjJu7mXlufc
	 Q8hQvpXH7k5n7WzpCYy3IC8qt9O+az4P6DlWWTc6sULKHSGMG7OjOVJTCCNBvvZQp1nbp
	 XLA0gUcR1JedSZ4M/fiIJwjIQB6NnQzZORFCGEg3saK0cWmPvQXC6cZ8QMeEjhHjLapbS
	 e3NK7/jb4Y2Q0QSvQqIAgt8VT/rPn53KEr3ukTcpA+Z3VV+Jw/eJy6cXfGr+KFcgNhUMy
	 Nv9OeKJKewr9+cd7SHcyrcmIPBOsVtY9FaNzn5DDPQ+hrSdk4JmnBDwMCAPR5vQH+gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187112;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Fz0k8oputIvP2ngb2jEJI8EKf7eFSOuev+wvB7tkZow=;
	b=LEaB/J6YmU4zykTp/h7ajjhrvzmjRNBdOq3DvVUyY/+odKfpkLPpxRNsoZhK/aH9WlSS
	 4GzbwBIYxfZ+z3kHPjyDWZ3cM0Y018/y6b51bHZmko6ZxkUWF164BXXOQlt5C+cxSBukt
	 FndrgGWAM11ACDnO0IGHyqPifDHMwJQdztSGoxwLmcr4fQNTa/KY652JODnFGsKVfZyvi
	 oMTY89qj6dcRqYiNW1vjcZiOGxPYeEu6P9cFaR6IbtaObOg4RH0IA5DuvPko2Yv3R4hd/
	 uYNK6Hkr5aqGkX7CCSIljEgcwBfwL+BehppmwAS/ahsWktnSLSA+J7sElbR7c/TdXng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iLV/rQZ1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B98606A325
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iLV/rQZ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E421F000D2;
	Fri, 20 Nov 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795187111;
	bh=Fz0k8oputIvP2ngb2jEJI8EKf7eFSOuev+wvB7tkZow=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iLV/rQZ1g2BF9u6y7EJ1j2wpcBU21iGnj9KkpKDiqFSEzvHTCNwlPXtVuKU0p7KsX
	 SYd5WJKXxDCEdLSq8TxQQrfgtp4nRod74szeMx53+KZXD1PqvPCtqd+rxO7Dmx57J1
	 nkmIvOZn7cEuO7hmOQ36jTp+n5ZMA/BT8x8f856UH31o3qbB9Dymj7+6CmL5tdGv81
	 zmWZ/pUc3LlYpYGWnehWkPRYgks5/gaMisAcBOGV8PUtV/qmC9+ZHTZxESIZhm6tsy
	 uBQsjiMwzK5ZjsS2PUbfy6jIylqf5HmgBs2GOw2ulM9C9go6xUC5lDPNnsOg/MnqYy
	 lJRNRZkzz3I+g==
Message-ID: <sashiko-outbox-225424@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: lp5860: Fix DOTONOFF register offsets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peter LaDow" <pladow@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120-fix-lp5860-dotonoff-register-offset-calculation-v1-1-ec1e78842380@gmail.com>
References: <20261120-fix-lp5860-dotonoff-register-offset-calculation-v1-1-ec1e78842380@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 15:05:11 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Peter LaDow <pladow@gmail.com>
>=20
> According to the TI LP5860 datasheet, 18 dots per scanline are
> spread across groups of 3 in the DOTONOFF0..DOTONOFF32 registers,
> rather than spread across the entire range.  Update the register
> offset calculation to correctly calculate the offset and mask
> for scanlines 1 to 10.
>=20
> Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
> Signed-off-by: Peter LaDow <pladow@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-fix-lp5860=
-dotonoff-register-offset-calculation-v1-1-ec1e78842380@gmail.com?part=3D1

