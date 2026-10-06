Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA71CAA78;
	Tue,  6 Oct 2026 03:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259024; cv=none; b=t+Ohi5NZDayGiW3MYtmcjrgEpoX4v2x775roYBL5ZbmQnZyzjEBk0IL9wCja74a3Rcrt28RE1lXTZ6czhYx3SY1f7aA/mspeFUK0UQnGEM3Dd/ztn8YMkuO+PUA6eOiUSvzEmGFgil4JmKe2ERzofiAfCSLvmjF4B7DGtrRGAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259024; c=relaxed/simple;
	bh=IRt15f8I9wFRSPTwTTXwqvby3Im0ZNWNN24G7TFqmEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yzpkub5y7Tg6dRqBUbbRIjEOXcFM47a3GeXXqcY9zpnvMoA+AkrhuCGeZykmJyplnSemBb+KnGzw5XjPjW7a9OLPFefVLAykFbROW8p4l1PiZ1rviWuZsxR2OkI111Q+OA49RM6g4nCaq8bLoCMnYZZ1dEEb1cQl1/c4wyyQvxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PXQ43otH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PXQ43otH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8241F000FF;
	Tue,  6 Oct 2026 03:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259022;
	bh=IRt15f8I9wFRSPTwTTXwqvby3Im0ZNWNN24G7TFqmEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PXQ43otHPirg6MeMwHP3qerkf/WIL2Kkfp7PLA9uzYX/FSyotCrrQ9/i1AUhfpnf9
	 VZAMoX9tm4afvlyOwWKSImp1aQryU/pOZT2J4Ypa3YtEqBVuItz5syhQieg8wxW2V6
	 Kz7vlQGWC4PKVMLMb9jGNVxRr4MVmeOqraKMCxFMWapIXEXMSWHriWA9rlKX3AoqXP
	 XbG1ee4XMxeFuzkhfUrVhWSMKIK7cyuDvq+MLhg2qIvdrav8IxR8ENwyFHlXZxru2O
	 j6OvF/ldL1vD/Dtezml9XFClRyYMl2oRBzQsGRgo2iWcSyIrVwj5eOwfX3zZ3l7RJa
	 5HA7+GpdqSyLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] leds: aw2013: use dev_err_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-4-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-4-108ecbdf2775@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 03:57:02 +0000
Message-Id: <20261006035702.8D8241F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: commit message title violates capitalization guidelines
--

commit c4cd98164677763e9cf5e92886e81d34a9229be0
Author: Paul Sajna <sajattack@postmarketos.org>

leds: aw2013: use dev_err_probe

This commit converts dev_err() logging calls within the probe function
to use dev_err_probe(). This ensures correct handling of deferred probing
and cleans up error messaging in the aw2013 LED driver.

> leds: aw2013: use dev_err_probe

[Severity: Low]
This isn't a bug, but the commit message description starts with a lowercase
letter ("use"), which violates the LED subsystem style guidelines requiring
capitalized descriptions.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-aw2013-aw2=
0xx-rename-v2-0-108ecbdf2775@postmarketos.org?part=3D4
