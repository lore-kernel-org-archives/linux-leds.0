From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: add LED driver for CR0014114 board
Date: Mon, 14 Aug 2017 21:44:01 +0200
Message-ID: <a3b2efc2-8501-207e-363d-975d1a3ed0ff@gmail.com>
References: <20170814115355.9437-1-oleg@kaa.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34423 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750859AbdHNToq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Aug 2017 15:44:46 -0400
Received: by mail-wm0-f67.google.com with SMTP id x64so15571358wmg.1
        for <linux-leds@vger.kernel.org>; Mon, 14 Aug 2017 12:44:46 -0700 (PDT)
In-Reply-To: <20170814115355.9437-1-oleg@kaa.org.ua>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>

Hi Oleh,

Thanks for the patch. Please see my comments below.

On 08/14/2017 01:53 PM, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the RGB LEDs found on
> the Crane Merchandising System CR0014114 LEDs board.
> 
> Driver creates LED devices with name written using the following
> pattern "LABEL-{N}:{red,green,blue}:".

LED device naming is already defined to "devicename:colour:function"
in Documentation/leds/leds-class.txt. Please stick to this scheme.

> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  23 ++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/leds/Kconfig                               |  12 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-cr0014114.c                      | 352 +++++++++++++++++++++
>  5 files changed, 389 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>  create mode 100644 drivers/leds/leds-cr0014114.c
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> new file mode 100644
> index 000000000000..6a399cb65388
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> @@ -0,0 +1,23 @@
> +Crane Merchandising System SPI LED board CR0014114
> +==================================================
> +
> +Required properties:
> +- compatible: "cms,cr0014114"
> +
> +Optional properties:
> +- label: prefix for LED names. If omitted the label is taken from the node name.

Please change the description to:

"see Documentation/devicetree/bindings/leds/common.txt"

> +- leds-per-board: RGB leds per board, minimal value is 6
> +- num-boards: number of LED boards on SPI bus, usually 1
> +
> +Example
> +-------
> +
> +cr0014114@0 {
> +	compatible = "ccs,cr0014114";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	spi-cpha;
> +	label = "cr0014114";
> +	leds-per-board = /bits/ 8 <6>;
> +	num-boards = /bits/ 8 <1>;

You should have child nodes here representing each LED.
Each child node should have its own label and an information
on how to address the LED, e.g. reg property.

leds-per-board and num-boards wouldn't be required then.

> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 7e5754ecb095..ad72b278d307 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -67,6 +67,7 @@ chunghwa	Chunghwa Picture Tubes Ltd.
>  ciaa	Computadora Industrial Abierta Argentina
>  cirrus	Cirrus Logic, Inc.
>  cloudengines	Cloud Engines, Inc.
> +cms	Crane Merchandising System
>  cnm	Chips&Media, Inc.
>  cnxt	Conexant Systems, Inc.
>  compulab	CompuLab Ltd.
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 594b24d410c3..2d1527fc7643 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -76,6 +76,18 @@ config LEDS_BCM6358
>  	  This option enables support for LEDs connected to the BCM6358
>  	  LED HW controller accessed via MMIO registers.
>  
> +config LEDS_CR0014114
> +	tristate "LED Support for Crane Merchandising Systems CR0014114"
> +	depends on LEDS_CLASS
> +	depends on SPI
> +	depends on OF
> +	help
> +	  The CR0014114 LED board used in vending machines produced
> +	  by Crane Merchandising Systems.
> +
> +	  This driver creates LED devices with name written using the
> +	  following pattern "LABEL-{N}:{red,green,blue}:".
> +
>  config LEDS_CPCAP
>  	tristate "LED Support for Motorola CPCAP"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 909dae62ba05..fd886a30267d 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -73,6 +73,7 @@ obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
>  obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
>  
>  # LED SPI Drivers
> +obj-$(CONFIG_LEDS_CR0014114)		+= leds-cr0014114.o
>  obj-$(CONFIG_LEDS_DAC124S085)		+= leds-dac124s085.o
>  
>  # LED Userspace Drivers
> diff --git a/drivers/leds/leds-cr0014114.c b/drivers/leds/leds-cr0014114.c
> new file mode 100644
> index 000000000000..490ee3996a5d
> --- /dev/null
> +++ b/drivers/leds/leds-cr0014114.c
> @@ -0,0 +1,352 @@
> +#include <linux/delay.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/property.h>
> +#include <linux/spi/spi.h>
> +#include <linux/spinlock.h>
> +#include <linux/timer.h>
> +#include <linux/workqueue.h>
> +
> +/* CR0014114 SPI commands */
> +#define CMD_SET_BRIGHTNESS	0x80
> +#define CMD_INIT_REENUMERATE	0x81
> +#define CMD_NEXT_REENUMERATE	0x82

Please add a namespacing prefix to the macros. At least "CR_".

> +
> +/* default settings */
> +#define DEF_LEDS_PER_BOARD	6
> +#define DEF_MAX_BRIGHTNESS	GENMASK(6, 0)
> +#define DEF_NUM_BOARDS		1
> +#define DEF_FPS			50
> +#define DEF_FW_DELAY_MSEC	10
> +#define DEF_RECOUNT_DELAY	(HZ * 3600)
> +
> +struct cr0014114 {
> +	struct spi_device	*spi;
> +	struct device		*dev;
> +	const char		*label;
> +	u8			leds_per_board;
> +	u8			num_boards;
> +	size_t			leds_count;
> +	char			wq_name[64];
> +	struct workqueue_struct	*wq;
> +	unsigned long		leds_delay;
> +	struct work_struct	leds_work;
> +	struct timer_list	recount_timer;
> +	struct work_struct	recount_work;
> +	struct cr0014114_led	*leds;
> +};
> +
> +struct cr0014114_led {
> +	char			name[64];
> +	struct cr0014114	*priv;
> +	struct led_classdev	ldev;
> +	u8			brightness;
> +};
> +
> +static void cr0014114_calc_crc(u8 *buf, const size_t len)
> +{
> +	u8	crc;
> +	size_t	i;
> +
> +	for (i = 1, crc = 1; i < len - 1; i++)
> +		crc += buf[i];
> +
> +	crc |= BIT(7);
> +
> +	/* special case when CRC matches to SPI commands */
> +	switch (crc) {
> +	case CMD_SET_BRIGHTNESS:
> +	case CMD_INIT_REENUMERATE:
> +	case CMD_NEXT_REENUMERATE:
> +		crc = 0xfe;
> +		break;
> +	}

Wouldn't "if" fit better here?

> +
> +	buf[len - 1] = crc;
> +}
> +
> +static void cr0014114_leds_work(struct work_struct *work)
> +{
> +	int			ret;
> +	size_t			i;
> +	struct cr0014114	*priv = container_of(work,
> +					struct cr0014114, leds_work);
> +	u8			data[priv->leds_count + 2];
> +	unsigned long		udelay, now = jiffies;
> +
> +	/* to avoid SPI mistiming with firmware we should wait some time */
> +	if (time_after(priv->leds_delay, now)) {
> +		udelay = jiffies_to_usecs(priv->leds_delay - now);
> +		usleep_range(udelay, udelay + 1);
> +	}
> +
> +	data[0] = CMD_SET_BRIGHTNESS;
> +	for (i = 0; i < priv->leds_count; i++)
> +		data[i + 1] = priv->leds[i].brightness;

Why do you set three LEDs at once? We expose each LED as a single
LED class device in the LED subsystem.

> +	cr0014114_calc_crc(data, sizeof(data));
> +
> +	ret = spi_write(priv->spi, data, sizeof(data));

Could you please describe the layout of registers driving the brightness
of each LED ?

> +	if (ret)
> +		dev_err(priv->dev, "spi_write() error %d\n", ret);
> +
> +	priv->leds_delay = jiffies + msecs_to_jiffies(DEF_FW_DELAY_MSEC);
> +}
> +
> +static void cr0014114_test(struct cr0014114 *priv)
> +{
> +	unsigned int		mdelay;
> +	size_t			i;
> +	struct led_classdev	*ldev;
> +
> +	/* blink all LEDs in 500 milliseconds */
> +	mdelay = 500 / priv->leds_count - DEF_FW_DELAY_MSEC;
> +	if (mdelay < DEF_FW_DELAY_MSEC)
> +		mdelay = DEF_FW_DELAY_MSEC;
> +
> +	for (i = 0; i < priv->leds_count; i++) {
> +		ldev = &priv->leds[i].ldev;
> +
> +		ldev->brightness_set(ldev, DEF_MAX_BRIGHTNESS);
> +		msleep(mdelay);
> +		ldev->brightness_set(ldev, LED_OFF);
> +	}
> +}

Is this function really required? It seems to mimic timer trigger.

> +static void cr0014114_set_brightness(struct led_classdev *ldev,
> +				     enum led_brightness brightness)
> +{
> +	struct cr0014114_led	*led = container_of(ldev,
> +					struct cr0014114_led, ldev);
> +
> +	led->brightness = brightness & DEF_MAX_BRIGHTNESS;

LED core takes care of not exceeding max brightness.

> +	queue_work(led->priv->wq, &led->priv->leds_work);
> +}
> +
> +static int cr0014114_led_create(struct cr0014114 *priv,
> +				struct cr0014114_led *led,
> +				size_t id,
> +				const char *color)
> +{
> +	int ret;
> +
> +	led->priv = priv;
> +	snprintf(led->name, sizeof(led->name), "%s-%zd:%s:",
> +		 priv->label, id, color);
> +
> +	led->ldev.name			= led->name;
> +	led->ldev.brightness		= LED_OFF;
> +	led->ldev.max_brightness	= DEF_MAX_BRIGHTNESS;
> +	led->ldev.brightness_set	= cr0014114_set_brightness;

Please use brightness_set_blocking op and remove workqueue.

> +
> +	ret = led_classdev_register(priv->dev, &led->ldev);

Please use devm prefixed version.

> +	if (ret)
> +		dev_err(priv->dev, "can't register LED '%s', error %d\n",
> +			led->name, ret);
> +
> +	return ret;
> +}
> +
> +static int cr0014114_recount(struct cr0014114 *priv)
> +{
> +	size_t		i;
> +	int		ret;
> +	u8		cmd_init = CMD_INIT_REENUMERATE;
> +	u8		cmd_next = CMD_NEXT_REENUMERATE;
> +
> +	dev_dbg(priv->dev, "recount of LEDs is started\n");
> +
> +	msleep(DEF_FW_DELAY_MSEC);
> +
> +	ret = spi_write(priv->spi, &cmd_init, sizeof(cmd_init));
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < priv->leds_count; i++) {
> +		msleep(DEF_FW_DELAY_MSEC);
> +
> +		ret = spi_write(priv->spi, &cmd_next, sizeof(cmd_next));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	priv->leds_delay = jiffies + msecs_to_jiffies(DEF_FW_DELAY_MSEC);
> +
> +	dev_dbg(priv->dev, "recount of LEDs is complete\n");
> +
> +	return 0;
> +}
> +
> +void cr0014114_recount_timer(unsigned long data)
> +{
> +	struct cr0014114 *priv = (struct cr0014114 *)data;
> +
> +	queue_work(priv->wq, &priv->recount_work);
> +	mod_timer(&priv->recount_timer, jiffies + DEF_RECOUNT_DELAY);
> +}
> +
> +static void cr0014114_recount_work(struct work_struct *work)
> +{
> +	struct cr0014114 *priv = container_of(work, struct cr0014114,
> +					recount_work);
> +
> +	cr0014114_recount(priv);
> +
> +	/* after recount we should restore brightness */
> +	queue_work(priv->wq, &priv->leds_work);
> +}
> +
> +static int cr0014114_probe_dp(struct cr0014114 *priv)
> +{
> +	if (device_property_read_string(priv->dev, "label", &priv->label))
> +		priv->label = priv->dev->of_node->name;
> +	if (!priv->label || !*priv->label) {
> +		dev_err(priv->dev, "'label' can't be empty\n");
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u8(priv->dev, "leds-per-board",
> +				    &priv->leds_per_board))
> +		priv->leds_per_board = DEF_LEDS_PER_BOARD;
> +	if (priv->leds_per_board < DEF_LEDS_PER_BOARD) {
> +		dev_err(priv->dev,
> +			"'leds-per-board' should be at least %d\n",
> +			DEF_LEDS_PER_BOARD
> +		);
> +		return -EINVAL;
> +	}
> +
> +	if (device_property_read_u8(priv->dev, "num-boards",
> +				    &priv->num_boards))
> +		priv->num_boards = DEF_NUM_BOARDS;
> +	if (priv->num_boards < DEF_NUM_BOARDS) {
> +		dev_err(priv->dev, "'num-boards' should be at least %d\n",
> +			DEF_NUM_BOARDS
> +		);
> +		return -EINVAL;
> +	}
> +
> +	priv->leds_count = priv->leds_per_board * priv->num_boards * 3;
> +	priv->leds = devm_kzalloc(priv->dev, sizeof(*priv->leds) *
> +			priv->leds_count, GFP_KERNEL);
> +
> +	if (!priv->leds)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static int cr0014114_probe(struct spi_device *spi)
> +{
> +	struct cr0014114	*priv;
> +	size_t			i, id;
> +	int			ret;
> +
> +	priv = devm_kzalloc(&spi->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->spi = spi;
> +	priv->dev = &spi->dev;
> +	INIT_WORK(&priv->leds_work, cr0014114_leds_work);
> +	INIT_WORK(&priv->recount_work, cr0014114_recount_work);
> +
> +	ret = cr0014114_probe_dp(priv);
> +	if (ret)
> +		return ret;
> +
> +	ret = cr0014114_recount(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "Recount failed with error %d\n", ret);
> +
> +		return ret;
> +	}
> +
> +	snprintf(priv->wq_name, sizeof(priv->wq_name), "%s/work", priv->label);
> +	priv->wq = create_singlethread_workqueue(priv->wq_name);
> +	if (!priv->wq)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	id = 0;
> +
> +	while (i < priv->leds_count) {
> +		ret = cr0014114_led_create(priv, &priv->leds[i], id, "red");
> +		if (ret)
> +			goto fail;
> +		i++;
> +
> +		ret = cr0014114_led_create(priv, &priv->leds[i], id, "green");
> +		if (ret)
> +			goto fail;
> +		i++;
> +
> +		ret = cr0014114_led_create(priv, &priv->leds[i], id, "blue");
> +		if (ret)
> +			goto fail;
> +		i++;
> +		id++;
> +	}
> +
> +	cr0014114_test(priv);
> +	spi_set_drvdata(spi, priv);
> +	setup_timer(&priv->recount_timer, cr0014114_recount_timer,
> +		    (unsigned long)priv);
> +
> +	/* setup recount timer to workaround buggy firmware */
> +	mod_timer(&priv->recount_timer, jiffies + DEF_RECOUNT_DELAY);

Could you share some details on why it is needed?

> +
> +	dev_info(priv->dev,
> +		 "%s (Boards: %u, LEDs per board: %u, Total channels: %zd)\n",
> +		 priv->label,
> +		 priv->num_boards,
> +		 priv->leds_per_board,
> +		 priv->leds_count);
> +
> +	return 0;
> +
> +fail:
> +	while (i--)
> +		led_classdev_unregister(&priv->leds[i].ldev);
> +
> +	destroy_workqueue(priv->wq);
> +
> +	return ret;
> +}
> +
> +static int cr0014114_remove(struct spi_device *spi)
> +{
> +	struct cr0014114	*priv = spi_get_drvdata(spi);
> +	size_t			i;
> +
> +	for (i = 0; i < priv->leds_count; i++)
> +		led_classdev_unregister(&priv->leds[i].ldev);
> +
> +	del_timer_sync(&priv->recount_timer);
> +	destroy_workqueue(priv->wq);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id cr0014114_dt_ids[] = {
> +	{ .compatible = "cms,cr0014114", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, cr0014114_dt_ids);
> +
> +static struct spi_driver cr0014114_driver = {
> +	.probe		= cr0014114_probe,
> +	.remove		= cr0014114_remove,
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= cr0014114_dt_ids,
> +	},
> +};
> +
> +module_spi_driver(cr0014114_driver);
> +
> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
> +MODULE_DESCRIPTION("cr0014114 LED driver");
> +MODULE_LICENSE("GPL");

Please add suitable copyright note at the beginning of file.
You can compare other LED class drivers with the same licence.

> +MODULE_ALIAS("spi:cr0014114");
> 

-- 
Best regards,
Jacek Anaszewski
