Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586003;
	b=ZBdXsuTzFAT3dbv5605ySQfoClGkI++eUTkySVysDWtXkmq8acj6Vda96Uwv5QfbYpjE
	 SFGX6QFHSzD2rUaPH47zoOb/VPiXCMKDpLSYopyaq342oqQMXn5pqBmQIqpGpCy/jAoSi
	 ZxYfbrpYyivs2jpZ2xV5yTXtNAVCecNWPv/Pda3U6fA9bcUtXdOsVDcUBaDMe/DHL7nmq
	 ummcdBOaYDpT5bSPImku78foLrXUOuS0i/c+Xjh5cjIXM+iqKpqmIzA3P/pn0dIKE+djH
	 s2leqGz30/Fgvghthba8WmgwqTmuihZ+6L5kyPUvfo7YgXY3wmMLGWKxtlXKR/b6mDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586003;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XHvLDtVOXzAnS+laaIfYiAJkcCOy3wJHqY15bQxiR1I=;
	b=hABVO6HKMt/BNkay/pcBb7uzEKUS58KRQIXnEG+V0W15UeCf8QBf0gZ7TtR/A1SWOOMR
	 SjTyQ3exbHdv6WUpya/fKPguK+h5QKyDxoZ5idvE3hsZuzmqzIq5BZpGfz58+06TQvllQ
	 RkypcTEuhU7nC04u8cTlP8Sy0jonKCGPfeRG0etXvR6kjJcBrL0+3d2NvL3CFPiFOkOdj
	 FLskzuAI6j/d/ICDuk5mKXRPNQ205Hs2aM9CJ4nIyimieFxPpldy/xq3uZnSDd8EeCq4O
	 gt0nhPsTIxfwTW5qRVbXLV0FE0suBh1aH7uRyMqMTkcuZb/GVbVlEehJ5ozyqSUWnyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZD2ejgT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A5A606A324
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 02:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iZD2ejgT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE111F000C1;
	Mon,  2 Nov 2026 02:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586002;
	bh=XHvLDtVOXzAnS+laaIfYiAJkcCOy3wJHqY15bQxiR1I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iZD2ejgTPT1bN49pEvgQijdzHE3baCPY9gyJDUSDHsNbGf6YCY+DfsJrT+reFVkS0
	 F5D9+xlK2EFgWhmGBY1gT/xzxS6N/6J0Mi8md3RRbpKc2vymitZMXnSyByFBBSrn1r
	 B9vKGUzlBMXGlTAdEiYYEmLzkYlBSbeo6tVTZsQREzCldx3K8WfBaj2F4AzsCMfl3H
	 8W7Db256AtaoXaHh/MJ8s0hnmcFAjQAeuub0qosx3EwQeUeKymee2Cks1umU8CIz2L
	 CYJUshoiG1m5g0pB+AM18/fvuObnTUKNHm0EIc8naDGYhUBN4HTER2CRE8jDIUM8h0
	 ovBOSzaa9qQew==
Message-ID: <sashiko-outbox-192828@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/10] leds: rgb: ktd202x: Never program an on time of
 zero
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-3-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-3-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:20:02 +0000
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
> blink_set() turns delay_on into a fraction of the period in 1/256 steps.
> When delay_on is less than 1/256 of the period, for example 1 ms on and
> 1000 ms off, that fraction is 0: the LED stays dark, while the timer
> trigger reports that it is blinking with delay_on =3D 0.
>=20
> Use the shortest on time the hardware has, 1/256 of the period, and
> report it back.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D3

