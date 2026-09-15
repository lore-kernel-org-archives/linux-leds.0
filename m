Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB97184524
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477283; cv=none; b=NYcXQZpJTHjsx8g/XIvJ/0b63r1WigPaUf6dpvOYQlIBVlz41RcaRMts87XsMCisDxdm9rlM73HBVfQXRP8eQcAWmoFVFOAxdkCEV58grOob9kA7iQBeRs1XO8GC59qZj+q7ZVqzZ+0IQPI97KGp1fn7cBbKBTEDBMonnV1OItA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477283; c=relaxed/simple;
	bh=hQr8TMrtfJHxoP9ODllVWAWkja1MFBTE4P0ASO9cGH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VQAmusK3ABPhkgymgK47yE8T/gclptVxW4Eeh6zdmSvIfJ9wcziZ0VHSGnskA9+F3RWSYv6+kgrBUw4h5DoOh515C3E9hbTG6taGKy1wOUoqwfgO3hYSj9mGvYocL3lgyewcfGAT+DNMdl3iwqwE/veml52t3h6wWIWSPEemsFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oAKw2K4M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oAKw2K4M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4DBD1F000FF;
	Tue, 15 Sep 2026 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477281;
	bh=hQr8TMrtfJHxoP9ODllVWAWkja1MFBTE4P0ASO9cGH0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oAKw2K4ME+04WTUP3t0dCk2RimSfhbdIZtTa1qIEwjoQZFObCQjm+AYGOrEmFQFjx
	 fE2X3KtNcAhbeZTw7gwxMxqrwf0h/f4fldCcMtJnuE3z1FeCAIoZVNloVUpMhXrZ5Y
	 7V6SJV6PpYizygvyj9oD+RQV0AcTnBiX9FKUfBroCYgVdNZ6iVmff7eXV9Y6AmejqM
	 G9MafWkMgVA7B2PqeeikMMBR53QE+aAQDNg/vyHnNhNiLRarHKYun4RBRpXi3KmcLP
	 ZqoyrcR+DYTXj2Jh3aCvByiw8/vF8SQ6wsjYHsbSWI9v5w2XBYjD5h3WS+yzzd2sA8
	 2C+NbizlCzaIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/13] leds: st1202: Clear unused pattern slots in
 blink_set()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB849770CF6D41F3DFF56B1AC3C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849770CF6D41F3DFF56B1AC3C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 13:01:21 +0000
Message-Id: <20260915130121.A4DBD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> st1202_blink_set() programs slots 0 and 1 of its own channel and leaves
> slots 2 to 7 at ST1202_PATTERN_PWM_FULL, the value both st1202_led_set()
> and st1202_led_pattern_clear() leave behind. Nothing keeps those slots
> out of the output except the duration registers being zero, and those
> are shared by all twelve channels.
>=20
> Another channel programming a hardware pattern longer than two steps
> writes those durations again and re-arms the sequencer, so the blinking
> channel drives full scale for the extra steps. With two LEDs on one
> device, blinking one and giving the other a four step pattern, the
> blinking channel lights during the two steps it never programmed.
>=20
> Zero the channel's own unused slots, the same invariant
> st1202_led_pattern_set() applies to the slots beyond its pattern length.
> blink_set() already zeroes durations 2 to 7 when it runs; the slots are
> exposed only when another channel sets those shared durations again.
>=20
> A channel whose blink is shorter than the active timeline still loses
> its own timing, because the sequencer has one set of duration registers.
> This only stops it emitting output it never asked for.
>=20
> Fixes: 35cbd34a6a05 ("leds: st1202: Add hardware-accelerated blink suppor=
t")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D10

