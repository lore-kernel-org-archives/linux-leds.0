Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FD1388E60;
	Tue, 24 Mar 2026 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345982; cv=none; b=ukkbRL7/4ntTd00UtM0ha8yABpFlcGA29PoHaEnMRGqTh0I6yYZrfHINTOg8/xbeoIXbSDfmhM8GxzOCcPpwwN90dfzrIIh/LrbIoD+yhgWSCw6sP8/Mvy70tX79f7hXxQp7cYID802hof1XorOE3bEfsqkZwzpBxDIe6v3r3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345982; c=relaxed/simple;
	bh=9/w78eLdcTOVlkTZthX/B07lGl9E0Qm2yYsJ0nh71l8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=omy8Hkgv86CY7bPnoAQi1DGFhrxKNzK3Nk7njkOyNhORTGkWDWgkOPPAXEgeLTDyt2n2e2TSRtca/zHrTCxyV7JM+P7qBp8TrzFOXw522AcKXBxLz0EwiKwITD3Av8bX/U6YtfEN6AUOMPJsgH01rozQHwv5zS8RX9Bge3gmUow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nKH70kbm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nKH70kbm"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 194B11A2FC0;
	Tue, 24 Mar 2026 09:52:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1ACC6011D;
	Tue, 24 Mar 2026 09:52:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61B64104511C9;
	Tue, 24 Mar 2026 10:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774345978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NWbEWD1+tCLesuLGhS91X8Nzg8UFewtHcq3VcPA4VSU=;
	b=nKH70kbmCJUD/k596dT01rQz6fmlv7t9sn+nW7YiLXERPXRm1hG5vUMmKQh1Kd2ULDX5Zc
	4YBovspp+CF1mM0kFJgLoW6lvv5pijZGP1Dskkr9XEY/KUJjgUFshDZkwnEI2UGHarnTDX
	Kvk8C0oY3arMXyLKspK5KPquLRhDEzOgeeeAyJlXL28ONg0GOQvOSwzXnrFyuzwEsWu5UG
	ntyuVxGlTcuov6lv/ooOS7puL0zaPMeUyM1ic3t6rhsIBoXHUfH8IkP7JD1+VikktggkS7
	vcDSKYD3+UIrN4xwBCjKu3V2WabmYpHohjDNQiRh81DtW8jNUkQ0B+/L2vQs7w==
Date: Tue, 24 Mar 2026 10:52:52 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 0/3] net: pse-pd: add poll path and LED trigger
 support
Message-ID: <20260324105252.0114a7a4@kmaincent-XPS-13-7390>
In-Reply-To: <20260323201225.1836561-1-github@szelinsky.de>
References: <20260323201225.1836561-1-github@szelinsky.de>
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

On Mon, 23 Mar 2026 21:12:22 +0100
Carlo Szelinsky <github@szelinsky.de> wrote:

> This series adds poll-based event detection and LED trigger support
> to the PSE core subsystem.

I just saw it but, for next version please add net-next prefixes in your pa=
tch
subject, as described here:
https://elixir.bootlin.com/linux/v6.19.3/source/Documentation/process/maint=
ainer-netdev.rst#L64

> Patches 1-2 introduce the poll path independently of LED support,
> so it can be tested in isolation on boards with and without IRQ
> configured.

Great, I will test it when I have a bit of spare time.

> Patch 3 adds LED triggers that hook into the shared event handling
> path introduced by patch 2.
>=20
> Changes since v1:
> - Split single patch into 3 separate patches
> - Extracted pse_handle_events() and devm_pse_poll_helper() as a
>   standalone poll path (patches 1-2), testable without LED code
> - Added DT binding for poll-interval-ms as a separate patch
> - Renamed led-poll-interval-ms to poll-interval-ms for generic use
> - Fire LED triggers from the notification path rather than a
>   separate poll loop
>=20
> Tested on Realtek RTL9303 with HS104 PoE chip, poll path only
> (without IRQ configured). Verified PD connect/disconnect notifications
> and LED trigger state changes. Testing with IRQ configured is still
> needed to verify the refactored pse_isr() path.
>=20
> Link:
> https://lore.kernel.org/all/20260314235916.2391678-1-github@szelinsky.de/
>=20
> Carlo Szelinsky (3):
>   dt-bindings: net: pse-pd: add poll-interval-ms property
>   net: pse-pd: add devm_pse_poll_helper()
>   net: pse-pd: add LED trigger support via notification path
>=20
>  .../bindings/net/pse-pd/pse-controller.yaml   |   8 +
>  drivers/net/pse-pd/pse_core.c                 | 267 ++++++++++++++++--
>  include/linux/pse-pd/pse.h                    |  34 +++
>  3 files changed, 278 insertions(+), 31 deletions(-)

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
