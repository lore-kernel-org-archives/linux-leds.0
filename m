Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5855C3DB62E
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253200; cv=none; b=GxZLY2mIDT+kjtspjFmeMhIs6AqlbvV4l1XmXJmupmoiAYXVok3F8/MBOmXAjYAEawKDfHb6hnC108/+rI8g4NMByA/Q/2dFP1d3Y74Q+cPtQyzcgJo5HRdNJis1fCMk9ukrN3n+54a4385R/4NJGr3zGsND6GRxgKNuz/9ziR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253200; c=relaxed/simple;
	bh=feRcUYCrxKWEDwli2ouP4/6T+AdWqTnVkA//MKAiJSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k4ix61jsCSEC5+O4Bvw2mtd7RRenOv9LarW2ip96II/aEIrWsfgj6Gau9t/uVHbjTs2SkRWiX8l4waW+6ppkN7NxwI9+bestQa8cKbQbdzvf4Xtw3zJviWDSnIqP7/dgx/MT/YdW3MOpTDtY918XYK2X1OW+ETUJDmsGoObOHG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAFJPTXl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAFJPTXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA41D1F00893;
	Sat, 12 Sep 2026 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253198;
	bh=feRcUYCrxKWEDwli2ouP4/6T+AdWqTnVkA//MKAiJSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gAFJPTXlRVuVWaNUpYCO7ZHX7etZjkKapRxAIJ1hhsenkeM9hP0p9TxjlZalG+2ec
	 UGahh/D8LW+2YQ6m6c8IqszRpgzmS6VEGjtLuffymXz1HuhkM3X49wuC7jyWYHSdbE
	 GAjEX8ICzSpr03qP9gsnL+8FpJDjjesplGscZF0gDPTO9dhWN50xGUgBmYw9zUsXUi
	 PjlsZs9ndxCaJCTdnpR/ps3OppvdcEhcopoPqKhJlSDv/O2juko7eqooJdxaQSaZjb
	 DnrIzAacffEfz73AW0ZfE02AxblRUmWFuFwgPY1g22ZjCJWH5FH3Sd3wAp0LQfSJZh
	 RKIGbg6fxgPJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 09/11] leds: st1202: Do not set brightness from
 atomic context
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB84976AB392C375533BE4B583C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84976AB392C375533BE4B583C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:46:38 +0000
Message-Id: <20260912224638.AA41D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> st1202_brightness_set() takes the chip mutex and performs I2C transfers,
> both of which can sleep, but it is installed as the brightness_set
> callback. led_set_brightness_nopm() calls that op directly on the
> assumption that it never sleeps, including from softirq context, so the
> driver can sleep in atomic context.
>=20
> The driver also installs brightness_set_blocking, but the core only
> falls back to it when brightness_set is absent, so st1202_led_set() was
> never reached. It merely turned the channel on or off and ignored the
> requested brightness, so dropping brightness_set on its own would have
> lost brightness control entirely.
>=20
> Move the register programming into st1202_led_set() so the blocking
> callback honours the brightness value, and drop brightness_set. The core
> now defers the update to a work queue, where sleeping is allowed. Errors
> from the register writes are propagated rather than discarded.
>=20
> Programming every PWM slot to full scale is kept: it is what makes the
> brightness visible while the global sequencer is running, without having
> to stop the sequencer and disturb the other channels.
>=20
> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D9

