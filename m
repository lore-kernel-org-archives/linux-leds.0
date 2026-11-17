Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916484;
	b=SGzAVtuTYeTFvBf7ciKG0SB96Mqv7y1j+53oNzYH/TdMsaGVlNgz6ikUnPeJYr0OsfDe
	 We1mWz90buU5wYw1gldT8Z6O8+z9wPqEu47+psl8Rb1j4RCDcTQI2bOnR9Hjs9ISa55jf
	 p4AowIF0OQMZpe8AR58kxgVCP8F08z67DXzyxbrS/clurrvoiL+XMdY4/c91R4hOLzG15
	 +4rjhqQrb48oSfTraej+wyjo4vigY8gmw5r8z1YkgQPb/gIozF0Z8FnhCx/lJjmTIgQ/Q
	 UkoBDD1skR/DB2lbEM8TE51pYVwqwQ5kiHgiRGfrSqvPCi2JygMUigwcZ3XTfMJs7vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916484;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ctL1r68IpWb3deAlDR30M20FWzr8MjsCIiYUJvlCKRo=;
	b=lAow4Xq7CPHQ9GNzM3wLochU3jU8xNi7H5+quJhRhDCXkBCIAlYxa6gfOGwrsGALhaIP
	 4Rt74/T09Hb+jK7qjYGmAHHaVAUhyUB8mT9Bu7lj+rZSll7oFpVgN2Aj8X54dfuGiDbGS
	 YerTY0ajvlh6K8MTQQCDjpJGs9JJv+3dZnVM5kCGLEwA0LsV9lIaL7Cl8NfGp/tE2whoQ
	 hFt+wxoOzqS7P4BpBvKf8Mod7tRvaas5IN+FF1m4WF+sqGDp7WpkajZeKo1UV0fWS/qyG
	 h9ir+KtzFwZhzJSzQg5NFYynESUMGEcl5L1rcrWiZo24iyJ49MYEs0x9NYErzLgcD7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="B1aWN/l2";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7AD606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B1aWN/l2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034751F000C5;
	Tue, 17 Nov 2026 11:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794916484;
	bh=ctL1r68IpWb3deAlDR30M20FWzr8MjsCIiYUJvlCKRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B1aWN/l2AvCi3zswBtWtL/AAyXqhiaQiua7BntexdU7wZO6PDiEexA3qjI1f4ND1L
	 qRtHB5/yFylPeXZ0ulyNatKy8YOnXSnmzStg7ktJuBdUIaj2nxIb8Bj00tSoiqT+fL
	 WWfl2eXxqhlYTa7ZUqB1oYeSd1rpwA4ygCYU6Gt7vmBIWdmPAYP5QCuOA/c0k+B9b8
	 2wSDZqPLy7bD0eitlcAwIgdD6HYLqeNxei8Q71WJpJUuMMsC0KGxW1E1Xt1oqBxlIT
	 qn+Qrm4WsbLmvOzvRGfZr9ZA1cnoJyHZcewLpysIbAY1nZxCH4JobRckDnFUjNFwg+
	 WzuPvh660R8Rg==
Message-ID: <sashiko-outbox-218739@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/4] dt-bindings: net: dptel,dap8211r: add
 LED nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117114432.2794961-3-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
 <20261117114432.2794961-3-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 11:54:43 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Document the optional "leds" node supported by the DAP8211R PHY.
>=20
> The PHY exposes three configurable LED outputs, each of which can be
> assigned a color, a function and a default trigger.
>=20
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117114432.2794=
961-1-a.shimko.dev@gmail.com?part=3D2

