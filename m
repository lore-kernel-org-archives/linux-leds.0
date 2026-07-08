Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBFD44D01D;
	Wed,  8 Jul 2026 12:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514260; cv=none; b=sIB7cW3EMf+McuMn3pccrOrrytyMwgabLbugHoRAidQM31heI3nVinDhbte86zvkHTeqWrYcflQ3PeXXZ3+H+jltSyTtoCzyqMve6J8kXNiLmV6s2EEjCF8D5EupfThUfWxETt1xptN/TjaQqJC9+y89Yq4/xfbhgM+vZDmjmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514260; c=relaxed/simple;
	bh=D4V20yvTx7Bt9X5jiU4Rk/UjjvQ8zoTI5A4kW9wqm8g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lGRphevSu/gtMzBfScxINQ9TiLba47VMGWE4tsbKGj23MGxTqcRaOewJRnMH8P3bfnQ3O8lzX2GylZUdwskYj/4zn5oRGsWQfOoFPbTyYr3PHJhjrwuR99c1uuzL4kc6pS4aPovnACVuIWz9g6U2y7Bo6rcZl6yE2+qdHnTZ+mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKGqwLn2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKGqwLn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289401F000E9;
	Wed,  8 Jul 2026 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783514258;
	bh=8fUFQDzaUf36uu7CDdNF60MWQnD0G9Nnv1PIm09s/RI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JKGqwLn2f/56m8y6eAKhEWCzCiLcujvPhOW8iqtGW/ro+U+zcpe3AtaBSqJp9H/aU
	 T24PuOjJBjRVdIuXQo9QQ7+MXUChvLqSni4oQpKrGAs0kEhbKaLXGZHIQ3CT1EQepJ
	 Dhv+z0mZxU5YG2K7cMIrClE5dMWYzEospHINkLs8X+ku10cvBxL80NQBE1MfKjIw77
	 0KKRDiuGssYKAOoMfSqHMwVO3mcpiwYHd01U1iQrN/PDjZELtE4B/6sX63Vjm6vfT4
	 V8dKfxr5J4fQfD+KepmlrHFTZJG7MVfLBE88/QX5caGAjQV3U/mc+cbvxv2QXqvwse
	 lpa2shIiPbB/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: backlight: Convert TPS65217 to DT
 schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708123317.1768641-1-egbostina@gmail.com>
References: <20260708123317.1768641-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 12:37:37 +0000
Message-Id: <20260708123738.289401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Convert the Texas Instruments TPS65217 PMIC bindings to DT schema.
>=20
> During the conversion, the following updates were made:
> - Make the 'backlight' node optional to resolve dtbs_check warnings.
>   Some boards declare a bare TPS65217 node without implementing the
>   backlight configuration.
> - Document the 'isink-en' property in the backlight subnode to resolve
>   dtbs_check warnings. This property is used (am335x-guardian.dts)
>   to manage the backlight current sinks. It was missing from the old
>   txt binding.
> - 'additionalProperties: true' is at the top level because the
>   TPS65217 node is documented across multiple independent schemas
>   matching the same compatible string.
>=20
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708123317.1768=
641-1-egbostina@gmail.com?part=3D1

