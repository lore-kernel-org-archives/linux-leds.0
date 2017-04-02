From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] Extend pca9532 device tree support
Date: Sun, 2 Apr 2017 16:41:55 +0200
Message-ID: <b54c77d5-b4f7-9517-8c5b-9200c766204a@gmail.com>
References: <1490880833-22199-1-git-send-email-fb@ltec.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33457 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751482AbdDBOmk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 2 Apr 2017 10:42:40 -0400
In-Reply-To: <1490880833-22199-1-git-send-email-fb@ltec.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Felix Brack <fb@ltec.ch>, rpurdie@rpsys.net, pavel@ucw.cz, mark.rutland@arm.com, riku.voipio@iki.fi, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi Felix,

Thanks for the patch.

I made a few cosmetic amendments to it, please refer below.

On 03/30/2017 03:33 PM, Felix Brack wrote:
> This patch extends the device tree support for the pca9532 by adding
> the leds 'default-state' property.
> 

Added leds: pca9532: prefix to the patch title.

Removed below change history from the commit message.

> Changes in v2:
> - remove prescaler and pwm configuration by none generic
>   DT properties
> 
> Signed-off-by: Felix Brack <fb@ltec.ch>
> ---
>  .../devicetree/bindings/leds/leds-pca9532.txt      | 10 +++++++
>  drivers/leds/leds-pca9532.c                        | 31 +++++++++++++++++++++-
>  include/linux/leds-pca9532.h                       |  4 +--
>  3 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> index 198f3ba..8374075 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> @@ -17,6 +17,8 @@ Optional sub-node properties:
>  	- label: see Documentation/devicetree/bindings/leds/common.txt
>  	- type: Output configuration, see dt-bindings/leds/leds-pca9532.h (default NONE)
>  	- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
> +	- default-state: see Documentation/devicetree/bindings/leds/common.txt
> +	  This property is only valid for sub-nodes of type <PCA9532_TYPE_LED>.
>  
>  Example:
>    #include <dt-bindings/leds/leds-pca9532.h>
> @@ -33,6 +35,14 @@ Example:
>        label = "pca:green:power";
>        type = <PCA9532_TYPE_LED>;
>      };
> +    kernel-booting {
> +    	type = <PCA9532_TYPE_LED>;
> +    	default-state = "on";
> +    };
> +    sys-stat {
> +    	type = <PCA9532_TYPE_LED>;
> +    	default-state = "keep"; // don't touch, was set by U-Boot
> +    };

Adjusted above indentation to match the preceding lines.

>    };
>  
>  For more product information please see the link below:
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index 06e6310..66ef280 100644
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
> @@ -456,6 +474,7 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
>  	const struct of_device_id *match;
>  	int devid, maxleds;
>  	int i = 0;
> +	const char *state;
>  
>  	match = of_match_device(of_pca9532_leds_match, dev);
>  	if (!match)
> @@ -475,6 +494,16 @@ pca9532_of_populate_pdata(struct device *dev, struct device_node *np)
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

Added a comma at the end of the above line to avoid the need for
changing two lines on addition of a new enum value, like in this case.

>  };
>  
>  struct pca9532_led {
> @@ -44,4 +45,3 @@ struct pca9532_platform_data {
>  };
>  
>  #endif /* __LINUX_PCA9532_H */
> -
> 

The patch, with the aforementioned amendments, has been applied to
the for-next branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
