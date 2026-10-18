Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC54C6527
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331932; cv=none; b=jAJJ36WOUGW+yGzB10pSKjf7eoXsDOAwst+92FzMRrk+kUl937Jy7kVDX6AcyWP6qWLKEIN/q+KTqmsuXmxLFeBL3+ERVbtZtWKYPSCnxIMUU87w5yaz1KJoIar85iiFGXXb+k3/8I/55lM0v/5pS+ZXilfJZqVbGApGf8vLygM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331932; c=relaxed/simple;
	bh=Yenw6tYQKdK5RnnMydeqOWotlUcY6KBrIAIIu77ksc0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mY6Mgh8gaKaJJ3/HsXhDSVzFyU5URAP9lMDOAx0MNqfQlf7g8Balbpkli3zypu/4ala4BjUU4esrMcCZLrR2cFQjA46MP3+EUiGIZkNnqBnslIaihoimpdwVMkPC4R9hMYXNA/gwLL0Tr/95OnHxy36u8GA/j4QOYZjWMjqyAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eulXjzJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eulXjzJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF251F000C4;
	Sun, 18 Oct 2026 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792331931;
	bh=Yenw6tYQKdK5RnnMydeqOWotlUcY6KBrIAIIu77ksc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eulXjzJnNMPgn8PH7PL+FuRz53VlYk85xKDTC4an8W7MyTKsFzKt+frh0qXdT8ISH
	 Hxa6LAXQvCakpSvPxBxmEhTMwM2ku7bZc6werPPn5FtLV5pJNjtvXeIDy5e9789UVu
	 ni+3rhbFaqYr1ffYDwtEJhSIzof8zRG6GN9ffOTV1r4mOwZ6c6NKTXkfyB6uohw9Mv
	 jNtczAr0XOjpAjQZhOhDpCzwuSLGhUFdp2UQ0i1x0qSOIedi3CwuiSnWPs1bzYPEXk
	 SNzBdT3wh6aWb40tBECDUara/Sei6fCHeOsDINFWWG4sDjDkJNBXTv6ycZOhNOTbx2
	 7gfhe2vYvRkkA==
Message-ID: <sashiko-outbox-176173@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/10] leds: class: Fix race condition when creating the
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-6-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-6-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 13:58:51 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Userspace applications can access the sysfs attributes as soon as
> device_create_with_groups() has returned. Two of those sysfs
> attributes ("brightness_hw_changed" and "max_brightness") access
> fields that are not properly initialized at this point, with only
> "max_brightness" guarding against this by taking the LED access lock.
>=20
> Fix the race conditon affecting "brightness_hw_changed" by creating
> the device after the associated fields have been properly initialized.
> This also allows us to drop the LED access lock inside
> max_brightness_show(), as the maximum brightness does not change after
> initialization.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D5

