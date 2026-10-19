Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440298;
	b=kL8/DElQm4sMCJJA0ezsrpjQSQpRX4pLryF30EhfFf2LSHbNKTbCyG0wPg0th4I8ylxS
	 XiNwTuV33sKF+8WmwTtQPXqjXaEJRPMm8Izmwi2xDsioDulxifvZOSdQud0gRYcFphC80
	 7Y2Nw6j+J0xovLMU9zJX4vuB7lrRvUA52vVExduRlGrFWGmdT+Im/O0sP4mtzRqeqIW1e
	 GvSyIMB0GhpZA9uAnXDP/4l0nVFzQfYWAzLCO5zhmfM2hF13Vqhkb4qK9tb2L0C7gACze
	 yhm2w29y8PtM6Mbpjneqzh/WZpNlCJ3Jv36vCGXMhwFQnOej0kvDHeRT4wkKE2xuWgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440298;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ANvo9St3v2ROepdEoAmexdzOPCPIt7+sxVgJI5u94wM=;
	b=KX/whlSy26DmtPsV6J/VMTN/UtPfZKm9kT7GE3mWQx6CtDWYvBJJNtAJJEIOtq02rfFD
	 LJ7Ifb/Exw2qS1CXtcXLDV1QjF7Yd8UlV1V2aJd6tzD4sZ0jxp0oo4rpoXR+6bm5OHcDR
	 Rhgwb6Wiipcv4Nzafi5dF/2kXs7t89u2wECb5yeksFCUtHmFqfAFwLDzfq3M8/hl3gkSs
	 Sn/qHuHAu15Q2PMANdOJsDHSeK8O5d5dT7qd9ViVQ0irgI7VbIvMM8sbVkB8wYunTWIgH
	 +5N583yZyJXdadRUshNiIpBx3riQWVYnnRgVZUECepOv+lRuEOe/nEtqLNCbo9d+8SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqw4YgoV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFB0606A319
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mqw4YgoV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422F81F000C4;
	Mon, 19 Oct 2026 20:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792440297;
	bh=ANvo9St3v2ROepdEoAmexdzOPCPIt7+sxVgJI5u94wM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mqw4YgoVbo1WRDwiGoh26yTSMhyuu3hKCSXpd9gH63Nxic+ggYwaLtXuntprgI8Rm
	 K/t32Y5j7KPpU5+cQwpFf01BeXoL9oXzGu1B/BlioW9wmw1CVCyaDNBz9uDMqvd7mf
	 cIJPrUeMmFbF0hYLV6wGNw+8HVXSaPiy6M7B85KwAaHCe0Ocov+0C52pny0doxMYiN
	 vKAABZqLOZFHCaNOqf3/PjxnX/YkEYXOTuxGSxPawV24Qpk9/JhoSPnFNLYAZZMjYM
	 anbQruhEj7XQvG+FChiHi2cBmQgojlburdUZP3B2fIvZLeMkCNVbUqb229Tye5W/uo
	 O2XLZmj0iNb4Q==
Message-ID: <sashiko-outbox-178159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: net: realtek,rtl9301-switch: add port
 LED controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ross Cawston" <ross@r-sc.ca>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018194339.132-3-ross@r-sc.ca>
References: <20261018194339.132-1-ross@r-sc.ca>
 <20261018194339.132-3-ross@r-sc.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 20:04:56 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The switch drives the port LEDs, and some boards wire LEDs to it that
> have no hardware function and are switched in software, such as PoE
> status LEDs. Allow the software LED control block, described by
> realtek,rtl9301-port-leds, as a child of the switch like its I2C and
> MDIO controllers.
>=20
> Signed-off-by: Ross Cawston <ross@r-sc.ca>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018194339.132-=
1-ross@r-sc.ca?part=3D2

