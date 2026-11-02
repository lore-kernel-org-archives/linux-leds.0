Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586004;
	b=TqIb0lKyyL1BgaL/Uc+7nAHAMAdIc4A7AluPn4Dzgth2AiYvnpU1g0ZM9I4MVQ2xCfov
	 bVrGMYVSX1G8pLKXWpE5dA9q+9q74QV+11ubievfFeE56rVx1i1HqG6UH3Ag03YhGis+e
	 mF0PYx0Wbf7Dvv35g7iqXUk8iug0cargGdbMOFXWTfHPKEY4pp/eS8nLuAi4NrfKHf71O
	 7x/EBHEHb5d+R8/XP9sUiqgXEMuppgGqS6qZ3eM+OKfKXAlAYwNYyKbWNr5mGfZGWSz4A
	 3wTUEalQCfd7uWuX8t/GkS8SMKpcFyo0Hi86G1M0NZIqj2StHbMp9Er/DXIQRQsHSYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586004;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F2Rl7IqsBKaFOmfH9epKQiwabClyiBPHPy0k1Pj1QdE=;
	b=c5v84/L6FnFZuBDb0OeCbDVqxD5+gwAwlr/59MqZ6MjwUV1gfHlzKT4YP5NCo4+GYtje
	 xmE++dnPp01pMan0bIe+Jo3t4/vYFrZUBtH9rsJ/E0A0WP7R1qBBlVHf8mMOfbZetm3l/
	 OEoc8ubg3qcinqiJmsWzL0BjceGKxPxDJex+rRb0eCVcfLm1b9U2Ebty7pt0k6JiWA7Lo
	 2jVMJuLlgIoyxsXtf8i5bETqUnmYMDtifdQyKzOddAM9aOd94YTjepXwqkBgHl7UQZ2Sk
	 q7Qi79jluO5Xad06aRC6otZ9ol4ZSrjD2xm0WBKPQK9XSnKY7McHnfMqT66GxOtnREA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0SOOxfk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCDC606A324
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 02:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o0SOOxfk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3586F1F00919;
	Mon,  2 Nov 2026 02:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793586003;
	bh=F2Rl7IqsBKaFOmfH9epKQiwabClyiBPHPy0k1Pj1QdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o0SOOxfkU1F6RYuusOxn4WrKgRYv815IHxmXZAudM2i8Np/sUrV8LNbRUhHrsKJUV
	 XrrW72VrU+bj1eAyvPHiPDSyzkx7IMEqQO2bqnrcHN9qxW/cKFIibSNcnW2s47gaGL
	 JH5YoMO0tn0WrDJN0eZUCKaJETTATe8rNNXcsYD5IJIBSDHEdxA9Floyi5IvrRwyFP
	 yUlUiyVwCZAEn3wEUZK1r2Q3fu4szFZ2H6lHe18iWdl423I3jUHB0/XeqJykXBCae4
	 CV1eSxFmzsxSZVW8CsjEHfdKc/LLrhrSd7UBEUSGmDWVzL3xi6RdKJLAjFP3rjUes9
	 g3wD33JhaCf7Q==
Message-ID: <sashiko-outbox-192829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/10] leds: rgb: ktd202x: Fix the flash period of short
 blinks on 32 bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-1-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-1-eb51eddad08c@telaak.dev>
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
> When delay_on + delay_off is below 256 ms, the unsigned subtraction of
> KTD202X_FLASH_PERIOD_MIN_MS wraps. On 64 bit the result truncates to -1
> or -2 and gets clamped to the shortest period, but on 32 bit it
> truncates to 33554431 or 33554430 and gets clamped to the longest one,
> so asking for a fast blink gives a blink every 16 seconds.
>=20
> Compare before subtracting.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D1

