Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793585838;
	b=YTT9S2qJWuJrsgSEJ5GSUh6YBycYokqKc+ba7bLExyY7quNkN/kHa2smUQBjEogOgRCH
	 ruKFmh/XqXXkf+yrmbL4dB8vIr82gI+DVYdCa51/8m8AgUDZsTQbtujJ4Y/SkVTedGpr4
	 zRPr2qiofKP6BcH4sWcH77xP2GN1cuACUndC3SxYMSqyFYD12mCgbjGCKLnkAy4x9FIcX
	 3aCUeX+Dz0MX5D6RUjfclAiFnKJbTTRFMzaqGgbD31jJjPFnkvE3YD5hi1XJcG/P4tot1
	 c/+7O2/dtEIJyF5YR8Uy0V7sl8yws9j/nt0T3SN2odGaGQna5PpxrOEVBi8oyW31QIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585838;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gfYdaCcrsfeGsiVI83judEPeNuN6204N6bC4IADU9zw=;
	b=iinBgMZzUq1QM5+rc15qVfnePsMC8x6LvTfFsUxkH7MR/nkoFgNgD7CAEg5RSFS2rR9g
	 KaUtN6USMvgVo/uL9ojRVo7KXmUyPxz8hiFbKoSH0w6wxomy71d8Wb78Wz1zgnuNH7yzW
	 8aRXXivT3xqiWUXaEdhhXTAw37WfuxzlxNA1RwZVOuqK8xMHmUDXhZNzD2azq1oj9Fsb0
	 8HsguqBYGbvaRINc+OLkYvN2nMrkZw0Riz/Oe79ROIwXDM3u+tQOnjJBhEWVGqjzKc3gu
	 S9HHgf2jC77wFuMMtnuJCuPLsLTmTKZs4XvHKxx4ny6fnMmoAuPBi8Na/FRJVSmNDNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAMMNcKn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3334C606A324
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 02:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZAMMNcKn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC1B1F000C1;
	Mon,  2 Nov 2026 02:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585837;
	bh=gfYdaCcrsfeGsiVI83judEPeNuN6204N6bC4IADU9zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZAMMNcKnNGra1mD+ePo3EUPTR2hkbc8lzrsX1bGKa9xakmXfBmKOBlk2Z9O223Rje
	 IMTr54EtKdGqJVmuykBZ58xwwpiMaib6cGetbXFa59uDAJuhchVf4yzr20h42ZvEkY
	 WG/RUfwUrYwjJ3azOkVk4JPLxne1CVkvvblPGGi1O3IcjYr+j2WXvV7IAQl0rGxVIq
	 4PQpFW3Ipadx4FjdDKRKTVL0tBX90MId2WUn53fFAFeuY0obhwUM/TUntakonIOaEQ
	 HDgYCS75u0Ibd31m9jZXxWX/35xVmtjAveud3W1GlwY+ihDrNCTuWCxs51fFhZogRb
	 IPp4WyK6pdN3g==
Message-ID: <sashiko-outbox-192823@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek
 ET6326
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 02:17:17 +0000
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
> The Etek ET6326 is a 3 channel LED driver with the register map, the I2C
> address and the current steps of the KTD2026. It only differs in the
> flash period, which is (Reg1 + 1) * 128 ms instead of 256 ms + Reg1 *
> 128 ms, so a KTD2026 driver runs it with blink periods that are 128 ms
> off. Document it with the KTD2026 as fallback.
>=20
> The ET6326 drives the status LED of the GL.iNet GL-SFT1200 (Opal).
>=20
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-ktd202x-et=
6326-v1-0-eb51eddad08c@telaak.dev?part=3D5

