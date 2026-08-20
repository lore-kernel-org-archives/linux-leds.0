Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD1244062A;
	Thu, 20 Aug 2026 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787248123; cv=none; b=XFTGeA049MJKC6CfxyzOMvCU18BMLSDsVUtNqPVQ80P4dlhN4M4cWrjFzzLPTwRPsP31sC4ni7KYb1cpPP4a30zw8Kj0a4Koj/GwMLU1BPNOZ/JP4a/6/G6X/rTR8v9i1kLMKPxpfsx547KJBc/0pwDHg82b/rvcGlUy40XKVSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787248123; c=relaxed/simple;
	bh=HPVyCEQWLw55DGUDsD2dL4SJpeRIszG9Bok9wboWdto=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bwM7812qnLXIKA3gZd1IZVVPFvzhflWFlIQ5dKn3PcaeG0D/7QEeecCsqIEkIII8bnFfPxAIr/cglWQZyppfA1hl1ZTgFjFx9h9yJnTeSgrLRycQeYqqEuWbUbe6ElySi5M5gbMq0DHlk95r3tMY2EOMVV/WH/N3s9dRVYhs5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDaq+Bkp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDaq+Bkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4E31F000E9;
	Thu, 20 Aug 2026 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787248122;
	bh=HPVyCEQWLw55DGUDsD2dL4SJpeRIszG9Bok9wboWdto=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IDaq+Bkp20+E08ZAQ5hqma8W7GakZhb0o38yJnn/YgtYATh0JWrSJQaQHwlxz8GMo
	 VeI9/BDy0At2S7cEgmumreKni5aO9oRYNGjLOR22/+ubwAN+EYBz+B6Db3k4GRdf5K
	 s/RRFU69fAYSXyOptMptQzXWso5i/QVyRJxSDpz6MjUMyHF5XlDszHlCE9xFkpHdGW
	 ppIuPk1sQYB2qV+mfr/Uagr76nlnkAV5VlkjXJqX4qTvA52ebUtSbnRziblv5hbFdB
	 7KDk3EPgJpzkj35Og5OqOZqiogL0SdLBfJrVKw9m8ybCsVPDRfx1K7hWaRzKLFsc5i
	 xF+n17iogJMmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] leds: is32fl3207: Add controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <5c39843cf5be70e27021ab2fb4fc26172f75106e.1787247467.git.ahmadexp@gmail.com>
References: <cover.1787247467.git.ahmadexp@gmail.com>
 <5c39843cf5be70e27021ab2fb4fc26172f75106e.1787247467.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2026 17:48:41 +0000
Message-Id: <20260820174841.DC4E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add an I2C driver for the Lumissil IS32FL3207 18-channel LED controller.
>=20
> Expose individual and multicolor LEDs through the LED class. Use the
> default 8-bit, 62 kHz PWM mode, derive output current from RISET, and
> enforce each output current limit with the scaling registers. Serialize
> multicolor calculation, scaling, PWM, and controller-wide update
> operations.
>=20
> Clear retained scaling while SDB holds the outputs disabled. Release SDB
> and briefly enable normal operation to issue the required software reset,
> then keep the controller in software shutdown while registering every LED.
> Enable outputs only after all limits and initial brightness values are
> programmed.
>=20
> Handle an optional supply and enable GPIO. Serialize shutdown against
> pending brightness updates and honor retained shutdown state.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787247467.gi=
t.ahmadexp@gmail.com?part=3D2

