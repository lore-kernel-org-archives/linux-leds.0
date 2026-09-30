Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E1144C648
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751736; cv=none; b=Hq4qg8nHWOodTVLtoPYepyLLZailO4fTjWIrFZvloU9YkEQe0HVTygATzTOOPwNAoEtGJf1/tBAIaL6hGsjr3S8ktz26v/TEfvSqjyNYN8XHd1q6eyviIMD0OWeMuRsOvTmzTWy+sDHj+jcFtQarqyRRJI24ynjx43Vm3XKuDtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751736; c=relaxed/simple;
	bh=TLeM8vaK96Mk9Wwq3YmB8jL5oPzDrVflt0K0gjJCUVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pqdwPTcQDf41jpd0/V+IM2F5ylOgax0P/fK/UrxzPUxz1hKvGCNPi/1yZzP2Dc84GWXH6qh4g2baDiCmdSca2BDTvw21VOhnFVTXaknmuMNupp0ooeqRi4htsVkf2/Zkbdbm8tEWSkOkZwWFKazllwPSLyiZf+LxObK/FIy2aBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PT7f0VYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PT7f0VYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501591F000FF;
	Wed, 30 Sep 2026 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790751721;
	bh=TLeM8vaK96Mk9Wwq3YmB8jL5oPzDrVflt0K0gjJCUVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PT7f0VYdYYjrTgHbdL6r22OwP7Zx7i5s2uVrpW7IoWjCtRP5SL3dhwfUtWHkPOYpz
	 kHaSYhB7w2vEGHTeuA9fRyqm42HtAxK7SSsr8MP5OPc3uPZ3zckijF9ZBz3JTpqzOj
	 691yAeC2lNgz7HGScfou/jvlRhVXuRtbTPUmmo7eObmwR/fffnjpYvmri/JYZucNps
	 uLab4e7Do8+IyaTonLKfSrBO+yjMGJetObAuRPz538VG+L8a4och2OlWp9V3OytvJj
	 2vPvefZPfgGdVXG6OR9R8DB08ekk8LGGIiBtErEL1vZJb4FC2VO1rQjV6zi4fOwQNq
	 gNDKKPCgcw0wA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] leds: trigger: input-events: Restore previous
 brightness on input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260930-leds-input-events-brightness-v2-2-3948d3cddd83@gmail.com>
References: <20260930-leds-input-events-brightness-v2-0-3948d3cddd83@gmail.com>
 <20260930-leds-input-events-brightness-v2-2-3948d3cddd83@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:02:00 +0000
Message-Id: <20260930070201.501591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
>=20
> The trigger turns the LEDs back on with LED_FULL, which the LED core
> clamps to max_brightness. For keyboard backlights with several levels,
> such as asus::kbd_backlight, this means the backlight always comes back
> at maximum after being idle instead of at the level the user picked.
>=20
> Remember the brightness per LED before turning it off and restore it on
> the next input event. The level is kept in a small per-LED state struct
> allocated in activate() and freed in deactivate(), so the trigger is
> converted from the simple trigger API to a regular trigger. Brightness
> changes made while the trigger is active, for example with the keyboard
> brightness hotkeys, are picked up too. The LEDs are walked with the new
> led_trigger_walk_leds() helper instead of the trigger touching
> trig->led_cdevs itself.
>=20
> Tested on an ASUS ROG Flow X13 GV302XV: with the keyboard backlight at
> level 1, it now comes back at level 1 after going idle instead of at 3.
> A level changed with the brightness hotkeys while the trigger is active
> is restored after the next idle period as well.
>=20
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-leds-input=
-events-brightness-v2-0-3948d3cddd83@gmail.com?part=3D2

