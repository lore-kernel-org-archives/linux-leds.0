Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9BC568FD0
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091444; cv=none; b=inKF83LCM2MKwJpd9CxnNzu5VRFMQy7zz7u0yRmK7NJq6vtNjQtHopztzQ/tABkrmzYxP8ZUQqbFDzhws4tp9JBNq30lMyoq9r6dhtJA/3+RH0QdlXxH2cZkQ4c9LmC85koEFjng12dKkE5on4C+nr3Rn6vZ/GqGoQjm450YAWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091444; c=relaxed/simple;
	bh=FnJWQaOFiar6Yc5oMkWqrbG6LpQrTjh1pIX7tzZ4NRc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=C9t9DNLIboDB2hT9z4EsAcXPd4nn0fSxgqHGUEDkzEgo0tPqyW03Vo9p9YeCAiJnh03Jhj7OROqqGlGbiatvUxIlnSB9iA/vzhzx8d7irNXC2YO2a+vvEevp/a/wnu8pq1bN5vZwQVUUrJHgy+T/W8SdWLsXA0NDZJ8c15kbEGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kx2yI1De; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kx2yI1De"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEF01F000C4;
	Thu, 15 Oct 2026 19:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792091439;
	bh=FnJWQaOFiar6Yc5oMkWqrbG6LpQrTjh1pIX7tzZ4NRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kx2yI1DeWJrB69OwRoIqhB0GmRo877HVD5rGr7Tj8SU6F9kEwCDl5RbniY0gjO0Qk
	 O1wKhYYmQcxESMetGMBpsjfIxYp+P+lNlfk8v8ChlYl4Te7LmPwCXPVMOdoupa3GK0
	 omIfp9sS5Esnphnvxj66QTWF1IaanBSb83UAgu6I1cobwSETW03eToUIOeJpZWw5hX
	 irvJtojxQCPD16dYpDzQb8jRRvsu+AuZ1GzFOPXDt6A4Kvu+ZJMoTVwWAosX6YzQfJ
	 ojG5EWh6XJjtDgzwHggQcxH9TO0w727HfUw2yFqh1mbE5agWHKFkn1J2A2mriknh2M
	 pUTip0xhgI1/A==
Message-ID: <sashiko-outbox-173350@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] leds: trigger: input-events: Restore previous
 brightness on input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261016-leds-input-events-brightness-v3-2-2c462cafe020@gmail.com>
References: <20261016-leds-input-events-brightness-v3-0-2c462cafe020@gmail.com>
 <20261016-leds-input-events-brightness-v3-2-2c462cafe020@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 19:10:38 +0000
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
> the next input event. Keep the level in a per-LED state struct allocated
> in activate() and freed in deactivate(), converting the simple trigger
> to a regular trigger. Pick up brightness changes made while the LED is
> on before saving the level again.
>=20
> Use led_trigger_for_each_led() under guard(rcu)() for both the on and off
> paths. Skip LEDs whose activate() callback has not set up their state yet.
>=20
> Tested on an ASUS ROG Flow X13 GV302XV: keyboard backlight levels 1 and 2
> were restored after idle timeout and keyboard input, and 20 trigger
> activate/deactivate cycles completed successfully.
>=20
> Assisted-by: LLM
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-leds-input=
-events-brightness-v3-0-2c462cafe020@gmail.com?part=3D2

