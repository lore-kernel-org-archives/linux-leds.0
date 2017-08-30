From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pca955x: check for I2C errors
Date: Wed, 30 Aug 2017 22:00:30 +0200
Message-ID: <f171c638-4190-30ba-94dc-36fdf9ed10de@gmail.com>
References: <20170830112551.3493-1-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36658 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbdH3UBR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Aug 2017 16:01:17 -0400
Received: by mail-wr0-f194.google.com with SMTP id 40so4542857wrv.3
        for <linux-leds@vger.kernel.org>; Wed, 30 Aug 2017 13:01:17 -0700 (PDT)
In-Reply-To: <20170830112551.3493-1-clg@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Andrew Jeffery <andrew@aj.id.au>

Hi Cedric,

Thanks for the patch.

On 08/30/2017 01:25 PM, Cédric Le Goater wrote:
> This should also allow probing to fail when a pca955x chip is not
> found on a I2C bus.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> 
>  Andrew,
> 
>  The patch conflicts with your patch :
> 
>    "leds: pca955x: Don't invert requested value in pca955x_gpio_set_value()"
> 
>  and I have chosen to be in sync with the 'for-next' branch of the
>  linux-leds git repo. Depending on the reviews we will have to respin
>  one or the other.

Applied yours as first.

Best regards,
Jacek Anaszewski


>  Cheers,
> 
>  C.
> 
>  drivers/leds/leds-pca955x.c | 114 ++++++++++++++++++++++++++++++++------------
>  1 file changed, 83 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 09303fd1fdc6..905729191d3e 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -165,13 +165,18 @@ static inline u8 pca955x_ledsel(u8 oldval, int led_num, int state)
>   * Write to frequency prescaler register, used to program the
>   * period of the PWM output.  period = (PSCx + 1) / 38
>   */
> -static void pca955x_write_psc(struct i2c_client *client, int n, u8 val)
> +static int pca955x_write_psc(struct i2c_client *client, int n, u8 val)
>  {
>  	struct pca955x *pca955x = i2c_get_clientdata(client);
> +	int ret;
>  
> -	i2c_smbus_write_byte_data(client,
> +	ret = i2c_smbus_write_byte_data(client,
>  		pca95xx_num_input_regs(pca955x->chipdef->bits) + 2*n,
>  		val);
> +	if (ret < 0)
> +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> +			__func__, n, val, ret);
> +	return ret;
>  }
>  
>  /*
> @@ -181,38 +186,56 @@ static void pca955x_write_psc(struct i2c_client *client, int n, u8 val)
>   *
>   * Duty cycle is (256 - PWMx) / 256
>   */
> -static void pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
> +static int pca955x_write_pwm(struct i2c_client *client, int n, u8 val)
>  {
>  	struct pca955x *pca955x = i2c_get_clientdata(client);
> +	int ret;
>  
> -	i2c_smbus_write_byte_data(client,
> +	ret = i2c_smbus_write_byte_data(client,
>  		pca95xx_num_input_regs(pca955x->chipdef->bits) + 1 + 2*n,
>  		val);
> +	if (ret < 0)
> +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> +			__func__, n, val, ret);
> +	return ret;
>  }
>  
>  /*
>   * Write to LED selector register, which determines the source that
>   * drives the LED output.
>   */
> -static void pca955x_write_ls(struct i2c_client *client, int n, u8 val)
> +static int pca955x_write_ls(struct i2c_client *client, int n, u8 val)
>  {
>  	struct pca955x *pca955x = i2c_get_clientdata(client);
> +	int ret;
>  
> -	i2c_smbus_write_byte_data(client,
> +	ret = i2c_smbus_write_byte_data(client,
>  		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n,
>  		val);
> +	if (ret < 0)
> +		dev_err(&client->dev, "%s: reg 0x%x, val 0x%x, err %d\n",
> +			__func__, n, val, ret);
> +	return ret;
>  }
>  
>  /*
>   * Read the LED selector register, which determines the source that
>   * drives the LED output.
>   */
> -static u8 pca955x_read_ls(struct i2c_client *client, int n)
> +static int pca955x_read_ls(struct i2c_client *client, int n, u8 *val)
>  {
>  	struct pca955x *pca955x = i2c_get_clientdata(client);
> +	int ret;
>  
> -	return (u8) i2c_smbus_read_byte_data(client,
> +	ret = i2c_smbus_read_byte_data(client,
>  		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
> +			__func__, n, ret);
> +		return ret;
> +	}
> +	*val = (u8)ret;
> +	return 0;
>  }
>  
>  static int pca955x_led_set(struct led_classdev *led_cdev,
> @@ -223,6 +246,7 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>  	u8 ls;
>  	int chip_ls;	/* which LSx to use (0-3 potentially) */
>  	int ls_led;	/* which set of bits within LSx to use (0-3) */
> +	int ret;
>  
>  	pca955x_led = container_of(led_cdev, struct pca955x_led, led_cdev);
>  	pca955x = pca955x_led->pca955x;
> @@ -232,7 +256,9 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>  
>  	mutex_lock(&pca955x->lock);
>  
> -	ls = pca955x_read_ls(pca955x->client, chip_ls);
> +	ret = pca955x_read_ls(pca955x->client, chip_ls, &ls);
> +	if (ret)
> +		goto out;
>  
>  	switch (value) {
>  	case LED_FULL:
> @@ -252,26 +278,37 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>  		 * OFF, HALF, or FULL.  But, this is probably better than
>  		 * just turning off for all other values.
>  		 */
> -		pca955x_write_pwm(pca955x->client, 1,
> -				255 - value);
> +		ret = pca955x_write_pwm(pca955x->client, 1, 255 - value);
> +		if (ret)
> +			goto out;
>  		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK1);
>  		break;
>  	}
>  
> -	pca955x_write_ls(pca955x->client, chip_ls, ls);
> +	ret = pca955x_write_ls(pca955x->client, chip_ls, ls);
>  
> +out:
>  	mutex_unlock(&pca955x->lock);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  #ifdef CONFIG_LEDS_PCA955X_GPIO
>  /*
>   * Read the INPUT register, which contains the state of LEDs.
>   */
> -static u8 pca955x_read_input(struct i2c_client *client, int n)
> +static int pca955x_read_input(struct i2c_client *client, int n, u8 *val)
>  {
> -	return (u8)i2c_smbus_read_byte_data(client, n);
> +	int ret = i2c_smbus_read_byte_data(client, n);
> +
> +	if (ret < 0) {
> +		dev_err(&client->dev, "%s: reg 0x%x, err %d\n",
> +			__func__, n, ret);
> +		return ret;
> +	}
> +	*val = (u8)ret;
> +	return 0;
> +
>  }
>  
>  static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
> @@ -285,23 +322,32 @@ static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
>  	return -EBUSY;
>  }
>  
> -static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
> -				   int val)
> +static int pca955x_set_value(struct gpio_chip *gc, unsigned int offset,
> +			     int val)
>  {
>  	struct pca955x *pca955x = gpiochip_get_data(gc);
>  	struct pca955x_led *led = &pca955x->leds[offset];
>  
>  	if (val)
> -		pca955x_led_set(&led->led_cdev, LED_FULL);
> +		return pca955x_led_set(&led->led_cdev, LED_FULL);
>  	else
> -		pca955x_led_set(&led->led_cdev, LED_OFF);
> +		return pca955x_led_set(&led->led_cdev, LED_OFF);
> +}
> +
> +static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
> +				   int val)
> +{
> +	pca955x_set_value(gc, offset, val);
>  }
>  
>  static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct pca955x *pca955x = gpiochip_get_data(gc);
>  	struct pca955x_led *led = &pca955x->leds[offset];
> -	u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);
> +	u8 reg = 0;
> +
> +	/* There is nothing we can do about errors */
> +	pca955x_read_input(pca955x->client, led->led_num / 8, &reg);
>  
>  	return !!(reg & (1 << (led->led_num % 8)));
>  }
> @@ -310,17 +356,13 @@ static int pca955x_gpio_direction_input(struct gpio_chip *gc,
>  					unsigned int offset)
>  {
>  	/* To use as input ensure pin is not driven */
> -	pca955x_gpio_set_value(gc, offset, 0);
> -
> -	return 0;
> +	return pca955x_set_value(gc, offset, 0);
>  }
>  
>  static int pca955x_gpio_direction_output(struct gpio_chip *gc,
>  					 unsigned int offset, int val)
>  {
> -	pca955x_gpio_set_value(gc, offset, val);
> -
> -	return 0;
> +	return pca955x_set_value(gc, offset, val);
>  }
>  #endif /* CONFIG_LEDS_PCA955X_GPIO */
>  
> @@ -495,19 +537,29 @@ static int pca955x_probe(struct i2c_client *client,
>  				return err;
>  
>  			/* Turn off LED */
> -			pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> +			err = pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
> +			if (err)
> +				return err;
>  		}
>  	}
>  
>  	/* PWM0 is used for half brightness or 50% duty cycle */
> -	pca955x_write_pwm(client, 0, 255-LED_HALF);
> +	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
> +	if (err)
> +		return err;
>  
>  	/* PWM1 is used for variable brightness, default to OFF */
> -	pca955x_write_pwm(client, 1, 0);
> +	err = pca955x_write_pwm(client, 1, 0);
> +	if (err)
> +		return err;
>  
>  	/* Set to fast frequency so we do not see flashing */
> -	pca955x_write_psc(client, 0, 0);
> -	pca955x_write_psc(client, 1, 0);
> +	err = pca955x_write_psc(client, 0, 0);
> +	if (err)
> +		return err;
> +	err = pca955x_write_psc(client, 1, 0);
> +	if (err)
> +		return err;
>  
>  #ifdef CONFIG_LEDS_PCA955X_GPIO
>  	if (ngpios) {
> 
