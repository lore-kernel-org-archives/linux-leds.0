Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518828;
	b=LQIKUkua7WmAEQtovqDGOXzVhkPYe+9g6EBCtte+c1ROnTZteaXqo+TOmxF0JYMfNszy
	 xIpr3yp8bPIMHimbrbORPWm+wxswHZzQmpyn6XJoKJoxY4b9BcdxcXs4uDE4f3v8cM1rj
	 l1SFCC4NK7h12/Ah4CRP+ONrdu5UKV0vg4NJP+mT/gZ19Dhh09BK9p/cWAot/WloWV9r2
	 wKVAo+tVJEImckgrOZ3YAGppM2VfRlT5BO6kfmkxqYggKg7Zz36fkBmTg9fkyWVOCoOmx
	 sqfu7C4kg6GxvGZlRmvrVlLMM70aOCzfA7bhqE01g33ts6sW+sylq+CUlSc0wRTXWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518828;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YN+X2jG1jSo3DIrkw08iKSSuE4WRks9zxuiAYTuV2ys=;
	b=CkpS0brs1y1kuzWnRKUVcai14f+qZnPDJfhRnKy2sOmyWlbz6gx2VMg5rAelvg3bK77O
	 mVsxITiMOoHwsPbWCvXKeAA86XFXVBPhV8/EzUeXKUS4Sp+40KiTwHV/0kEfc5UJeNFIB
	 6kZYtMunVxbr3S65pmxOBSZsvyl/QTc7Zy3H9dSUzYNVfoHdCcxwp8rHjolDhaWiv5WJz
	 z5eVi6aFPjjabQW/0axMjLQ6LVmUH0YTK7936tZuIXAG0jdKLhM26uqDQmbI2PUAytw2M
	 157HpSvepYGogRZNqbmmmgxKdvr06PRtGLgBuCs8Wvg4DxUaHNddjQd/ObCetcaZ8mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kWiJRgSx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F60D606A321
	for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2026 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kWiJRgSx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F4A1F000C4;
	Thu, 12 Nov 2026 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518827;
	bh=YN+X2jG1jSo3DIrkw08iKSSuE4WRks9zxuiAYTuV2ys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kWiJRgSxKbj6EuwUKnSw3b2UNj8a6Y+hs9AATsr9AISaSsY/dAfEYYq3pZDIaNs4n
	 dbi2XV7GKpdqiG13mY3+pLDyDG9P7H1U0d2maR1R0cVUM2FASa66WydVMSJes7pUvA
	 oHgkz01p4BHs+ornE6XGFETAjjcEZ2BpGNAueEyOhfVaCoA8GKeIEiTUdc81HRDqZ9
	 8rQ/v3bLwjDrA0bDJMnz9gl/JMWbbwo31O//rwu1XEPfSzGOQ7rpGbpkzQVgoFuXwI
	 FIApWg4TikiArPED/UCK6oHd0L8Jexg+NZD/ZxEXj+DcL5+2T4eAgjLGxo66cjzhLF
	 OviiP0U+HhMpA==
Message-ID: <sashiko-outbox-211864@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] leds: aw2013: Use dev_err_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261112-aw2013-aw20xx-rename-v5-3-b2c5e323a90a@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
 <20261112-aw2013-aw20xx-rename-v5-3-b2c5e323a90a@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 21:27:07 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Paul Sajna <sajattack@postmarketos.org>
>=20
> Failure to use dev_err_probe() for regulator requests violates
> LED subsystem guidelines. (At least according to sashiko [1])
>=20
> The original driver didn't use it, but it's worth cleaning up
> while I'm here.
>=20
> [1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts=
/kernel/subsystem/leds.md?plain=3D1#L71
>=20
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-aw2013-aw2=
0xx-rename-v5-0-b2c5e323a90a@postmarketos.org?part=3D3

