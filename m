Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E087C51355B;
	Tue, 13 Oct 2026 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913244; cv=none; b=O1zt7fhDiPtEhG2kD+PLFMP33LO8ye1ifSjioZNT7Vj/DDFdYDffY0qsPg18l/i/Cj3dSKBwhaIa8b3+gENnpX/R0AH4U+/rF/BEVW+00bU3e6THXnq4LT2GogQcj3xhgejYdV/X0z/zF3vS4DniGnIfjSZWIDvAyuNwgAzXHkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913244; c=relaxed/simple;
	bh=BLuuhs0J/04i8Ko5molP/SktbYZrECz4Pfgd+Wg3O/s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=m6rJS/IOVQKMmD1Pb/hhRCzr/oBmdYUpzNYZMJ7ii977BDs9Bjs6HsZc0Edo61vwefk9Ie7J37fdxbvnnPrNGnQlDN80hf+yXM5Xa0uvhUAmnz42DoAzpmReLwAq0/oS3aACIQNWA0WNIdHzMgMedOZ08xZW8YLPJDPHiygCwF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4l5Josv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4l5Josv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849D31F00898;
	Tue, 13 Oct 2026 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791913243;
	bh=BLuuhs0J/04i8Ko5molP/SktbYZrECz4Pfgd+Wg3O/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C4l5JosvPpqjhtPVQKVmJr+NWOzM9ZIVRZH5v3q4zQ7pi/eMt/FV1RCIymzljlfAF
	 3835oKAqPhd2vQfd5eZ5jKgVd4D2SVK54AkL7+AzoXjlTGg/hStbBcXjts7F0LNlce
	 s8DXm2LO2Fo2jnI71Ps6DBuFjjTOrFzOGfCtaxTAG0MYLBcu/d/fc63FEjQKioyYQY
	 GXoZgPZpEIVSfrNhgztvDwnc7ugZRRyMi3wMEkK6wPtzg+OG8yKWK2yufwIub380hJ
	 i7r+VJSHiu1uL5ckqd5oR2OYhXZ/YY0vO3lcvDuUSoqNxh1ZrVL0CnIyjW8T1LQaEv
	 53wwFaI97BctA==
Message-ID: <sashiko-outbox-170242@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 1/7] dt-bindings: embedded-controller: document ASUS
 Transformer EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013173504.451391-2-clamor95@gmail.com>
References: <20261013173504.451391-1-clamor95@gmail.com>
 <20261013173504.451391-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 17:40:43 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document embedded controller used in ASUS Transformer device series.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013173504.4513=
91-1-clamor95@gmail.com?part=3D1

