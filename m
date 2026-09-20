Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A0123ABBE
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934263; cv=none; b=ajVZ4nLO61LFNouG0a2MXhSCuCsx9RGZIhkhhNu1w8TSaWemP5H0666b8jlywmLohCYjAutghjY4aXZ5A3Nh3wuOME0kBTOYBD+iz1BGgVj3g1vfXW1b5gUp5bu6Ej+9g3zuMU0TtjpfLbrtQ2fzl7CL9V9tg8lvkgpQxjiDUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934263; c=relaxed/simple;
	bh=1lnQPNAxnj1+s8dbE5uJzexCcPmTBDvqt0lgZiU6Lgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tsCGyvTOnskgZ2dFArFZcInycFVDNgrvzjX5290RBIbtPS+Bxq0sS/EyeOZ6vu6VrlV5hMzQLgBBLAsuEaBRfw0PS2ymtcqBUeo3rElzRvETJtNgFjsVrQCKs+4IUHFTOhYhjGdnmUyvi3TgeYdYDdqvBCZCelAktPZDe1LaozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAjfUfpE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAjfUfpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 104311F00893;
	Sun, 20 Sep 2026 19:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934262;
	bh=1lnQPNAxnj1+s8dbE5uJzexCcPmTBDvqt0lgZiU6Lgw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eAjfUfpEc0LsM3WWpPLCQDLxkUsPRvXx8yDeOPlj7Fbo5ua59GhzBOGr1V1rXa2k/
	 KyR9IGi2FYOfDDexBdCRD9zQRWdwqJHrR6zIGtab4Q4tfSBhaiN0hMHvDvvXkUnQzx
	 Hi3zoWzNQIOhjbyaWhg8IO9qwoU4wK/GZo5rZbrkn/k7yKnbZAqX9igYJnuFUW7975
	 Q+2xOEkac07Ppe9xLbo4tI59Qm6rrB/MHi/KLf87L3ERcdMJPTTeRjiB7cxNE7U5rz
	 zdIAQZm97ANg/ZZbQGhvcbQ4rltgkdtK3gpyPAAGoft8F9eIY5xe0o7hJa35/qIrAg
	 3ubGvpxTBRWlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 13/13] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-13-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-13-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:41 +0000
Message-Id: <20260920195742.104311F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently, the auto brightness mode of keyboard backlight maps to
> brightness=3D0 in LED classdev. The only method to switch to such a mode
> is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
> is a multiplexed brightness value; writing 0 simply results in the
> backlight being turned off.
>=20
> With brightness processing code decoupled from LED classdev, we can now
> fully support the auto brightness mode. In this mode, the keyboard
> backlight is controlled by the EC according to the ambient light sensor
> (ALS).
>=20
> To utilize this, a private hardware control trigger "ideapad-auto" is
> added, with the event handling procedure calling the
> led_trigger_notify_hw_control_changed() interface to activate/deactivate
> the private trigger according to the current LED trigger state. To align
> with LEDS_BRIGHTNESS_HW_CHANGED, the driver neither depends on
> LEDS_TRIGGERS_HW_CHANGED nor selects it.
>=20
> Meanwhile, block brightness changes on exit to prevent the side effect
> of LED device unregistration when the private trigger is active from
> resetting the brightness to zero, so that the state of auto mode can
> retain among boots.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D13

