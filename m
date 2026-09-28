Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096D4D09FE
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604373; cv=none; b=kSSjqZLZTzJu0vhmJbeULox9c9tfoFmbnebunVwMVfCpipyQSlD7ueGcveXNq8hqXZzKIz+smziW/wrwyRGD1dWOlRPAembRzQGKLTdl3tmrFziZBx2C/r2eQO5tNS6y3wckeFq28+kNvMo50gqEt4JaokoU3xngShhtdjSfgRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604373; c=relaxed/simple;
	bh=JfrDfpE/PsT8UfKkpWzJQLhvJ6MwqJ7AyIXwhEBmTKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NPIJbIC8tgXvcUcLB7/Nk/AfZr6BXBzWgcWy6c/50mSzOT8MMrb5zn5I5TUSCoDdorh13k04JiS+B2F1raU8GHn+4RtfU58+tJUQQWYsvcUVMS1ONzTRAeAhQgnH7U6dLd3gfdCH7BFuyLl02/G/TO+tPOcra0FxUdS6kpNQlgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXoB1Rij; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXoB1Rij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65C381F000FF;
	Mon, 28 Sep 2026 14:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790604371;
	bh=urrS778IpPOyRyrZQpHLvkl8Yoi+Tz9CIkif4HeG5EU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXoB1Rij8Uq0WevzZXwLfGq/ghB2salNpMsc3NA7gxhM3wZt4cxQ7cWiZ0lVEF8h2
	 2pUWJ3rsKPaJ0uhJHJzyhqUzpwQcNls3ocpEmT26xlnTdpqB6bfJ/ysFehsh8R01XI
	 l2a9CuKmi/enIG6QlUFmIsVUK85xLXTYY29M2R45yKIvtcULRol6icHyHYi2bFBbvP
	 BBuom34NJQqax1gTr+z+Fk2aCwRYAKyKAhXKfDSVvJwb+EKRWaKhidTu4/NbiDwBmP
	 oefy9MIt3gxvtGlvZX0kfa5h0zdv73fLBzpGocfUv3AwQBdLAVU+M5qvIVREaZEwHn
	 3gVBcmlSlNo0w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] leds: trigger: netdev: Support devices in other
 network namespaces
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcus Flyckt" <marcus.flyckt@kvaser.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260928135130.1131749-1-marcus.flyckt@kvaser.com>
References: <20260928135130.1131749-1-marcus.flyckt@kvaser.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 14:06:10 +0000
Message-Id: <20260928140611.65C381F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928135130.1131=
749-1-marcus.flyckt@kvaser.com?part=3D1

