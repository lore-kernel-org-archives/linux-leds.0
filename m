Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60348352030
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 17:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826142; cv=none; b=DAv5IzcIHxbRLuA6TX7pOsVebaF6998BN/sLtdZG9QJiZ+wKy7o1Yz5qpYYKY+gKo433ZpdbxKf58KMasIoppIqty/WNQQld4sLiI6b02EDUDAL+Z/gERRsAZO5dSHwfgK2xgZgZAZWP8saCy9PwMWpX7UEkOxBupdxwxiEJW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826142; c=relaxed/simple;
	bh=jc4IfXJopxkoVMsG6EOUIrIVED+3c9mka+yX6sLtj+Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pv8c1joZIZVpotVyZEkRl+RUifQvm25o1OGLVFiRwN3EcBYCfWYwLXtwnzgAVHCPD+K7vjQBOFWcES8HxbvpG29a+CdJInjC630DpBenuFVGqlDafGe/MGAcOUZHJOFKltSuf5WBb2RVPSoI2AvMKkagQBcjTn+GkNUlAXfROaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2NkN1M7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2NkN1M7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A697E1F000E9;
	Thu, 23 Jul 2026 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784826138;
	bh=jc4IfXJopxkoVMsG6EOUIrIVED+3c9mka+yX6sLtj+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g2NkN1M7sReHR1eZlYHJcpYrYvkI7MKCHZnqpWHhORwdRCDb94ljXMzhgEISL5gmN
	 jLb1g8HDU7o4liwmazQkp7s+Xq+TiBW4j85WN5Sc+Lkj4FX+fktc4imGHOlG+d0rJa
	 IDmFWmi3e9lkCO4MuSmjlzQm2SWokvQXTSqCgHF3ov0PWy4Fogff2XhFPAE5PGmNqU
	 4yaXSYRToh7GIhboRO+83gSvoWJuxJeACG8/7uSQjqb4M/EgaDMU3zjOt1uKd9ARdx
	 0jC4EECzE047+NWcnnY34AZC6gNbmm8CGIjwSwA9I9Pu0Lecf2H/Bgz1A6UmUsgxhS
	 nCKmh2C98phPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] leds: 88pm860x: convert to dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260723164612.3146-4-arun07172003@gmail.com>
References: <20260723164612.3146-1-arun07172003@gmail.com>
 <20260723164612.3146-4-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:02:14 +0000
Message-Id: <20260723170218.A697E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message lacks the mandatory subsystem prefix capitalizat=
ion.
--

--- Patch [4]: [PATCH v2 4/4] leds: 88pm860x: convert to dev_err_probe() ---
commit 44af50244a910d0907f1e33477c8de6960595c9a
Author: Arunachalam <arun07172003@gmail.com>

leds: 88pm860x: convert to dev_err_probe()

This commit replaces open-coded dev_err() and return patterns with
dev_err_probe(), which also properly handles -EPROBE_DEFER.

> leds: 88pm860x: convert to dev_err_probe()

[Severity: Low]
This isn't a bug, but the description after the subsystem and driver
prefixes should be capitalized according to the LED subsystem commit
message conventions. Should this be "leds: 88pm860x: Convert to
dev_err_probe()"?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723164612.3146=
-1-arun07172003@gmail.com?part=3D4
