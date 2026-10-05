Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F3E4AA01A;
	Mon,  5 Oct 2026 14:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210435; cv=none; b=OYJSMoF/tDYU2DnZwzw0a2pZqfMr0GsuDKDVKUy1CVkFNX0jdE6w3hvkFth9MMP66pwApAiklydE8mAisUWHBZpAoMWgdIB4Y+SzGtMG7Vxkmf/p72f4LBDrFtEL8b1Wx4fpo/RFMJToH93G9xeFVacaa6NO3V50anWWzq45vfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210435; c=relaxed/simple;
	bh=MMuU3j9ryv8biKDOND11EIY3RlEYcCuAA0xe8PvMmXI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ML6tB1SrP3ubScg1QCwNCidY985Jud0RIOJJRyDywKBqXhZUdPFHPpkNXpN/fwnGqFCQpRJk4V8HpUF+f9Qbpb82s2q6S2P/AZEiIx/rvYyR3Aj6reNaj+7ZGXhCpm6qQth8Heszyh28HMS+DXm0Ewq6+XV5e06TAnbWvgfuvxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLlhJxZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLlhJxZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5781F00893;
	Mon,  5 Oct 2026 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210422;
	bh=MMuU3j9ryv8biKDOND11EIY3RlEYcCuAA0xe8PvMmXI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cLlhJxZBEADnueu7Pfkup6K2CHMNp12uyQwd2nrIzGoyhRlPbOcVHrvp67USnmWVK
	 vfgXIwyoA0deXFoathPsKj1lStl8qIM52JAecRyn5QPCJoKetWPLz/5Duew2Bh5Qp1
	 ELe7OTcHykQh2gFUyRG5y+3iM9cW0qQiXZ4LvGotncWUGGXOVUIIUOsp8uo65eoK0u
	 Aa9C8aEzVDNvmEmsgJsOef/2V8SURAyVXsWwqOPdcOqmtnsiknEUThVdvjmf5uSXIe
	 4CcC8ZZ3mL0CprgvxQ4jYQmg09tdcLhMATOSGBiWl2KNRLy3sHnnJAMyuBmRoJseIz
	 Z6SMCiYRk53eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/11] leds: pca995x: Fix maximum LED index for
 16-channel variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <3926421f5734083348a6dc3e3c0d60de5d75a067.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <3926421f5734083348a6dc3e3c0d60de5d75a067.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:27:01 +0000
Message-Id: <20261005142701.BE5781F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The pca995x_chipdef for the 16-channel variants PCA9952 and PCA9955B
> correctly sets num_leds to 16, but the value was not actually used when
> checking and iterating over the LEDs during probe.
>=20
> Fixes: 68d6520d2e76 ("leds: leds-pca995x: Add support for NXP PCA9956B")
> Link: https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53=
c4c9.1788350618.git.nora.schiffer@ew.tq-group.com
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D3

