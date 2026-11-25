Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636887;
	b=vvHnPBS7GSgV1uaN0wbgQqdgbtv0WtwRK4/WKm1liIeDJk/glbsCWepafNK1nJrllGRP
	 D+u8r/7OOlVLbYxbG5hyLk+1CE+008yQENsLNfYpdJuNGI4hMYDwx/a7BDiEP66ceZVl6
	 cLy56YcWK9Ff8RAMUVx1uWsBEz5v5bAZ2R2rE7213QCDzVnQ+ua7ThwfJ4dgUfZtgvLby
	 9+ethm55Z24/AgT0NgMo4DUqvZ5ooN/qeDUByjFBZz7zsa+Rm7qj+NF7tQByyLDKtr8u0
	 rjG81fDj4TNdLZHjSb6Y9vziIJJ2mO5+tARUvwOjVAXg2YaexLInkxYjZNc6ZJbUkBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636887;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1oTwVb3iLqRW4bGQ/2iEkFC+0wx//UNSN6W6I3QFpO0=;
	b=hb+wFcizspJnKC8pKGNOs4xbs57E/WLmpgfUwYiWLNeXTxH9HRFN9S6HlugBJf3y7/kB
	 k6933qkqkfcJxK8sAKCXVWG5OHDmdx+f5k7RtHDwsRXHu1wOVXCxABOT7Bk0OYbfKGvlY
	 ib3iB2qwGhNG/oBdoe8xh2NzIoTls9I6olyoHgGgoTzVxP9bvIs6KG1JdGjtAE2W8LgaI
	 OCmXH8utZvUGC9bhdTPRFDZwS4h2KlPW2RhvEmbEPPmhFoqBsrPArY11tBZxGN5Y3nYSf
	 jKUNgK1tAWrnokw/6cceOGjoMk745Wn86F41g6GWB4MUkPPCWzvF6As5oXEYj2gdGrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrgQHph0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B5606A323
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KrgQHph0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D111F000CF;
	Wed, 25 Nov 2026 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795636886;
	bh=1oTwVb3iLqRW4bGQ/2iEkFC+0wx//UNSN6W6I3QFpO0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KrgQHph0Ovr5+f0oCxTzebJq+4SF4r5NLQ2wUu608v7CP6Q/ihIdW0p5qlFEmKBi9
	 HMFNgrhotSsx2dgdyaettC9cB6b/OzQhyF/znFn7NbFuX4JlgY3uYw9xQyhfQBCiDk
	 W+x34febO0Y71TQUv+MdF8JGOmQDoraXhrmiF+XYGDqR6wuGnvynNpMttf4RpjFNcU
	 JtVl6suebILfAvbjxOkx2BIm/Q5d/qwalHXlV8uhgC2dGb1qjlVtO4zLuQheIaNU0g
	 be2fjFmFs1OIelQRSSDo54H6FwkeysxbJZ0Kw2lnmGXMz3sQbnAwvS3rJWzMCE0C0S
	 VRrxoBigIcplA==
Message-ID: <sashiko-outbox-234112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/3] qcom: PMK8850 LPG backlight on Mahua T14s
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 20:01:26 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 1 and 2: no issues found.
- Patch 3 ("arm64: dts: qcom: mahua-t14s: wire backlight through..."): 3
  potential issues (1 Medium, 2 Low)

A detailed review has been sent as a separate reply to patch 3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125195226.1563=
577-1-srinivas.kandagatla@oss.qualcomm.com
