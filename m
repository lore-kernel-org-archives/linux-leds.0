Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795693268;
	b=yd3YohhZ75cPUYXHRUsFUMeC8n0VWtyDfcsBvoRI39PFTTT/sfCaNNmQMRlViQTxjpO6
	 vpySpPyyjuOoP+5mQmT5PIltkiKLdluDf2E5fq92M1Z6ROdb9y6SbBWfyEk32lBlGFmBD
	 QstZkGdgROUvWwJk+9BfKYoweYUJOEPXMIC99rAK5Iemy5p/YqCIdlPIuUavxf77rFY0I
	 tK0v/fkP0nGP8DpifyW2bntQVuz0Pl5tJaeN9oU+1fenrAsDsa7ma6tBCs4ik607hRCvm
	 HIoTWSoEeC2IZESDt0lKbt2bE1tyBosVZQNssiV9OmGCSfyyK5FgUA+zOmwVpXiubvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795693268;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=4nofvEM/msSS7UH4Yyhr+3kuoc0g7IaNr2SvcswGg8U=;
	b=BI1HXLOBi10NBnqsgbqjEZKh9l9fCq6M2e/bsHDDOeKtX3aY/Z4OocIfJnyYpejP0dqI
	 EBKyNRTcfUXGwWm86q8qVNEy24ZFf4EgQ0n7Tyw0a+epg0/0YEDpvGBu3muyhItVuYBDc
	 VKTQo2UlzZRd27iCA6QVw+ZOwu5/OB62Pb825s0hGlNPX7RZEkO4PPhKa1pJFVqdui6Yu
	 AMXhOSXPGeYxZZkDMhz14A5H/FrmF9REe0XFceGDlmsfaGlAeGN9THXNCTywpvGcqqOff
	 C5Tb2+9MAxmqM7zVa0oEBVKVG7PHxx5+tEXQO1t4oUetnALtVGZiiep1zoPIiw0jHYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5KhAbfI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC6D606A32E;
	Thu, 26 Nov 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y5KhAbfI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D91C1F000C6;
	Thu, 26 Nov 2026 11:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795693268;
	bh=4nofvEM/msSS7UH4Yyhr+3kuoc0g7IaNr2SvcswGg8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5KhAbfIc6Lt0gOb3usxYSsSSwvZstu6CLdxjkkhKtIXi+ea2twZBhq2G8p22N6JG
	 53V4tzzEM4N1NrO49J+F1shLbncCKNXNMA6xsy8mSok2DWYshKADAUJ+ND+qL+KJ7L
	 k4KFe4cOLLyBCrazP0BU1mHmERUEM6ZPxWQip2qHuzHDTRfWjIJJVM1Jar91H++P06
	 sg0zqTzlu9/t7aRkNV4FT2WIn4ZVnuMkbWlEVSpO1hy9BQBLuGpih3AQhUcXbPxl1L
	 8nPW7VvKi3LoRG2IpXrtqT803SF6+vV2kZCN+KM7Xr93DDOKouJtl3+9/sfUJ1Hut8
	 Maoc+yV4dqorg==
Date: Thu, 26 Nov 2026 11:41:04 +0000
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: lm3533: Clean up probe and use managed
 helpers
Message-ID: <179510287166.63755.11402400428284590628@kernel.org>
References: <20261115084347.70592-1-clamor95@gmail.com>
 <20261115084347.70592-2-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115084347.70592-2-clamor95@gmail.com>
X-AI-Review-Draft: <20261115084347.70592-2-clamor95@gmail.com>

On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:

> Clean up the lm3533 LED driver probe and remove routines by adopting
> managed device helpers and modernizing error handling:
>
> - Introduce a local `struct device *dev` variable to clean up repeated
>   `&pdev->dev` references.
> - Use `dev_err_probe()` for cleaner error handling on invalid IDs and
>   LED class registration failures.
> - Switch to `devm_led_classdev_register()` to automatically handle LED
>   class device unregistration, removing the need for manual cleanup in
>   error paths and the `remove` hook.
> - Remove redundant `dev_dbg()` statements and cleanup unused cleanup
>   labels.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/leds/leds-lm3533.c | 48 +++++++++++---------------------------
>  1 file changed, 14 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index d5997cbd88dfc..7db1105bee5c2 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
> @@ -633,22 +633,19 @@ static int lm3533_led_setup(struct lm3533_led *led)
>
>  static int lm3533_led_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct lm3533 *lm3533;
>  	struct lm3533_led *led;
>  	int ret;
>
> -	dev_dbg(&pdev->dev, "%s\n", __func__);
> -
> -	lm3533 = dev_get_drvdata(pdev->dev.parent);
> +	lm3533 = dev_get_drvdata(dev->parent);
>  	if (!lm3533)
>  		return -EINVAL;
>
> -	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
> -		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
> -		return -EINVAL;
> -	}
> +	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT)
> +		return dev_err_probe(dev, -EINVAL, "Illegal LED id %d\n", pdev->id);
>
> -	led = devm_kzalloc_obj(&pdev->dev, *led);
> +	led = devm_kzalloc_obj(dev, *led);
>  	if (!led)
>  		return -ENOMEM;
>
> @@ -662,14 +659,12 @@ static int lm3533_led_probe(struct platform_device *pdev)
>  	led->cdev.groups = lm3533_led_attribute_groups;
>  	led->id = pdev->id;
>
> -	led->cdev.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-%d",
> -					pdev->name, led->id);
> +	led->cdev.name = devm_kasprintf(dev, GFP_KERNEL, "%s-%d", pdev->name, led->id);
>  	if (!led->cdev.name)
>  		return -ENOMEM;
>
>  	led->cdev.default_trigger = "none";
> -	device_property_read_string(&pdev->dev, "linux,default-trigger",
> -				    &led->cdev.default_trigger);
> +	device_property_read_string(dev, "linux,default-trigger", &led->cdev.default_trigger);
>
>  	mutex_init(&led->mutex);
>
> @@ -683,45 +678,30 @@ static int lm3533_led_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, led);
>
> -	ret = led_classdev_register(&pdev->dev, &led->cdev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to register LED %d\n", pdev->id);
> -		return ret;
> -	}
> +	ret = devm_led_classdev_register(dev, &led->cdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register LED %d\n", pdev->id);

Using devm_led_classdev_register() here while keeping lm3533_ctrlbank_disable()
in remove() reverses the teardown order: on unbind, the control bank will now be
disabled before the LED class device and its active triggers/sysfs attributes
are unregistered.

Also, shouldn't the hardware setup and lm3533_ctrlbank_enable() happen
before registering the LED class device (or be wrapped with
devm_add_action_or_reset() prior to registration) so that the teardown
order remains symmetric and the LED is ready as soon as it is exposed to
userspace?

-- 
Lee Jones
