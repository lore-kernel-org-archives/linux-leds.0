Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA640BCC8;
	Wed, 30 Sep 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753096; cv=none; b=ZxfUG01k1Wu8OFY3SQgQmT0b2MHrtiXXtgUebr1DrvAlcupd9nqH+LWju6KJvEwx5FJc/tRIuMxWVcvjz6tZZPG8TdSIqG1XLdNo1dbnty0lxn+coTUVmIkUo4tLbtIBoeIj9J1npxqrxZbsmplQKQmnT/xHZ6xD1S0iFmKnSAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753096; c=relaxed/simple;
	bh=UxqKvO5DnZdyyjeJVh5WYwYUZx3ftUy3b2K0Z/lgCG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IXYH+gQ1KTWnqY+34pczTMITkNHpHGwvOnZRc+id6A50FanGOO8bctVhuYg7hikZR83mE2Evic1/GK3/hwiRd6fcy8jxD7e7Kljtb0GcsXpkr3/uGBr8gDc//LGEwmSI0W8+ScnYwwLR7gYKnt6PIDdiP+j7J+R+XAqS8SRQefc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crivVVAn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crivVVAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4961F000FF;
	Wed, 30 Sep 2026 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790753095;
	bh=UxqKvO5DnZdyyjeJVh5WYwYUZx3ftUy3b2K0Z/lgCG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crivVVAnfZih2ZuZ+rHoEwOX/NZWJs25YbDEGgkbIbFVMd3CeGQFY5J5+mvDthNhn
	 JzwAvUHwvLsR0B+ANRllsT7t8Lur4oTr6P2/HIFnHJF7xIgdjlRKqvUaqgfEHk0evh
	 DPDYcKPDHn1VkyQep8nbAYRtVwKoYeYzQG8bXmvkfecvnuqQqewNwcz9P7bl9vxQUy
	 tRP9Zj9wZO9D3Q5I7yeG/oOOIkQBPeZit95VbuD5syZD5lcVmmveb68L79YKzlnKER
	 qD8SjMrbAAARW54RonzPiDLTK1LpwMGNdd+h7FvoyDsVF7VFxQddi3lnLJQQ9ZKx+T
	 4nV4h/zG25aSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] mfd: aat2870: Add support for VIN and IN-LDO
 power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260930071513.54697-4-clamor95@gmail.com>
References: <20260930071513.54697-1-clamor95@gmail.com>
 <20260930071513.54697-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:24:54 +0000
Message-Id: <20260930072455.3B4961F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The AAT2870 supports a dedicated main power supply input alongside parent
> power supply for its internal regulators.
>=20
> Add support for retrieving and managing these supply regulators
> (vin-supply and in-ldo-supply) using the regulator framework to ensure
> proper power supply dependencies and power-up sequencing.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930071513.5469=
7-1-clamor95@gmail.com?part=3D3

