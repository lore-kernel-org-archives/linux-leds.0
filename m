Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848AC4F93DB;
	Wed, 30 Sep 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784199; cv=none; b=VngeSUmoXyGpSdA5LhUqRv54NB71QebuS0j9oBrsY9J1gHg31VwAQ3mPX9fOEZwJni7uLMhPN/DIHPH047ClJB6j4X8FrkIg59Z0PktZJwVl2/5EsZzYUYTlQM4MMerGqsaT3OB4FpulOaH4tpSDIcfMnONT+mWhwDqVKGjGnUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784199; c=relaxed/simple;
	bh=5cctviEvZBuPXTWPkFfna7+3PSJFjcUM6+Hejt7aKxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y1w4BPIbp0hWMh/xlhZN5uWS1UoqILAsF4khcFFLTFXabJIoSE8xUsaA2qMnT8sr6Szvrt/yNCs3MkNanDmenlWo/VR3TUQ1cfBAxV5sbIjAR1mVfYk7v1gkd6GweOQ/G+usqD7Uay0eQ5OIbi8o8qao4rSy3e1MldaPli8wMQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OaEFgIGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OaEFgIGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2811F0089A;
	Wed, 30 Sep 2026 16:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790784195;
	bh=5cctviEvZBuPXTWPkFfna7+3PSJFjcUM6+Hejt7aKxI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OaEFgIGPXuXltyOQnt+/QdiBDS69TdqLs9Am5iAj8dBTe8hLorDgoapWA73SSIa/m
	 HIj099slBG7C1UcfcDnC08MS+jJzqQVO1K2SqODkcv+/uCIOHblJmmZPMJQEayWLIJ
	 ta7UOrfPb+10EKCsJNpVY1BqjDGnirnr21ByWTkbcuhBYRZzAGJXthGM2JuWBQNHBP
	 QMHmiLQRRtpOC+jD9HvbXNZU6eDWfVlym0TdglAKoqlP/rcoC+LnVChk95o2t5hwmI
	 t15jCDaldYFdVYdz6v9H2u69kuAyIvX6B9Vkc2VePHCUZZ4Bi7+g2VWiTT6lFGqrFz
	 iqV5BtPUtioSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/10] leds: pca995x: Add support for group
 brightness control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <45706e11ea287c92de3408991a3c620472669b5d.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <45706e11ea287c92de3408991a3c620472669b5d.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 16:03:14 +0000
Message-Id: <20260930160315.2F2811F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> When LEDs are set to PWM mode with group control enabled, their
> brightness can control using a global "group PWM" setting, modulating
> the individual LEDs' brightness with a second PWM running at a different
> frequency. This lowers the minimum duty cycle from 1/256 to 1/65536
> (averaged over the modulated signal). Group brightness control is
> particularly useful to adjust for different levels of ambient light.
>=20
> For simplicity, group PWM mode is always enabled, with the reset default
> of 255 as group brightness. This reduces the effective duty cycle by
> 1/256 at all individual brightness levels (the individual PWM signals
> are modulated with the 255/256 duty cycle group PWM), which should be
> imperceptible.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D10

