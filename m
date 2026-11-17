Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937613;
	b=GGDKaJ1UHORXMMgDCkFAXvSpAq9tGFwTjW+CWv3ec7FxBOa066JfQ4U2scll3IUrC/V1
	 5eiRoc+NutVWTLivpuhyn3HNxmhV71OLZNZGCY35etXCV78Jmm86qJM8+ZE+t8j3rT3Oc
	 SBhyNzi7y/NuvhkXObkAj8BpWNoh118H+JPhnFdJcRjeB0wkkaXepaN1PXhLCHYjNsKC+
	 p5b7rCjwT1GuTOrRP0hUlnrO6skdQHF6L7nRiScQ+qrEHicLlpto0Qdryj9dPxkcHx6Hg
	 D6qYyM/mxV60a6rDJi0FfsA/l/+SFXKdAb7oDf0O6HxOM93BdgvBLWUYjajLjLJc19g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937613;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4mB2IfQXQKoux7FXn/gVNeKPZCKmk//Ql+GH3VWFsU0=;
	b=ApiU7KT8hqSjkeNmJObKKgnwN5ulkEu0NOuNcCSHBaxZWj9Y9Freg6aV4A+RWM7nk4jm
	 WB+o9+PAql6Pup/jUQNjlpQ5jj/a9h/FfoABfC8pW4cdna0jxRkquEUcADHSP3M2HwVSJ
	 fGdpP/0V6UU/e7XLPK1e6MRDTNOWPPCzSJfxDJzIs+nr11SiMmO5y0GErFCwHiBQGE6pq
	 3N5JEBTQa1iAtDhBKeoS06w4Rd7Z0vom/JjHVUuYC+QNquQVid3E48zFhtBqJwVPEZSSN
	 f9r1n1cUIVuOsmrdaZ63TKkvJ3xd+EMMmDAgy0ro4wo1fjrnjAcesVUbFtHtjC06tow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2gRHWRq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBCD606A31C
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C2gRHWRq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB8D1F000C5;
	Tue, 17 Nov 2026 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794937613;
	bh=4mB2IfQXQKoux7FXn/gVNeKPZCKmk//Ql+GH3VWFsU0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C2gRHWRqm7epvYyE2bYbXD2R5L+biLugANfyIJo8P18El2ZlfP+8qaFu/KwjgA5J3
	 TqX4Q0GcsUafAIafeiyvC96oqN94lIf8yj2WnEVKurc6/EtNHOSn8Dv/eIh4MQcqJp
	 AH+Gi+vzqKaPDd0C9w+7tCSUKxw2xz90ucPEN4LLYNfBdxEGZ1L9XYCSJFk4wgHM6o
	 I8M8UYF+D/YbGhnjKR8CP0p/tv7j44AUreA4/J9GNSwOsba6r8Y38yi1XIxFLOBhWd
	 NtrsltK6eNKflJMk+6/u2A47UeYx1NXaggJ+VHM4gqyM/DAPNV3qG9o4aQpRWFBdJ0
	 yWMtAr54hsraw==
Message-ID: <sashiko-outbox-219263@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: add Kinetic
 KTD3137
Reply-To: sashiko-reviews@lists.linux.dev
To: "Roman Vivchar" <rva333@protonmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261117-6768-ktd3137-v3-1-b4fd957e3b00@protonmail.com>
References: <20261117-6768-ktd3137-v3-0-b4fd957e3b00@protonmail.com>
 <20261117-6768-ktd3137-v3-1-b4fd957e3b00@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:46:52 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-6768-ktd31=
37-v3-0-b4fd957e3b00@protonmail.com?part=3D1

