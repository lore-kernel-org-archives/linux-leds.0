From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pca9532: Extend pca9532 device tree support
Date: Tue, 7 Feb 2017 21:45:27 +0100
Message-ID: <f1649865-87cd-eb1c-68de-184990f64661@gmail.com>
References: <aed3d861-eb7d-7bad-1fe2-73b5b3299a0c@ltec.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34209 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754394AbdBGUyz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Feb 2017 15:54:55 -0500
In-Reply-To: <aed3d861-eb7d-7bad-1fe2-73b5b3299a0c@ltec.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Felix Brack <fb@ltec.ch>, riku.voipio@iki.fi, rpurdie@rpsys.net, pavel@ucw.cz, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: f.brack@eets.ch

Hi Felix,

Thanks for the patch.

On 02/07/2017 07:11 PM, Felix Brack wrote:
> This patch extends the device tree support for the pca9532 allowing LEDs to blink, dim or even being unchanged, i.e. not being turned off during driver initialization.

Isn't it possible to apply desired settings with existing LED subsystem
brightness file, and delay_on/off files exposed by timer trigger?

Best regards,
Jacek Anaszewski

> Signed-off-by: Felix Brack <fb@ltec.ch>
> ---
>  .../devicetree/bindings/leds/leds-pca9532.txt      | 22 ++++++++++++
>  drivers/leds/leds-pca9532.c                        | 41 +++++++++++++++++++++-
>  include/linux/leds-pca9532.h                       |  4 +--
>  3 files changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> index 198f3ba..81b6563 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> @@ -11,12 +11,24 @@ Required properties:
>  		"nxp,pca9533"
>  	- reg -  I2C slave address
>  
> +Optional properties:
> +	- psc0: 8 bit prescaler value according to NXP data sheet
> +	- pwm0: 8 bit PWM value according to NXP data sheet
> +	- psc1: 8 bit prescaler value according to NXP data sheet
> +	- pwm1: 8 bit PWM value according to NXP data sheet
> +
>  Each led is represented as a sub-node of the nxp,pca9530.
>  
>  Optional sub-node properties:
>  	- label: see Documentation/devicetree/bindings/leds/common.txt
>  	- type: Output configuration, see dt-bindings/leds/leds-pca9532.h (default NONE)
>  	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
> +	- default-state: see Documentation/devicetree/bindings/leds/common.txt
> +	  This property is only valid for sub-nodes of type <PCA9532_TYPE_LED>.
> +	  In addition to the values mentioned in the document above the additional
> +	  values "pwm0" and "pwm1" are valid. The corresponding LED will blink
> +	  or will be dimmed depending on the configuration of prescaler and pwm
> +	  values (see optional node properties above).
>  
>  Example:
>    #include <dt-bindings/leds/leds-pca9532.h>
> @@ -24,6 +36,8 @@ Example:
>    leds: pca9530@60 {
>      compatible = "nxp,pca9530";
>      reg = <0x60>;
> +    psc0 = <0x97>; // blink frequency 1Hz
> +    pwm0 = <0x80>; // 50% duty cycle (500ms On / 500ms Off)
>  
>      red-power {
>        label = "pca:red:power";
> @@ -33,6 +47,14 @@ Example:
>        label = "pca:green:power";
>        type = <PCA9532_TYPE_LED>;
>      };
> +    kernel-booting {
> +    	type = <PCA9532_TYPE_LED>;
> +    	default-state = "pwm0";
> +    };
> +    sys-stat {
> +    	type = <PCA9532_TYPE_LED>;
> +    	default-state = "keep"; // don't touch, was set by U-Boot
> +    };
>    };
>  
>  For more product information please see the link below:
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 06e6310..3353739 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -254,6 +254,21 @@ static void pca9532_input_work(struct work_struct *work)
>  	mutex_unlock(&data->update_lock);
>  }
>  
> +static enum pca9532_state pca9532_getled(struct pca9532_led *led)
> +{
> +	struct i2c_client *client = led->client;
> +	struct pca9532_data *data = i2c_get_clientdata(client);
> +	u8 maxleds = data->chip_info->num_leds;
> +	char reg;
> +	enum pca9532_state ret;
> +
> +	mutex_lock(&data->update_lock);
> +	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
> +	ret = reg >> LED_NUM(led->id)/2;
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
>  #ifdef CONFIG_LEDS_PCA9532_GPIO
>  static int pca9532_gpio_request_pin(struct gpio_chip *gc, unsigned offset)
>  {
> @@ -366,7 +381,10 @@ static int pca9532_configure(struct i2c_client *client,
>  			gpios++;
>  			break;
>  		case PCA9532_TYPE_LED:
> -			led->state = pled->state;
> +			if (pled->state == PCA9532_KEEP)
> +				led->state = pca9532_getled(led);
> +			else
> +				led->state = pled->state;
>  			led->name = pled->name;
>  			led->ldev.name = led->name;
>  			led->ldev.default_trigger = pled->default_trigger;
> @@ -456,6 +474,8 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
>  	const struct of_device_id *match;
>  	int devid, maxleds;
>  	int i = 0;
> +	const char *state;
> +	u32 val;
>  
>  	match = of_match_device(of_pca9532_leds_match, dev);
>  	if (!match)
> @@ -468,6 +488,15 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
>  	if (!pdata)
>  		return ERR_PTR(-ENOMEM);
>  
> +	if (!of_property_read_u32(np, "psc0", &val))
> +		pdata->psc[0] = val & 0xff;
> +	if (!of_property_read_u32(np, "pwm0", &val))
> +		pdata->pwm[0] = val & 0xff;
> +	if (!of_property_read_u32(np, "psc1", &val))
> +		pdata->psc[1] = val & 0xff;
> +	if (!of_property_read_u32(np, "pwm1", &val))
> +		pdata->pwm[1] = val & 0xff;
> +
>  	for_each_child_of_node(np, child) {
>  		if (of_property_read_string(child, "label",
>  					    &pdata->leds[i].name))
> @@ -475,6 +504,16 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
>  		of_property_read_u32(child, "type", &pdata->leds[i].type);
>  		of_property_read_string(child, "linux,default-trigger",
>  					&pdata->leds[i].default_trigger);
> +		if (!of_property_read_string(child, "default-state", &state)) {
> +			if (!strcmp(state, "on"))
> +				pdata->leds[i].state = PCA9532_ON;
> +			else if (!strcmp(state, "keep"))
> +				pdata->leds[i].state = PCA9532_KEEP;
> +			else if (!strcmp(state, "pwm0"))
> +				pdata->leds[i].state = PCA9532_PWM0;
> +			else if (!strcmp(state, "pwm1"))
> +				pdata->leds[i].state = PCA9532_PWM1;
> +		}
>  		if (++i >= maxleds) {
>  			of_node_put(child);
>  			break;
> diff --git a/include/linux/leds-pca9532.h b/include/linux/leds-pca9532.h
> index d215b45..a327b1aa 100644
> --- a/include/linux/leds-pca9532.h
> +++ b/include/linux/leds-pca9532.h
> @@ -22,7 +22,8 @@ enum pca9532_state {
>  	PCA9532_OFF  = 0x0,
>  	PCA9532_ON   = 0x1,
>  	PCA9532_PWM0 = 0x2,
> -	PCA9532_PWM1 = 0x3
> +	PCA9532_PWM1 = 0x3,
> +	PCA9532_KEEP = 0xff
>  };
>  
>  struct pca9532_led {
> @@ -44,4 +45,3 @@ struct pca9532_platform_data {
>  };
>  
>  #endif /* __LINUX_PCA9532_H */
> -
> 
