Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339810;
	b=BDZz+PYNAL/43GpHdI8hh9vZaGUEzxR9w9S0S99QKYtJg0ik3x7nXHMMOEXtIc4nMWIO
	 dES13+E4W5nnm1sa+JF/TMyk5gEEEceInXpPzSLYtMhcjNQGxtAbjJBQoIDBHAhunD8XD
	 iz9EbbpVtH9kCPgBVObhvgQzy9s5fSmMCKaou8De5Z6DeXFyHPaQTCDPFMTHmgLnSXRaw
	 d8aDtqmQ9NjNSMDcM1BcVNunqdn9Gm3ePTFzQNYoep2g4ROjujauKDkUdQWe+G1MR5/tz
	 xiTHzXELcK22pDnlEFHxXnmNj/gFTax3tn7FXYIxoiVCf4eKa5+/QDxoQ9GEdxl6jFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339810;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YZXer07S58Z/0jzPsNUlTX7+rJGU8w9a+K8zIIGwsN8=;
	b=sLL3m9/i0Yd1XMfPnr+ghyb5QyrqHOfPg7sgkJRz7oWVdVWZ3L0HuAi1ZHtDwGUwUjiR
	 rs2QoMSHk/PPBkTOucrAUhtib+Kr6t6QaRD1BqV16jKXx6z/+6UeZyrzMmTRXqXTw+rJk
	 BYgqxTBqXzEU17xDIJg09F1qw86TgVeAJoj1SqhvetdHfmtswoGeXPsa41WaRjK2EuP6/
	 aC76UfpB8OwM7VJvkmu8kr18SXm8g64S9PWZw23frZm4FMCEenvKqu8iJA15EL9TE+8bL
	 GYCr/sYqFPnpzbd8sxOAka95/SK8upiiqOnT+bZrJB/Ip8VXO55VP5DsP1F8bDapbIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Tirh/qzM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A673606A31C
	for <linux-leds@vger.kernel.org>; Tue, 10 Nov 2026 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tirh/qzM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C3A1F008A1;
	Tue, 10 Nov 2026 19:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794339810;
	bh=YZXer07S58Z/0jzPsNUlTX7+rJGU8w9a+K8zIIGwsN8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Tirh/qzM5nVJzdAF5oEJGeMPrw9982Ttd+YcrvPDLjo4ukh0i9DN5mdNB3pxZmkTI
	 UQ9R9Lhbm0oeLhrpNPao2w7OSqxwGWrK0IsifY9ipg3pKR3/vsTDrHvxzNAmEqM3la
	 R0zsAbv5Sb3a7BI1anvIZbLeD/BQ7yKv4M2RzP5O9YquF0t8A9nbzLKWaSF9XgTNhF
	 Yu0wePhjW8l5cCRUFtQfbqg/BBDq4C1h0dA+gcmBxxQz0smbWVzok+1qL4uzu6uzx0
	 P+ZX7igQTF84jwI6KLIo8uBpyS/ncoFBJRT8khOYi82UXRx7chf6sNyUa3TZkhPxnX
	 F4R+Zdbiyt9GQ==
Message-ID: <sashiko-outbox-207675@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: backlight: add Kinetic
 KTD3137
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261110-6768-ktd3137-v2-1-9496c51efea4@protonmail.com>
References: <20261110-6768-ktd3137-v2-0-9496c51efea4@protonmail.com>
 <20261110-6768-ktd3137-v2-1-9496c51efea4@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 19:43:29 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Roman Vivchar <rva333@protonmail.com>
>=20
> Kinetic KTD3137 is an LED IC, used in various mobile devices for the
> display backlight. Add devicetree bindings documentation for this chip.
>=20
> Datasheet: https://www.kinet-ic.com/uploads/KTD3137-04a.pdf
>=20
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-6768-ktd31=
37-v2-0-9496c51efea4@protonmail.com?part=3D1

