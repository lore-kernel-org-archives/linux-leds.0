Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8217429B200
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967605; cv=none; b=g/Db7p0TR32O7TuW667espCu2vETB7/ajXqkQaqkzd+A4DcituQEOmhpOjU38EJkpC/0IfheDiADZaBAR6t28oqDtjtJOFsX1Sm6ldM59jmskOQWcnQbYno2zvo/2j4y7xbHb7TSP5fGNbiL1ffVWu0zpEY+dggXmNtm9mHSd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967605; c=relaxed/simple;
	bh=o9Fv0+wS0VFWiFQjHumpBNnZmmlfY/wxRzHJG4xasZw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QkChAr/H9l7sYd7UxLdSg/J3ALItIJrwyMut8bb4zePV9ZzAW601ooBIX9I3Uzh3RSnSyYa+jhccjUpPjVuDlh6R2etHIQIUSjUSfz8sZzbMeytSnoro64V342z+rmP7Mlj6AqKOtrT3WdaYa49Jti9LEmrVbaW/VCe9O4sNlFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP8Gsdh7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP8Gsdh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F423C1F000E9;
	Sat, 25 Jul 2026 08:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784967604;
	bh=U++GDE1/CGyCcANy2UNqXycsVITGxeMdTKHPBTKpoAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FP8Gsdh7wu1dfLsYx/MrOaZCaeiWzSl+UodnGLtp905lSw12y2Vz8fZmZg6icjVfi
	 qyLkSzHVVG8N4M/cmVBIqhMzAmjKYtVS7FUVyE2Jt8eaL924y9+1vb1kHD5Aa+rfJg
	 v0bbBoYqAIKNQmomBAWue9FFqRhvMmAn+sNAxLwHRgGlf5mrx+urkCzjkwYEnVZTAT
	 xXljv8nYK9WshOJbu5gT7SHRuXWb7WV0HPh2eFLZa7fXWM7bSrL51cqQJU4GDcgwjm
	 39OehBZRqydKsuSX1UTvF+k2zZIlQ6pgmOr/pim2I7F0XPqVcGaAEKA1kbm/hpcx6r
	 HZ7ittl15Mb4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] leds: cobalt-raq: Add missing MODULE_DESCRIPTION
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260725081349.8556-1-arun07172003@gmail.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 08:20:03 +0000
Message-Id: <20260725082003.F423C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Unmap and orphaned LED classdevs due to missing .remove =
callback combined with unmanaged led_classdev_register.
--

--- Patch [1]: [PATCH v3 1/4] leds: cobalt-raq: Add missing MODULE_DESCRIPT=
ION ---
commit d2016764a88879b346e156b26cea14e3d81dd4b0
Author: Arunachalam <arun07172003@gmail.com>

leds: cobalt-raq: Add missing MODULE_DESCRIPTION

Add the missing MODULE_DESCRIPTION() macro, which is required by
modpost and was missing from this driver.

> diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-ra=
q.c
> --- a/drivers/leds/leds-cobalt-raq.c
> +++ b/drivers/leds/leds-cobalt-raq.c
> @@ -101,5 +101,5 @@ static struct platform_driver cobalt_raq_led_driver =
=3D {
>  		.name	=3D "cobalt-raq-leds",
>  	},
>  };

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing flaw in
the driver.

Does this driver leave orphaned LED classdevs if it is unbound via sysfs?

The LEDs are registered in cobalt_raq_led_probe() using the unmanaged
led_classdev_register() API, but the driver definition here lacks a .remove
callback.

If a privileged user unbinds the driver, the devres cleanup will unmap
led_port. Because the LEDs are not unregistered, they will remain in the
subsystem. Any subsequent access to the sysfs brightness files will execute
raq_power_off_led_set() or raq_web_led_set() and attempt to write to the
unmapped led_port pointer, causing an invalid memory access.

Should this driver be updated to use devm_led_classdev_register() during
probe, or have a .remove callback added to ensure symmetric cleanup?

> -
> +MODULE_DESCRIPTION("LEDs driver for the Cobalt Raq series");
>  builtin_platform_driver(cobalt_raq_led_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725081349.8556=
-1-arun07172003@gmail.com?part=3D1
