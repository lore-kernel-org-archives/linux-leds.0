Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251457;
	b=cOJK71AT1QmmLGcY+iddDXXe5m0SgQLVROxuclqLPnPAfB6V3GH2RMoo1PzjhJSzWAVQ
	 m7XmLpH6xNgxA5+Xlg1pv8FY7cHgbZP1m4CJh7t0v7JE8+eBgx5W/axPJfAuPp3Imc5rg
	 ws0lPM1bjAAMYxvZ0Dq6nE9+irNhUlc9LSrSnRgV+vJe0NOvEhr+NMyN0CLCDzkKE18+n
	 kkfUPtS/tFG2jF5jBSVJujHiuPBnyVFMSIgG9wbZ1GvZTz4ArPR/egPwzN3/xr3SqvwZC
	 ZFh9+T99quWAwThE1oyVbVvG+Us0W/vd/a/x0PaYcBfHRWx7aJmtYdwVpfjJn8889LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251457;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=goiYw7EGsa9cgCdYZ+8ASRGIzaU4ouT2wRU98HvGwcY=;
	b=5Uo6tycNR6ipjoYvh6HJhmRDBkYDWDEkZNeeztMHEfVpVHJgYCXSfXQ59BsDfXlQAGRn
	 zoGs8HVDgKLuEvXsTCK8dX7F3h11wwwvotSZNQLqNDYjtC7qGVdpMV04FzELfSDpdawT6
	 QBDdhHMiczVkz3O27vWYp6lWzotteXcxZiKi22JeXfzQ9Xp2mdVSKQGy6rCgH6/wCsIet
	 al6qqGFLkD7lQSp5wIxeaBBZEa4WclK7N8FtTu8q2Ik3Wa3FUDZ1rWpomAB2VEibuDRmC
	 1DP5z0IMpzycmkxrpwlHjCtjbUZdRDEA9AVD1xMJ+ZhowadMbaRTHvu7HIEtbNUZAxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YZjwUJ/0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20669606A31C
	for <linux-leds@vger.kernel.org>; Mon,  9 Nov 2026 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YZjwUJ/0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB561F0089F;
	Mon,  9 Nov 2026 19:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251456;
	bh=goiYw7EGsa9cgCdYZ+8ASRGIzaU4ouT2wRU98HvGwcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YZjwUJ/0vgW7w1st3nezyHpJDNB6ORa1vgKeax70bqMrejvMFA1m+pFHZoe7Sq+r9
	 HZXObc7bLZH6J7nL1hovM/xqA9QvXlm4kPvCCFZmASLwLeDGB6N9nqtVZH0OjiY0OE
	 rW+QA1m9idbg23W4QaWcpiHLgqNb1nENh28BwqHaPn7fQ1JM7lfA6IYts1QTNmHdno
	 /FBBxZffsGrBVZ8Z2fPWDMrh3STBRusaPqXr2A+bSl7L6ECw5kBwmyg8WrEIlq+5oC
	 9NuJfxLxQal2vbn9lGrYEawbKzHgVLE1EjMHSceBgg0T8S8Gu2aY71XyV7ke1TU1hi
	 HL+DOLdVxDpsg==
Message-ID: <sashiko-outbox-205464@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/11] leds: rgb: ktd202x: Fix an out-of-bounds read
 with unused channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-ktd202x-et6326-v2-2-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
 <20261109-ktd202x-et6326-v2-2-56e97c226658@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 19:10:56 +0000
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
> The LED array is allocated for the number of child nodes, but
> ktd202x_chip_in_use() walks it up to num_leds, the number of channels of
> the chip. With fewer LEDs in the device tree than channels, for example
> two LEDs on a KTD2026, it reads past the end of the allocation and the
> __counted_by() annotation hides that from the bounds checkers.
>=20
> Allocate one entry per channel.
>=20
> Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-ktd202x-et=
6326-v2-0-56e97c226658@telaak.dev?part=3D2

