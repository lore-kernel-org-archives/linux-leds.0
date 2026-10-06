Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D635AC0E
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270198; cv=none; b=lFYNvVIq6twQPBsYbALYr8zpWCoo7Ij/3X0Z7h2ATUJ6d4dSY6VdvnOAPb1AzKLul7ywOzxcUO/W/Zr6cZWX24mm3v6nDEV5jJa1EiT+DwXOlfuZ8Yb3ef7dc4M0J1AHph+IEo2N/pKm5HTVPO0HsDP60NbuRdS2kve9oJiz/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270198; c=relaxed/simple;
	bh=+76CRSN0ZNdz/FXmq600+mN8O9/xA5Al8iLzygV7phk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JpRcQ/Cxb3wb0yVL8Q/mjlRBEMIM7r1q7drB4TmESW9GGdn36BoOYleZad0DsKgomYM6LBSM2+SIcAl4Vg4PEFiYcYYYGagRuY5PR0Rb60FWpuaODhvXd4zDGAG/7k+Y3kjutAiR5lsY0+FXo/xx0n6MINYwkTYPJJ93aexnT+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6w6tT4l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6w6tT4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F621F000FF;
	Tue,  6 Oct 2026 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791270197;
	bh=urV9ymxq0eAIsjuCTt6DlJMEbRAAR7NRPv0GDgflFU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P6w6tT4lMr9UOSMXiqWl3whnxzeqH1Pzr7fyFMKepLw4mtncTNMmO1SS93zEYQ4Ri
	 rldTFAJyG7kTnIaQhOFkGCw6FTXW4L/6eIDCl/5DyA+/T2fyTBHfBGOZVHgCBk6593
	 6uboPiQrUGe1z/hdKKnV8n13nak6kXGyPi3fS+6bDm2g/vy1PgDgVhKP4Qu1nUCkXT
	 4eY1Dz0SRDW/0LwwNbnFkBjzZw4VfP7OK/GQtvOiDVGtU2pXp+I5LsYj2KyUK2w2z1
	 jlpGrLxxym352FOS8rMVAPxJQ/1p5Cg40WMAwIapdTopPr7eJhyX0tavE7Z+YNIG3B
	 CDKc6iVt2qqhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: trigger: netdev: Support devices in other
 network namespaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcus Flyckt" <marcus.flyckt@kvaser.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261006064603.1081262-1-marcus.flyckt@kvaser.com>
References: <20261006064603.1081262-1-marcus.flyckt@kvaser.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 07:03:16 +0000
Message-Id: <20261006070317.07F621F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The netdev LED trigger currently cannot resolve a network device that
> has been moved into another network namespace.
>=20
> For example:
>=20
>   ip link add vm1 type veth peer vm2
>   tools/leds/uledmon test:green:netdev &
>=20
>   echo netdev > /sys/class/leds/test:green:netdev/trigger
>   echo 1 > /sys/class/leds/test:green:netdev/link
>=20
>   ip netns add ledns
>   ip link set vm2 netns ledns
>   ip netns exec ledns \
>           sh -c 'echo vm2 > /sys/class/leds/test:green:netdev/device_name'
> [ ... ]
> global LED sysfs interface, which is not network namespace aware. The
> namespace is therefore effectively selected by the task that last wrote
> device_name.
>=20
> Signed-off-by: Marcus Flyckt <marcus.flyckt@kvaser.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006064603.1081=
262-1-marcus.flyckt@kvaser.com?part=3D1

