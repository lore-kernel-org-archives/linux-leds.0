From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/2 v3] leds: add PM8058 LEDs driver
Date: Tue, 9 Aug 2016 22:15:35 -0700
Message-ID: <20160810051535.GJ26240@tuxbot>
References: <1470679911-13669-1-git-send-email-linus.walleij@linaro.org>
 <1470679911-13669-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f180.google.com ([209.85.192.180]:34017 "EHLO
	mail-pf0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933797AbcHJSYc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 10 Aug 2016 14:24:32 -0400
Received: by mail-pf0-f180.google.com with SMTP id p64so18340428pfb.1
        for <linux-leds@vger.kernel.org>; Wed, 10 Aug 2016 11:24:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1470679911-13669-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>

On Mon 08 Aug 11:11 PDT 2016, Linus Walleij wrote:

> This adds a driver for the six PM8058 LEDs, three ordinary LEDs,
> two "flash" LEDs and one "keypad" LED.
> 
> The "keypad" and "flash" LEDs are not really hard-wired to these
> usecases: for example on the APQ8060 Dragonboard, the "keypad"
> LED is instead used to drive an IR LED used for the proximity
> sensor. The "flash" LEDs are just ordinary high-current LED
> drivers.
> 
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
[..]
> diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
[..]
> +#include <linux/init.h>

I don't see any uses of this.

> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>

Dito

> +#include <linux/spinlock.h>

Dito

> +
> +#define PM8058_LED_TYPE_COMMON	0x00
> +#define PM8058_LED_TYPE_KEYPAD	0x01
> +#define PM8058_LED_TYPE_FLASH	0x02
> +
> +#define PM8058_LED_TYPE_COMMON_MASK	0xf8
> +#define PM8058_LED_TYPE_KEYPAD_MASK	0xf0
> +#define PM8058_LED_TYPE_COMMON_SHIFT	3
> +#define PM8058_LED_TYPE_KEYPAD_SHIFT	4
> +
> +struct pm8058_led {
> +	struct regmap *map;
> +	unsigned int reg;

reg should be u32, as you pass it to of_property_read_u32()

> +	u32 ledtype;
> +	struct led_classdev cdev;
> +};
> +
> +static void pm8058_led_set(struct led_classdev *cled,
> +	enum led_brightness value)
> +{
> +	struct pm8058_led *led;
> +	int ret = 0;
> +
> +	led = container_of(cled, struct pm8058_led, cdev);
> +	switch (led->ledtype) {
> +	case PM8058_LED_TYPE_COMMON:
> +		ret = regmap_update_bits(led->map, led->reg,
> +					 PM8058_LED_TYPE_COMMON_MASK,
> +					 value << PM8058_LED_TYPE_COMMON_SHIFT);
> +		break;
> +	case PM8058_LED_TYPE_KEYPAD:
> +	case PM8058_LED_TYPE_FLASH:
> +		ret = regmap_update_bits(led->map, led->reg,
> +					 PM8058_LED_TYPE_KEYPAD_MASK,
> +					 value << PM8058_LED_TYPE_KEYPAD_SHIFT);
> +		break;
> +	default:

"default" shouldn't ever happen, so I think you should have the switch
massage value and pick a mask and then move the regmap_update_bits()
after the switch.

> +		break;
> +	}
> +	if (ret)
> +		pr_err("Failed to set LED brightness\n");
> +}
> +
> +static enum led_brightness pm8058_led_get(struct led_classdev *cled)
> +{
> +	struct pm8058_led *led;
> +	int ret;
> +	u32 val;

regmap_read takes an unsigned int.

> +
> +	led = container_of(cled, struct pm8058_led, cdev);
> +	switch (led->ledtype) {
> +	case PM8058_LED_TYPE_COMMON:
> +		ret = regmap_read(led->map, led->reg, &val);
> +		if (ret) {
> +			pr_err("Failed to get LED brightness\n");
> +			return LED_OFF;
> +		}
> +		return ((val & PM8058_LED_TYPE_COMMON_MASK) >>
> +			PM8058_LED_TYPE_COMMON_SHIFT);
> +	case PM8058_LED_TYPE_KEYPAD:
> +	case PM8058_LED_TYPE_FLASH:
> +		ret = regmap_read(led->map, led->reg, &val);
> +		if (ret) {
> +			pr_err("Failed to get LED brightness\n");
> +			return LED_OFF;
> +		}
> +		return ((val & PM8058_LED_TYPE_KEYPAD_MASK) >>
> +			PM8058_LED_TYPE_KEYPAD_SHIFT);
> +	default:

"default" should never happen.

> +		break;
> +	}

I think you should move the read above the switch statement, then have
the cases massage the value and have a common return here.

regmap_read(&val)
if (error)
  ...

switch (type)
case ...:
  val &= MASK;
  val >>= SHIFT;
  break;
case ...;
  ...

return val;

Would look cleaner.

> +
> +	return LED_OFF;
> +}
> +
> +static const struct of_device_id pm8058_leds_id_table[] = {
> +	{
> +		.compatible = "qcom,pm8058-led",
> +		.data = (void *)PM8058_LED_TYPE_COMMON
> +	},
> +	{
> +		.compatible = "qcom,pm8058-keypad-led",
> +		.data = (void *)PM8058_LED_TYPE_KEYPAD
> +	},
> +	{
> +		.compatible = "qcom,pm8058-flash-led",
> +		.data = (void *)PM8058_LED_TYPE_FLASH
> +	},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, pm8058_leds_id_table);
> +
> +static int pm8058_led_probe(struct platform_device *pdev)
> +{
> +	struct pm8058_led *led;
> +	struct device_node *np = pdev->dev.of_node;
> +	int ret;
> +	struct regmap *map;
> +	const struct of_device_id *match;
> +	const char *state;
> +
> +	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
> +	if (led == NULL)

if (!led)

> +		return -ENOMEM;
> +
> +	match = of_match_node(pm8058_leds_id_table, np);
> +	if (!match)
> +		return -ENXIO;
> +	led->ledtype = (u32)match->data;

Use of_device_get_match_data() instead, then you can keep the
pm8058_leds_id_table at the bottom of the file.

> +
> +	map = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!map) {
> +		dev_err(&pdev->dev, "Parent regmap unavailable.\n");
> +		return -ENXIO;
> +	}
> +	led->map = map;
> +
> +	ret = of_property_read_u32(np, "reg", &led->reg);
> +	if (ret) {
> +		dev_err(&pdev->dev, "no register offset specified\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Use label else node name */
> +	led->cdev.name = of_get_property(np, "label", NULL) ? : np->name;
> +	led->cdev.default_trigger =
> +		of_get_property(np, "linux,default-trigger", NULL);
> +	led->cdev.brightness_set = pm8058_led_set;
> +	led->cdev.brightness_get = pm8058_led_get;
> +	led->cdev.max_brightness = 15;

For the "common" LED you have 5 bits of precision.

> +
> +	state = of_get_property(np, "default-state", NULL);
> +	if (state) {
> +		if (!strcmp(state, "keep")) {
> +			led->cdev.brightness = pm8058_led_get(&led->cdev);
> +		} else if (!strcmp(state, "on")) {
> +			led->cdev.brightness = LED_FULL;
> +			pm8058_led_set(&led->cdev, LED_FULL);

It's kinda ugly to let regmap_update_bits() shave off the upper 3 or 4
bits of LED_FULL. Perhaps pass max_brightness here instead?

There's no need to limit the paramter inside pm8058_led_set(), as
subsequent calls to set_brightness() will pass through a min(value,
max).

> +		} else {
> +			led->cdev.brightness = LED_OFF;
> +			pm8058_led_set(&led->cdev, LED_OFF);
> +		}
> +	}
> +	led->cdev.flags	= LED_CORE_SUSPENDRESUME;

I can see this being a feature for the keyboard and flash, but for the
"common" LEDs I don't think this is the right thing to do.

> +
> +	ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "unable to register led \"%s\"\n",
> +			led->cdev.name);
> +		return ret;
> +	}
> +	platform_set_drvdata(pdev, led);

You don't retrieve the drvdata, so no need to set it.

> +
> +	return 0;
> +}
> +
> +static struct platform_driver pm8058_led_driver = {
> +	.probe		= pm8058_led_probe,
> +	.driver		= {
> +		.name	= "pm8058-leds",
> +		.of_match_table = pm8058_leds_id_table,
> +	},
> +};
> +module_platform_driver(pm8058_led_driver);
> +
> +MODULE_DESCRIPTION("PM8058 LEDs driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:pm8058-leds");

Regards,
Bjorn
