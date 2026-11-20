Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210516;
	b=iUxtFJFHbBvYDnnC8ijUFjQV2hhTbHyl/V3cACkmQ/tHVk8m0VWZ1kl7vVkQiMZ9B7bS
	 H73PFDXaylpctOF0ZZ6HDgsbvzOWzrspQnIR4TCUPyGAnfgJ0b4NIIqbpSwU5DlVhJh3O
	 my3d4pGur0fbzIIYAKr3QIkSG+kEHsCaiHrqqWL35qECeEBim/qe3wm706JA5U0dEgYP7
	 Kf1cuDjGSoxKVcrfT6mpKqZ1NKZ3Tdb8e5Aw2Q9bd4tSukyLhyddwxOU0qTsMecoXOq69
	 2XPjPNXpHpwA4B5g0g5WwAPGScP+S5b96YeBdST/M6x2WEEreM6hE75iDTfEtw3usyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210516;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WhjaaITthH56uA3HApMbeBb8Xw8M4fDBfb5zJqhIzY8=;
	b=t2S500Cf8nDinP9dElU4hr97rU+b3ROxkaXTY01hlVOhbhPO/ToWZi5H8Sac87t4cabR
	 IzMA1QQS394eR8zMptn1cLbt34yDwN9gfifSiu643qsG5wYq4C3YcqDxOv8BWK72YlPMq
	 I3jEmmhUVhSIt0ml+69SKbYvsTGf5Y7q7Zb/Y/O2Wp0PHUSCMstPVb7UfJfS8RwRJmwVj
	 lzsLu9tbxaS8QqDKfbJwURxxfX3Ryn+3fj9icTlieGeiu3DnCGBQbCQWBjJJ/5gIfyGCI
	 HEvftu700kync0f3Cl3WJg101GGzoMBWFENLHtnk2N4ip17QZV+bsEnpmghkr48NjdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="li/kYhW7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BD5606A6BD
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=li/kYhW7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099781F000CA;
	Fri, 20 Nov 2026 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795210516;
	bh=WhjaaITthH56uA3HApMbeBb8Xw8M4fDBfb5zJqhIzY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=li/kYhW7wR0YUKtOIsOHVtawVCouWdm4WQl5sCqOGOtrNCxB13AGL7YC5nUgmiu4f
	 aSbEtXCCParwPcUqBO+gDOEFPiVxSevLi4pvKyrifqOaF2vOev85Pzk0T9BQdhMlXg
	 NEfI8MlmLpbjP5uzd25btYqTg/tcweL5Rx6+eHc89XiECZ9/mdpVxqXWyY3tVfoacu
	 U8YMlY099uYLoBFDBq5sKRwyALbzrosYnxP4IWPnU9E080cX7n+erJ39Pf4E4Ih3Qb
	 V2kL0pbF8prgcGvlrmZskMclZVn9brLCWKWVRZpSpY1Y4xxqtjUT43U6XhyBlQ++st
	 1VHJuSTaSrt7w==
Message-ID: <sashiko-outbox-226197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] leds: class: Create "brightness_hw_changed"
 attribute atomically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120212431.152081-5-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <20261120212431.152081-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:35:15 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] leds: class: missing Fixes trailer for brightness_hw_changed
  uevent race
--

commit 93e8b2d739d4002596403653f8175bd4272f5a44
Author: Armin Wolf <W_Armin@gmx.de>

> leds: class: Create "brightness_hw_changed" attribute atomically
>
> Using device_create_file() might cause userspace applications
> listening for uevents to inspect a new LED device before the kernel
> has registered all sysfs attributes for it. This might cause those
> applications to incorrectly assume that the new LED device does not
> support the "brightness_hw_changed" attribute.
>
> Fix this by letting the device core create the sysfs attribute before
> the uevent is being send to userspace.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

[Severity: Low]
This fixes the uevent race when creating the brightness_hw_changed
attribute.  Should this include:

  Fixes: 0cb8eb30d425 ("leds: class: Add new optional brightness_hw_changed=
 attribute")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120212431.1520=
81-1-W_Armin@gmx.de?part=3D4
