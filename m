From: Peter Meerwald <pmeerw@pmeerw.net>
Subject: Re: [PATCH] leds: Add driver for PCA9622 LED driver chip.
Date: Thu, 24 Jul 2014 15:05:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.01.1407241456330.31047@pmeerw.net>
References: <20140724120216.4845.99048.stgit@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ns.pmeerw.net ([87.118.82.44]:41896 "EHLO pmeerw.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932836AbaGXNFG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 24 Jul 2014 09:05:06 -0400
In-Reply-To: <20140724120216.4845.99048.stgit@localhost>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Martin Fuzzey <mfuzzey@parkeon.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hello Martin,

the pca9622 looks rather similar to the pca963x family of devices; maybe 
this could go into pca963x? the register layout looks VERY similar

(another example of why the x in driver file names is a bad idea :(

I have recently added support for the pca9635 chip to the pca963x driver, 
maybe check out linux-leds repo

maybe add Bryan Wu, he seems more responsive than Richard

comment inline

regards, p.

> Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> ---
>  Documentation/devicetree/bindings/leds/pca9622.txt |   35 +++
>  drivers/leds/Kconfig                               |    8 +
>  drivers/leds/Makefile                              |    1 
>  drivers/leds/leds-pca9622.c                        |  268 ++++++++++++++++++++
>  4 files changed, 312 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/pca9622.txt
>  create mode 100644 drivers/leds/leds-pca9622.c
> 
> diff --git a/Documentation/devicetree/bindings/leds/pca9622.txt b/Documentation/devicetree/bindings/leds/pca9622.txt
> new file mode 100644
> index 0000000..ac4f2f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/pca9622.txt
> @@ -0,0 +1,35 @@
> +LEDs connected to pca9622
> +
> +Required properties:
> +- compatible : must be : "nxp,pca9622"
> +- reg : i2c address
> +
> +Optional properties:
> +- name-prefix : name prepended to label in /sys/class/leds defaults to "pca9622"
> +
> +Each led is represented as a sub-node of the nxp,pca922 device.

nxp,pca9622

> +
> +LED sub-node properties:
> +- reg : number of LED line (0 - 15)
> +- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +   see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +leds@60 {
> +	compatible = "nxp,pca9622";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	reg = <0x60>;
> +	name-prefix = "antenna-board";
> +	out0 {
> +		label = "blue:target-3";
> +		reg = <0>;
> +	};
> +	out3 {
> +		label = "red:target-3";
> +		reg = <3>;
> +	};
> +};
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a1b044e..afbbc7e 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -291,6 +291,14 @@ config LEDS_PCA955X
>  	  LED driver chips accessed via the I2C bus.  Supported
>  	  devices include PCA9550, PCA9551, PCA9552, and PCA9553.
>  
> +config LEDS_PCA9622
> +	tristate "LED support for PCA9622 I2C chip"
> +	depends on LEDS_CLASS
> +	depends on I2C
> +	help
> +	  This option enables support for LEDs connected to the PCA9622
> +	  LED driver chip accessed via the I2C bus.
> +
>  config LEDS_PCA963X
>  	tristate "LED support for PCA963x I2C chip"
>  	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 79c5155..adbd075 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_LEDS_HP6XX)		+= leds-hp6xx.o
>  obj-$(CONFIG_LEDS_OT200)		+= leds-ot200.o
>  obj-$(CONFIG_LEDS_FSG)			+= leds-fsg.o
>  obj-$(CONFIG_LEDS_PCA955X)		+= leds-pca955x.o
> +obj-$(CONFIG_LEDS_PCA9622)		+= leds-pca9622.o
>  obj-$(CONFIG_LEDS_PCA963X)		+= leds-pca963x.o
>  obj-$(CONFIG_LEDS_DA903X)		+= leds-da903x.o
>  obj-$(CONFIG_LEDS_DA9052)		+= leds-da9052.o
> diff --git a/drivers/leds/leds-pca9622.c b/drivers/leds/leds-pca9622.c
> new file mode 100644
> index 0000000..3a19433
> --- /dev/null
> +++ b/drivers/leds/leds-pca9622.c
> @@ -0,0 +1,268 @@
> +/*
> + * Copyright 2014 Parkeon
> + *
> + * Author: Martin Fuzzey <mfuzzey@parkeon.com>
> + *
> + * Based on leds-pca9622.c
> + *
> + * This file is subject to the terms and conditions of version 2 of
> + * the GNU General Public License.  See the file COPYING in the main
> + * directory of this archive for more details.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/string.h>
> +#include <linux/ctype.h>
> +#include <linux/leds.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/workqueue.h>
> +#include <linux/slab.h>
> +
> +#define PCA9622_MAX_LEDS	16
> +
> +/* LED select registers determine the source that drives LED outputs */
> +#define PCA9622_LED_OFF		0x0	/* LED driver off */
> +#define PCA9622_LED_ON		0x1	/* LED driver on */
> +#define PCA9622_LED_PWM		0x2	/* Controlled through PWM */
> +#define PCA9622_LED_GRP_PWM	0x3	/* Controlled through PWM/GRPPWM */
> +
> +#define PCA9622_MODE1		0x00
> +#define PCA9622_MODE2		0x01
> +#define PCA9622_PWM_BASE	0x02
> +#define PCA9622_LEDOUT_BASE	0x14
> +
> +static const struct i2c_device_id pca9622_id[] = {
> +	{ "pca9622", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, pca9622_id);
> +
> +struct pca9622_led {
> +	struct i2c_client *client;
> +	struct work_struct work;
> +	enum led_brightness brightness;
> +	struct led_classdev led_cdev;
> +	int led_num; /* 0 .. 15 potentially */
> +	char name[32];
> +};
> +
> +static void pca9622_led_work(struct work_struct *work)
> +{
> +	struct pca9622_led *pca9622 = container_of(work,
> +		struct pca9622_led, work);
> +	u8 ledout_reg = PCA9622_LEDOUT_BASE + pca9622->led_num / 4;
> +	u8 ledout = i2c_smbus_read_byte_data(pca9622->client, ledout_reg);
> +	int shift = 2 * (pca9622->led_num % 4);
> +	u8 mask = 0x3 << shift;
> +
> +	switch (pca9622->brightness) {
> +	case LED_FULL:
> +		i2c_smbus_write_byte_data(pca9622->client, ledout_reg,
> +			(ledout & ~mask) | (PCA9622_LED_ON << shift));
> +		break;
> +	case LED_OFF:
> +		i2c_smbus_write_byte_data(pca9622->client, ledout_reg,
> +			ledout & ~mask);
> +		break;
> +	default:
> +		i2c_smbus_write_byte_data(pca9622->client,
> +			PCA9622_PWM_BASE + pca9622->led_num,
> +			pca9622->brightness);
> +		i2c_smbus_write_byte_data(pca9622->client, ledout_reg,
> +			(ledout & ~mask) | (PCA9622_LED_PWM << shift));
> +		break;
> +	}
> +}
> +
> +static void pca9622_led_set(struct led_classdev *led_cdev,
> +	enum led_brightness value)
> +{
> +	struct pca9622_led *pca9622;
> +
> +	pca9622 = container_of(led_cdev, struct pca9622_led, led_cdev);
> +
> +	pca9622->brightness = value;
> +
> +	/*
> +	 * Must use workqueue for the actual I/O since I2C operations
> +	 * can sleep.
> +	 */
> +	schedule_work(&pca9622->work);
> +}
> +
> +static struct led_platform_data *pca9622_led_pdata_from_dt(struct device *dev)
> +{
> +	struct led_platform_data *pdata = NULL;
> +#ifdef CONFIG_OF
> +	struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +	struct led_info *leds;
> +	int num_leds;
> +
> +	num_leds = of_get_child_count(np);
> +	if (num_leds == 0)
> +		return NULL;  /* Optional */
> +	if (num_leds > PCA9622_MAX_LEDS) {
> +		dev_err(dev, "Too many child nodes max=%d\n", PCA9622_MAX_LEDS);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	leds = devm_kzalloc(dev, PCA9622_MAX_LEDS * sizeof(*leds), GFP_KERNEL);
> +	if (!leds)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for_each_child_of_node(np, child) {
> +		int ret;
> +		u32 line;
> +		struct led_info led;
> +
> +		memset(&led, 0, sizeof(led));
> +
> +		ret = of_property_read_u32(child, "reg", &line);
> +		if (ret) {
> +			dev_err(dev, "Node '%s' missing line number (reg)\n",
> +				child->name);
> +			return ERR_PTR(ret);
> +		}
> +
> +		led.name = child->name;
> +		of_property_read_string(child, "label", &led.name);
> +		of_property_read_string(child, "linux,default-trigger",
> +							&led.default_trigger);
> +
> +		leds[line] = led;
> +	}
> +
> +	pdata->leds = leds;
> +	pdata->num_leds = PCA9622_MAX_LEDS;
> +#endif
> +	return pdata;
> +}
> +
> +static int pca9622_probe(struct i2c_client *client,
> +					const struct i2c_device_id *id)
> +{
> +	const char *name_prefix = "pca9622";
> +	struct pca9622_led *pca9622;
> +	struct led_platform_data *pdata;
> +	int i, ret;
> +
> +	of_property_read_string(client->dev.of_node, "name-prefix",
> +							&name_prefix);
> +	pdata = pca9622_led_pdata_from_dt(&client->dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +
> +	if (!pdata) {
> +		pdata = client->dev.platform_data;
> +		if (pdata && (
> +				pdata->num_leds <= 0 ||
> +				pdata->num_leds > PCA9622_MAX_LEDS)
> +		) {
> +			dev_err(&client->dev,
> +				"board data must define 0-%d LEDs",
> +				PCA9622_MAX_LEDS);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	ret = i2c_smbus_read_byte_data(client, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	pca9622 = devm_kzalloc(&client->dev,
> +			PCA9622_MAX_LEDS * sizeof(*pca9622), GFP_KERNEL);
> +	if (!pca9622)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, pca9622);
> +
> +	for (i = 0; i < PCA9622_MAX_LEDS; i++) {
> +		pca9622[i].client = client;
> +		pca9622[i].led_num = i;
> +
> +		/* Platform data can specify LED names and default triggers */
> +		if (pdata && i < pdata->num_leds) {
> +			if (pdata->leds[i].name)
> +				snprintf(pca9622[i].name,
> +					 sizeof(pca9622[i].name), "%s:%s",
> +					 name_prefix,
> +					 pdata->leds[i].name);
> +			if (pdata->leds[i].default_trigger)
> +				pca9622[i].led_cdev.default_trigger =
> +					pdata->leds[i].default_trigger;
> +		}
> +
> +		if (strlen(pca9622[i].name) == 0)
> +			snprintf(pca9622[i].name, sizeof(pca9622[i].name),
> +						"%s:%d", name_prefix, i);
> +
> +		pca9622[i].led_cdev.name = pca9622[i].name;
> +		pca9622[i].led_cdev.brightness_set = pca9622_led_set;
> +
> +		INIT_WORK(&pca9622[i].work, pca9622_led_work);
> +
> +		ret = led_classdev_register(&client->dev, &pca9622[i].led_cdev);
> +		if (ret < 0)
> +			goto exit;
> +	}
> +
> +	/* Disable LED all-call address and set normal mode */
> +	i2c_smbus_write_byte_data(client, PCA9622_MODE1, 0x00);
> +
> +	/* Turn off LEDs */
> +	for (i = 0; i < PCA9622_MAX_LEDS / 4; i++)
> +		i2c_smbus_write_byte_data(client, PCA9622_LEDOUT_BASE + i, 0);
> +
> +	return 0;
> +
> +exit:
> +	while (i--) {
> +		led_classdev_unregister(&pca9622[i].led_cdev);
> +		cancel_work_sync(&pca9622[i].work);
> +	}
> +
> +	return ret;
> +}
> +
> +static int pca9622_remove(struct i2c_client *client)
> +{
> +	struct pca9622_led *pca9622 = i2c_get_clientdata(client);
> +	int i;
> +
> +	for (i = 0; i < PCA9622_MAX_LEDS; i++) {
> +		led_classdev_unregister(&pca9622[i].led_cdev);
> +		cancel_work_sync(&pca9622[i].work);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id of_pca9622_leds_match[] = {
> +	{ .compatible =  "nxp,pca9622"},
> +	{},
> +};
> +
> +static struct i2c_driver pca9622_driver = {
> +	.driver = {
> +		.name	= "leds-pca9622",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = of_match_ptr(of_pca9622_leds_match),
> +	},
> +	.probe	= pca9622_probe,
> +	.remove	= pca9622_remove,
> +	.id_table = pca9622_id,
> +};
> +
> +module_i2c_driver(pca9622_driver);
> +
> +MODULE_AUTHOR("Martin Fuzzey <mfuzzey@parkeon.com>");
> +MODULE_DESCRIPTION("PCA9622 LED driver");
> +MODULE_LICENSE("GPL v2");
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 

Peter Meerwald
+43-664-2444418 (mobile)
