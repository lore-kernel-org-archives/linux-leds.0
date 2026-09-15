Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A909D3B6BF0
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476925; cv=none; b=NB6wmCjokCN7/TQ57C6bn4OCTyhYKyyJTlHZhz/bfle9apH56ZdTQUBPtFAvTpKvP3fudUz/LsHEYurknIpD3Ml561QH6uaxz0a7aXyGMhcQ3nCk0oW+E9aBUk+DgWUtuKO8ASzejVeglP1bLQndSVUxs36/jnxPkCnTFt6WFNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476925; c=relaxed/simple;
	bh=DDnq5N9v5ROHQJQPqed38VhK3ICgl4pbNcwrR1tEyxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h07p9Fd1O4MuvK9I9J2PsrJXKDgtxu9KchUC96Y0i997IQJSzJX3rIhLJg7lb3TxEMZb8S6YpgERI/eF4xjhtbuNThqxzyL7UnfT+M5XeO0HJ+MlKtq1Bo5OiH1EETHhwelHlBN/Kra2Jrtylsf16A+8S2/QMLClmPrDBtkaFc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5MHw/QO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5MHw/QO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF131F000FF;
	Tue, 15 Sep 2026 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476924;
	bh=DDnq5N9v5ROHQJQPqed38VhK3ICgl4pbNcwrR1tEyxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C5MHw/QOvO51dbFPCldW+zUHYPL+BcoMude0leogBGYh8I0La0zJMincShcmxZm5M
	 2cAUDSpDwkNvBgW6bFmOPs+LUsdhnk5RHOiM1S5WWjRnwq2LXi7QYNXjNiKVlTWXs2
	 fvQpbgiOzVvmtMUhMkOSc9OUPXcXLhPlkMOBTgRc5wRGtOqH/c36PLvWlryaPKsA/u
	 g8R0lGODiR0afJf9Rq9Kz0TpEufNznrYEfIhw5sj/pmxtvRhX9hpPivSzcy72ju5Dy
	 WPnByAm1ugCoaZrRdYNHbFZpgyBxrKsM/ffGkz2Fr2u6u3T2INo/WJBQDW2kZGH+Eb
	 74RDSj9Y3akKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/13] leds: st1202: Do not set brightness from
 atomic context
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497CF8FB57A272EB671F0C6C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497CF8FB57A272EB671F0C6C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:55:23 +0000
Message-Id: <20260915125524.0CF131F000FF@smtp.kernel.org>
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
> st1202_led_set() was the last user of the locking st1202_channel_set()
> wrapper, which is removed.
>=20
> Programming every PWM slot to full scale is kept: it is what makes the
> brightness visible while the global sequencer is running, without having
> to stop the sequencer and disturb the other channels.
>=20
> Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D9

