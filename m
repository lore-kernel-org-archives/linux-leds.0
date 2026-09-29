Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5E438F658
	for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684349; cv=none; b=RP+jOPpqb+RLoOLoBZndYlpvY4+NF6VTAgIBAjH287/dc4ouNd7Ey663kNz+eHTu2aRAv0eaPfssa/iRB8gNdFk0XpXayvJbtEPhsX/9PY5lZk1HhnHROVn2DAGdQ7gpxpvkAK8BJPa6g/jDX7d8UCcOJSCIkzdb3Av41nZXtYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684349; c=relaxed/simple;
	bh=0u4C2Wxg7a2d2J02ZH7OJvFM4gPmIPkQHwmX/r+mXWA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wn/gl5IUBvloufkNB8KicuN0glKQCuCoCLzivmGk07a0p7CncSqR0nvK6ELg/bJLSYjupVgM9iUTWisNnpIlq5E4MfP+t1vWcHvYQo8/rKQ1/US0HAH7MC33L60S8/2AvSBZDD25ZVKLOCC98QS38+BUkqHujm6IafCYctbKXpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFfaDQlg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFfaDQlg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36221F000FF;
	Tue, 29 Sep 2026 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790684344;
	bh=RuNIL3fC87IOQ31YioJ1FVNl/ex+PMUpnQXiGIPjH0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JFfaDQlgXlUDfCteb8LnT1HJqV660rO0bU3GXJAPH3yn018dyr0icmhMk2GH3Z2t9
	 otGxUbjH74eWyItHxCsD4oAU5QRkoOUo/Lsv+9+HVbTVr+X+OdZQBWlYiUi0vvVoQG
	 fKseiXiq3qUJQKAxavTWSl/Du8u4l70Be3dKvfpX0AoENJl18XRN+HwO/ywWGq8k4P
	 Zxdm53AlYsSMbKWNS7OGQ7o2J5Nq22FtDRgjfzk4KOD9Q3TKznVmuZR4EWeU9pQuYl
	 b+oPUnnfTpzrWJtBG0GPoVw3Q9OzOScD8bRgH6zzjad/FwSkZJksAYQxXDp8Dxk3CZ
	 at4sQza3cMPGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] leds: trigger: netdev: Fix sysfs_update_group()
 races
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260929120902.2793138-4-alexander.sverdlin@siemens.com>
References: <20260929120902.2793138-1-alexander.sverdlin@siemens.com>
 <20260929120902.2793138-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 12:19:03 +0000
Message-Id: <20260929121903.C36221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> The link_speed attribute group was listed in netdev_led_trigger.groups,
> so the LED core creates and destroys it via device_add_groups() /
> device_remove_groups() in led_trigger_set() (under trigger_lock), while
> the trigger also refreshes it with sysfs_update_group() from
> netdev_trig_notify() and device_name writes.  With no shared lock this was
> observed as a sysfs splat when the trigger is re-armed during PHY link-up:
>=20
>   sysfs: cannot create duplicate filename '...green:lan/link_10'
>=20
>     CPU 0 (led_trigger_set)        CPU 1 (linkwatch workqueue)
>     -----------------------        ---------------------------
>     activate():
>       register_netdevice_notifier()
> [ ... ]
> store that takes that lock.
>=20
> Cc: stable@vger.kernel.org
> Fixes: 06cdca014eca ("leds: trigger: netdev: Display only supported link =
speed attribute")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929120902.2793=
138-1-alexander.sverdlin@siemens.com?part=3D3

