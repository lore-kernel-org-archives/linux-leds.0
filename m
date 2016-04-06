From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/1] leds: pca9532: Add device tree binding
Date: Wed, 6 Apr 2016 09:56:32 +0200
Message-ID: <5704C130.80001@gmail.com>
References: <1459912250-50878-1-git-send-email-preid@electromag.com.au>
 <1459912250-50878-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33459 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750868AbcDFH5D (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Apr 2016 03:57:03 -0400
In-Reply-To: <1459912250-50878-2-git-send-email-preid@electromag.com.au>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, riku.voipio@iki.fi, rpurdie@rpsys.net, j.anaszewski@samsung.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org

Hi Phil,

Thanks for the patch. Please find my comments below.

On 04/06/2016 05:10 AM, Phil Reid wrote:
> This patch adds basic device tree support for the pca9532 LEDs.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---
>   .../devicetree/bindings/leds/leds-pca9532.txt      | 32 +++++++++++
>   drivers/leds/leds-pca9532.c                        | 63 ++++++++++++++++++++--
>   include/dt-bindings/leds/leds-pca9532.h            | 18 +++++++
>   include/linux/leds-pca9532.h                       |  8 ++-
>   4 files changed, 112 insertions(+), 9 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-pca9532.txt
>   create mode 100644 include/dt-bindings/leds/leds-pca9532.h
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> new file mode 100644
> index 0000000..b48c223
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> @@ -0,0 +1,32 @@
> +*NXP - pca9532 PWM LED Driver
> +
> +The PCA9532 family is SMBus I/O expander optimized for dimming LEDs.
> +The PWM support 256 steps.
> +
> +Required properties:
> +	- compatible:
> +		"nxp,pca9530"
> +		"nxp,pca9531"
> +		"nxp,pca9532"
> +		"nxp,pca9533"
> +	- reg -  I2C slave address
> +
> +Each led is represented as a sub-node of the nxp,pca9530.
> +
> +LED sub-node properties:
> +- type: Output configuration
> +	0 = NONE, 1 = LED, 2 = N2100_BEEP, 3 = GPIO
> +
> +Example:
> +
> +  ledBL: pca9530@60 {

I think that ledBL label is here by mistake. It looks like this
label's purpose was to describe LED color (BL -> blue), but
this info should be conveyed by child node name, per which
LED class devices are created.

> +    compatible = "nxp,pca9530";
> +    reg = <0x60>;
> +
> +    led0 {

i.e. here. Moreover there is established LED device naming
convention (see Documentation/leds/leds-class.txt):

devicename:colour:function


> +      type = <PCA9532_TYPE_LED>;

Please add "#include <dt-bindings/leds/leds-pca9532.h>" after
"Example:" above.

> +    };
> +  };
> +
> +For more product information please see the link below:
> +http://nxp.com/documents/data_sheet/PCA9532.pdf
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index e3d3b1a..8694c83 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -21,6 +21,8 @@
>   #include <linux/workqueue.h>
>   #include <linux/leds-pca9532.h>
>   #include <linux/gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>
>   /* m =  num_leds*/
>   #define PCA9532_REG_INPUT(i)	((i) >> 3)
> @@ -86,9 +88,22 @@ static const struct pca9532_chip_info pca9532_chip_info_tbl[] = {
>   	},
>   };
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id of_pca9532_leds_match[] = {
> +	{ .compatible = "nxp,pca9530", .data = (void *)pca9530 },
> +	{ .compatible = "nxp,pca9531", .data = (void *)pca9531 },
> +	{ .compatible = "nxp,pca9532", .data = (void *)pca9532 },
> +	{ .compatible = "nxp,pca9533", .data = (void *)pca9533 },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, of_pca9532_leds_match);
> +#endif
> +
>   static struct i2c_driver pca9532_driver = {
>   	.driver = {
>   		.name = "leds-pca953x",
> +		.of_match_table = of_match_ptr(of_pca9532_leds_match),
>   	},
>   	.probe = pca9532_probe,
>   	.remove = pca9532_remove,
> @@ -432,15 +447,55 @@ exit:
>   	return err;
>   }
>
> +struct pca9532_platform_data *pca9532_of_populate_pdata(struct device *dev,
> +						      struct device_node *np)
> +{
> +	struct pca9532_platform_data *pdata;
> +	struct device_node *child;
> +	int devid = (int)of_match_device(of_pca9532_leds_match, dev)->data;
> +	int maxleds = pca9532_chip_info_tbl[devid].num_leds;
> +	int i = 0;
> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for_each_child_of_node(np, child) {
> +		of_property_read_string(child, "name", &pdata->leds[i].name);

Please use "label" property (see Documentation/devicetree/binding
/leds/common.txt). If not present use child node name. You can refer
to other LED class devices.

> +		of_property_read_u32(child, "type", &pdata->leds[i].type);
> +		if (!pdata->leds[i].name)
> +			pdata->leds[i].name = "?";
> +		if (i >= maxleds)
> +			break;

You have to call of_node_put if breaking this loop.

> +	}
> +
> +	return pdata;
> +}
> +
>   static int pca9532_probe(struct i2c_client *client,
>   	const struct i2c_device_id *id)
>   {
> +	int devid;
>   	struct pca9532_data *data = i2c_get_clientdata(client);
>   	struct pca9532_platform_data *pca9532_pdata =
>   			dev_get_platdata(&client->dev);
> -
> -	if (!pca9532_pdata)
> -		return -EIO;
> +	struct device_node *np = client->dev.of_node;
> +
> +	if (!pca9532_pdata) {
> +		if (np) {
> +			pca9532_pdata =
> +				pca9532_of_populate_pdata(&client->dev, np);
> +			if (IS_ERR(pca9532_pdata))
> +				return PTR_ERR(pca9532_pdata);
> +		} else {
> +			dev_err(&client->dev, "no platform data\n");
> +			return -EINVAL;
> +		}
> +		devid = (int)of_match_device(
> +			of_pca9532_leds_match, &client->dev)->data;
> +	} else {
> +		devid = id->driver_data;
> +	}
>
>   	if (!i2c_check_functionality(client->adapter,
>   		I2C_FUNC_SMBUS_BYTE_DATA))
> @@ -450,7 +505,7 @@ static int pca9532_probe(struct i2c_client *client,
>   	if (!data)
>   		return -ENOMEM;
>
> -	data->chip_info = &pca9532_chip_info_tbl[id->driver_data];
> +	data->chip_info = &pca9532_chip_info_tbl[devid];
>
>   	dev_info(&client->dev, "setting platform data\n");
>   	i2c_set_clientdata(client, data);
> diff --git a/include/dt-bindings/leds/leds-pca9532.h b/include/dt-bindings/leds/leds-pca9532.h
> new file mode 100644
> index 0000000..4d917aa
> --- /dev/null
> +++ b/include/dt-bindings/leds/leds-pca9532.h
> @@ -0,0 +1,18 @@
> +/*
> + * This header provides constants for pca9532 LED bindings.
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2.  This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#ifndef _DT_BINDINGS_LEDS_PCA9532_H
> +#define _DT_BINDINGS_LEDS_PCA9532_H
> +
> +#define PCA9532_TYPE_NONE         0
> +#define PCA9532_TYPE_LED          1
> +#define PCA9532_TYPE_N2100_BEEP   2
> +#define PCA9532_TYPE_GPIO         3
> +#define PCA9532_LED_TIMER2        4
> +
> +#endif /* _DT_BINDINGS_LEDS_PCA9532_H */
> diff --git a/include/linux/leds-pca9532.h b/include/linux/leds-pca9532.h
> index b8d6fff..4970f51 100644
> --- a/include/linux/leds-pca9532.h
> +++ b/include/linux/leds-pca9532.h
> @@ -16,6 +16,7 @@
>
>   #include <linux/leds.h>
>   #include <linux/workqueue.h>
> +#include <dt-bindings/leds/leds-pca9532.h>
>
>   enum pca9532_state {
>   	PCA9532_OFF  = 0x0,
> @@ -24,16 +25,13 @@ enum pca9532_state {
>   	PCA9532_PWM1 = 0x3
>   };
>
> -enum pca9532_type { PCA9532_TYPE_NONE, PCA9532_TYPE_LED,
> -	PCA9532_TYPE_N2100_BEEP, PCA9532_TYPE_GPIO };
> -
>   struct pca9532_led {
>   	u8 id;
>   	struct i2c_client *client;
> -	char *name;
> +	const char *name;
>   	struct led_classdev ldev;
>   	struct work_struct work;
> -	enum pca9532_type type;
> +	u32 type;
>   	enum pca9532_state state;
>   };
>
>

-- 
Best regards,
Jacek Anaszewski
