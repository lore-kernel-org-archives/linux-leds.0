Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B54547D935
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395948; cv=none; b=Wic4gEGiG9EdU+grhf8QHiIu7MPXq69MYcpJOlg5tTnFMlP6Ci5ad+DivnWgMNXekNmthppRF1nPuXaWDWo/MHeQtO+wycZTikGY0PePHHDE4wsIOdflhOAyH8oFl485mTWb6k2SyVhtTWBzp5V499NcCQEWf5WjKdfbjLELDDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395948; c=relaxed/simple;
	bh=psWYTYz3nIq+mCntX14nnF6yeFr11+ZDjPHdHV711W4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=swYkJNzwT4gtNmKcTsp+uVli2kMesI5kZYKObkL8Tvxn83oBZBXi0//AeuUldDP8U7HQqp2aQdGUAJSu99ThIdIdN0AU4jLJ6Qa9Is000B48At0s42m07+AJGY7pF2t023wVuEKYLOLqEdc61Et6SrrjG+UUQAPnYMMPdp2duBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0PLJ3M9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0PLJ3M9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E79D1F000FF;
	Mon, 14 Sep 2026 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789395946;
	bh=Ou5V5U4QbtMWrcc5I9YxQ7tQqjwdl9md8Ha9yGfaWag=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K0PLJ3M9JVRXqLKzAPk4zOIzQEnFgGjVYiFssZOCbo/hPzr//28X7YT/x0T8/AK2H
	 fdrl60vmJW1CqddvSVfaoqtdR588anI8sZvaUTqRoZJiD4EoF1OOJxj0FuaDx+ILLu
	 JILyduBAZDA5rWMdz2JrNfc4JnVt2hE5T/+EYjUMO/O00qdwn3UOeZX6fvM1rg7kch
	 wJb+1HcizWQPN4PnewUsczIuWTHduN078FCZl1niyE93nqgMqme2f7NWm+RgIajjB3
	 fgG/fr3CBUuJZzhYs5eChU4CF3D5ibnjbRXZNopKeFJMPz2Ia1Vrf5ol6N3eoUreK2
	 ewMmcpmqdfMKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: flash: sgm3140: fix child node reference leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260914135723.1741327-1-lgs201920130244@gmail.com>
References: <20260914135723.1741327-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:25:46 +0000
Message-Id: <20260914142546.9E79D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] Non-capitalized description in commit message.

Pre-existing issues:
- [High] Use-After-Free of driver private data (priv) due to missing or inc=
orrectly ordered del_timer_sync() for powerdown_timer.
- [High] The powerdown timer callback calls regulator_disable(), which can =
sleep, from atomic context.
- [High] Unbalanced regulator_disable() in timer handler due to missing tim=
er cancellation in brightness_set(LED_OFF).
--

commit ee14e99da842d6c5f84775b78b062eac6483dedf
Author: Guangshuo Li <lgs201920130244@gmail.com>

leds: flash: sgm3140: fix child node reference leak

This commit fixes a missing fwnode_handle_put() call in the successful
probe path to avoid leaking a reference to the LED child node.

> leds: flash: sgm3140: fix child node reference leak

[Severity: Low]
This isn't a bug introduced by this patch, but the subsystem guidelines
mandate capitalizing the description after the subsystem prefix. Could
"fix" be capitalized to "Fix"?

> diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-=
sgm3140.c
> index d3a30ad94ac46..ab649e2c8f20a 100644
> --- a/drivers/leds/flash/leds-sgm3140.c
> +++ b/drivers/leds/flash/leds-sgm3140.c

[ ... ]

>  	/* Create V4L2 Flash subdev */
>  	priv->v4l2_flash =3D v4l2_flash_init(&pdev->dev,
>  					   child_node,
>  					   fled_cdev, NULL,
>  					   &v4l2_sd_cfg);
>  	if (IS_ERR(priv->v4l2_flash)) {
>  		ret =3D PTR_ERR(priv->v4l2_flash);
>  		goto err;
>  	}

[Severity: High]
This is a pre-existing issue, but I noticed the error path unwinds devm
allocations without canceling the powerdown timer.=20

Since devm_led_classdev_flash_register_ext() is called before this step,=20
userspace could theoretically trigger a flash strobe and arm the timer. If=
=20
v4l2_flash_init() fails and we take this error path, devres callbacks will=
=20
free the driver data. Could the timer expire later and access freed memory?

Also, looking at sgm3140_remove(), del_timer_sync() is called manually
before the devm-managed LED is unregistered. Could this create a race
window where the timer is re-armed before the driver fully unloads?

> =20
> -	return ret;
> +	fwnode_handle_put(child_node);
> +
> +	return 0;
> =20
>  err:
>  	fwnode_handle_put(child_node);

While reviewing the timer code, I also noticed a couple of other
pre-existing issues in the driver:

[Severity: High]
This is a pre-existing issue, but sgm3140_powerdown_timer() executes in
atomic context and calls regulator_disable(), which can sleep:

sgm3140_powerdown_timer()
   ...
   regulator_disable(priv->vin_regulator);

Can this lead to a scheduling while atomic panic when the timer expires?

[Severity: High]
This is a pre-existing issue, but sgm3140_brightness_set() disables the=20
regulator when setting LED_OFF without canceling the powerdown timer:

sgm3140_brightness_set()
   ...
   } else {
       gpiod_set_value_cansleep(priv->enable_gpio, 0);
       ret =3D regulator_disable(priv->vin_regulator);

If the timer was armed by a previous strobe, it will expire later and=20
unconditionally call regulator_disable() again:

sgm3140_powerdown_timer()
   ...
   regulator_disable(priv->vin_regulator);
  =20
Could this unbalanced regulator disable cause regulator core warnings or
unintended shutdown of shared regulators?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914135723.1741=
327-1-lgs201920130244@gmail.com?part=3D1
