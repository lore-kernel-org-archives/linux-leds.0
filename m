Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED7C4A2A56;
	Mon, 19 Oct 2026 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404745; cv=none; b=Za9VsWwiZJ/CMdQmLMvEB6/04cWljEX+RGsYYZp1TdUxBR0s5OxKD0tp+Y8D76OxqbNFmcsQdch2O6kBjBje0vnTxrtpwwcr1tm4p/e6Tr2IpegN9VcW742Nk1npLs4cGJf9sG/y8v/7PWR75DYVg1toj8xkb7MJJKobJIzvyAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404745; c=relaxed/simple;
	bh=Y9tReA2b3n3teryhzZpgElTYzCcEgdTH+UWVfdvxqOU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FpWLg5uoqeIrpo0uO+Zr1Hdhml7WR6qYA5F4yV57ihPw52nqF/cuKmeR4V9oD7Zmw70w4nyh+bozotMZ9XEarSFEPzCfSREH4tkXzQv6rF9HfRTk6fQ2W36TsTOiIMt6N0irkLxGjgScjd/K4TLwnCFHMaICY/USAatfuRsER78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FggwKCJI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FggwKCJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC8951F000C4;
	Mon, 19 Oct 2026 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404744;
	bh=Y9tReA2b3n3teryhzZpgElTYzCcEgdTH+UWVfdvxqOU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FggwKCJIqI+DIVcpFmeg+r1QJ32RfUKP5u7uMnCDXg6QCElDWQ6UtjHvYda4GCc/I
	 2FRhE6DoBYN08eQVsvAXnDUSD4hNzPwSPvWrY2LmUAxfVHhzfPMqZY3rFB/pvT7qag
	 /kp6vpITChQkuhTWymn8/flwOgVI6ZeTOeQ+cu7hXHED6XPt3EEgRzlxEIyAb0IRok
	 1zVXA0j4ILyBXZ0WXHhhYPLJJCZB4YhoWhOe62iMxGvHS4EWlfYxQPjD2YS7YI4m3V
	 zeQrAvtxwyZ70a+6IEcGvVYSfkacauOdccqhOnj+0j0/WiDTeCQDDgeJ+YYthTuVdt
	 zdw2r+C4009yA==
Message-ID: <sashiko-outbox-176961@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] mfd: aat2870: Add support for VIN and IN-LDO
 power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019100930.110954-5-clamor95@gmail.com>
References: <20261019100930.110954-1-clamor95@gmail.com>
 <20261019100930.110954-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:12:23 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The AAT2870 supports a dedicated main power supply input alongside parent
> power supply for its internal regulators.
>=20
> Add support for retrieving and managing these supply regulators
> (vin-supply and in-ldo-supply) using the regulator framework to ensure
> proper power supply dependencies and power-up sequencing.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100930.1109=
54-1-clamor95@gmail.com?part=3D4

