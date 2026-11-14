Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679660;
	b=hOOMfj3j3SNccy8Uhbtr/Hl9awOBE+wMSW4fZDPYE/1gTn0XJiE1QTG6cZQ7V+JqpD7q
	 6UJtecPUgaLJw/8+LlQ0TLqi1qOgjqzuBLsKKDzT0R0u9oVAFBJ7JtqnVCjvy1O22NCpF
	 hE1AJXRxdIB4NppWVLSaeit21wk/MyBxCLpymVeLO5kS/a2TI6LIfXss/1ALTo+3zk3JW
	 5N3j+Ekt/PDMqqEZ+qkTp0BuBXYIgdCKpPCxLbtAEr17Qb6HHRDaD26vJNZPCEUPxMMCs
	 bWajAOzseyhRFqNM+P0gJG1yPj0Y6pQvx9HoFy5rUnTNkmE5Rk/G3vYxQ9lig5QJlSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679660;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z61HMGkDIPYSPVhkhwlebGI/fV4vghyQjvclxu6F9p4=;
	b=urlpl0/0JGRL3j68cEAN2ID42BSqikLvXYwkgKflZ+ZNNCzPzXseVBQ/VebUtyHwrl7z
	 p2HIL2ddTYjaaakzQJzWnLPaM6tpwqNLqSll+8rcsglTEdwScc+JHyZJP8aAyR2KtMLsf
	 6/c2+XXBQRb/VHI5Ums1ox1gUooNGwmXTbv4J1zaSXWN64UNsLPTH+njiLJPRbSX5KKOm
	 frMcEdIBbl6u4XUrGxW9B1B9iDWKQgy8CwA6WpLiGS4VtNl95+YD9k+VcdQsaxInfy3aO
	 zM2E4MYB9Z1LWZNPIRNs/mUG20Bxif+T7+/np1H1JfYnUUCIYAgGWmHCPGT5SCp/XBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MiwW4c90;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1766A606A332
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MiwW4c90
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850C91F000C4;
	Sat, 14 Nov 2026 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794679659;
	bh=z61HMGkDIPYSPVhkhwlebGI/fV4vghyQjvclxu6F9p4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MiwW4c90RsJQqnszaarr4iagBZ8qVK9ORgqHGlwYKPWp6+fKYaU54noofvZmoTjRq
	 25XTWISc25nAr7cQmoGRhI0uE1Nm1p+063crTixK9qnEQyS8sBNFKSz/sicns9CnQX
	 z+GjGmwURjdydiOLZqLgB7kgw79TP8kMiMigasbuqranBtAsjb43a9DqUywUGtM7Ta
	 xRLJGfBVjywYOugePk/fLbceusAB2vz8bFNRySRjoBeHfiM9dZ2afJGwjfh+ob3cbT
	 EXLj3T8t/jWf4IiT7mnC9OAj7UwQdFYte8Zfi4sEr4ox3N08vin6lNY1jY/5zH4DxR
	 LSfmKdSkVWndA==
Message-ID: <sashiko-outbox-214870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] platform/x86: thinkpad_acpi: Skip LED
 suspend/resume on auto-mode machines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114174814.62153-6-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-6-kmatzkaczor244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 18:07:39 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> On machines whose EC supports the auto mode (MLCG bit 20) the firmware
> takes care of the keyboard backlight across suspend by itself: on a
> ThinkPad X1 Carbon Gen 14 it turns the backlight off on suspend and
> restores the previous level on resume for the manual levels, and keeps
> auto mode across suspend; after hibernation from auto mode the
> backlight comes back off.
>=20
> Skip led_classdev_suspend() and led_classdev_resume() entirely on those
> machines: the LED core no longer enters the suspended state, which also
> removes the window in which userspace writes and pending
> set_brightness work would race against a suspended LED.
>=20
> Machines without auto-mode support keep the existing behavior.
>=20
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114174814.6215=
3-1-kmatzkaczor244@gmail.com?part=3D5

