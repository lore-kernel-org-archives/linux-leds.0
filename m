Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D930375F96;
	Tue,  4 Aug 2026 20:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785876660; cv=none; b=oe99v5AkM/oie42p2lfJwoaoe+bQOLZXvTJHUxkIsY0YNU+Ob0kqE6DDnm0rEEOoYGnkQwltvV0CQ6szkWiQaEIxee1ckA971CN5TrRs8JSjsBH0P7eQfgL69U1BoO21AIG6tqbpy4XrVQaMuXYAkv10Qr1C2gOe4Xued/IHoN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785876660; c=relaxed/simple;
	bh=DAmmWfTZBOO1zFZ3d4sVcKAC79TtYzFNsoLcL4WgCP4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XVY7mluqupTYyBbjGPpNb3zkI99INSahKZ1HE/kNLXP+ZsVZqHGzpsfcEsS31Lkn082dVvzb44Ei2y1lsyhqW7m/u5ROWKpPtXPyFwVGUoipMHteTvqpCEhGPnVuxLXNYSJdd0k/bPLGMXZgOMFu3HHyBdf3y3TkeUFCY16XT1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMdoOJFV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMdoOJFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A071F000E9;
	Tue,  4 Aug 2026 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785876654;
	bh=DAmmWfTZBOO1zFZ3d4sVcKAC79TtYzFNsoLcL4WgCP4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DMdoOJFV0It/pTF7tcKQWwU4svEIV1ZhW+tUzZ7XVzf33N/A/hfpIpwQJX5QpOYD2
	 9wOUCCDV1kQHMXEF4iBIOgjXlrSbqXLCP/KWUa8HVzhOX/0G4NwzvPxZ0wFAlPP76D
	 cpDevxPLiMnNC1dSA54chsC0C65SUty8wRFzsC9NlQ7iyaZjZnVIutzZmVDLmU7Jc2
	 PM7BMlIipLrM2DCXXa/FZLh6kzfdzsiJj+Pe3A0oczZP7WYIVT0ySnBzBphN/R5dzb
	 w7CmW/IknNwb8CSoLcTJQ+xPqiirSqL26vpIpWzvfmUGhlhwGFezL+84vfpTrJD+3l
	 jPIj4xHaxs7+g==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next v2 1/6] dt-bindings: leds: Add IS32FL3207
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260803205011.1249-2-ahmadexp@gmail.com>
References: <20260803205011.1249-1-ahmadexp@gmail.com>
 <20260803205011.1249-2-ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 20:50:53 +0000
Message-Id: <20260804205054.34A071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The IS32FL3207 is an 18-channel constant-current LED controller
> with per-output PWM and current scaling.
>=20
> Describe I2C addressing, power and shutdown controls, RISET, and
> individual or multicolor output groupings. Require board current limits
> for each output.
>=20
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803205011.1249=
-1-ahmadexp@gmail.com?part=3D1

