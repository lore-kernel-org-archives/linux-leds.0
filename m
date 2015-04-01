From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v5 3/3] leds: Add ktd2692 flash LED driver
Date: Wed, 01 Apr 2015 08:47:41 +0200
Message-ID: <551B948D.5060905@samsung.com>
References: <1427860708-32559-1-git-send-email-ingi2.kim@samsung.com>
 <1427860708-32559-4-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40058 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097AbbDAGrq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 1 Apr 2015 02:47:46 -0400
In-reply-to: <1427860708-32559-4-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, varkabhadram@gmail.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Ingi,

On 04/01/2015 05:58 AM, Ingi Kim wrote:
> This patch adds a driver to support the ktd2692 flash LEDs.
> ktd2692 can control flash current by ExpressWire interface.
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> ---
>   drivers/leds/Kconfig        |   9 +
>   drivers/leds/Makefile       |   1 +
>   drivers/leds/leds-ktd2692.c | 405 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 415 insertions(+)
>   create mode 100644 drivers/leds/leds-ktd2692.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 25b320d..c32e73e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -498,6 +498,15 @@ config LEDS_MENF21BMC
>   	  This driver can also be built as a module. If so the module
>   	  will be called leds-menf21bmc.
>
> +config LEDS_KTD2692
> +	tristate "KTD2692 LED flash support"
> +	depends on LEDS_CLASS_FLASH && GPIOLIB
> +	help
> +	  This option enables support for KTD2692 LED flash connected
> +	  through ExpressWire interface.
> +
> +	  Say Y to enable this driver.
> +
>   comment "LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)"
>
>   config LEDS_BLINKM
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index cbba921..289513b 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -58,6 +58,7 @@ obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
>   obj-$(CONFIG_LEDS_SYSCON)		+= leds-syscon.o
>   obj-$(CONFIG_LEDS_VERSATILE)		+= leds-versatile.o
>   obj-$(CONFIG_LEDS_MENF21BMC)		+= leds-menf21bmc.o
> +obj-$(CONFIG_LEDS_KTD2692)		+= leds-ktd2692.o
>
>   # LED SPI Drivers
>   obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
> new file mode 100644
> index 0000000..558e2b9
> --- /dev/null
> +++ b/drivers/leds/leds-ktd2692.c
> @@ -0,0 +1,405 @@
> +/*
> + * LED driver : leds-ktd2692.c
> + *
> + * Copyright (C) 2015 Samsung Electronics
> + * Ingi Kim <ingi2.kim@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/led-class-flash.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/workqueue.h>
> +
> +/* Value related the flash mode */
> +#define KTD2692_FLASH_MODE_TIMEOUT_LEVELS	8
> +#define KTD2692_FLASH_MODE_TIMEOUT_DISABLE	0
> +#define KTD2692_FLASH_MODE_TIMEOUT_DEFAULT_US	1049000
> +#define KTD2692_FLASH_MODE_TIMEOUT_MAX_US	1835000
> +#define KTD2692_FLASH_MODE_CURR_PERCENT(x)	(((x) * 16) / 100)
> +
> +/* Macro for getting offset of flash timeout */
> +#define GET_TIMEOUT_OFFSET(timeout, step)	((timeout) / (step))
> +
> +/* Adjust a multiple of brightness */
> +#define KTD2692_BRIGHTNESS_RANGE_255_TO_16(x)	(((x) >> 4) & 0x0F)
> +#define KTD2692_BRIGHTNESS_RANGE_255_TO_8(x)	(((x) >> 5) & 0x0F)
> +#define KTD2692_BRIGHTNESS_RANGE_255_TO_4(x)	(((x) >> 6) & 0x0F)
> +
> +/* Base register address */
> +#define KTD2692_REG_LVP_BASE			0x00
> +#define KTD2692_REG_FLASH_TIMEOUT_BASE		0x20
> +#define KTD2692_REG_MIN_CURRENT_SET_BASE	0x40
> +#define KTD2692_REG_MOVIE_CURRENT_BASE		0x60
> +#define KTD2692_REG_FLASH_CURRENT_BASE		0x80
> +#define KTD2692_REG_MODE_BASE			0xA0
> +
> +/* Set bit coding time for expresswire interface */
> +#define KTD2692_TIME_RESET_US			700
> +#define KTD2692_TIME_DATA_START_TIME_US		10
> +#define KTD2692_TIME_HIGH_END_OF_DATA_US	350
> +#define KTD2692_TIME_LOW_END_OF_DATA_US		10
> +#define KTD2692_TIME_SHORT_BITSET_US		4
> +#define KTD2692_TIME_LONG_BITSET_US		12
> +
> +/* KTD2692 default length of name */
> +#define KTD2692_NAME_LENGTH			20
> +
> +/* KTD2692 default name */
> +#define KTD2692_DEFAULT_NAME			"ktd2692"
> +
> +enum ktd2692_bitset {
> +	KTD2692_LOW = 0,
> +	KTD2692_HIGH,
> +};
> +
> +/* Movie / Flash Mode Control */
> +enum ktd2692_led_mode {
> +	KTD2692_MODE_DISABLE = 0,	/* default */
> +	KTD2692_MODE_MOVIE,
> +	KTD2692_MODE_FLASH,
> +};
> +
> +struct ktd2692_context {
> +	/* Related LED Flash class device */
> +	struct led_classdev_flash fled_cdev;
> +
> +	struct mutex lock;
> +	struct regulator *regulator;
> +	struct work_struct work_brightness_set;
> +
> +	int aux_gpio;
> +	int ctrl_gpio;
> +
> +	enum ktd2692_led_mode mode;
> +	enum led_brightness torch_brightness;
> +};
> +
> +static struct ktd2692_context *fled_cdev_to_led(
> +				struct led_classdev_flash *fled_cdev)
> +{
> +	return container_of(fled_cdev, struct ktd2692_context, fled_cdev);
> +}
> +
> +static void ktd2692_expresswire_start(struct ktd2692_context *led)
> +{
> +	gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
> +	udelay(KTD2692_TIME_DATA_START_TIME_US);
> +}
> +
> +static void ktd2692_expresswire_reset(struct ktd2692_context *led)
> +{
> +	gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
> +	udelay(KTD2692_TIME_RESET_US);
> +}
> +
> +static void ktd2692_expresswire_end(struct ktd2692_context *led)
> +{
> +	gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
> +	udelay(KTD2692_TIME_LOW_END_OF_DATA_US);
> +	gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
> +	udelay(KTD2692_TIME_HIGH_END_OF_DATA_US);
> +}
> +
> +static void ktd2692_expresswire_set_bit(struct ktd2692_context *led, bool bit)
> +{
> +	/*
> +	 * The Low Bit(0) and High Bit(1) is based on a time detection
> +	 * algorithm between time low and time high
> +	 * Time_(L_LB) : Low time of the Low Bit(0)
> +	 * Time_(H_LB) : High time of the LOW Bit(0)
> +	 * Time_(L_HB) : Low time of the High Bit(1)
> +	 * Time_(H_HB) : High time of the High Bit(1)
> +	 *
> +	 * It can be simplified to:
> +	 * Low Bit(0) : 2 * Time_(H_LB) < Time_(L_LB)
> +	 * High Bit(1) : 2 * Time_(L_HB) < Time_(H_HB)
> +	 * HIGH  ___           ____    _..     _________    ___
> +	 *          |_________|    |_..  |____|         |__|
> +	 * LOW        <L_LB>  <H_LB>     <L_HB>  <H_HB>
> +	 *          [  Low Bit (0) ]     [  High Bit(1) ]
> +	 */
> +	if (bit) {
> +		gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
> +		udelay(KTD2692_TIME_SHORT_BITSET_US);
> +		gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
> +		udelay(KTD2692_TIME_LONG_BITSET_US);
> +	} else {
> +		gpio_set_value(led->ctrl_gpio, KTD2692_LOW);
> +		udelay(KTD2692_TIME_LONG_BITSET_US);
> +		gpio_set_value(led->ctrl_gpio, KTD2692_HIGH);
> +		udelay(KTD2692_TIME_SHORT_BITSET_US);
> +	}
> +}
> +
> +static void ktd2692_expresswire_write(struct ktd2692_context *led, u8 value)
> +{
> +	int i;
> +
> +	ktd2692_expresswire_start(led);
> +	for (i = 7; i >= 0; i--)
> +		ktd2692_expresswire_set_bit(led, value & BIT(i));
> +	ktd2692_expresswire_end(led);
> +}
> +
> +static void ktd2692_brightness_set(struct ktd2692_context *led,
> +					enum led_brightness brightness)
> +{
> +	mutex_lock(&led->lock);
> +
> +	if (brightness == LED_OFF) {
> +		led->mode = KTD2692_MODE_DISABLE;
> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
> +		goto out;
> +	}
> +
> +	ktd2692_expresswire_write(led, KTD2692_REG_MOVIE_CURRENT_BASE |
> +				KTD2692_BRIGHTNESS_RANGE_255_TO_8(brightness));
> +	led->mode = KTD2692_MODE_MOVIE;
> +
> +out:
> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
> +	mutex_unlock(&led->lock);
> +}
> +
> +static void ktd2692_brightness_set_work(struct work_struct *work)
> +{
> +	struct ktd2692_context *led =
> +		container_of(work, struct ktd2692_context, work_brightness_set);
> +
> +	ktd2692_brightness_set(led, led->torch_brightness);
> +}
> +
> +static void ktd2692_led_brightness_set(struct led_classdev *led_cdev,
> +					enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
> +	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
> +
> +	led->torch_brightness = brightness;
> +	schedule_work(&led->work_brightness_set);
> +}
> +
> +static int ktd2692_led_brightness_set_sync(struct led_classdev *led_cdev,
> +					enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
> +	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
> +
> +	ktd2692_brightness_set(led, brightness);
> +
> +	return 0;
> +}
> +
> +static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
> +						bool state)
> +{
> +	struct ktd2692_context *led = fled_cdev_to_led(fled_cdev);
> +	struct led_flash_setting *timeout = &fled_cdev->timeout;
> +	u32 flash_tm_reg;
> +
> +	mutex_lock(&led->lock);
> +
> +	if (state == 0) {
> +		led->mode = KTD2692_MODE_DISABLE;
> +		gpio_set_value(led->aux_gpio, KTD2692_LOW);
> +		goto done;
> +	}
> +
> +	flash_tm_reg = GET_TIMEOUT_OFFSET(timeout->val, timeout->step);
> +	ktd2692_expresswire_write(led, flash_tm_reg
> +			| KTD2692_REG_FLASH_TIMEOUT_BASE);
> +
> +	led->mode = KTD2692_MODE_FLASH;
> +	gpio_set_value(led->aux_gpio, KTD2692_HIGH);
> +
> +done:
> +	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
> +
> +	fled_cdev->led_cdev.brightness = LED_OFF;
> +	led->mode = KTD2692_MODE_DISABLE;
> +
> +	mutex_unlock(&led->lock);
> +
> +	return 0;
> +}
> +
> +static int ktd2692_led_flash_timeout_set(struct led_classdev_flash *fled_cdev,
> +						u32 timeout)
> +{
> +	return 0;
> +}
> +
> +static void ktd2692_init_flash_timeout(u32 flash_timeout_us,
> +					struct led_flash_setting *setting)
> +{
> +	setting->min = KTD2692_FLASH_MODE_TIMEOUT_DISABLE;
> +	setting->max = KTD2692_FLASH_MODE_TIMEOUT_MAX_US;
> +	setting->step = KTD2692_FLASH_MODE_TIMEOUT_MAX_US
> +			/ (KTD2692_FLASH_MODE_TIMEOUT_LEVELS - 1);
> +	setting->val = flash_timeout_us;
> +}
> +
> +static void ktd2692_setup(struct ktd2692_context *led)
> +{
> +	led->mode = KTD2692_MODE_DISABLE;
> +	ktd2692_expresswire_reset(led);
> +	gpio_set_value(led->aux_gpio, KTD2692_LOW);
> +
> +	ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(45)
> +					 | KTD2692_REG_FLASH_CURRENT_BASE);
> +}
> +
> +static int ktd2692_parse_dt(struct ktd2692_context *led, struct device *dev,
> +				u32 *flash_timeout_us)
> +{
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	if (!dev->of_node)
> +		return -ENXIO;
> +
> +	led->ctrl_gpio = of_get_named_gpio(np, "ctrl-gpio", 0);
> +	if (!gpio_is_valid(led->ctrl_gpio)) {
> +		dev_err(dev, "no ctrl-gpio property found\n");
> +		return -EINVAL;
> +	}
> +
> +	led->aux_gpio = of_get_named_gpio(np, "aux-gpio", 0);
> +	if (!gpio_is_valid(led->aux_gpio)) {
> +		dev_err(dev, "no aux-gpio property found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_gpio_request_one(dev, led->ctrl_gpio,
> +					GPIOF_OPEN_SOURCE, "ctrl-gpio");
> +	if (ret) {
> +		dev_err(dev, "failed to request ctrl-gpio %d error %d\n",
> +				led->ctrl_gpio, ret);
> +		return ret;
> +	}
> +
> +	ret = devm_gpio_request_one(dev, led->aux_gpio,
> +					GPIOF_OPEN_SOURCE, "aux-gpio");
> +	if (ret) {
> +		dev_err(dev, "failed to request aux-gpio %d error %d\n",
> +				led->aux_gpio, ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(np, "flash-timeout-us", flash_timeout_us);
> +	/* default setting */
> +	if (ret)
> +		*flash_timeout_us = KTD2692_FLASH_MODE_TIMEOUT_DEFAULT_US;
> +
> +	return 0;
> +}
> +
> +static const struct led_flash_ops flash_ops = {
> +	.strobe_set = ktd2692_led_flash_strobe_set,
> +	.timeout_set = ktd2692_led_flash_timeout_set,
> +};
> +
> +static int ktd2692_probe(struct platform_device *pdev)
> +{
> +	struct ktd2692_context *led;
> +	struct led_classdev *led_cdev;
> +	struct led_classdev_flash *fled_cdev;
> +	struct led_flash_setting flash_timeout;
> +	u32 flash_timeout_us;
> +	int ret;
> +
> +	led = devm_kzalloc(&pdev->dev, sizeof(*led), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	fled_cdev = &led->fled_cdev;
> +	led_cdev = &fled_cdev->led_cdev;
> +
> +	ret = ktd2692_parse_dt(led, &pdev->dev, &flash_timeout_us);
> +	if (ret)
> +		return ret;
> +
> +	led->regulator = devm_regulator_get(&pdev->dev, "vin");
> +	if (IS_ERR(led->regulator)) {
> +		dev_err(&pdev->dev, "regulator get failed\n");
> +		return PTR_ERR(led->regulator);
> +	}
> +
> +	ret = regulator_enable(led->regulator);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to enable supply: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ktd2692_init_flash_timeout(flash_timeout_us, &flash_timeout);
> +
> +	fled_cdev->timeout = flash_timeout;
> +	fled_cdev->ops = &flash_ops;
> +
> +	led_cdev->name = KTD2692_DEFAULT_NAME;

Device Tree label should be used for the LED class device name.
Please refer to :
Documentation/devicetree/bindings/leds/common.txt

Also the documentation states that the LED should be represented
by DT child node of the LED controller.

You can parse the label as follows:

led_cdev->name = of_get_property(child, "label", NULL) ? :
                            child->name;

> +	led_cdev->brightness_set = ktd2692_led_brightness_set;
> +	led_cdev->brightness_set_sync = ktd2692_led_brightness_set_sync;
> +	led_cdev->flags |= LED_CORE_SUSPENDRESUME | LED_DEV_CAP_FLASH;
> +
> +	mutex_init(&led->lock);
> +	INIT_WORK(&led->work_brightness_set, ktd2692_brightness_set_work);
> +
> +	platform_set_drvdata(pdev, led);
> +
> +	ret = led_classdev_flash_register(&pdev->dev, fled_cdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "can't register LED %s\n", led_cdev->name);
> +		mutex_destroy(&led->lock);
> +		return ret;
> +	}
> +
> +	ktd2692_setup(led);
> +
> +	return 0;
> +}
> +
> +static int ktd2692_remove(struct platform_device *pdev)
> +{
> +	struct ktd2692_context *led = platform_get_drvdata(pdev);
> +	int ret;
> +
> +	led_classdev_flash_unregister(&led->fled_cdev);
> +	cancel_work_sync(&led->work_brightness_set);
> +
> +	ret = regulator_disable(led->regulator);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to disable supply: %d\n", ret);
> +
> +	mutex_destroy(&led->lock);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ktd2692_match[] = {
> +	{ .compatible = "kinetic,ktd2692", },
> +	{ /* sentinel */ },
> +};
> +
> +static struct platform_driver ktd2692_driver = {
> +	.driver = {
> +		.name  = "leds-ktd2692",
> +		.of_match_table = ktd2692_match,
> +	},
> +	.probe  = ktd2692_probe,
> +	.remove = ktd2692_remove,
> +};
> +
> +module_platform_driver(ktd2692_driver);
> +
> +MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
> +MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
> +MODULE_LICENSE("GPL v2");
>


-- 
Best Regards,
Jacek Anaszewski
