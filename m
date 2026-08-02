Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFFA2749DF
	for <linux-leds@vger.kernel.org>; Sun,  2 Aug 2026 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785691915; cv=none; b=thDw0KrwhsKjaXjkuJyP9ja15RW8z52UH8bHLZVX173oNGZ3hFCeoypr/5RwdJUhScBoiVHGPjrOZM5nFaBEksYQe7ykGFVskSaIUwgCu3F7Va4zRSPwm5lGz1Af2mLlKBL3zsm5NFF3henGI8TRE5WhUsVDt+RKTR6pilg4Kig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785691915; c=relaxed/simple;
	bh=P9FiE3evYQya59BXNpGgAtRCgF6O/j5ntibN+V9I1Ag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WmLdElhDrqSkkcNrCVusTGKI1FJQS+MBNIgCleVdhEUn/nKnP81mhPRoBYxi6jY9OgKUSXia275TTmw0btuK8XPRAQP/n4Oa1e4GMfOsTFdz+Umwma13QNcyLma9sWJ1OPt708dS8yvO+nw66tPP4yxCJMqEKu1XDQlSwASboKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MayQBlki; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MayQBlki"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5251F00A3D;
	Sun,  2 Aug 2026 17:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785691914;
	bh=P9FiE3evYQya59BXNpGgAtRCgF6O/j5ntibN+V9I1Ag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MayQBlkiOCt8FWIxjDy4NjTebDKKWUPqY+xaFTDR+b9wOxyAo/bGWLLwZQe8hm0ka
	 7kdG81mWoCjhqTqah3fS9F5OU/cInAPxI+G+FMJnMiBdJeLxe8zKkl7NPOCPdRjhoL
	 CEvrBWaj17x9mK0kyaMf+/+0gvuNo36ZxaGp3BWBonU5a1EcoQoOB+Nz0ECEKUX8Az
	 fmIvG4loThpYUrd8xG3RMUqC5jOOqxR5nxpiLzJ9wYg4bDDNK4WuckM4UFpzmMjBfR
	 o9uizsNYCH4MZjuD59gVhXkstRvFuPRA2rFKX3ABexnJSdOyanKhIBD/BuNNR2PTQ3
	 /j7pJ7dL3moYg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260802-leds-trigger-hw-changed-v4-12-f97e2ca976fe@rong.moe>
References: <20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe>
 <20260802-leds-trigger-hw-changed-v4-12-f97e2ca976fe@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 17:31:53 +0000
Message-Id: <20260802173154.2C5251F00A3D@smtp.kernel.org>
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
> resetting the brightness to zero, so that we can retain the state of
> auto mode among boots.
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802-leds-trigg=
er-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=3D12

