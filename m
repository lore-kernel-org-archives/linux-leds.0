Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4014B311C36;
	Tue,  6 Oct 2026 04:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259241; cv=none; b=CIS/Mri/OEtY3HUkRgjDJ9SEAPFTrjqZbYwygyE/OyVFFhbEaj4jzAECmYAivCCyFcrBF3jMyrjJj/Poy7FmlgQbDWpYIOAP5D6E2uiYJGZIsUvnwBaHuaIRg3rRiI4KyogKnxHv2aAP5Jca4wOAbN1gveXxI6HKVSwI58OwQ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259241; c=relaxed/simple;
	bh=iwWPRgjv+FbYG876hscMjsogxNgS9MwxTDYOl/jKfCA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s/65aX6oJOZbv5AUF9/rJKt3jlpqr/jgoFBo5vqE9FiSmMD6iLkCrsPdmw5wkESDhRZvgyNLQz01xJzuqqy91BrCjXPnGX6N/+9Z5sQ4QA1c8bxhenoZgU79uEqmxzRKY8xVKnxbDW30fhgvprpnHl7hi2pbZyisNtd7DiT2AFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1emjIQB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1emjIQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF421F000FF;
	Tue,  6 Oct 2026 04:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259239;
	bh=ILpvjUjCOdA29tW2zJ4p6QuJaQmsHsewAiOhEGA52/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V1emjIQBfXFdKgsdSDm8MjWQb9pNa6DEghOHr3E6ffkLTgDOGASiVoe/XPyPTRsHi
	 Y40ojasHQTkJdF8yhOf4N9zO472ec5fiTX45qpulksV2j3bkDAxq0hG4EoXzV3Gndc
	 jHozXuBi1Bd6J8ZO+JnjOhEB+2+1vRuXBPWZRUa/xZVuvaAItvqVH06W9o13MqhdLL
	 3/Iv3Vdz//Slkzc+325OSChDv8ToA52F4MQpbfAAkETkK5xvjY7FfaJd49HHA/G+Ip
	 z5A4h2baRGWNxcPBbTGpb2iPDBVCYvLfVYFu5C4eOMhyqpJFtwBbj1Ef53ero2/DQK
	 24R4/InQbiJ7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] leds: aw2013: move reset from probe_dt to
 chip_init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-7-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-7-108ecbdf2775@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 04:00:39 +0000
Message-Id: <20261006040039.8AF421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] leds: aw2013 hardware retains uncontrolled bootloader state
- [Low] leds: commit message capitalization violation
--

commit 62a3fe5d7c44e90d5a2b75159d01568ea923e7e2
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: move reset from probe_dt to chip_init

This commit moves the chip reset logic from the Device Tree probing function
to the chip initialization routine. This is intended to simplify mutex
requirements during initialization.

> leds: aw2013: move reset from probe_dt to chip_init

[Severity: Low]
This isn't a bug, but does the commit message violate the subsystem's
capitalization guidelines?

The LED subsystem requires the description to be capitalized after the
subsystem prefix. Should "move" be capitalized to "Move" here?

> diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
> index 2a133657d9b64..7bc0415375c6f 100644
> --- a/drivers/leds/leds-aw2013.c
> +++ b/drivers/leds/leds-aw2013.c

[ ... ]

> @@ -369,8 +376,6 @@ static int aw20xx_probe_dt(struct aw20xx *chip)
>  	if (!count || count > AW20XX_MAX_LEDS)
>  		return -EINVAL;
> =20
> -	regmap_write(chip->regmap, AW20XX_RSTR, AW20XX_RSTR_RESET);
> -
>  	for_each_available_child_of_node_scoped(np, child) {

[Severity: Medium]
Will removing this unconditional reset from aw20xx_probe_dt() allow the
hardware to retain uncontrolled bootloader state?

By moving the reset exclusively to aw20xx_chip_init(), the reset only occurs
when the kernel explicitly enables the LEDs. If the bootloader leaves the
LEDs enabled and the regulator is shared with another active device, the ch=
ip
won't be reset during probe and will remain powered.

Could this cause the LEDs to stay illuminated indefinitely without the
kernel's awareness until user space explicitly requests a state change?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-aw2013-aw2=
0xx-rename-v2-0-108ecbdf2775@postmarketos.org?part=3D7
