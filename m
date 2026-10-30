Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368820;
	b=hfONF+hCegTW4dXzjv6/41D8LYe1IszvMbDH0XFkdgBxdioOPz8ByzTj7gHjPpcmwdaa
	 ESN9Dt2MiQc2aI03+tY5Pdok5/wuefRUhyXs27ZtjBhlLDEJ+4WECR0LbxHIwZNdwzubJ
	 H0I4FM5ObMbKbfUmK1zFq4fPUKDoSJXP3RuWT0Hm0Tq0lHbBlz2KCeLvBd1l4aBlQRDah
	 aLpifVrPwfDiYkZllgNXTixTeUOiW2zUJQR7gMb+RjO4yr+rttkGOM6k85WLAmRrwjoxQ
	 scMGc+mx4JAz9Po6paX5OXc2NGlFB9tlW/JZVVdg078vu7v85Xdf/vZCgBbnxsKnm4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368820;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=we07QR6g0vU0WEX9zgq49afRAEM8gh91Kpk9YPwaiAc=;
	b=wvFjwxmSFJmdkjuhY97mlDPhDtIZtFzNnyZUmsgpokLJIZEwxarU2cbA1FNKcMgmSw6H
	 bZuWiO1/VGX3DGxdU62xZJ59IXBxt2YTiXfNcg3NNIMhz/lfJD6vGsZHKnSG+0mqlLpg4
	 6/MIVYbB513uViUfJDI8PY5mQqFXVUI3soxh5YFLtBVnZiwIE47XRvDnFyKnaVEFLCxmM
	 tm/5YFFyiculgsjfULPfZ4Zgq6xSRbFATF/VWDW2xUalQ6cBFAWKLol4SNlYz40jvwKBS
	 4rWd169ojZcRGBVOfqI+nMIKhS4DkX/48Q9SHSs1kSO8VwRoCdgprEvRpaNEFTlMiKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4hbTJCv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3AB606A323
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L4hbTJCv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D501F0093A;
	Fri, 30 Oct 2026 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368819;
	bh=we07QR6g0vU0WEX9zgq49afRAEM8gh91Kpk9YPwaiAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L4hbTJCvpmLZ90fRM4G22Xar+arf4kRVaqJf+yyCqMnV+4BXDYRKO3lucS5Oc8zS0
	 ImKbIzQ+IuV2t7lW4uFYjpI6qJlpVkvMAo0JNI+SFCEFyzx2UCJH2yIHGEnwb2RybV
	 D/shRS1gX2k3UybN1bv61b0+gbNEWyPPvC5En+AMCl8Bix+Z3BaA95LB4dvpgS/AMN
	 srneEC4hbN0ljcXArCPpFaEre5C4HkB45GovOW5XDejvI3yu+5AIMqM2dBF3c22RMI
	 3pBVPWbRQyTj20NrkvBr6tLfdrGMkqqStLfaZv9vY9rlMh/64NfSgWYXeFOkGkNFCh
	 X4vytDXMEnHew==
Message-ID: <sashiko-outbox-191086@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] leds: trigger: input-events: Restore previous
 brightness on input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261030-leds-input-events-brightness-v4-2-5ea0ead7480c@gmail.com>
References: <20261030-leds-input-events-brightness-v4-0-5ea0ead7480c@gmail.com>
 <20261030-leds-input-events-brightness-v4-2-5ea0ead7480c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 14:00:19 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Nikolay Plastinin <plaztininikolai@gmail.com>
>=20
> The trigger turns the LEDs back on with LED_FULL, which the LED core
> clamps to max_brightness. For keyboard backlights with several levels,
> such as asus::kbd_backlight, this means the backlight always comes back
> at maximum after being idle instead of at the level the user picked.
>=20
> Remember the brightness per LED before turning it off and restore it on
> the next input event. Keep the level in a per-LED state struct allocated
> in activate() and freed in deactivate(), converting the simple trigger
> to a regular trigger. Pick up brightness changes made while the LED is
> on before saving the level again.
>=20
> Use led_trigger_for_each_led() under guard(rcu)() for both the on and
> off paths. Skip LEDs whose activate() callback has not set up their
> state yet.
>=20
> Clear trigger_data under the same lock used by the LED walker before
> freeing the per-LED state. Although normal trigger removal waits for an
> RCU grace period, the device_add_groups() error path calls deactivate()
> while the LED is still linked, so a walker must see NULL after teardown.
>=20
> The previous revision was tested on an ASUS ROG Flow X13 GV302XV:
> keyboard backlight levels 1 and 2 were restored after idle timeout and
> keyboard input, and 20 trigger activate/deactivate cycles completed
> successfully.
>=20
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-leds-input=
-events-brightness-v4-0-5ea0ead7480c@gmail.com?part=3D2

