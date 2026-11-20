Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133541;
	b=QAmMNzB1XcAPLZ7NmtyeeezfThYje6q+WDYkH2sU1gUeCmM86kiwEOcqXPTVcGCipK0v
	 sgixtvDgPTABDPH4F8cgscC9k3DmFl1MJe2xFgFMWnKArWhHz0zP3xRQDwbJgwti+0m/j
	 B+nlKVkY6buERdyTyUorAZ2cNhUL/EeNTThGNh5ApqNGBpEaMxPZdnpB53BumVRvKuhlH
	 AsuIYM/ZGdrXMbtftCaTsCQleweuDtoWbzXwBhz6hjRqjKP4MpkxXvR64AcZCTsO9LnQY
	 6mREbX+OPmSF4SsyAQOpvv290v6gqD8ftJuS1xxCdPhoRQJvyjd5exRPgiDIDdHKZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133541;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mKPOBwVM7cpxwc8PP5N/6iko1ksn/y1Zy7rMO9VQjuA=;
	b=dntxwR3nh4I3fxzF6qm++dTLVDjHDBD1LyG53tK+XwwHCun5+qftvTXvM8AIWDaMklnA
	 SDUAtiVVIlJmjEmz9NTCnDufA32otFO3qyUR+g5b8HO3left+FfyCwNfpqa3bVZyJTv8o
	 exGJ9T1WxytnvJHomxylk0lyYs3qNjT8hPYzGTjP57tWTyBC9HbuYzPPm5DpQKM49smDn
	 uSyfSFt+UrtBJVSyra+v+3rBk7c7X/90IyuracxlazM7sW6uhOb8ZgHo4LctPYb5pIcUo
	 ScAwkGVi+lsuDYnzV4+eOJeCv9BT5Y2CsE3l9EekmnKRy4yQLQaTueRFujjFZzczXYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKQlZIXu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CF1606A33D
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FKQlZIXu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D000B1F000C6;
	Fri, 20 Nov 2026 00:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133541;
	bh=mKPOBwVM7cpxwc8PP5N/6iko1ksn/y1Zy7rMO9VQjuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FKQlZIXuI1/ADxWMJsuC0Mn+w1+/T3YcTPxoTFQO3ZqkzwiYxl76yAPFmsjb9lt9H
	 F4O3bj3jRYdz2YfUuEwWMbll6SyIlmagGlgP/9utpAuQNSDlXxZJsRb8dRdP/CnWC5
	 hs89EVKHX9FB7pIqdQwysqML0IpYwHt8l8HWcPZ4WE08Kp9WG1Rcun/Nq/CwdQLXrJ
	 fk+z/bIIXDeI89mv7dwze9kZT0GhScq9qu19fpiIO+w9yOozjwUjzk0WF1iAm3XILC
	 e1+3G4PQ+u6bZdKQuDe7qXXVDHHT2/R8cpxLNQf57HLlZzZl/wMqnhALwuD08XWkgS
	 UB3P7qZsNS08w==
Message-ID: <sashiko-outbox-224256@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/11] leds: rgb: ktd202x: Fail the probe when the
 chip does not answer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-10-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-10-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:12:20 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The driver never reads from the chip: the register cache starts from the
> defaults. So with a wrong address, or no chip at all, the LEDs get
> registered anyway, and every later write fails.
>=20
> The reset write can't tell: the KTD202x does not ACK the byte that
> resets it, and its data sheet says to ignore that. So once the reset
> is done, put the chip to sleep, as ktd202x_chip_disable() does, and
> fail the probe when that write fails.
>=20
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D10

