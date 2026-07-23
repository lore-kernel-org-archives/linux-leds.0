Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640A39524B
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825813; cv=none; b=qpYcRQLNm5ZZZX31sDrASbHDrexNG2Bj6Krxa1sDW/F2NX8O/ckWEmaLRVaeAbs0V5QimMz32QyoA1u/rLfCdGIkNyxDkGWOuSwqojh7uvHDQ5qw8IDkJKqYFk6jxBz/VI/yFBBDwn1bQpvsXjNafIMqWCl/VXGW6WlvxacvvCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825813; c=relaxed/simple;
	bh=h3ZzUd4+1Z7ojOIJrmrQvGJ7BG7AHu8lgINAlr/8wdo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KEjWMk9luirDxW9Po8YSPWpMO7aRjGwxZHh3Haclpj0pYrSM4gRp7jYMyHfvhPYnPqRveSposq8nRsJyAeYnncCXo4rszkDA8I9kve1csIMecr4QgDhRhrPn6CTtlYm4aTw5ehlnSBvPzNdq9mXJURQrQfpqXg3aqgDkNFBOauM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRDF2aCN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRDF2aCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6501F00A3A;
	Thu, 23 Jul 2026 16:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784825811;
	bh=s1UdVqE35qqF8Lf89zgSEG50GOKee5MOJkhSsTmnzYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NRDF2aCNsB9GG5StMoUtZX/QZGDQjcfSq8EuB8Xf5BVOxEfzPXQMVWlwxVL2gVThS
	 uLr7DwjvjDo18IOsbgg3WaB5dvkA5Ulk9+0h6KweH8+hkjSqSK+3nYWoRgPxoyuw+g
	 2Llfcp3QxwWGPdZBOZd8tIaTlHZoo24v1zQkPezwBY7py4p3lpeV/9LLx5AzmJI8O3
	 lu/VuKT28xyxyH9muN0sXJA4uMAyNpj2Zy6rMdV5Bw+5+qgBTYFrut2C+kOZ53r4N3
	 vLSUTQzWwcyRJHrn3aEqioTQkhImGcVuCqAdZ4MYwqEUZKGKcAmVwius/csJaPjn1H
	 W9HFFix/SuWtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] leds: cobalt-raq: add missing MODULE_DESCRIPTION
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260723164612.3146-1-arun07172003@gmail.com>
References: <20260723164612.3146-1-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:56:51 +0000
Message-Id: <20260723165651.8E6501F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The commit message claims MODULE_DESCRIPTION is required by modpost=
 for this driver, but the driver is unconditionally built-in.
- [Low] The commit message description is not capitalized, violating subsys=
tem guidelines.

Pre-existing issues:
- [High] Unmanaged LED registration combined with managed memory mapping wi=
thout a `.remove` callback leads to a use-after-free on device unbind.
--

--- Patch [1]: [PATCH v2 1/4] leds: cobalt-raq: add missing MODULE_DESCRIPT=
ION ---
commit f1b0026d062cbcf0e980882e66d901b8eb8e018f
Author: Arunachalam <arun07172003@gmail.com>

leds: cobalt-raq: add missing MODULE_DESCRIPTION

Add the missing MODULE_DESCRIPTION() macro, which is required by
modpost and was missing from this driver.

> leds: cobalt-raq: add missing MODULE_DESCRIPTION

[Severity: Low]
This isn't a bug, but the subsystem guidelines request capitalizing the
description after the prefix. Should this be "Add missing MODULE_DESCRIPTIO=
N"?

> Add the missing MODULE_DESCRIPTION() macro, which is required by
> modpost and was missing from this driver.

[Severity: Low]
Is this description accurate? This driver is defined as a bool in Kconfig,
meaning it can only be built-in. Modpost only checks for MODULE_DESCRIPTION
in loadable modules, so is this macro actually required here?

> diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-ra=
q.c
> index 045c239c7328e..5b5acaa8c3215 100644
> --- a/drivers/leds/leds-cobalt-raq.c
> +++ b/drivers/leds/leds-cobalt-raq.c
> @@ -101,5 +101,5 @@ static struct platform_driver cobalt_raq_led_driver =
=3D {
>  		.name	=3D "cobalt-raq-leds",
>  	},
>  };

[Severity: High]
This is a pre-existing issue, but does the lack of a .remove callback here
leave a use-after-free window?

If a privileged user unbinds the driver via sysfs, the driver core will
automatically release devm resources, unmapping led_port. Since the LEDs we=
re
registered with led_classdev_register() in cobalt_raq_led_probe() without
using the managed API, they remain registered.

Would a subsequent write to the LED's brightness file trigger
raq_web_led_set() and write to the now-unmapped led_port?

> -
> +MODULE_DESCRIPTION("LEDs driver for the Cobalt Raq series");
>  builtin_platform_driver(cobalt_raq_led_driver);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723164612.3146=
-1-arun07172003@gmail.com?part=3D1
