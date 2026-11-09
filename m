Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251370;
	b=EbsPnikHrRvBGOhJtf/xZk7XRYSIQEDMPXVY3ARK5QV7W3YG8R9oUm2rP5HWit4d1eqd
	 8Dlwj1LcxHYSaWkcO3W8K/jyANDBuV/8a4O/S9iGVYfjzqFuC854rwdpuaPGbyP7H+hbS
	 SjVzI0j2mW7j7l0siikd4ibA6I8im7bqZvr44BdTf5cQW+44l+FaPUdItpFkeEOPFBf49
	 rQngx0inq6GetwKavuDRAANelLDlMvuCXpAS9bfyvhGP9Sn9h2/1t6KpkPg/UbrDlctbh
	 3DT9hINnzCDIULBlI60atpB1RIX7X5NfDaE+AGwAtrXn3FHvCGduhOWRvznnLG5ySKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251370;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=89My3qdIAjdgbHkCl0m405z5qgQre7g9mWeS4ARG/C4=;
	b=iCg/ge8DBpCJddlR4H5QZjAVxIhbWtlcE7PFE1GHavfGDPcYgppLhZNXTsuz2qkEklOl
	 4Q+rzUSQdZgca5JmbHrSOQT8z7gADlTpyswqs7M3Jizivc/kbkka2iL23MIYC8cCMkkuC
	 OAskYyB/qn9GIE0koEf/5QPx3Z90aRosaXrM+14nODAAW4o6psnAD/wBqiZEGXZu3WEGm
	 4PvpoPg1UAJjd+H4LbuFg6q64jZFmgwOfP0nWkd6ZNzWnbUXXkdlJz7ajFSc4bLcIp4X+
	 Rv5JDPJZJcz0EmsMvs/BvUJFQTWI6sdmwzx0LegmyjccPeChEPhMkeS9PfRRCsS5njA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4SeShKa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1945606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4SeShKa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501981F0089F;
	Mon,  9 Nov 2026 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251369;
	bh=89My3qdIAjdgbHkCl0m405z5qgQre7g9mWeS4ARG/C4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b4SeShKaVIE2StixKemKxJivTtPZ1vOT8OGb29Lgo/0kEBwyBgY2snSf66dm70AgD
	 DqPfm76aZ25PUsxa4av42yRWAvN/tsbQCvNuCFFAXBpqt4wpwqflMhEFxRz6lxEXkP
	 YLcOjjwoN0/3Te/jMNO+mI0j9j5Tv7ByNq940bCVChK8d6KA5VKJo8wVN0NL7+xmf1
	 Ymmg1f+Q9f28tKwDTzV2snXutRpsF1TXIQc9zICUVT3kDW964z5GhstWszma++QlL7
	 29WSl9JXZqdyNgtx50obMOehbC98pssOazg0AFznv1mQeIQa9yFBlca7TUa/eyqhZ5
	 FcAk2UCFKPGwg==
Message-ID: <sashiko-outbox-205461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] leds: rgb: ktd202x: Add Etek ET6326 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-7-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-7-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:09:28 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The Etek ET6326 is a KTD2026 with a different flash period encoding:
> Reg1 =3D n selects (n + 1) * 128 ms, from 128 ms to 16.38 s, where the
> KTD202x selects 256 ms + n * 128 ms and uses Reg1 =3D 127 for one shot
> mode.
>=20
> Move the number of LEDs and the flash period limits into per chip data
> and add the ET6326, so the timer trigger gets the delays it asked for.
>=20
> Report the on time rounded to the nearest millisecond rather than down.
> The shortest ET6326 period is 128 ms, and 1/256 of it rounded down is
> 0 ms, which the timer trigger passes back with the next delay_off
> write, where an on time of 0 turns the LED off. Rounded, the delays
> read back also give the same on time when they are written again.
>=20
> Link: https://www.etekmicro.com/wp-content/uploads/datasheets/ET6326_data=
sheet.pdf
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D7

