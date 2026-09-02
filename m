Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BB13DDDDD
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372961; cv=none; b=HN0aEkfcjwWL2YC4N2HSoFsqevemrj9bATXT2C2esW2GY6IqJZiUUgx1krkk4/QQFB9z9n0gTr3YJdU5DXfJH48bVWGXfxbmuSQNOy41Ryk0QTAg28m+tlMYaLhM70OWoIQxaHhXNFoFN40kTn0sw5rfd7ztW8ajxZMCGn/7AD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372961; c=relaxed/simple;
	bh=PZCTIzWX6neYH9vbAuV3/pMTKzfnxjJF1Z1C71tHp0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=srXmDwkdVW3N1e99CBL0q+qpyEkEZVjJcLud1HJ/1QF+zHWZ05w5vY9omNxN4VFZWnwXnYsrSIz+UfFn7b1Eey3T48J+8+qLTvHouLax6ucr7Fdkw69Q7xnZ5ft4WOn9CvmGFmrO7jMLrBorzOc8iQfo3LQBJeOA1Psloz0F1lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvLtLu1s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvLtLu1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2109E1F00A3E;
	Wed,  2 Sep 2026 18:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372959;
	bh=PZCTIzWX6neYH9vbAuV3/pMTKzfnxjJF1Z1C71tHp0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fvLtLu1sZBVFgv3tm0XSYuo/B+SIgGN+QOb0XSDDq0Z22eRzcFGsf3baaOt/9E6uC
	 qjB7xcn6gRAKwF5OCvwMtVMeXd0U1eyvivI0VZ09wR5GmWP79nI/9NZJMIXy8veFUA
	 318+4azu3p35UyreOdo6kduFKuxLX82zBVBz9pila6CzCSjBrmzJfg+CjUar0Lsac1
	 A/QQLKW7JD2agXY5dmE7Y1Tpq9KRbia6SLkiTw0+PPUV8jhQx9iGm+kfLN8UMXkxQY
	 jPxZk1T9feZHCN6qDHTrpMIkaPsEGflLuAMrEKMLu47xHMziO7nRu/h3yg3Evp5ZLi
	 J+H+trjZCQz6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 12/12] platform/x86: ideapad-laptop: Fully support
 auto keyboard backlight
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-12-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-12-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:58 +0000
Message-Id: <20260902181559.2109E1F00A3E@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D12

