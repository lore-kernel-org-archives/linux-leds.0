Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9A84657C6
	for <linux-leds@vger.kernel.org>; Mon, 17 Aug 2026 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786986939; cv=none; b=QJDHbgpDtIPM7MXsmsLQVd4YIPu7AHdR++dTiADh1ceK0cfVOYtgB00SHEV3/yS7ZrK6mrG9qhJqXI2Qpd2T1fHarO9Y86/+NWSnPhkMdWNrtRAAwmAAzfM9xrmvmJ5Jnk2CN7qkQyHOVoPkxRhxnNYD8hgIhNFU7+8ljWv0PJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786986939; c=relaxed/simple;
	bh=vqpl9F2i8d57XZXPuTpGkt/yJ+MUgRhR3pJM+vtCdo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kErJwm5pWsTCozDWZrC3CivEAx68iOVNPhF/lztC/Q0oqBXyVRMRaM3/TGwbiLE9KfUlvltkDAHt1qL10349uG5iv6cb97A6ZQOHKukh4lM0cT+cZ16HlmwFRRmVMdD5pgMpxr3UqjVgB/N+jLxvJjiLgn982ePPMyubw9RUtEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwMoC0+K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwMoC0+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF111F000E9;
	Mon, 17 Aug 2026 17:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786986938;
	bh=vqpl9F2i8d57XZXPuTpGkt/yJ+MUgRhR3pJM+vtCdo8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MwMoC0+Kglq9E9f+00Xg4gxv5nPnA177Xmw8/KzEXMiTtOgzJJ+n0hsD2N+EakHsU
	 UrdIgnmkYl2HkcqFUI5LpbwMlGEWC3BaYEPmRoiJLE8y2n1KmVmY7HTGSm3Aksfl8t
	 RQ76ks4TTzgugYTSnQ6/JYvBupRl9XuDWVV45mDKcz3/zypb1WjNnCLIs8mHcDvrfO
	 OPR3RPeIgitG9mZWLK8iqzAZCi+1I9vkfjzLE/0dfDnF0PW8jrTrw7CEouCHwdrkFP
	 CQ+TPjb2NadFymas/iUddtrhTDXXdXqCFXbwaQXJuIBspkVQV8RZ1YvIVZLNhxUlsO
	 14aFNSAxRVKOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] leds: lp8864: Register a backlight device
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org, lee@kernel.org
In-Reply-To: <20260817170817.1933046-3-alexander.sverdlin@siemens.com>
References: <20260817170817.1933046-1-alexander.sverdlin@siemens.com>
 <20260817170817.1933046-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 17:15:37 +0000
Message-Id: <20260817171538.0FF111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> The LP8864/LP8866 is a display-cluster LED backlight driver. Expose a
> standard backlight class interface in addition to the LED class device,
> so it can be used by display/panel stacks that expect a backlight.
>=20
> Use the new devm_led_backlight_register() helper, which spawns a
> led-backlight device driven by our LED and tied to the I2C device
> lifetime. This keeps the driver a plain LED driver, requires no
> device-tree changes and remains backwards compatible with existing DTs.
> It is a no-op when the led-backlight support is not enabled.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817170817.1933=
046-1-alexander.sverdlin@siemens.com?part=3D2

