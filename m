Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213553BBFBA
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477038; cv=none; b=BRqrPGu7hJwDa4p72VFkkAWPphb84Q06Y4T/4oIRd3net3no6vChgontAUPuTcMmrp0Ngw0nfIkn6p719/Ahql2yEzK338mi1F8FIFPg1q6kujvEcjsQloo8aWgLnygkWMZ5V4ePOC28lnOybIwaJuSpO5O8N6t6GimP2w1vZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477038; c=relaxed/simple;
	bh=KkwPzqUocm5SLooME5jfdcyc53WC2q16R9KVulZzXLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RW5Zm0lZyUDoEEb3OTuD68p8ow/jEJoKlQBvtThJfphZEeDXOFZ7X2iX/Tzl7Zf5+uOMWdA0etKy1y73NkuAYE7folN2PyjxmNrb1zOH5Z5oDPjnxuOfeohy9xVKEx+JFu0PvYgTxRW3a2wvQmLVQw9WJRpVaSSs3wK219YSNkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0mT/Q+f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0mT/Q+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 656071F000FF;
	Tue, 15 Sep 2026 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789477036;
	bh=KkwPzqUocm5SLooME5jfdcyc53WC2q16R9KVulZzXLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0mT/Q+fA22HJLgtrfTLEyQF37c9kG9USFLd6UfMi5oRtsotwUDWdGZl2tfyhnPAm
	 uAYHDG0f6qxgp2Rlc2KscNjy29LsopQDayt8xP6P8tdAerGmSK+Pdv6WKqCF0E+ckh
	 4woZDWtEAsR5SHQ76Ekdoop+3ZUETUp+00HMi8ENevhzIggTkKrWCDLJ7AbL7Lw4UZ
	 d/gedWeLctxjte7BiOdzs6Ya7HuvIp2iEaq5pfui0hv4IWKwnqoCKouJFdN8siwUh6
	 61S68sorU0Q52zN95SZfYAvfcv2PW7Tt70VqVH5Aw82stWcd3a+AYw3JBBGy6ZVdwH
	 yKDsMeo8rXXQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/13] leds: st1202: Spell out the phase-shift
 configuration bit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB849716E21E082D3B93B5B683C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849716E21E082D3B93B5B683C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:57:16 +0000
Message-Id: <20260915125716.656071F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> ST1202_CONFIG_REG_SHFT is abbreviated to the point of being unreadable
> and, unlike the neighbouring PATS and PATSR bits, carries no comment
> explaining what it controls.
>=20
> Rename it to ST1202_CONFIG_REG_PHASE_SHIFT and document it in the same
> style as the other configuration bits, retaining the datasheet name in
> the comment so it remains searchable.
>=20
> The longer name no longer fits the existing layout in
> st1202_led_pattern_set(), where the continuation line was already 106
> columns wide. Re-wrap that register write to match the layout
> st1202_blink_set() uses for the same operation and drop the redundant
> parentheses around the bit mask.
>=20
> No functional change.
>=20
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D2

