Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7A3D5674
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032652; cv=none; b=sCsTb7p+zOEPqByFktXOX0wNCXBKsyQ5b1wmD+rgsihKn0HBvvX4MzsSwnNCFSzAUofFTOZtvi6R19m69dsJY9RSvfrsJTqLfqor7T3qTeKcw6U6n53fMg6gSo2kk6m+NoZFelLmy0D+DhfMBiLrUSe7vj6xGyvqcoqOlRb0lS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032652; c=relaxed/simple;
	bh=BXBI9d0RZLbUiQvGwzzodAtt+UiCQ9WKeDlglaKhm5E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gvyli7s/QiDUxOMPdo/yLWkd9wK5XAjcAA/85gUXgDMJy1CVL9fd1RjRneaSCtgKZreGpGeX6M6P9OF/gmsFQCxdAAmXe26oxjOc5rERYtDPFYNsF02CSCUkyZOtGdrG3W5VrhMs9gKstS/RCNCyvWdt62L88kAoy6w9cTlgdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1L65Uv+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1L65Uv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C8F1F000E9;
	Thu,  2 Jul 2026 22:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032649;
	bh=UiE6KFtbduB6K3v4dDCgnP0jvev2gj6TzU2ES0cU1y8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m1L65Uv+M9WxhIVnL1ixYRLwKzU75BTego1BVrtsWxhp3jK6ImXHls+G6/LuU4mZ2
	 cXpUZKxwekenzjDAjuhflt2nSk8VT2uj7SiuWALWDWrO3tdpcFKwnB7+YDkLN3woDk
	 cZfAcUrpyPhc3jNdq+Il+aoUscjmzkejKsXpEH8Gg4l+Ux95ZcM2ZFbtc406ENyImh
	 UezlddEm6f/g1/OTsSqBLkBCDlsWQvNRwoRC2YVEALOE4iY3KyzJI3hqQZDldyXHZ7
	 YzERpHATCGc3y2h94+Z7doGaGsgWVHxxLyXhRWaLxWNuwtH7al4AbTV/h+LlP4Jt3Q
	 /2raEgdMAUExg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] leds: st1202: fix pattern duration prescaler and
 pattern_clear skip marker
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB84971D3AF982F4F707A378F0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB84971D3AF982F4F707A378F0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:50:47 +0000
Message-Id: <20260702225048.66C8F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver improperly maps the single global ST1202 hardware patte=
rn sequencer to independent per-LED operations, causing destructive interfe=
rence between channels.
- [High] `st1202_led_pattern_set` does not clear trailing unused pattern sl=
ots, potentially executing stale delay steps if not preceded by `pattern_cl=
ear`.
--

commit b7d0b63932c36211ff0c19e9d1915d909b53394b
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: fix pattern duration prescaler and pattern_clear skip marker

This commit fixes the formula used to calculate the pattern duration
prescaler by removing an erroneous subtraction, updating the maximum
duration constant accordingly. It also explicitly writes 0 to the duration
registers in st1202_led_pattern_clear() so that unused slots are correctly
marked as skipped.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index a750c95ef3f89..b4adade49898e 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
[ ... ]
> @@ -209,7 +209,7 @@ static int st1202_led_pattern_clear(struct led_classd=
ev *ldev)
>  		if (ret !=3D 0)
>  			return ret;
> =20
> -		ret =3D st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTER=
N_DUR_MIN);
> +		ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);

[Severity: High]
This isn't a bug introduced by this patch, but could zeroing out the durati=
on
registers here freeze the sequence for other LEDs?

The ST1202 hardware uses a single, globally shared pattern sequencer with
shared step duration registers (ST1202_PATTERN_DUR). When
st1202_led_pattern_clear() is called for one LED, zeroing out these shared
duration registers would stop or corrupt the active pattern on any other LE=
Ds
that are relying on the global sequencer.

Could this cause cross-channel interference, and should the driver manage t=
he
sequencer state globally rather than on a per-LED basis?

[Severity: High]
This is also a pre-existing issue. Is st1202_led_pattern_set() leaving
trailing unused pattern slots active?

While st1202_led_pattern_clear() explicitly writes 0 to all 8 slots to mark
them as skipped, st1202_led_pattern_set() only updates the duration registe=
rs
up to the provided len.=20

If a previous pattern was longer, won't the trailing duration registers sti=
ll
contain non-zero values? This might cause the hardware sequencer to execute
those stale delay steps instead of skipping them, artificially lengthening
the new pattern's cycle time.

>  		if (ret !=3D 0)
>  			return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D3
