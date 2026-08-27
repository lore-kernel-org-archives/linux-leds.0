Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB3A37A833;
	Thu, 27 Aug 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837742; cv=none; b=ILdcka/v4PAf7NxVsoxRCYgwV5pDHDrI6D8KTtnqIrY360uGrvgsRokC/MxlQLXZDTyGgb7EJh854/ITcFSArzXH+UFRHW9cIYiyiFok9UiPuvWIMf14PdKu7wEsLQgfSoy9cS/gMNRI+JKLcvSg/fpxmbBm4xP2z+ThD2U9010=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837742; c=relaxed/simple;
	bh=hDQ+41H6pqlenf/fEX/XsJwzo7qp1BFufnUbkakquxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhIGGlKdNy73THswEBMR61P/G6g8U6LpaDz4NFVZ+NoXXXshP3gMF3wy1zbhdF7XXZ6qinGNt+ZPUOvE0gzWkmuUk7a1WU1eX6ZUyxkwxjws7H1cPNZmWh4FyfgnnTruB0aSjwwWbXfhpg3E2IcNYtBld6BPFP7obhXXahtZUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ls8g2aV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ls8g2aV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35B41F000E9;
	Thu, 27 Aug 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787837738;
	bh=w8x8nXMDIkRBzPuT5NeZgVCnIFMDeUrXPZ2wXl7wF/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ls8g2aV/Xwc2ZPN2omsWkIk6XPceZFb6rWKF1UbAm3cab4nRcIobSnRi2pvUem0Ao
	 KvYGJz2ARTBEfkaCfdb0jGZuMQViYN0tybVVV5RbDU2hXoxaUOA5Bwq0zoCVuQqVV1
	 GzwiqxMA8iyZFx9n21n0AfDLa+DN3BBaAcfmcoZHQsQNKpJ9MX+E2wLZNjuCJYzMGQ
	 BOR3UbQLEpkH+8svZaSmFrjBP8hzAPgL5BSvost3NthtNwsZ7aIFp31lbF/Xl17sar
	 flJzyYQCce2xjiodQU/wKFobPJd2Uej4zFEdfqA5zEjSCYjDp/8LuNJ0xLfgO22WvQ
	 hdyTs2yYto/dw==
Date: Thu, 27 Aug 2026 14:35:35 +0100
From: Lee Jones <lee@kernel.org>
To: MYYDAQ <xmmntnbklsa917813@163.com>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: set max_brightness to 1 for on/off-only drivers
Message-ID: <20260827133535.GL770273@google.com>
References: <32a07f5e-eede-4c8a-acab-3f6c9bbab0d4@163.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32a07f5e-eede-4c8a-acab-3f6c9bbab0d4@163.com>

On Tue, 25 Aug 2026, MYYDAQ wrote:

> The following drivers implement their brightness_set() callback as a
> pure on/off switch: any nonzero brightness value turns the LED on, and
> there is no way to request intermediate levels.  They still keep the
> default max_brightness of LED_FULL (255), so user space writing e.g.
> "100" or "200" to the brightness sysfs attribute produces exactly the
> same hardware state, which is misleading and violates the first item of
> the drivers/leds/TODO list ("On/off LEDs should have max_brightness of
> 1").
> 
> Address this by setting max_brightness to 1 for all on/off-only LED
> drivers in drivers/leds, and by using LED_ON instead of LED_FULL for
> their initial brightness values and brightness_get() results:
> 
>   ariel, bcm6328, bcm6358, cobalt-qube, cobalt-raq, hp6xx,
>   ipaq-micro, locomo, menf21bmc, net48xx, ot200, rb532, ss4200,
>   syscon, wrap

I'm guessing this patch was created with AI, right?

> Signed-off-by: MYYDAQ <xmmntnbklsa917813@163.com>

Could you please sign off using your full, real name? The 'Signed-off-by' tag
requires a real name rather than a pseudonym or username.

> ---
>  drivers/leds/leds-ariel.c       | 1 +
>  drivers/leds/leds-bcm6328.c     | 3 ++-
>  drivers/leds/leds-bcm6358.c     | 3 ++-
>  drivers/leds/leds-cobalt-qube.c | 3 ++-
>  drivers/leds/leds-cobalt-raq.c  | 2 ++
>  drivers/leds/leds-hp6xx.c       | 2 ++
>  drivers/leds/leds-ipaq-micro.c  | 1 +
>  drivers/leds/leds-locomo.c      | 2 ++
>  drivers/leds/leds-menf21bmc.c   | 1 +
>  drivers/leds/leds-net48xx.c     | 1 +
>  drivers/leds/leds-ot200.c       | 1 +
>  drivers/leds/leds-rb532.c       | 3 ++-
>  drivers/leds/leds-ss4200.c      | 6 ++++--
>  drivers/leds/leds-syscon.c      | 1 +
>  drivers/leds/leds-wrap.c        | 3 +++
>  15 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
> index dd319c7..9f1a11d 100644
> --- a/drivers/leds/leds-ariel.c
> +++ b/drivers/leds/leds-ariel.c
> @@ -111,6 +111,7 @@ static int ariel_led_probe(struct platform_device *pdev)
>          leds[i].led_cdev.brightness_get = ariel_led_get;
>          leds[i].led_cdev.brightness_set = ariel_led_set;
>          leds[i].led_cdev.blink_set = ariel_blink_set;
> +        leds[i].led_cdev.max_brightness = 1;

Use tabs, not spaces.

Did you run `checkpatch.pl`?

>          ret = devm_led_classdev_register(dev, &leds[i].led_cdev);
>          if (ret)
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
> index 592bbf4..0ccffc6 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -366,7 +366,7 @@ static int bcm6328_led(struct device *dev, struct
> device_node *nc, u32 reg,
>          val &= BCM6328_LED_MODE_MASK;
>          if ((led->active_low && val == BCM6328_LED_MODE_OFF) ||
>              (!led->active_low && val == BCM6328_LED_MODE_ON))
> -            led->cdev.brightness = LED_FULL;
> +            led->cdev.brightness = LED_ON;
>          else
>              led->cdev.brightness = LED_OFF;
>          break;
> @@ -378,6 +378,7 @@ static int bcm6328_led(struct device *dev, struct
> device_node *nc, u32 reg,
> 
>      led->cdev.brightness_set = bcm6328_led_set;
>      led->cdev.blink_set = bcm6328_blink_set;
> +    led->cdev.max_brightness = 1;
> 
>      rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
>      if (rc < 0)
> diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
> index 51fcff2..291a587 100644
> --- a/drivers/leds/leds-bcm6358.c
> +++ b/drivers/leds/leds-bcm6358.c
> @@ -122,7 +122,7 @@ static int bcm6358_led(struct device *dev, struct
> device_node *nc, u32 reg,
>          val = bcm6358_led_read(led->mem + BCM6358_REG_MODE);
>          val &= BIT(led->pin);
>          if ((led->active_low && !val) || (!led->active_low && val))
> -            led->cdev.brightness = LED_FULL;
> +            led->cdev.brightness = LED_ON;
>          else
>              led->cdev.brightness = LED_OFF;
>          break;
> @@ -133,6 +133,7 @@ static int bcm6358_led(struct device *dev, struct
> device_node *nc, u32 reg,
>      bcm6358_led_set(&led->cdev, led->cdev.brightness);
> 
>      led->cdev.brightness_set = bcm6358_led_set;
> +    led->cdev.max_brightness = 1;
> 
>      rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
>      if (rc < 0)
> diff --git a/drivers/leds/leds-cobalt-qube.c
> b/drivers/leds/leds-cobalt-qube.c
> index ef22e1e..204d69e 100644
> --- a/drivers/leds/leds-cobalt-qube.c
> +++ b/drivers/leds/leds-cobalt-qube.c
> @@ -29,7 +29,8 @@ static void qube_front_led_set(struct led_classdev
> *led_cdev,
> 
>  static struct led_classdev qube_front_led = {
>      .name            = "qube::front",
> -    .brightness        = LED_FULL,
> +    .brightness        = LED_ON,
> +    .max_brightness        = 1,

Some odd alignment issues going on here.

>      .brightness_set        = qube_front_led_set,
>      .default_trigger    = "default-on",
>  };
> diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
> index 045c239..4d1735d 100644
> --- a/drivers/leds/leds-cobalt-raq.c
> +++ b/drivers/leds/leds-cobalt-raq.c
> @@ -39,6 +39,7 @@ static void raq_web_led_set(struct led_classdev *led_cdev,
>  static struct led_classdev raq_web_led = {
>      .name        = "raq::web",
>      .brightness_set    = raq_web_led_set,
> +    .max_brightness    = 1,
>  };
> 
>  static void raq_power_off_led_set(struct led_classdev *led_cdev,
> @@ -60,6 +61,7 @@ static void raq_power_off_led_set(struct led_classdev
> *led_cdev,
>  static struct led_classdev raq_power_off_led = {
>      .name            = "raq::power-off",
>      .brightness_set        = raq_power_off_led_set,
> +    .max_brightness        = 1,
>      .default_trigger    = "power-off",
>  };
> 
> diff --git a/drivers/leds/leds-hp6xx.c b/drivers/leds/leds-hp6xx.c
> index 54af9e6..03a2638 100644
> --- a/drivers/leds/leds-hp6xx.c
> +++ b/drivers/leds/leds-hp6xx.c
> @@ -42,6 +42,7 @@ static struct led_classdev hp6xx_red_led = {
>      .name            = "hp6xx:red",
>      .default_trigger    = "hp6xx-charge",
>      .brightness_set        = hp6xxled_red_set,
> +    .max_brightness        = 1,
>      .flags            = LED_CORE_SUSPENDRESUME,
>  };
> 
> @@ -49,6 +50,7 @@ static struct led_classdev hp6xx_green_led = {
>      .name            = "hp6xx:green",
>      .default_trigger    = "disk-activity",
>      .brightness_set        = hp6xxled_green_set,
> +    .max_brightness        = 1,
>      .flags            = LED_CORE_SUSPENDRESUME,
>  };
> 
> diff --git a/drivers/leds/leds-ipaq-micro.c b/drivers/leds/leds-ipaq-micro.c
> index 504a95b..aae3e13 100644
> --- a/drivers/leds/leds-ipaq-micro.c
> +++ b/drivers/leds/leds-ipaq-micro.c
> @@ -102,6 +102,7 @@ static struct led_classdev micro_led = {
>      .name            = "led-ipaq-micro",
>      .brightness_set_blocking = micro_leds_brightness_set,
>      .blink_set        = micro_leds_blink_set,
> +    .max_brightness        = 1,
>      .flags            = LED_CORE_SUSPENDRESUME,
>  };
> 
> diff --git a/drivers/leds/leds-locomo.c b/drivers/leds/leds-locomo.c
> index 9aa3fcc..8dc162f 100644
> --- a/drivers/leds/leds-locomo.c
> +++ b/drivers/leds/leds-locomo.c
> @@ -43,12 +43,14 @@ static struct led_classdev locomo_led0 = {
>      .name            = "locomo:amber:charge",
>      .default_trigger    = "main-battery-charging",
>      .brightness_set        = locomoled_brightness_set0,
> +    .max_brightness        = 1,
>  };
> 
>  static struct led_classdev locomo_led1 = {
>      .name            = "locomo:green:mail",
>      .default_trigger    = "nand-disk",
>      .brightness_set        = locomoled_brightness_set1,
> +    .max_brightness        = 1,
>  };
> 
>  static int locomoled_probe(struct locomo_dev *ldev)
> diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
> index 6b1b471..8d7b234 100644
> --- a/drivers/leds/leds-menf21bmc.c
> +++ b/drivers/leds/leds-menf21bmc.c
> @@ -82,6 +82,7 @@ static int menf21bmc_led_probe(struct platform_device
> *pdev)
>      for (i = 0; i < ARRAY_SIZE(leds); i++) {
>          leds[i].cdev.name = leds[i].name;
>          leds[i].cdev.brightness_set = menf21bmc_led_set;
> +        leds[i].cdev.max_brightness = 1;
>          leds[i].i2c_client = i2c_client;
>          ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
>          if (ret < 0) {
> diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
> index a93468c..1dd9dc5 100644
> --- a/drivers/leds/leds-net48xx.c
> +++ b/drivers/leds/leds-net48xx.c
> @@ -31,6 +31,7 @@ static void net48xx_error_led_set(struct led_classdev
> *led_cdev,
>  static struct led_classdev net48xx_error_led = {
>      .name        = "net48xx::error",
>      .brightness_set    = net48xx_error_led_set,
> +    .max_brightness    = 1,
>      .flags        = LED_CORE_SUSPENDRESUME,
>  };
> 
> diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
> index 12af112..17b72e3 100644
> --- a/drivers/leds/leds-ot200.c
> +++ b/drivers/leds/leds-ot200.c
> @@ -123,6 +123,7 @@ static int ot200_led_probe(struct platform_device *pdev)
> 
>          leds[i].cdev.name = leds[i].name;
>          leds[i].cdev.brightness_set = ot200_led_brightness_set;
> +        leds[i].cdev.max_brightness = 1;
> 
>          ret = devm_led_classdev_register(&pdev->dev, &leds[i].cdev);
>          if (ret < 0)
> diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
> index 782e1c1..aba17f5 100644
> --- a/drivers/leds/leds-rb532.c
> +++ b/drivers/leds/leds-rb532.c
> @@ -27,12 +27,13 @@ static void rb532_led_set(struct led_classdev *cdev,
> 
>  static enum led_brightness rb532_led_get(struct led_classdev *cdev)
>  {
> -    return (get_latch_u5() & LO_ULED) ? LED_FULL : LED_OFF;
> +    return (get_latch_u5() & LO_ULED) ? LED_ON : LED_OFF;
>  }
> 
>  static struct led_classdev rb532_uled = {
>      .name = "uled",
>      .brightness_set = rb532_led_set,
> +    .max_brightness = 1,
>      .brightness_get = rb532_led_get,
>      .default_trigger = "nand-disk",
>  };
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index f24ca75..726b608 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -214,7 +214,8 @@ static u32 nasgpio_led_get_attr(struct led_classdev
> *led_cdev, u32 port)
>  /*
>   * There is actual brightness control in the hardware,
>   * but it is via smbus commands and not implemented
> - * in this driver.
> + * in this driver, so the LED is treated as on/off and
> + * max_brightness is set to 1.
>   */
>  static void nasgpio_led_set_brightness(struct led_classdev *led_cdev,
>                         enum led_brightness brightness)
> @@ -487,9 +488,10 @@ static int register_nasgpio_led(int led_nr)
>      led->name = nas_led->name;
>      led->brightness = LED_OFF;
>      if (nasgpio_led_get_attr(led, GP_LVL))
> -        led->brightness = LED_FULL;
> +        led->brightness = LED_ON;
>      led->brightness_set = nasgpio_led_set_brightness;
>      led->blink_set = nasgpio_led_set_blink;
> +    led->max_brightness = 1;
>      led->groups = nasgpio_led_groups;
> 
>      return led_classdev_register(&nas_gpio_pci_dev->dev, led);
> diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
> index d633ad5..acee7db 100644
> --- a/drivers/leds/leds-syscon.c
> +++ b/drivers/leds/leds-syscon.c
> @@ -110,6 +110,7 @@ static int syscon_led_probe(struct platform_device
> *pdev)
>          sled->state = false;
>      }
>      sled->cdev.brightness_set = syscon_led_set;
> +    sled->cdev.max_brightness = 1;
> 
>      ret = devm_led_classdev_register_ext(dev, &sled->cdev, &init_data);
>      if (ret < 0)
> diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
> index 794697e..348c06b 100644
> --- a/drivers/leds/leds-wrap.c
> +++ b/drivers/leds/leds-wrap.c
> @@ -53,6 +53,7 @@ static void wrap_extra_led_set(struct led_classdev
> *led_cdev,
>  static struct led_classdev wrap_power_led = {
>      .name            = "wrap::power",
>      .brightness_set        = wrap_power_led_set,
> +    .max_brightness        = 1,
>      .default_trigger    = "default-on",
>      .flags            = LED_CORE_SUSPENDRESUME,
>  };
> @@ -60,12 +61,14 @@ static struct led_classdev wrap_power_led = {
>  static struct led_classdev wrap_error_led = {
>      .name        = "wrap::error",
>      .brightness_set    = wrap_error_led_set,
> +    .max_brightness    = 1,
>      .flags            = LED_CORE_SUSPENDRESUME,
>  };
> 
>  static struct led_classdev wrap_extra_led = {
>      .name           = "wrap::extra",
>      .brightness_set = wrap_extra_led_set,
> +    .max_brightness = 1,
>      .flags            = LED_CORE_SUSPENDRESUME,
>  };
> 

-- 
Lee Jones
