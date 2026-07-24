Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545043ED10F
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784916971; cv=none; b=Xf5p7ee0rjxAt0ScvCcHKzFLASPijHBQUV/PEDzCYaF1BPqzui+p9f2TRhka5QVdPNj1T3fUoPD/3GRjiNw7L2QLKOn+sX78lHpXTKv/4t8OQOQqK55avMjVUFqmbWp9/3cRbjdEI14/1nLzMDJ+b82cahM3Lf0Zne5Xbvpi1g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784916971; c=relaxed/simple;
	bh=7H5MyYzgYvWPdbrNGzgAicTJz95YtIqfngRHMGKeVX4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nkxNi4aakSahS7U3Fm/jS8/EncFmjQpeXbVTii6AhMBzxKXNn0E2SHFGVdPplXeuI+hRNDoxKrhPUivqof+faVxXM85mfw8WwQ2MVkx2ZNDr996GNhgo5JSX7QjfzKe8L1G+a8++BXQTIKoumcWyWPrUrchqMOyVFyWVQC/OYkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJUOXAUf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJUOXAUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B84C1F000E9;
	Fri, 24 Jul 2026 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784916967;
	bh=u9c2shY0G5nxdyOYGv+eSfpgXo4B05luVQptaUjFeuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UJUOXAUfxwsrWHNJZUu5otTw5MTUi6fH3/Ncx03pXyq0pUDSLZ6pd2r/6mcQnSY8k
	 JxlbKk+z/B4T0SV1l6qIunLop5xCqgWAavLFq/G8e1dGHMqyHEsSm9FHlIwRuJip7T
	 bPlJiCJ+ZB1GBTGqrH6HpJyg/XJEsJzSCqH+eMH086mnrTy3IrAvVsyypaTglcaY90
	 0os3A7vTDFzy8qqzyVR0R+x2Xpvc7dCgWZho/0PUgzEW+jSwXwa5gh48Rnr6eJlYd2
	 akDpmlkratuPszIRnIqnjlJk3Sxzi1IEsMdD0uN7hP1IQ5vAHX1v5oVB9Ryo1UIWwx
	 hoIqSuOg/EWdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steve Dunnagan" <sdunnaga@redhat.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260724180412.43150-1-sdunnaga@redhat.com>
References: <20260710150841.19669-1-sdunnaga@redhat.com>
 <20260724180412.43150-1-sdunnaga@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:16:07 +0000
Message-Id: <20260724181607.7B84C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver masks -EPROBE_DEFER from GPIO fetching functions and in=
correctly skips the LED instead of deferring the probe.
--

--- Patch [1]: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs=
 ---
commit 2d09674f074f178fbc54110548c9a0816564760c
Author: Steve Dunnagan <sdunnaga@redhat.com>

leds: gpio: Clear error pointers for skipped LEDs

When an LED's GPIO is unavailable, the error pointer is left in led_dat->gp=
iod.
During shutdown this error pointer is passed to gpio_led_set(), producing an
invalid GPIO warning. This commit clears the error pointer to prevent the
warning.

> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 8ae71c2e91e01..8810fdcf2d774 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -277,6 +277,7 @@ static int gpio_led_probe(struct platform_device *pde=
v)
>  			if (IS_ERR(led_dat->gpiod)) {
>  				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
>  					 template->gpio, template->name);

[Severity: High]
This isn't a bug introduced by this patch, but does this unconditionally sk=
ip
the LED even if gpio_led_get_gpiod() returns -EPROBE_DEFER?

If the GPIO controller providing the LED pins hasn't probed yet,
gpio_led_get_gpiod() returns ERR_PTR(-EPROBE_DEFER) to gpio_led_probe(). By
catching all error pointers with IS_ERR() here and continuing, the driver
completes the probe without the deferred LED instead of actually deferring,
permanently breaking the LED's functionality.

Would it be better to use dev_err_probe() here to correctly handle
-EPROBE_DEFER?

> +				led_dat->gpiod =3D NULL;
>  				continue;
>  			}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724180412.4315=
0-1-sdunnaga@redhat.com?part=3D1
