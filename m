Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208405;
	b=rPOeWUJC2aRuA42iuP0gc8VCm1njXAFEdzJwIK3mfv59ywPw95wAOABwPnteoThMM4QD
	 AajbemepBI2Aw3yydougpJqLa/yfg59Ic03S82dlMbUC/Z8lYE3HHA9/RWEEwEB2wXYTA
	 V3djnU2zGNtMUHo9fz2C0SFLcdVYnBXWGVuZ3GF8NTgpAABiMHAGuYI69i1G9Bk7qvzPz
	 RynsdmHbeLyhpfH3a/78nPkY64S97HgHaguAr/7c6gLfKZyba0/KobW/SoTl+wILsd8Sn
	 evPR1QJQFk72NAoV7Nd51BOEhABqqO1mesUP6joaqgxfVEbjZgJs6wIr/rvKNOZpuog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208405;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u7m3P3JQ1d9OAdkrANUem++xXkW+Yz3A3qGhHWSIoRI=;
	b=hST5lKWdW4qVPu442XR/QTZRvQmeKwx85ZrjFTW7mShVy5Ih1mbCOjFzA0QxUUe9bjtB
	 vJXfXrwKEnJhVHFN9CBhvli52ek7iKTxA9pCSA+S32vb6kjxkyNAnR3lAhklQTt5q6T+M
	 /Zh7Yr7kuf4FfKMMz5WBTTd11ZW0Edbb0pEcQ1Cjs5hPWY1QHqXp2K+cWgKMiduB3MQOZ
	 l+jM3NVaFFgqglbIMd5AVIeLoePgXaR+EvY9yL6ZPKiOJcRZijn6E+uF2PvugKKaI/6hg
	 ffCPMGhiy/L0z+Z82c3CsRoxiakJYOvR2waKVObyZJhazuiFmfWhJuKp5WuqicmJjsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MEcu0/Vy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DED606A6A9
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEcu0/Vy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067DA1F000C6;
	Fri, 20 Nov 2026 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795208405;
	bh=u7m3P3JQ1d9OAdkrANUem++xXkW+Yz3A3qGhHWSIoRI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MEcu0/VyJ0SVwxr1ojHqA8ZwNlzDd4bi3IveN4DW4RiZmj5buti2/1jYPmJDLZxmg
	 c2kDAN+TAL6UJw3En3fiQ4XKJAovrPJn6db4gNedMzZvE6utrYgYA75lyQNVd2xOzt
	 Li3c73n7Ei8XssKW7FRq8P8o8ZlJlJ1MqUE1/G3T2wfmFTiqzpFSIw5jJdIisT0Y9L
	 nBDfyAbO8+nwYTPDHZISdUMs/81UVmdPI9rJO5tqySCge3OCjkYkZMrpOUtoybgQ6t
	 kcjCkGWJcv1kmoWB7VgLXPgUkfHT5ahmRTEB/9UStaC7ZI0aWfO7qcuI/QwGHhop8d
	 i+cPAeRu+/Kpg==
Message-ID: <sashiko-outbox-226116@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/10] leds: class: Create "brightness_hw_changed"
 attribute atomically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120204246.6645-5-W_Armin@gmx.de>
References: <20261120204246.6645-1-W_Armin@gmx.de>
 <20261120204246.6645-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:00:04 +0000
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
  creation
--

commit 613d5c59b551c09481768d315756232edb71f290
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
This fixes a uevent race introduced with brightness_hw_changed.  Should
this include a Fixes tag?

  Fixes: 0cb8eb30d425 ("leds: class: Add new optional brightness_hw_changed=
 attribute")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120204246.6645=
-1-W_Armin@gmx.de?part=3D4
