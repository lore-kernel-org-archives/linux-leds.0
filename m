Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB659547040
	for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2026 00:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790381572; cv=none; b=Ou5iVnWZEkafOzwQt0nb1v+WjJXNvxTaUdT0xmJ12pvnmXiv4/0ASueZSP/q9CdCFmV8hGMXrlSBPCp+jkxVnwHqF3dukkdTQaHkZOPZ/eT7AOXE8b1cwBScBAbZy1NqNBkdeHZMJ2lcrFVUQbbl86rp/94oXMNt/1LsQlpMPuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790381572; c=relaxed/simple;
	bh=SLDD6Twdr9QeydXbhSM2/Xz3ZOTTPYjKk7H7CmVaoBk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c/C6dec0hp6N476vFyBssEmgO0FFlTBd0LVvG+oc8wih9sXaRpywygaDqaq3hoUFKMVtjMkREP0qMfTXc/vwDFaQypD+qZSJ6q37swimke2FyK5R67dyuNEb6a0JWjoh4MqxPXRAdmTwwV/WJyqn1zSLcAXJrmCSdjLHcYxF8DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVm140Pq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVm140Pq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB201F000FF;
	Sat, 26 Sep 2026 00:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790381571;
	bh=SLDD6Twdr9QeydXbhSM2/Xz3ZOTTPYjKk7H7CmVaoBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RVm140Pqw0FqB31LCFvsdGNAN+LJK7f9S8cm8p1b1LXmykEs5zTyn9nh6ZIk4RR3B
	 DwqQLFJsqQiO1w2ZsDdJzcsGlo3Jl3oqs2DQ5S9kWR8nMfYmkaLX5OhubHcBO5et/S
	 Gy0aM/zvKViA4cXwTBRZtWZ60E+A9B3mu6yCzgZSDqJe21i3czbBE2tWqcQAvONBAX
	 zvY2UrMLQRxnGs2MYdq8XPj37hZyOShZgLCET36mYBwHDJ17/r04vCRRa1apVknek6
	 O2Na2NwvsKe/7vhlLXgyaf5ByngGn9kuyrg28pyFJxv326k/j/H37cNsHPWYk41qQV
	 y7xiloW9jRApg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: blinkm: Clean up sysfs group on LED
 registration failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260926000344.29899-1-mhun512@gmail.com>
References: <20260926000344.29899-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 00:12:50 +0000
Message-Id: <20260926001251.5BB201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> blinkm_probe() creates the BlinkM sysfs group before registering the LED
> class devices. If multicolor sub-LED allocation fails, probe returns
> without removing the group. If multicolor LED registration fails, the
> helper removes the group but returns success, leaving the device bound
> without an LED class device.
>=20
> Keep LED class device rollback in the registration helpers, but remove
> the BlinkM sysfs group in blinkm_probe() when either registration mode
> fails. Propagate the multicolor registration error so probe can perform
> this cleanup and report the failure.
>=20
> Fixes: 56e8c56c9af0 ("leds: Add multicolor support to BlinkM LED driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926000344.2989=
9-1-mhun512@gmail.com?part=3D1

