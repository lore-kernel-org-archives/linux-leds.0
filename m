Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49286468C00
	for <linux-leds@vger.kernel.org>; Tue,  4 Aug 2026 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851717; cv=none; b=Vu8RwYXdxTjaFMdwzaU/FIVUKxIQtljwNXZeapmeojvAi0wMsjBHSAZNLdSkBiTEBQqc+i1rNYeqkZTmC6ZPQbLIG49WYFrezsgYhzTTZdy1gHEoR86WZao8Kbx3N2D/erqMzxCZtwJK/Z3oX/5KmGuAPuqvPl1yzFpT5WlDZVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851717; c=relaxed/simple;
	bh=acOHr1Y330WkMn4lvs5hrC9L7BXoAy5giDryFnLUqQE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DIGYID1+cBYM+udlywoYQBpmfGZL48NqIwShi7SLI5vhH4oLF2sn0t93bYp8JFIm72koNj89+Jrd2sjpfUKpen2or7m6s0LM4i4b4OhrdtCqaoV5iIqrRU+fKNIab4WdHzBX9oUfoJmjT4undpFb1xfzmk4DMEJbmFLCxbkFjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dG3oJ2Z2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dG3oJ2Z2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBFC1F000E9;
	Tue,  4 Aug 2026 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785851715;
	bh=acOHr1Y330WkMn4lvs5hrC9L7BXoAy5giDryFnLUqQE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dG3oJ2Z2CrS65o42i959HNRx00XgzfsaSQWXyA+L9BEKFOKwOSW4fruSBj89lUAOT
	 aGYkIGraD0aBkLbNSAww8YiRukyce7RgTTwUc+cNmh1wd9BAiEnP5ti8uJ7l0ZVvV+
	 DKL44AHCgc6glMVJGpg8Ln+gCpOOiYDay8zPH+y5zxJCnxOGR+dJRmiZ+2Th5Nsczg
	 b2VKdZ99kJ1mY5GDNJicKvXNX37Vb/HDTRu8Gs5DiSmz8yjGBkVpmgnV29G3dXPbbd
	 fw3XEA4QtEaAHtx06feBMaTXkUHUel+O5deTR/HceR59jWENJoA+rmRM5xlEOt4z/v
	 kVHucbDl69dQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 13:55:14 +0000
Message-Id: <20260804135515.5DBFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message description starts with a lowercase letter, whic=
h violates the LED subsystem guidelines.
--

--- Patch [1]: [PATCH v3] leds: is31fl319x: modernize registration ---
commit 8ca9b33466bf8fe661e87d3758c14a3394d87a31
Author: Andreas Kemnade <andreas@kemnade.info>

leds: is31fl319x: modernize registration

This commit updates the IS31FL319x LED driver to use the extended managed
registration API for parsing properties automatically. It also adds proper
fwnode lifecycle management and defers LED registration until the maximum
aggregated current is calculated.

> leds: is31fl319x: modernize registration

[Severity: Low]
This isn't a bug, but should the description after the subsystem prefix be
capitalized? The LED subsystem guidelines recommend formatting commit messa=
ges
as "leds: <Driver>: <Capitalized description>".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804-led-modern=
-v3-1-297720eec19f@kemnade.info?part=3D1
