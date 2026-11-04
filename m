Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802461;
	b=Zyex5TcyuoLqd9+H0vnAr1/UNqeHYqaIzEiqC40rmVfPdhICA5ynkV7ueyPblQKsGt/c
	 ymwBEUD6m6/N34VanMsT1ZSmO38wLWImEzA+8CI25ym/2nouXvbo5jK6VWVOKiHjSdxQe
	 Cb+VdVooVf5E0/jwB9NL959qaRppLflNaQBBnRIFwePb8fWWTV0o/PeB1GE+fruYe2jgl
	 450IfjRKYgfT6kEFeY01F3EILxlnD7dUQAh5YIzvUwB1dlsLxBViZzNrz0Ur7RP2MLX5w
	 AVHoXYAMvlsZoYSAwA+Y5ss6Pqrs33G3XS7MY+YrqABAGa3mWMkv1Ec5MTiCDHZGdzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802461;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cXiBud0dLhDLTobPI+Dly29HliIME46AtHaVlL/GVlc=;
	b=rVmF5cUMY8uUiAc3QX+39xYTqs/XOdCMruZ/v4TACk164cPkZz/7XsVR1fJeZwLXzoKg
	 AeEc+nfqrkkttRPthfEwkEz+oAQ3AWBr5wEbcR8PFEQ9KpSZKom01MK/XxS4AUfaEk5eQ
	 JNR9PUAGq/M2lA0Fyd+8Ato6qBmdaJ/+2Q8RJWEahb1ARxhVC+Pqbd03qSfbto/hHgVXn
	 5UUSBNFU5Kj2CkbyZn6rUHVKQ6N8FsZObSV6iIUNpc2ciTkhzMyJxhsOr14U16ywAKyTr
	 oDEZUeWDLaMK51LZQHomNimkRrqwJwHf8e6i/Wv8ob7ZgafK11FXAKjgwdIQz4RhO/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icHUyR3c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217CD606A326
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 14:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=icHUyR3c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A911F00A1B;
	Wed,  4 Nov 2026 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802461;
	bh=cXiBud0dLhDLTobPI+Dly29HliIME46AtHaVlL/GVlc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=icHUyR3co9HcBIL6mDqscujCRbH9BmG93yqDhPWHqiKE+ZwI6HdqT+wWcE/R3xhFm
	 o5Dv82Tc06OeYcszYOUsmRdbKxWVTXHl1AcJw90yhW59IqJAx+duCUFM4u+ybKLd4E
	 Nfpdi4X8WkT2PRZHK0m38yvxd6xpgW74FBJq7fMzXsaMRmdwxAhGHMcPQsG6jcN3Qj
	 otu/i8+07twJaxK/umCvKIjd7cxh2FY60pL07z+A/MauYWls7Wvlchy2auxAXZ3elx
	 cyy2164tt5lX8MGSdw8Ps9m416JPotxn954iCzyZo5/hQMZlovFCPptWnEjqDvjqg7
	 k96e2OlZ5rdEQ==
Message-ID: <sashiko-outbox-197430@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: asus-aura-scsi: add CONFIG_SCSI_DH dependency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261104142415.676757-1-arnd@kernel.org>
References: <20261104142415.676757-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 14:27:40 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: asus-aura-scsi: commit subject description is not capitalized
--

commit e05e6430efbaa79461253555061a0b258c6afe65
Author: Arnd Bergmann <arnd@arndb.de>

leds: asus-aura-scsi: add CONFIG_SCSI_DH dependency

This commit adds a Kconfig dependency on SCSI_DH to LEDS_ASUS_AURA_SCSI in
drivers/leds/rgb/Kconfig so the driver does not fail to link when
scsi_register_device_handler is unavailable.

>     leds: asus-aura-scsi: add CONFIG_SCSI_DH dependency
>    =20
>     Without the device handler support, the driver fails to link:
>    =20
>     ERROR: modpost: drivers/leds/rgb/leds-asus-aura-scsi.ko: symbol 'scsi=
_register_device_handler' undefined!
>    =20
>     Add a Kconfig dependency to only show the symbol if it can
>     be enabled.
>    =20
>     Fixes: 6173959c7d4d ("leds: asus-aura-scsi: Add ASUS Aura RGB LED dri=
ver for ROG NVMe enclosures")
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[Severity: Low]
This isn't a bug, but in the commit subject for this LEDS_ASUS_AURA_SCSI
change in drivers/leds/rgb/Kconfig, should the description after the
"leds: asus-aura-scsi: " prefix start with a capital letter to match the LED
subsystem convention (i.e., "leds: asus-aura-scsi: Add CONFIG_SCSI_DH
dependency")?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104142415.6767=
57-1-arnd@kernel.org?part=3D1
