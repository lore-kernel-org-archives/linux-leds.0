Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047E6404BDD
	for <linux-leds@vger.kernel.org>; Thu, 24 Sep 2026 06:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230608; cv=none; b=YaRw6vFGgxk3An3FbQnN+ptaUHFBiO9QsuEunfsCR4aUSPrHMJ6Qmy44C563dwswWF++CxgdugIC4+15HEyeKq1VRi4Ps6F7xL8CcZcCbtZG+dPdPbOuxq/TB3i+XU8HHQVtKxxnfdHN9P7Jo32T5E9OrQqq709B3hh2rncWaU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230608; c=relaxed/simple;
	bh=tT/N9aApBPP3FJXAL+z0lov0rPgTPUy7FZFTPfDxLh4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p9rsRhOepZw80GNketXfHSyMrln92Pat3mGpSUlkVQ0hxiO8IneS5EFH6MVWaDxSRICXhzV9gFcLhejxCHkvMuRXuMof3n9fRjwBEtSmKiw4IbcWnuCGutdH8W6CjQhJ+x1A4Ux2j3tHXB+r9872tsOxlQPkf3cJKlKZuE+PF6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=inkN9hmz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inkN9hmz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658941F000FF;
	Thu, 24 Sep 2026 06:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790230606;
	bh=tT/N9aApBPP3FJXAL+z0lov0rPgTPUy7FZFTPfDxLh4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=inkN9hmz7MY7FLR4Y1t9Bvzi1IGnZsevh0ldhLKJDufoM3w3mWU/FH6FBYllMEXFy
	 eiWjlPF8fIzpAmdbhH//8tJ/1Tq1PBD9y94Z43G36Ahofw+j4WML4GzPx8qmbUcKm/
	 g+Q9EBDXp3edlpfZZz6Cj/t0bCpVz87RoTAuGyqMuWbK7eDjU00zOCKOHUCiN6Ryok
	 4qru7KIvGjSUYoz1AhqMSJmAmK3kLz2zHG9DQSHAZt6hjpBwoJZi8z4v3M44k38OKd
	 TL6szee6HNv3TNcIH7tTcGSUHYhwTUnC6GwGbuwvZpXWyGNNfpotOg76suTygy2EBY
	 eupVUS0XuYz7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: trigger: input-events: Restore previous
 brightness on input
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolay Plastinin" <plaztininikolai@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com>
References: <20260924-leds-input-events-brightness-v1-1-b0ceff3a2343@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 06:16:45 +0000
Message-Id: <20260924061646.658941F000FF@smtp.kernel.org>
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
> Remember the brightness in blink_brightness before turning the LEDs off
> and use it when turning them back on, as the netdev trigger does.
> Brightness changes made while the trigger is active are picked up too.
> This needs per-LED handling, so convert the trigger from the simple
> trigger API to a regular trigger with an activate callback.
>=20
> Tested on an ASUS ROG Flow X13 GV302XV: with the keyboard backlight at
> level 1, it now comes back at level 1 after going idle instead of at 3.
> A level changed with the brightness hotkeys while the trigger is active
> is restored after the next idle period as well.
>=20
> Assisted-by: Claude Opus 5.5
> Signed-off-by: Nikolay Plastinin <plaztininikolai@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-leds-input=
-events-brightness-v1-1-b0ceff3a2343@gmail.com?part=3D1

