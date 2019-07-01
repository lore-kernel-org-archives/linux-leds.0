From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 1/2] leds: tlc591xx: simplify driver by using the managed
 led API
Date: Mon, 1 Jul 2019 10:35:44 -0500
Message-ID: <da1acdad-4c7b-f297-7bcb-104e0c0cd4b7@ti.com>
References: <20190701152602.31716-1-jjhiblot@ti.com>
 <20190701152602.31716-2-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701152602.31716-2-jjhiblot@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com
List-Id: linux-leds@vger.kernel.org


On 7/1/19 10:26 AM, Jean-Jacques Hiblot wrote:
> Use the managed API of the LED class (devm_led_classdev_register()
> instead of led_classdev_register()).
> This allows us to remove the code used to track-and-destroy the LED devices
>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>   drivers/leds/leds-tlc591xx.c | 81 ++++++++++--------------------------
>   1 file changed, 21 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
> index 59ff088c7d75..14e47ff44df5 100644
> --- a/drivers/leds/leds-tlc591xx.c
> +++ b/drivers/leds/leds-tlc591xx.c
> @@ -128,51 +128,6 @@ tlc591xx_brightness_set(struct led_classdev *led_cdev,
>   	return err;
>   }
>   
> -static void
> -tlc591xx_destroy_devices(struct tlc591xx_priv *priv, unsigned int j)
> -{
> -	int i = j;
> -
> -	while (--i >= 0) {
> -		if (priv->leds[i].active)
> -			led_classdev_unregister(&priv->leds[i].ldev);
> -	}
> -}
> -
> -static int
> -tlc591xx_configure(struct device *dev,
> -		   struct tlc591xx_priv *priv,
> -		   const struct tlc591xx *tlc591xx)
> -{
> -	unsigned int i;
> -	int err = 0;
> -
> -	tlc591xx_set_mode(priv->regmap, MODE2_DIM);
> -	for (i = 0; i < TLC591XX_MAX_LEDS; i++) {
> -		struct tlc591xx_led *led = &priv->leds[i];
> -
> -		if (!led->active)
> -			continue;
> -
> -		led->priv = priv;
> -		led->led_no = i;
> -		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
> -		led->ldev.max_brightness = LED_FULL;
> -		err = led_classdev_register(dev, &led->ldev);
> -		if (err < 0) {
> -			dev_err(dev, "couldn't register LED %s\n",
> -				led->ldev.name);
> -			goto exit;
> -		}
> -	}
> -
> -	return 0;
> -
> -exit:
> -	tlc591xx_destroy_devices(priv, i);
> -	return err;
> -}
> -
>   static const struct regmap_config tlc591xx_regmap = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
> @@ -197,7 +152,7 @@ tlc591xx_probe(struct i2c_client *client,
>   	const struct of_device_id *match;
>   	const struct tlc591xx *tlc591xx;
>   	struct tlc591xx_priv *priv;
> -	int err, count, reg;
> +	int err, count, reg, idx = 0;
>   
>   	match = of_match_device(of_tlc591xx_leds_match, dev);
>   	if (!match)
> @@ -225,7 +180,11 @@ tlc591xx_probe(struct i2c_client *client,
>   
>   	i2c_set_clientdata(client, priv);
>   
> +	tlc591xx_set_mode(priv->regmap, MODE2_DIM);
> +
>   	for_each_child_of_node(np, child) {
> +		struct tlc591xx_led *led;
> +
>   		err = of_property_read_u32(child, "reg", &reg);

You should check to make sure "reg" is not out of bounds for the device.

This was handled in the for..loop in the configure routine

Dan

>   		if (err) {
>   			of_node_put(child);
> @@ -236,22 +195,25 @@ tlc591xx_probe(struct i2c_client *client,
>   			of_node_put(child);
>   			return -EINVAL;
>   		}
> -		priv->leds[reg].active = true;
> -		priv->leds[reg].ldev.name =
> +		led = &priv->leds[reg];
> +
> +		led->active = true;
> +		led->ldev.name =
>   			of_get_property(child, "label", NULL) ? : child->name;
> -		priv->leds[reg].ldev.default_trigger =
> +		led->ldev.default_trigger =
>   			of_get_property(child, "linux,default-trigger", NULL);
> -	}
> -	return tlc591xx_configure(dev, priv, tlc591xx);
> -}
> -
> -static int
> -tlc591xx_remove(struct i2c_client *client)
> -{
> -	struct tlc591xx_priv *priv = i2c_get_clientdata(client);
> -
> -	tlc591xx_destroy_devices(priv, TLC591XX_MAX_LEDS);
>   
> +		led->priv = priv;
> +		led->led_no = idx++;
> +		led->ldev.brightness_set_blocking = tlc591xx_brightness_set;
> +		led->ldev.max_brightness = LED_FULL;
> +		err = devm_led_classdev_register(dev, &led->ldev);
> +		if (err < 0) {
> +			dev_err(dev, "couldn't register LED %s\n",
> +				led->ldev.name);
> +			return err;
> +		}
> +	}
>   	return 0;
>   }
>   
> @@ -268,7 +230,6 @@ static struct i2c_driver tlc591xx_driver = {
>   		.of_match_table = of_match_ptr(of_tlc591xx_leds_match),
>   	},
>   	.probe = tlc591xx_probe,
> -	.remove = tlc591xx_remove,
>   	.id_table = tlc591xx_id,
>   };
>   
