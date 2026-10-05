Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98FA4A8A3E;
	Mon,  5 Oct 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210401; cv=none; b=J7QQ5mDZeV4U5cxEWn+1ZxEDbVNicEnLorWU8L5kM+RECiVToHcIlwVSP+SkAqCG5g/kNaC+3U3Pqq0cDpZa3SoZ6cuqFre6Zv/FQRIZ6gulyxBcDZemwI4yuYpAxo3q6+bgOrF5W389gSK5lnrtH0LG5j8n2t8haHRDS2URGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210401; c=relaxed/simple;
	bh=QCqNTSayJBbHtuuQP+0J2UmyRAi4QLbPMAfEdnYs4Gg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J4V87Vw1xPGZ3ZlAR2USfjC5NUtWduGkegvWsMxIva/F1PLFq7NZpgyVqClOWc7wpRvIpjdvJGHm0ahqnuShZg5hUBhXQf27j4QDagMJYTxG39dO/GR3QzpJq0+OJiYiaHgS8XUMRAvpqD5YGmnf3lZXs3iMw3wV/UflU0mG+5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C36pKkz7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C36pKkz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A1A1F000FF;
	Mon,  5 Oct 2026 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210390;
	bh=QCqNTSayJBbHtuuQP+0J2UmyRAi4QLbPMAfEdnYs4Gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C36pKkz7jW4I4NDLBPS8GL4FEzA+UWRvJFpWuxEP4hipDgHvnAtq2vh3R/t3LhH2y
	 bFnD9PGi7ylXdNThvMz3sSCbUUIiwgKUQrMFIjh/YtoGsXuDHfr1AVgjnK3/w+Xh0e
	 6uYfnZX3s+TEZjKjng76aW9fRojTx/NjWA0vAOL6kdW1pBIxlXoj/wIGBw+GAX+qzQ
	 JkhonLwtSt+0cUwd2oVbbfN7PrNdTUfUujupmXMOgTbYqVaz2J9zbRi9GQtWM5Evil
	 Eg7eUk12kzSdfKEerserwUhFg4bd/BqD6rpNL5kkFn7VzRGbqWRIY/f3/eHnywCb9n
	 9bgmKuSn0oMrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/11] leds: pca995x: Do not use full on LED mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <4d1a741c5b78fe1dc5bf0d0ac47f3f3a161c335e.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <4d1a741c5b78fe1dc5bf0d0ac47f3f3a161c335e.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:26:29 +0000
Message-Id: <20261005142630.03A1A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> LEDs in full on mode are unaffected by group dimming. Avoid using it,
> so group dimming is applied consistently.
>=20
> This slightly changes the brightness at maximum (from 100% to 255/256
> duty cycle), which should be imperceptible; arguably it is also more
> consistent with the other brightness levels, as it will now scale
> linearly from 0/256 to 255/256 over the whole range.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D10

