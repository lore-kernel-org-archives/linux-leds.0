Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8448F850
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476948; cv=none; b=md+CQYWfw4xwRRFU8De0uAaUvLdRAIVsh+nLUHAGBDlwYmCf8Q2CLaoJZQ7gQo5TdFW+4fUTMdvzGyNGAXHWU+7Vlnr0JoFV+wiUvWc63pV4txXN5rPq3AYkL8zPsmfR3ukOB7W8kKykpfQKadg37HEfu41uBviBBBx3Swjdd7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476948; c=relaxed/simple;
	bh=thjkfxl9NkpEHpW1LUTKI79jrpYhciHbbOZ9L4zqbJk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7mQ1x5O+tk9WmvpQQy8l8IiZQnyY6KH0yl2c9rDugcQhmc+79V/q2lFT+OzBnHqTDlHutVLke7fJ+E7JOtoleDlh4cT6E4sCYqB8r9/2emM93IaUQj8yVUmSr82So17gU6XvQ4yo3pQ5G/xJbFa7+2K3hK1dPd0/m9EdQYd/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+lHB7MK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+lHB7MK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6779F1F00893;
	Tue, 15 Sep 2026 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476946;
	bh=thjkfxl9NkpEHpW1LUTKI79jrpYhciHbbOZ9L4zqbJk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J+lHB7MKnsht9bTdao8LQQY4C9kRdrdcP2fOQ4WOHp0nO5/CxOspmotRr+V1vR5SH
	 Lgzjhd7P7yKQ3+utQS1nKmf+1lVK89lMwO7MvQRSekwj7Yr/d062Q5Vlzk6GXO15wm
	 mGrCWN5h5tyr+FNIF5KDVavhHj/fS02iWXjXLt2i7xHcPeMg1hjcUOAGD2Bk9BkVbG
	 arAcCSngrR8MIQMkSoE2VOtPzHHJb+Hrs1jpsoLkpSOzkQ1vnaW534PLoMMpyxZENY
	 Yg/ZtbGgilNB/2LnDjkrl+XDPu6IYJwK2TTtr/VPX5OQYpLYgMG+TB+YHb8cN8q2HG
	 h9bT2gYjnRCVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/13] leds: st1202: Clear unused pattern slots in
 pattern_set()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497E9939E3C0D68401659D0C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497E9939E3C0D68401659D0C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:55:46 +0000
Message-Id: <20260915125546.6779F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The pattern duration registers are chip-wide while the PWM registers are
> per-channel, so a channel can end up driven by a sequencer timeline it
> never programmed.
>=20
> st1202_led_pattern_set() programs only the first len slots. The pattern
> trigger calls pattern_clear() before pattern_set() only once a channel is
> already in PATTERN_TYPE_HW mode, and activating the trigger resets that
> mode, so the first hardware pattern written after every activation skips
> it. If another channel has already programmed a longer pattern,
> durations [len, 8) are still set, and this channel's PWM for those slots
> holds whatever was last written there.
>=20
> That used to be LED_OFF, so a channel stayed dark for the slots it had
> not programmed itself. Since commit d2ca0e2b6d64 ("leds: st1202: Set all
> pattern PWM slots to full after clearing pattern") pattern_clear() leaves
> [ ... ]
> from having a single hardware sequencer and is not something this can
> correct.
>=20
> Fixes: d2ca0e2b6d64 ("leds: st1202: Set all pattern PWM slots to full aft=
er clearing pattern")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D5

