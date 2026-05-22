Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679433CF66C
	for <linux-leds@vger.kernel.org>; Fri, 22 May 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446836; cv=none; b=Qk4UldDLaDwylH+/uVgeiibbyluBK4p7OOPXlasBu/pytwgPrvj9mwICukUM3Ycfeg+DXvL0MBvNQ8uetdVLw6kIDtEnJT2g8yiyux87iKZOBWAn44LQpYC6Cn5TdNU9/hnH1Ew3XA86IwZwEzyiMuPNVWpA5ZkIBJJF2cJ5UfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446836; c=relaxed/simple;
	bh=RUSStquhEhuIxHbt6IFzGnVkB87hIATvRDM8sWeOrkY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FuvQ1INVEC5pHQtK8r+3wqv/005RGKBt+MoMVikDKeV7Yw7OZ9iThnZ+kLByFHKWWSofYlA34dk2eCokCXXhUt+lkx6yXV72yTqtmiXo6jlGNpoIPjTIwlpvoETA9TOOHAQ0vGYmTlA+0yOe85StjaPVLshipk3DDfFiBrCYUI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJkjQ2Re; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJkjQ2Re"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so98902465e9.2
        for <linux-leds@vger.kernel.org>; Fri, 22 May 2026 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779446830; x=1780051630; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RUSStquhEhuIxHbt6IFzGnVkB87hIATvRDM8sWeOrkY=;
        b=bJkjQ2Re+XgB+LHPvZVWvVyz10hS0xE0uHT6/n23GaX84eEjqhLowkHniXcm+8Kazd
         3p0Fd47bF4FOdi844eT9FYIpitC+2bXwKtH3IhkXdsxmEFZGnR4HkVJu8Ex34T12X301
         sWs21ChlSHt9xb307Jfd4dJVGWo38SrHK1pbgvIt33prWaw3jFSdGrny11UNqfL032jz
         5ORzVjh14Ozwpu0rLpVgfEuqYLVHWCBH6xGTGkPdhACutObO2708yXMyGymA3k4v/M/8
         nMArV6SWJwtZ0cje3NoQPTpuXyBEfhfMUK69HO+LmhDIegv/w2syzRgIPW3Xs7vULTcb
         Ogrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446830; x=1780051630;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUSStquhEhuIxHbt6IFzGnVkB87hIATvRDM8sWeOrkY=;
        b=WC6OV5XgIICumxHXNya+4zZDZ++UKGm6TJfs39Vm7/CdobyNU8SwPP55QtuYmjhrBX
         mGay35fjOsYON12wqz6d+slgSrrssrmVPW7hqv9BlbpZELqJ8td6dttkk47hCMGWSPAI
         pLoMVIgvDU8VX4WJyUmet56goVoHh81rM0yw+buYI/UqhWUOYLQi0RuhEK/QofepmHZv
         T/6JkY+IQzY23Y4c27Twrl/rLhXBFDFJ82JR646YtdwE2TCdGTl0aP6xbyFZGXdQPXro
         XnfQ57llBubQGV7iKsKHeH/rMoveV3+iNtwGN9Ctm56X/3p13tV+SpEv1NLDAp0jrLf2
         ozdg==
X-Forwarded-Encrypted: i=1; AFNElJ/H74jemctHBCroMEnX8rt1tD9/ET1dxb8yaFtgbdFdFRimimnz3jHQf3rudCkQmJDiPkzodxdK9wt2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+AEhmAKw+CsndcbScH9N2DGn/TAZ9F/4ZIzr5gIT6ScGPjx7
	6AlHS/dQa4z0/Ys81/oLIwvVZIdxWaZyDCDynwdqSk/P0CsOetPWs4Yj
X-Gm-Gg: Acq92OEsAZtmJblHjVBTh6XRHWycBiL/NWqmPm8R/A+nKNXKfC5YhlDdE51rBNhbCQq
	pZDBNvG6RXhSOaVMBrVpU+U3gCIwO4fhqY9M93FkVcbGsoTLbhu4wCN/VvanVrYiVMIJrKSlYum
	Cv3XnJbLrhPOITcTvkBTYzDPkiH74kOSujeVVQabyegC0/yTqGO+mVV61usoirtGoVu8x25nmk3
	rAF9D2G58YvdO1nXdQ3UbbG4RdzeqCGVmP/jWM5NUv+wKwDI2h20mjY36rkX5mWv0qo/kv0uTdY
	jY6YeXZEJ1szaq+RQuIPgRoVfRglb1emAUWBeGqnT5cWh3XxAUDcbx0gCqgt9wzwnW+0yyfRUZH
	vNgO6WP4j0B2nCi8aiGzXs7bm22r9qwogmgFoDlGqE0YnwciPoSTztT28MIU8lfhYjR/em5qNsI
	UmGB/pKQPtrm8msMtwhZiRZhR7n5KbATJFshX5I+W56qFXNISWuOQ8FJtEbxdaYvBu9vd48tJmD
	UQ=
X-Received: by 2002:a05:600c:4f82:b0:490:48e2:5618 with SMTP id 5b1f17b1804b1-49048e257admr3952395e9.22.1779446829809;
        Fri, 22 May 2026 03:47:09 -0700 (PDT)
Received: from giga-mm-11.home (72.92.4.85.dynamic.cust.swisscom.net. [85.4.92.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af029bsm13137805e9.29.2026.05.22.03.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:47:09 -0700 (PDT)
Message-ID: <2a8d1a3c35cf17a4edd202b67be95ab005c61748.camel@gmail.com>
Subject: Re: [PATCH v2] leds: Use named initializers for arrays of
 i2c_device_data
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>, Pavel Machek
	 <pavel@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Lukas Timmermann	
 <linux@timmermann.space>, Jan-Simon Moeller <jansimon.moeller@gmx.de>, Riku
 Voipio <riku.voipio@iki.fi>, Marek =?ISO-8859-1?Q?Beh=FAn?=
 <kabel@kernel.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Jonathan Cameron
 <jic23@kernel.org>, 	linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Fri, 22 May 2026 12:47:08 +0200
In-Reply-To: <20260522104222.4081017-2-u.kleine-koenig@baylibre.com>
References: <20260522104222.4081017-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Uwe,

On Fri, 2026-05-22 at 12:42 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub) =
wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> While touching all these arrays, unify usage of whitespace and commas.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

thanks for the re-spin!

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> Hello,
>=20
> Changes since v1 (available at
> https://lore.kernel.org/linux-leds/20260515163325.471175-2-u.kleine-koeni=
g@baylibre.com):
>=20
> =C2=A0- s/=C2=A0 / / in leds-lp8501.c
> =C2=A0- also convert drivers/leds/leds-as3668.c which I missed due to not
> =C2=A0=C2=A0 having
> =C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-n=
ext.git/commit/?id=3Db24e1049a5a53f0912046a8f4112d2d43dec74e7
> =C2=A0=C2=A0 in my tree.
>=20
> Thanks to Alexander Sverdlin for pointing these out.
>=20
> Best regards
> Uwe
> ---
> =C2=A0drivers/leds/flash/leds-as3645a.c |=C2=A0 2 +-
> =C2=A0drivers/leds/flash/leds-lm3601x.c |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-an30259a.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
2 +-
> =C2=A0drivers/leds/leds-as3668.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-aw200xx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
0 +++++-----
> =C2=A0drivers/leds/leds-bd2802.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-blinkm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-is31fl319x.c=C2=A0=C2=A0=C2=A0 | 22 +++++++++++--=
---------
> =C2=A0drivers/leds/leds-is31fl32xx.c=C2=A0=C2=A0=C2=A0 | 18 +++++++++----=
-----
> =C2=A0drivers/leds/leds-lm3530.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-lm3532.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-lm355x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 6 +++---
> =C2=A0drivers/leds/leds-lm3642.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-lm3692x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-lm3697.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-lp3944.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-lp3952.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-lp50xx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 12 ++++++------
> =C2=A0drivers/leds/leds-lp5521.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-lp5523.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-lp5562.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-lp5569.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-lp8501.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-lp8860.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-lp8864.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 4 ++--
> =C2=A0drivers/leds/leds-pca9532.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 ++++----
> =C2=A0drivers/leds/leds-pca955x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1=
2 ++++++------
> =C2=A0drivers/leds/leds-pca963x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 ++++----
> =C2=A0drivers/leds/leds-pca995x.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 8 ++++----
> =C2=A0drivers/leds/leds-st1202.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/leds-tca6507.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +-
> =C2=A0drivers/leds/leds-tlc591xx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
6 +++---
> =C2=A0drivers/leds/leds-turris-omnia.c=C2=A0 |=C2=A0 2 +-
> =C2=A0drivers/leds/rgb/leds-ktd202x.c=C2=A0=C2=A0 |=C2=A0 6 +++---
> =C2=A034 files changed, 91 insertions(+), 91 deletions(-)

--=20
Alexander Sverdlin.
