Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996913B6354
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476991; cv=none; b=ug9WFqOumqh0iqVKrmntw9UUwwzHw71YIdJR+jtdeBFV3HeqgVzbCDiPC2gQIhJDNmkUgHcMHHJ+dAQ+0U8h4EY1VAIP4g1pJYm2RQlcpBcom3a6qAU+6qOuyhjlPq4BSJtYG4iFU7gG7RPHg943CGUB7x4QOnO5yVL4z0V/5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476991; c=relaxed/simple;
	bh=Mrc0bKDZoeA7HtSS8noBMD71DMwMnN7+lf/bGE9/EvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ci7V9ZbHI650a30FPdhb1OPanZAqKajfFY2UtIiWUHGMs2ajXqagEnAyTzH9OKlVxAvsAO+TcHPqMW5r5sw/HVj3Jcrv0BU+qeXsmKhpYcME9PBQL1Z70hGy4DSYwqQ+/0kglEmVanZRwTs2dOzk+6Tx57UeCXKZ7Cj/WFPz3Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGbIeNe/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGbIeNe/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E511F000FF;
	Tue, 15 Sep 2026 12:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476990;
	bh=Mrc0bKDZoeA7HtSS8noBMD71DMwMnN7+lf/bGE9/EvI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGbIeNe/48QwohXercs2mvJmLGKf57KRVUDQHBqDgrDY5mAEKikM6NYyNU/c/iFt0
	 cgpcWSDIXzCRt5fpsQZaIXgpoRuuy45QKyk9IhOE/cGZFBtnSh9FC+yZgfSy+IPz3a
	 5+SGnrtynibmztQLEf7TWu9x2cfS3hkjAbvhyCCZQ86GMAP+RnJWDHzKspe6RsEDoL
	 sKVVGMh5U9N0yG0/vuksqmD3n+K8pl90OlxXhudTrXN/T6/gUZYUEUSzA9aPwzOTba
	 4nYb7SAVpJpY15xsiw01bXVquF9pZEvGLMDKT0rFISUORxCZd5I7+rMgoNneLNBQeS
	 1Fjo0axPtk+1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/13] leds: st1202: Use u8 consistently for 8-bit
 values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB8497783FB573CD48491F9648C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497783FB573CD48491F9648C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:56:29 +0000
Message-Id: <20260915125630.12E511F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The driver spells 8-bit unsigned values both as uint8_t and as u8, a
> mix present since the driver was added. The register helpers and the
> prescaler conversion use uint8_t, while the rest of the driver uses u8,
> which is also the preferred type in kernel code.
>=20
> Convert the remaining uint8_t uses to u8.
>=20
> No functional change.
>=20
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D4

