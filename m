Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE47245020
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785191120; cv=none; b=C5Fg7muGaGDD2+sMJ07vvgdoJLYOxYFMe7oYXAxas2+KCcWsBBqC+yZonGMMgJwAErhnJGB0Wzx+uC+6wxTMxO031M8e/29ATVhIOJF2EocunG6CWIU96H1tAk/m4kZTHkgGp/eAmEBqHU4KnegA4ZVSQHF72/d++VElcRbi0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785191120; c=relaxed/simple;
	bh=Rap1iZGE9Bk9llXUaTnovIWOUaWB1/ui12AEEX9zDKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KG22QGAYfdwV8L7CdGkuaBC/OHiR6sfoNLQ8rHwQqNNK+W97Vr+RIQEZ7dunzDHa1zzqkpfnNQrGSt7q4oWRBEn89AjZTmsUIt0b3pWDjxyQs7znIjmxNsi34G+l3Rv00kiTVTPkH0qVftl3iA69PPK6JCNgAniwlxT374kE0c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARlcv9Gg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARlcv9Gg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1ECA1F000E9;
	Mon, 27 Jul 2026 22:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785191119;
	bh=plS49XAqqdso5ssFFCIpSnmoNj3Pmbe4Bw/7K6Y7Hik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ARlcv9Ggx3fDyT289KjGIbzfk496aHFkLiha1CIYYJGPtZ1YyVwzf7XosYcaZL0hr
	 85KJfHhURb5M3zymk1yNqD0Epf2YmoRRVVVqGpK+NNp8/5LmHDzJIGtdOXAs48ClHN
	 vrBQ7jaitrUEdLFIeT+KI3Utk78DftOjrvpxYHYU5t5pZK9mJDHesn6yCCxuT9RK7q
	 bK+jQkMF3E2epVrsG0yG4OjMkBgRNx/NDwOIt5GqIIqnybTmZkxwPY6WSjt/xpuQUY
	 2lDxCFTnAkaPGBqlRpHLfoGU47d1SybLkKKQIXYEZj6IL3fNTt3MRC3+7F25DE9m+o
	 ntoUDrTO4aa9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: trigger: cpu: use cpuhp_setup_state_nocalls() for
 large CPU counts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sherman" <shermanpauldylan@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260727221607.5216-1-shermanpauldylan@gmail.com>
References: <20260727221607.5216-1-shermanpauldylan@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 22:25:18 +0000
Message-Id: <20260727222518.B1ECA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Skipping hotplug startup callbacks during initialization leaves th=
e CPU LED triggers in an incorrect inactive state for all already-online CP=
Us.
- [Low] The commit message description is not capitalized, violating LED su=
bsystem conventions.
--

--- Patch [1]: [PATCH] leds: trigger: cpu: use cpuhp_setup_state_nocalls() =
for large CPU counts ---
commit 2aa3e021f1cce38c0cc7487063d486ab550d6162
Author: Paul Sherman <shermanpauldylan@gmail.com>

leds: trigger: cpu: use cpuhp_setup_state_nocalls() for large CPU counts

This commit changes ledtrig_cpu_init() to use cpuhp_setup_state_nocalls()
instead of cpuhp_setup_state(). This avoids invoking the hotplug callbacks =
for
already-online CPUs at registration time to prevent boot delays on systems
with large CPU counts.

> leds: trigger: cpu: use cpuhp_setup_state_nocalls() for large CPU counts

[Severity: Low]
This isn't a bug, but the commit message description starts with a lowercase
letter. The LED subsystem guidelines mandate: "Always capitalize the descri=
ption
after the subsystem prefix for MFD, LED, and Backlight subsystems."

> diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/le=
dtrig-cpu.c
> index 679323c2ccda0..ce75d5f54684c 100644
> --- a/drivers/leds/trigger/ledtrig-cpu.c
> +++ b/drivers/leds/trigger/ledtrig-cpu.c
> @@ -163,7 +163,15 @@ static int __init ledtrig_cpu_init(void)
> =20
>  	register_syscore(&ledtrig_cpu_syscore);
> =20
> -	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "leds/trigger:starting",
> +	/*
> +	 * Use cpuhp_setup_state_nocalls() to avoid invoking ledtrig_online_cpu=
()
> +	 * on every already-online CPU at registration time. On systems with la=
rge
> +	 * CPU counts (e.g. 64-hart RISC-V) cpuhp_setup_state() would serialize
> +	 * callbacks across all online CPUs, causing multi-hundred-second delays
> +	 * during boot. The trigger operates correctly for future hotplug events
> +	 * regardless.
> + 	 */
> +	ret =3D cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "leds/trigger:st=
arting",
> +				ledtrig_online_cpu, ledtrig_prepare_down_cpu);

[Severity: High]
Does skipping the hotplug startup callbacks during initialization leave the=
 CPU
LED triggers in an incorrect inactive state for all already-online CPUs?

By replacing cpuhp_setup_state() with cpuhp_setup_state_nocalls(), the driv=
er
skips invoking ledtrig_online_cpu() for already-online CPUs during registra=
tion.
Because the cpu_trig per-CPU variables and num_active_cpus are zero-initial=
ized,
they remain in the inactive state.

On architectures that do not emit ledtrig_cpu events during idle transition=
s,
these CPUs will never call ledtrig_cpu(CPU_LED_START), so their LEDs will n=
ever
turn on unless they undergo a hotplug offline/online cycle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727221607.5216=
-1-shermanpauldylan@gmail.com?part=3D1
