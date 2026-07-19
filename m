Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD43ABDA5
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481192; cv=none; b=hG9zuo99XKRuOcwpAAArotdaHoROk1Yr2S+N3k8R+CxZ6+EdwVX73doDLBSxOexYi47XDP3o0cGYRJAJAKtoVZFKI/9Vpw7QpW9TvTSa1K3q0/oLapsjnuSeWdZ2CGgqY8TevK+UYCpODfpYCmgKgJ2OXX46kqrk4y9txg6PY9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481192; c=relaxed/simple;
	bh=wmQhnTvIGwaXZVZB53avrr758epE3EasRm43MxQr0T4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t2KjzSbkvEQ06WHHAx74dGtzZPc2rF9YaAqcbLggBu61O9FlRPy+IrUuA+djvrgEur07Fu3Bxsckar10YcyPyc2nIbgkkUDU0R3HsVMQOAFm8qBCSQJgpdD0sEkLMig6MmO3bXdPCqNZZL3PcAam4whkP33+xgk8eWImFxh5vPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ozy7g92g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ozy7g92g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 741ED1F00AC4;
	Sun, 19 Jul 2026 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481188;
	bh=2fO3GqXB9fPBXDXtS53oGYWlnxge19XgSQpvZqg/G7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ozy7g92ggsAQb7PaR3ddbg1KAiHnL/fB7CxefGbq4EWbz8NuG0CrXRZ8Bz8qy3Cmj
	 x1rBk2AKp5NcwcIQX2QKh2zaM5XJmzjbfchpvRSVY6RJnU1rd76ekr/nfvmtHRHJ2V
	 tPKbHPM88ZfkUrzAMOolSvE3uvqeek596Vk7nBly+s2fnvm6tJ3ZcnSiIWeFjhWKjb
	 qSAQXAyYHdjeH0phBaK9pom+BkuVcXiGrPEJVhMKZi1+FlCk3Pq7LOvcp3lVfRIv1M
	 zBL5NhG02IEzSo3lsqDEjQdQJZBCVWZ+IMjDqPkjpGOhk5u01PcdYII7YF4Im5dFce
	 RA6OBZfUu0STQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 05/11] leds: turris-omnia: trigger: Implement
 offloaded() and declare hw_control_trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-5-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-5-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:08 +0000
Message-Id: <20260719171308.741ED1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling `devm_led_trigger_register()` on a statically allocated gl=
obal `struct led_trigger omnia_hw_trigger` causes list corruption and poten=
tial kernel panics if multiple driver instances are probed.
--

--- Patch [5]: [PATCH RFC v3 05/11] leds: turris-omnia: trigger: Implement =
offloaded() and declare hw_control_trigger ---
commit 2d28a7cfbe3bd11a356a1c04d42e4a480011bb29
Author: Rong Zhang <i@rong.moe>

leds: turris-omnia: trigger: Implement offloaded() and declare hw_control_t=
rigger

"omnia-mcu" is a private hardware control trigger which always stays in
hardware control mode. Implement offloaded() callback with its return
value to be always true to reflect this.

> diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-=
omnia.c
> index ed6a47bbb44f9..32d40d176d3f1 100644
> --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c

[ ... ]

>  static struct led_trigger omnia_hw_trigger =3D {
>  	.name		=3D "omnia-mcu",
>  	.activate	=3D omnia_hwtrig_activate,
>  	.deactivate	=3D omnia_hwtrig_deactivate,
> +	.offloaded	=3D omnia_hwtrig_offloaded,
>  	.trigger_type	=3D &omnia_hw_trigger_type,
>  };

[Severity: High]
This is a pre-existing issue, but does calling devm_led_trigger_register()
on this statically allocated global structure cause list corruption if
multiple driver instances are probed?

If a privileged user instantiates a second instance of the driver on the
same I2C bus via sysfs:

drivers/leds/leds-turris-omnia.c:omnia_leds_probe() {
    ...
    ret =3D devm_led_trigger_register(dev, &omnia_hw_trigger);
    ...
}

The led_trigger_register() core function unconditionally executes
INIT_LIST_HEAD() and spin_lock_init() before checking if the trigger is
already registered:

drivers/leds/led-triggers.c:led_trigger_register() {
    ...
    spin_lock_init(&trig->leddev_list_lock);
    INIT_LIST_HEAD(&trig->led_cdevs);
    ...
}

Could this destroy the lock and the list of attached LEDs for the active
trigger, creating dangling pointers that lead to use-after-free or panics
during teardown before the duplicate name check returns -EEXIST?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D5
