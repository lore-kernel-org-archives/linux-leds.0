Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FD82BD5A8
	for <linux-leds@vger.kernel.org>; Mon, 23 Mar 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261838; cv=none; b=upLhe98hOjX5cVEQrziIFHjB4aHgh2C23mI2GcAn/yJHvQZwKcpXSOhXVnTlYznpJrHRsUqmP15MWgzOvWxp1nkKz8Q7ovnb4lBk2uqBy9hW9MxFTjaDTIaEmKv0yJonhy2lKOkH2OcS5K6pCi//DYwjQ2gFnWYRWa5nbzmsr7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261838; c=relaxed/simple;
	bh=H3eABNn/jTQdi8bLwLy4lbiH/P+mOBKDAClVuXMh95c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rwTW3zU3pnXR3QdWZkUtUTLtrg5OLXniNJi+7h159DwUL/K1pBPTWuzG0Mq0Sb/X2k2PzW2ywFcNqNTsHK6SkFoSUv/Nz6cjteNK7MlU1UkCu3pgb/7B+x1vWxl3d5KaAExiWdWZAYbMBPXy4oyRd6sdWXVswsHT3vKe/wSlgh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MVRt3h6h; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MVRt3h6h"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B44014E427AE;
	Mon, 23 Mar 2026 10:30:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 884225FEF6;
	Mon, 23 Mar 2026 10:30:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AB47103720F2;
	Mon, 23 Mar 2026 11:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774261833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H3eABNn/jTQdi8bLwLy4lbiH/P+mOBKDAClVuXMh95c=;
	b=MVRt3h6h0IL5ui/29e5EzJhWtTLbOysIOBHDq+tmXkVBDxf0WD9Ef6TeeGA8EHxULKEAnX
	nLgPFm2iw5oPPJovEO/pWS8PJ7DNB4bjCPrVo5BsxRlqqSOZuqHkXm+XMFSxbKXHOFjoUw
	e2N5I5fIPrOjlLVBPZYTJgfLI7aLcKhOpOcJqUgbdIFTogWU+m7UyPVQjc7+K7YKrNYg4w
	omD0PV/r69F/7iRLyJO5X149d8niVbus34D1/1LPoupYeoT6AhFjdzDqItF5T/8+W4ypFy
	BSnfA1adEbWPx0QnWTnVIYPQJQ+MhROoIpHGryFkUWQjMCXBNP/brS0tfohboA==
Date: Mon, 23 Mar 2026 11:30:27 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, o.rempel@pengutronix.de, pabeni@redhat.com,
 linux-leds@vger.kernel.org
Subject: Re: [PATCH] net: pse-pd: add LED trigger support
Message-ID: <20260323113027.784dfeef@kmaincent-XPS-13-7390>
In-Reply-To: <20260321175546.282181-1-github@szelinsky.de>
References: <b42fb036-89da-48cd-9525-d05a065096d5@lunn.ch>
	<20260321175546.282181-1-github@szelinsky.de>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Carlo,

On Sat, 21 Mar 2026 18:55:46 +0100
Carlo Szelinsky <github@szelinsky.de> wrote:

> Hey Kory, Hey Oleksij,
>=20
> Thanks again for taking the time to give detailed feedback. I am not real=
ly
> experienced with working on the kernel, so I took some time to process and
> get a clear picture. I will try to implement and test it asap... My action
> points would be the following: 1. Replace the LED specific polling with s=
ome
> generic devm_pse_poll_helper() that is based on the existing pse_isr() lo=
gic
> but in a timer instead of an IRQ - pushing events through ntf_fifo /
> pse_send_ntf_worker() like other IRQ-based controllers already do.=20

Please add a patch to introduce the poll path before any LED support.
I will test this new path with my boards with and without the IRQ configure=
d.=20

> 2. Fire
> LED triggers from the notification path, not from a separate poll loop: L=
EDs
> react to state changes e.g. they don't drive their own polling. 3. Fix
> pse_pw_d_is_sw_pw_control() - it currently requires pcdev->irq to be set =
in
> the PSE_BUDGET_EVAL_STRAT_DISABLED path, so poll-only controllers like hs=
104
> would never enter software power control. Needs to also check for an acti=
ve
> poll worker. 4. Add #define for the default poll interval (e.g. 500ms) wi=
th a
> comment explainin why.
>=20
> Did I understand you correctly to not waste any time?

Yes that's it.

> Unclear is for me still:
> * Poll helper design: new devm_pse_poll_helper() vs extending
> devm_pse_irq_helper() with IRQ=3D0 fallback? I suggest a separate
> devm_pse_poll_helper() - it keeps the IRQ and poll paths clean and symmet=
ric,
> and avoids overloading devm_pse_irq_helper() with conditional logic.
> * Who decides to poll? The driver explicitly calls the poll helper, or the
> core auto-detects missing IRQ? I suggest the driver decides explicitly - =
the
> driver knows its hardware best, and an explicit call is easier to review =
and
> reason about than auto-detection magic.
> * DT property: rename led-poll-interval-ms to poll-interval-ms since poll=
ing
> is now generic? I suggest yes - the polling is no longer LED-specific, so=
 the
> property name should reflect that.
> * Kory mentioned two distinct cases: (a) controller has no IRQ support at=
 all
> (like the hs104), (b) controller supports IRQ but it's not wired on the
> board. Should both cases be handled by the same poll helper, or does (b) =
need
> different treatment? I suggest the same devm_pse_poll_helper() handles bo=
th -
> from the core's perspective the situation is identical: no IRQ available,
> need to poll. The driver just calls the poll helper instead of the IRQ he=
lper
> in either case.

I agreed with all your points.
Thank you!

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
