Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133428;
	b=LijQo67+bA115j+/gol38lwSkzuJxLEAieHh6riokYup0KkWuGuclHVCkCEoJnsoiB+j
	 OFMA8t33JdS4/D8w3gIeqbhAqh65DwcVj0wkY4IByxFN66NqAJbAgoB5UQP2qmMHj2/3a
	 CqnPzgvedEfWEeT4K6Sc8Hm6McBxMLOz84LTz9lpTczwxeKgZRhpAKF9GS9/OTa+kvFp2
	 Zwlq3tDWrKjy19Ndv1yndEb1emBC9sNIEiIHgWURl/EEs6YBn6drPbOzl9N2FiVObXwhS
	 VGFq63iehxn7rmS1Ot1QZTLTiB2vAoF9ZdT2vigFCNZLSQvO53B4piWQbqCuuwIE+EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133428;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+U/CFafN4he4d57A5pUzcCmo4ushXuasSFGPv0FfHLs=;
	b=Y0hFOCfx7zI8HOq6GoiOSD0Hm1uleGxeSi1wksERhK/AdqmyXjSyVI8jAmTgp/gqH+KB
	 gM6mJ5JAKk18DjHRULl3NvNRJ7um77OA/epV3GoimvC+tcB6kL1nZurNQppe4NrJIq3jt
	 h3KzY8fAHpOku/I5wS7v4y8Cke1nK61b7XXhz0OpliqdTi1T8TkuIElgmhD954e4Uclo+
	 kE68RB+MwKpgW9ndiRmBK4CXqjOyWCedmq0RradBtVHT2wtbL8w6uOW9xpXqqUqJfB/Ry
	 T2CRoKwn/39XtymBsPkMKyfKQJsN86jRpmjoqqcjRhyRo2Fk3ZjlG4QdbSpuvucjrbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibkcC5Vr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90B606A33F
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibkcC5Vr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62221F000C6;
	Fri, 20 Nov 2026 00:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133428;
	bh=+U/CFafN4he4d57A5pUzcCmo4ushXuasSFGPv0FfHLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ibkcC5Vr7ezJvi3G6e9uHkz7ecllBvufQUXX1tfjwz2i0dS/OF1dYDcyisBXx3/fq
	 VEJAB6nQqDoFgzYk5Oczvlm12DUp1c0FlUt1iHfCACxM1gXREKppqEIoRtSHJdSxmp
	 L6iEB9XNoOBwsrBLOwQjYHNEUGQIpHxDP52PCaYO7Rc4QGGDLYHbsHu8kX14gUdyf6
	 S9QzwiZrdC2/RDp5gw4KuVtPAOR/9AdPVPVtkJarxYVguwrz+E1U1b4lvjmcGOgPBC
	 TR4OthamEkJhduSgTiy895x6EtCQ3nhYNniW+y/afZ2XZkFq3WzrYjkqJtZ2B+WFjG
	 XcQbUzNLqpY5w==
Message-ID: <sashiko-outbox-224247@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/11] leds: rgb: ktd202x: Fix an out-of-bounds read
 with unused channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261119-ktd202x-et6326-v3-2-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
 <20261119-ktd202x-et6326-v3-2-98b836b1cddc@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 00:10:27 +0000
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
> The LED array is allocated for the number of child nodes, but
> ktd202x_chip_in_use() walks it up to num_leds, the number of channels of
> the chip. With fewer LEDs in the device tree than channels, for example
> two LEDs on a KTD2026, it reads past the end of the allocation and the
> __counted_by() annotation hides that from the bounds checkers.
>=20
> Allocate one entry per channel.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ktd202x-et=
6326-v3-0-98b836b1cddc@telaak.dev?part=3D2

