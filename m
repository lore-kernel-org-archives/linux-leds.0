Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679790;
	b=D64IbBZ+Izj30K4mSt4BHpuGlbBrF+v+HZCqT0ZB1Os7MhHBLBvmXEW6VPVBnW89OsW3
	 4ZUh49kTEFWQQv3Sa02ns+zqwQakhTi3WId5WMHZ+kQyBOS5vE76EBiwVzFv+d9qtl8hI
	 Gi/yM5mst0FKJbjlY+QWwIt/o12IvGMi8WTN0CU1yXQzVl+Vf5hJ4Wq3OtLMal2QyeeT9
	 AG3pNv4xEpr4MzBqz9Yq6Orn0JmMPOQmWV7TvaIUQLhQopccpu+MYHmgWBc2vGQDOoXuH
	 yHigCj7h4gLkXE9XRudQSdGTl2LRfuTTD8i84SyZnQQzYIdZeIsGf6Irm23WPoyrGBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679790;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nptv42gbz5QnG1oLlQ3R3ryOd8cN++aMB3IhbPJB3+Q=;
	b=eMe62fGXkvSZG1/4wiJvhGJpDGxuYd0JcdV1aOadZG1TbyMDYllysGfk19hYwVSNl18T
	 jdd5QPIyXOLK/p/tCUY3rudCDtUwYJjDRj1EZEgt33uHT6LEhY4jJU+c17EczH33To22e
	 HZ5PTLpQK3/8oljLIjvd2wu5EWejyuwprUPhkPSnqES2JGETx8BhdNhAksvx97hnZdreZ
	 v+5JfqEwJ0BYvP/xpSGtJX1mOY/1iBBElEc9EDoPkyZX45ghP5UttBVKdc1XBV+Mj9tJY
	 0oA0mOhQ3Ht2PbI+2j/un1Z52Fz/CvezfYx3HTJHP5IIdOUyOOA3sehDGP53WVNVXvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEX3sIvg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DEC606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEX3sIvg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB5A1F000C5;
	Sat, 14 Nov 2026 18:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794679790;
	bh=nptv42gbz5QnG1oLlQ3R3ryOd8cN++aMB3IhbPJB3+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEX3sIvg39S6ZEEmK3VNcjUSqwSMcj0DsZLhWgLtnrQWDCBmmP9StadnCojOQFMMZ
	 XVUo2/Vo31G5ej6MYBEoUs9ONt3YQOCIuEQqzhLX3UVbTVTRa7aGlWpgh4YgRWJ/qF
	 mCpmedsKUIKJhGVqPcH48GAiw2/oZRmAx+LPymPFOpWZ9sNa87A2xTdwqdvpoV4NjJ
	 dYKhI6YltLMvd9KE7IjWnSsqv+mgPCdXDXIwt299yHD8PZ44IITUaddYPcIiTQNyOM
	 36X8v/OgGw5q3h/WOspMGtiuNcbCQkEGqda9OClzwYj+Rf0UGS3Haevv99PyVX/a6Y
	 rVLOENFRkFxkg==
Message-ID: <sashiko-outbox-214879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/7] platform/x86: thinkpad_acpi: Report auto
 keyboard backlight mode as off
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114174814.62153-2-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-2-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:09:49 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The EC keyboard backlight level 3, which selects the auto mode, is
> passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
> then reports a brightness of 3 with max_brightness 2, both through the
> brightness sysfs attribute and through brightness_hw_changed
> notifications.
>=20
> This is not only cosmetic: UPower 1.91.x treats the out-of-range value as
> invalid and stops watching brightness_hw_changed altogether, so the deskt=
op
> stops following the Fn+Space hotkey once auto mode has been entered.
>=20
> The auto mode is not a brightness level.  Map it to 0, the value it is
> reported as most of the time anyway, in line with what ideapad-laptop
> already does for its auto mode.
>=20
> Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
> Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
> Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=3DkDSew7XtNJCSvyPiXPJ5faWd=
mCr5RGYFhpunCA@mail.gmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114174814.6215=
3-1-kmatzkaczor244@gmail.com?part=3D1

