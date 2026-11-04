Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795485;
	b=j7oc7j1nprf/87jq2/CR8Udm0pHdCiRqTHu17aBBezlEThlE6FpQ1P3fWRvlHRDcZcKO
	 DPnJTMa16uZ/Xa8aBydc0rhfhNwNT/wyny+51jHyXIO9Nw2lBeqLVTltMIESlIObCtRhW
	 vUq0uCHB6SUZdD6qRuIzyayY0t9cWah8AsTjUX5zIzrUSZY84UhXz807hzkuBOWjdYxyA
	 stbS8dVzbXPS3nO66+PX3kmH49N1etW8AGLoTkRzhmb77Y8OqkQ/tlVPXikXsM3iHqIht
	 1Y3E5gxCDPVey5NgfeTqZi/Fd7rO+B2GyAUB4JrzGMt/TESGXj7S4CAq9zNoAyi5GKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y8Wl3/D0V9Jhn4OpeLz0IdVHJZgFAsEQkVnGwMbwJDg=;
	b=zoYAK7u+ZBdqLQ8OqKnO99MOhmT3PnHodVDMVyyDrzCAVUzGXhT+MbethgWqul58qeyD
	 p+tmRfShvGzn2v5628PknSIxe6R30Yhoafondxqpls+7E4TXNoVOyuOX73nrC6WKi70ES
	 R6HufAEQunTxRt4h2+cFRYLmN0Un8YRcMZ+Rv6sxQF9TonNvxkmTOECrZas49bxNSAwI2
	 Z3NkYhaMpyk52o+Pi6vmtqSx/0Gk6duevC52+tsj88NxszSGq5xdcK/RYWzNto5Z7+GKt
	 OmcS6oygnPTJvouMSAURFfjBuF01g28leuuoU+3ZbWEqw0pOkFuyyQ+gcHPek9+WefQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PsjnCQ5r;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F6B606A31B;
	Wed,  4 Nov 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PsjnCQ5r
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B4A1F000C1;
	Wed,  4 Nov 2026 12:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793795485;
	bh=Y8Wl3/D0V9Jhn4OpeLz0IdVHJZgFAsEQkVnGwMbwJDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PsjnCQ5raFljjuiRcz3tU3O6wbidOF/ZRA2G3N+ioZelOmktwtAfcRGWcX2qZAZYM
	 2fkQZPaBQWRs4JuyPubvwXz9VvkOYIS8OyyBvZIpylAIzcVpL7obl/nEhi7zFxG1Tv
	 xicJNnwM6zt1/l4S6u2tBTpaSpSpM3CIH/TEmYBX7hWJjUpmOoN8BbA/OZEmFzNqa9
	 LMqFpJifXdXXABO12aO4zbIm9XFKluV6r0Mr9NyskI9BptHu83SxJikuBHwYxcQqzR
	 I/T/eZ8M7/xLx93ETvkL/xUdgovQrC6oAeyCVhDTHNw0t7CK1cAk4gDGew7q6IJMWv
	 MKPN3a/urrkCQ==
Message-ID: <sashiko-outbox-197256@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 6/7] power: supply: Add driver for ASUS Transformer
 battery
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261104122606.215629-7-clamor95@gmail.com>
References: <20261104122606.215629-1-clamor95@gmail.com>
 <20261104122606.215629-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 12:31:24 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> Driver implements one battery cell per EC controller and supports reading
> of battery status for ASUS Transformer's pad and mobile dock.
>=20
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104122606.2156=
29-1-clamor95@gmail.com?part=3D6

