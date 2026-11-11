Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415851;
	b=Oqrinb31daMUAFuK+aoGg8ksMklyk44sbuMWniAOwU/jabOt7CTte12Tid8bC1Vy+UYU
	 SbOAML1n2zux9fcNXPB6ASfMbHtdhGx7lhAxAi2ENYaZTlMJiuI8vu0O+Wtsf7jLkCpqh
	 zWSuDfLu1LWgeY1/5wsdvi3UcFrwzbqbEWfbdOhaH2/9MhC+CX6EIhlDKkuKwOU9Bd95/
	 ZruAa0/mZpNYa4FlMAxoggjMd8yuqTO1XCkqTSrSBsS0LL3/tP3sC5L4iZzaE1hckbMEQ
	 8jlM2LF0KOFQhOqlNk3NsljO0/KwIndlvoeIZvwRLEk47natnjj5m5ucBPtwOk1TAGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415851;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6xrJTzSSyKqZvQGfkny25tpoePkdpY0Phx2z1KRT3rI=;
	b=CgXYYaiAuBQc+TLSZ7LbGCOb4hk6o7JEMI5CwLGY9R22qrt5vhdDvecExOwssqsxmytE
	 wZdM4NxegnOLIESeN+pWhU03IfzKflvcSpp1nWiWub5O4KleQjBoSawuXaDOcyvbn+qaW
	 IUQEQyELSE74r/vx4HOhzEUjRwV/M8ZEmataT4WvUK31UCQm2WBlADP/e9soqKPIv8sSN
	 rEAg+4uuUxZzf89eD4ORxIVyOmJSUwLauVut7Y5dvX+xDTgdcDCnKsRPINe9THHAewVf7
	 mXkqv2x33xyDxvzaGoZIZsOgsUhenTr1j3WBbTto1gme/6NMz3XgadKmc7ssdYHl1tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gECz+2QV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C00C606A321
	for <linux-leds@vger.kernel.org>; Wed, 11 Nov 2026 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gECz+2QV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66AF1F00A05;
	Wed, 11 Nov 2026 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794415850;
	bh=6xrJTzSSyKqZvQGfkny25tpoePkdpY0Phx2z1KRT3rI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gECz+2QVXVFexUw4LOLlJx47d+Sx3yZXn0Hbmz+RH1AczxdCx2CG9+c2doPcdSkzR
	 hqDbkH5myOzSzTyamK3bKxVZXzCnENKfui+opmAALUBER/M2CYVdow3canvnyGcvC3
	 7no0Ed1RdwrTAeAarlaho/yI5LhNgDS7b+N2g0JqL6mRTgCXaSTzSnsprFm9OX3IjX
	 RSkO0wn1INmE5UnnXKfQbXbRcJdDcLc2OJLRy2fSNBOkp3UjHq/M4QANxYtzK0sBmi
	 /Wiq0WUYcKHQ+66ltP/oW0h/+PjvAvusCZgMdmAdutgegz9VsJ8SqIWvi00TIjn/fm
	 hBOC4IXLmoAuQ==
Message-ID: <sashiko-outbox-209330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] backlight: lm3630a: Allow setting the full-scale
 current per bank
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michiel van Beers" <michielvanbeers@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261111-lm3630a-led-max-microamp-v2-2-aff11756e7be@gmail.com>
References: <20261111-lm3630a-led-max-microamp-v2-0-aff11756e7be@gmail.com>
 <20261111-lm3630a-led-max-microamp-v2-2-aff11756e7be@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:50:50 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Michiel van Beers <michielvanbeers@gmail.com>
>=20
> The driver always programs the full-scale current of both control banks
> to the maximum of 28.25 mA (code 0x1F). Boards whose LED strings are
> rated for less have no way to lower it.
>=20
> Read the optional led-max-microamp property of each led@ node and
> program the full-scale current register of that bank with the matching
> code, I_FS =3D 5 mA + code * 0.75 mA (datasheet SNVS974B, 7.3.1.11). The
> code is rounded down, so the current never exceeds the requested value.
> Values outside 5000 to 28250 uA are rejected with -EINVAL.
>=20
> Without the property the driver still programs 0x1F, so existing boards
> are unaffected.
>=20
> Signed-off-by: Michiel van Beers <michielvanbeers@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-lm3630a-le=
d-max-microamp-v2-0-aff11756e7be@gmail.com?part=3D2

