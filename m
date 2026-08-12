Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841363328E6
	for <linux-leds@vger.kernel.org>; Wed, 12 Aug 2026 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542982; cv=none; b=SzrgFSRcUpuVuQznHsJJlHECUYT7RUHL5onJoWrD5PLhQHUzivkFUyjiVzqVl1AuZS2Z59RTE60IRRqU1RRMUwP1XbDhRzItd/GzmZTmxIiPO0Tlt4KVK2Fr1Jwo+o/EPmYiufKO+U4+LeAtbFWN8vnPSR1Ber5Mw8fe0zY/gRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542982; c=relaxed/simple;
	bh=JwrCPHOh41x7EKXWU4PNQrZiixHNNkiN+acEjGcK3TM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=laGAOxQiGnU3eD5Z6rDOWexmESfgizxvu5G/Lw2+qG4/Sw7wvY3yHbeUJEw95ty97VgJ+j4rH8w3h2NQqQYpLEZ8bkaSQsTbNiP3axbYufvGsdeDIxs61jVhbeUIo3Uf5UqfBtD9DwapUtP15lD2nylbwB2by2zBRAgrZ1an3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPcMC4pN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPcMC4pN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC7F1F000E9;
	Wed, 12 Aug 2026 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542981;
	bh=JwrCPHOh41x7EKXWU4PNQrZiixHNNkiN+acEjGcK3TM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EPcMC4pN99KSnYqQY+qXwizilIfgw/o2zHqI7Gbnoaa53s2jbSagH06tuR8XaY6sa
	 9Dhi91I13PRCopr4rEsoJQA3b+TpzzFDwHE8IBT7t/syK73cFA0rb4UrsoyqcvYIfi
	 lhGSANa7lLg/vVG3xa8jmdworeqUfedpjecDSsmlCsMLMIPxmmq6NqvX8aJ3rJ1gZ/
	 1UOn6zSua+1J91LAQNqJkMUZhOz82jVAEwf1Me4lug7dhJezNdqNfZViXR/1gLJu61
	 lXZmLl7pf5HAjlw0BYdsDboFloHxU+c42DVyPc+EfWFEEOZmuv6MZUyQGHvKDCeO3o
	 Ss54ewT1Pd4hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: lp5860: Fix LED teardown ordering using
 devm_add_action_or_reset()
Reply-To: sashiko-reviews@lists.linux.dev
To: kr494167@gmail.com
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260812135001.48949-1-kr494167@gmail.com>
References: <20260812135001.48949-1-kr494167@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 13:56:20 +0000
Message-Id: <20260812135621.2DC7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Surendra Singh Chouhan <kr494167@gmail.com>
>=20
> The driver previously disabled the chip in its remove callback before
> devres unregistered the LEDs. LED unregistration turns the LEDs off
> through the driver brightness callback, which accessed disabled hardware.
>=20
> Fix this by registering a devm action via devm_add_action_or_reset()
> immediately after enabling the chip in lp5860_device_init(). Due to devm
> LIFO (Last-In, First-Out) teardown ordering, devm will automatically
> unregister all multicolor LEDs before the devm action disables the chip.
>=20
> In addition, use scoped_guard(mutex, &lp->lock) to restrict the initial
> mode setting lock scope, avoiding holding the mutex across
> lp5860_init_dt(), which would cause a self-deadlock when registering
> subleds.
>=20
> Finally, convert mutex_init() to devm_mutex_init() and declare the local
> variable ret in lp5860_probe(), allowing lp5860_device_remove() and
> lp5860_remove() to be removed completely.
>=20
> Fixes: f0a66563aa2d ("leds: Add support for TI LP5860 LED driver chip")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812135001.4894=
9-1-kr494167@gmail.com?part=3D1

