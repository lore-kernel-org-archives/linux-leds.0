Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5CE3905E7
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825812; cv=none; b=DTd1jz4CWv+lQ/Md22bFFGUTHqT5rokQo/95H6MsDjhf8Pdp+rDYXwytL9TuCQQCNdQdTAehF+IIzevmfWyOLD0kvidO81Vcfvuu9sACLaYecpBX3ztXdT+pAtX7K1J48d3QktEuMdp8wuRIj9cX5pgifH0VWrXNbkznz/bIDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825812; c=relaxed/simple;
	bh=JyM8+QQ6RLczyyt6kS8bNAlbSv6H1wAaexldBeK/nvU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dq1i3u7dJuX/pIrS5yJGTz6lbjC276M42RTqYnEldDdpN49qBq3I0lVyfTexYft0zRIpvvF22dixjNd6pzIzyOAIRcOWHp2XNWb8n5lz4b2bRFb3xh4iVshYWmXNaiYkUfMRtQCIEj3fCqW3JiLop4lhhBySesDpgE5FcAdp+8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LbQomV/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LbQomV/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D619D1F000E9;
	Thu, 23 Jul 2026 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784825811;
	bh=FhQnqkyHC+8RlzXOL15ZK9oXiJK69AB8zNBPYZ3VNe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LbQomV/j5fec4ig4aYK/GdEEISYGFPFphAkQ7yRm4k0py7bYY+g7P3jiBIjRZOZLJ
	 sZtUmMkuKVdni1H+CfDgPpBsD5Xq2cqJD9TC56lBIYGlrHIcPefKZJOzvBBx50a3zI
	 29BEm/ajaXucz8g37e40oWLImnU86Tgv9hG/3YB3yshb6S67nZEHZMUBxGsMEjF1oy
	 rBhEvxum8qqUnj9V91voy0ODR+JflMUo/PdEgKfd1yrCeJ1KWoUhzpUqhK6I50OCHR
	 lvI/unJcy4z+fDBklLzVfKI81KwBtfhG2iHNMOSspkjxeshcu3qMG/EfYzBTSlP28q
	 8TUWUmW0HD+Pg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] leds: menf21bmc: convert to dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: Arunachalam <arun07172003@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260723164612.3146-3-arun07172003@gmail.com>
References: <20260723164612.3146-1-arun07172003@gmail.com>
 <20260723164612.3146-3-arun07172003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 16:56:50 +0000
Message-Id: <20260723165650.D619D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized.

Pre-existing issues:
- [Critical] The driver manages LED instances using a shared static global =
array `leds`, causing kernel list corruption and use-after-free crashes if =
multiple devices probe or unbind.
- [High] The LED brightness control callback `menf21bmc_led_set` sleeps but=
 is incorrectly assigned to the non-blocking `brightness_set` hook.
--

--- Patch [3]: [PATCH v2 3/4] leds: menf21bmc: convert to dev_err_probe() -=
--
commit 256232e59da7fa918a47e5b2a0fabb6d2df03b37
Author: Arunachalam <arun07172003@gmail.com>

leds: menf21bmc: convert to dev_err_probe()
   =20
Replace open-coded dev_err() + return pattern with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

> leds: menf21bmc: convert to dev_err_probe()

[Severity: Low]
This isn't a bug introduced by this patch, but subsystem guidelines mandate
that the description after the subsystem prefix must be capitalized for LED
drivers. Should this be "Convert to dev_err_probe()"?

> diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
> index 6b1b471606026..a7e4db4879d81 100644
> --- a/drivers/leds/leds-menf21bmc.c
> +++ b/drivers/leds/leds-menf21bmc.c
> @@ -84,10 +84,8 @@ static int menf21bmc_led_probe(struct platform_device =
*pdev)
>  		leds[i].cdev.brightness_set =3D menf21bmc_led_set;

[Severity: High]
This is a pre-existing issue, but does assigning menf21bmc_led_set to the
non-blocking brightness_set hook risk a scheduling while atomic panic?

If the LED is set to blink via sysfs, led_timer_function executes in atomic
softirq context and calls this brightness_set callback. However,
menf21bmc_led_set() takes a mutex and performs I2C transactions which can
sleep.

Should this be assigned to brightness_set_blocking instead?

>  		leds[i].i2c_client =3D i2c_client;
>  		ret =3D devm_led_classdev_register(&pdev->dev, &leds[i].cdev);

[Severity: Critical]
This is a pre-existing issue, but does registering a globally shared static
cdev object risk linked list corruption?

The driver manages LED instances using a single static global array (leds).
If multiple devices are probed or if a user unbinds and rebinds the device,
devm_led_classdev_register() will be called on the same leds[i].cdev
structure.

The LED core calls list_add_tail() on a node already in a linked list, which
corrupts the global leds_list.

> -		if (ret < 0) {
> -			dev_err(&pdev->dev, "failed to register LED device\n");
> -			return ret;
> -		}
> +		if (ret < 0)
> +			return dev_err_probe(&pdev->dev, ret, "failed to register LED device\=
n");
>  	}
>  	dev_info(&pdev->dev, "MEN 140F21P00 BMC LED device enabled\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723164612.3146=
-1-arun07172003@gmail.com?part=3D3
