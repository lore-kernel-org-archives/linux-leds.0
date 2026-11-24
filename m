Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515555;
	b=tlTPj+XbAaxk1I5s4AsLUE8hsYeKUfHgEtmK/Lgm+OJTUTtoZfWbMvlq/2/6zbPSnPxD
	 v7tVHHnTyRE1vWsaL/JM43fcKjdq9GAqeLLWcC/IVhGzbd5pLAAOznXOYRqxDW+HsTNWa
	 P1qaxSRRifZ5tz9VVrmgkzklouIwwXtYpJVis9+d9pG/4zNMHYAfAnapgzyPTxcYgswH7
	 y2ZvHj1UWPwt55nrY+BLJJabNFpEQ1dFT/cD8FuFXlv8zm9LITccSfhgjQ1iyPv97mket
	 5TjExFXPvMlD4FUI8ARPAqr6XP4UAMM/MM980vy16xbpesfjBapKeO5CIZTbjucWLYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515555;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=W5tqNnnWsNT+wYloUYcYWKGIIg7fLKyEA2Cn1y4W2E4=;
	b=NX7Tn4B/y7BlJpJlthNryGlJEs6bp0fRKHUqPZXB6oHDBSpeUQ4kiCeiY7rpycXiXAnL
	 SAa471zW8F+aDZBUMWpCRNqlL/B3sqz2SAK9nlyoyer6SYzoBT7xTfhAAuj/8AFA7igGb
	 xSxbLUutZ2w1wEsMGmkPSWlMslCi48JhiEE74hMjmmgIDueh3L1w56VAUxuzzxkzptzFS
	 07++zGZ0dF3aaPvj39jS7YNWUaTh7FjZEtYy+MrI2B6aceeZWGwL5kKd1u/lwX8PDdtQE
	 2e3sq/7NvJojACrCrNHcbqU74DzLUUXzy1Y4ZT5O+yUxuHoqiUEhFeJL7KTDbik6GIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsJ9fRNo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38D7606A31E
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 10:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsJ9fRNo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D45B1F000C6;
	Tue, 24 Nov 2026 10:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795515555;
	bh=W5tqNnnWsNT+wYloUYcYWKGIIg7fLKyEA2Cn1y4W2E4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AsJ9fRNoIXFu8ykAn4pZqaaVh3P+ssTDygmsDv7tinT2WXFvN3L6b5c+7NxxJELeW
	 U44mHT4Ir4+b1VN5zxOAG59UDAFGbELn1b6BtU3VSfZj7//Qs9wZyvM40jsO+zBiyk
	 wh6F6Y2nXKkQFaKmSZxpOZxwuSOK292rG2X+TDh2HLjBvtHgesAG++WFPvuBcTgYu4
	 eVkYcVLJtcJy2SDTG7Mnach7nuuZ0Zol8U41xA78dyhf9Q5sumOpa1nAIwRB9Xjv3a
	 6xzM2IcVKgNfUGsl5UlU9IwcuNpSlLMRh8Nkx4M9FKTH2Q9O+pnm8lug77VzHabm4v
	 oYFUb+wRcH9WQ==
Message-ID: <sashiko-outbox-230958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: flash: tps6131x: put the LED child node reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261124101102.3884922-1-congnt264@gmail.com>
References: <20261124101102.3884922-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:19:14 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] leds: tps6131x: commit subject violates LEDs subsystem naming
  convention
--

commit e59e64da27879f33579f6bb41280340b0228e4fe
Author: Cong Nguyen <congnt264@gmail.com>

leds: flash: tps6131x: put the LED child node reference

This commit registers a devm action in tps6131x_parse_node() to release the
fwnode reference obtained from device_get_next_child_node().

> leds: flash: tps6131x: put the LED child node reference

[Severity: Low]
This isn't a bug, but LEDs subsystem commit subjects follow the
"leds: <driver>: <Capitalized description>" format, so this subject should =
be:

  leds: tps6131x: Put the LED child node reference

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124101102.3884=
922-1-congnt264@gmail.com?part=3D1
