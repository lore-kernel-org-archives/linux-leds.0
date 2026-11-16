Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833030;
	b=KZ24CQaXCLveob3xRffseRSRrBLmyUyTVgYKmQSeAKeRh9aOh6zrN3oavMj/eGjxLqwJ
	 b+RR8dVCQu1RlrBF5sKXrExGxkAkzeTRcJHV7lQO/CFyXYoYRhKhaHAkwZ/uWKiFlktEu
	 ckicdkauRf9nzdfjMCYIPnicpUN7em2HisZ21bd129gvOckLiQqMW9qx+2q2IEz0Fp+Vc
	 8NphdJv9jkATK0XZb2lSqBCHbKicUElYVJ4wKy6OcNC8q8KjcFSJsaAcwlB0MrJM0cfas
	 uLr6jJhphZyOVgOHeKEkP/Z/L3OojaXEhO3z1/lVdMuM6wmLN2n554dUjFpkH9Of8pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833030;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=urIVqAaFnFIHT9JGVNJy2ZG+PANfR+BVWX9qgyiwtQA=;
	b=zbl5PBBDy5Bd++GbeTnUaan1fXM6eN+1oTYbXQvfcjNnXTsDwcnTjHEy6Wm+CMg2+ljT
	 hbT6n4PEPcENMukE26Pj4Q+NuzKnpfjSXAaHys9NXgx5HGmpX8ZNObg/N6wDFpVQC6AON
	 OjqX0LduL9W+H3RpWJsc4a7LrZXnGbICyYroWAj5oP1X8/YhO0Gtd/Fa9fH4G290M3Cxb
	 DVYV8bYEYbICzJXq9sUemRD4ToXIjmmHy39H3u3ICajuJdklzek9EOqyrZw3HyAcgqVIp
	 jyeCcj+tnlpDwhYlIq1hHUtv/7XpXVw8mf3VHQ9e4H2BcB23OjCyTKHCl3+RMCiqDRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3ffCp4l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E7606A332;
	Mon, 16 Nov 2026 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N3ffCp4l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AAF1F000CC;
	Mon, 16 Nov 2026 12:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833029;
	bh=urIVqAaFnFIHT9JGVNJy2ZG+PANfR+BVWX9qgyiwtQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N3ffCp4lPtR0iCLPq6GX/hhh2lHoIpNQVrKCZSAf0KDSey2D/Y0oI4aLbDaMYTS6o
	 OmNlFkWqmulv2yVfUL9Fn+9PcEvSZb2ahEj/Dud9A0qbnuN+peCnIbyI9Ra96fbh+e
	 zEeNu66F+q/Lu0TYuMsx9MTuJYU/+R5mYaxPBx1tg+3gOrDWov9Jd21Wzqqh8wDSmH
	 FCHpOdZqdSVNVhPdl1anUa1HaoVdmXqJq11H2P4pBmWFQCAtHOjfCAZROFZ1kFH5oe
	 V7TnorOZsCxurm7DUGyQWF4Sn+W4LCApaNwiX9I51J8goU5HF7sXrQPtvYVyGg32Xg
	 MAzrfn/VFQ4Og==
Date: Mon, 16 Nov 2026 12:43:45 +0000
From: Lee Jones <lee@kernel.org>
To: Daniil Demakov <t3127430@gmail.com>
Cc: linux-leds@vger.kernel.org, pavel@kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] leds: pca9532: Propagate I2C errors
Message-ID: <20261116124345.GN6323@joneslee-macbookpro.roam.internal>
References: <20261114141926.92737-1-t3127430@gmail.com>
 <20261114185201.30519-1-t3127430@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261114185201.30519-1-t3127430@gmail.com>

INTENTIONAL TOP POST

Submitting patches as reply-to gets real confusing, real fast.

Please resubmit the latest version as an orthogonal patch/set.

On Sat, 14 Nov 2026, Daniil Demakov wrote:

> Check return values from SMBus read and write operations and
> propagate errors through LED, PWM, blink and GPIO operations.
> 
> Restore previous LED and PWM state when hardware updates fail.
> Protect shared LED and PWM state with the update mutex.
> 
> Check register writes during device initialization and register
> LED class devices only after successfully configuring the hardware.
> 
> Signed-off-by: Daniil Demakov <t3127430@gmail.com>
> ---
>  drivers/leds/leds-pca9532.c | 336 +++++++++++++++++++++++++++++-------
>  1 file changed, 270 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index c8085427696f..19b993d9ac9f 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -14,6 +14,7 @@
>  #include <linux/leds.h>
>  #include <linux/input.h>
>  #include <linux/mutex.h>
> +#include <linux/spinlock.h>
>  #include <linux/workqueue.h>
>  #include <linux/leds-pca9532.h>
>  #include <linux/gpio/driver.h>
> @@ -42,6 +43,9 @@ struct pca9532_data {
>  	struct i2c_client *client;
>  	struct pca9532_led leds[16];
>  	struct mutex update_lock;
> +	/* Protects beep_pwm between the event callback and workqueue. */
> +	spinlock_t beep_lock;
> +	u8 beep_pwm;
>  	struct input_dev *idev;
>  	struct work_struct work;
>  #ifdef CONFIG_LEDS_PCA9532_GPIO
> @@ -144,68 +148,147 @@ static int pca9532_calcpwm(struct i2c_client *client, int pwm, int blink,
>  	return 0;
>  }
>  
> -static int pca9532_setpwm(struct i2c_client *client, int pwm)
> +static int __pca9532_setpwm(struct i2c_client *client, int pwm)
>  {
>  	struct pca9532_data *data = i2c_get_clientdata(client);
>  	u8 maxleds = data->chip_info->num_leds;
> +	int ret;
>  
> -	mutex_lock(&data->update_lock);
> -	i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, pwm),
> -		data->pwm[pwm]);
> -	i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, pwm),
> -		data->psc[pwm]);
> -	mutex_unlock(&data->update_lock);
> -	return 0;
> -}
> +	if (pwm < 0 || pwm > 1)
> +		return -EINVAL;
> +
> +	ret = i2c_smbus_write_byte_data(client,
> +					PCA9532_REG_PWM(maxleds, pwm),
> +					data->pwm[pwm]);
> +	if (ret < 0) {
> +		dev_warn(&client->dev,
> +			 "Failed to write PWM register: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = i2c_smbus_write_byte_data(client,
> +					PCA9532_REG_PSC(maxleds, pwm),
> +					data->psc[pwm]);
> +	if (ret < 0)
> +		dev_warn(&client->dev,
> +			 "Failed to write PSC register: %d\n", ret);
>  
> +	return ret;
> +}
>  /* Set LED routing */
> -static void pca9532_setled(struct pca9532_led *led)
> +static int __pca9532_setled(struct pca9532_led *led)
>  {
>  	struct i2c_client *client = led->client;
>  	struct pca9532_data *data = i2c_get_clientdata(client);
>  	u8 maxleds = data->chip_info->num_leds;
> -	char reg;
> +	int reg;
> +	int ret;
>  
> -	mutex_lock(&data->update_lock);
>  	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
> +	if (reg < 0) {
> +		ret = reg;
> +		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
> +		return ret;
> +	}
> +
>  	/* zero led bits */
> -	reg = reg & ~LED_MASK(led->id);
> +	reg &= ~LED_MASK(led->id);
> +
>  	/* set the new value */
> -	reg = reg | (led->state << LED_SHIFT(led->id));
> -	i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
> +	reg |= led->state << LED_SHIFT(led->id);
> +
> +	ret = i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
> +
> +	if (ret < 0)
> +		dev_warn(&client->dev, "Failed to write LED register: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int pca9532_setled(struct pca9532_led *led)
> +{
> +	struct pca9532_data *data = i2c_get_clientdata(led->client);
> +	int ret;
> +
> +	mutex_lock(&data->update_lock);
> +	ret = __pca9532_setled(led);
>  	mutex_unlock(&data->update_lock);
> +
> +	return ret;
>  }
>  
>  static int pca9532_set_brightness(struct led_classdev *led_cdev,
> -	enum led_brightness value)
> +				  enum led_brightness value)
>  {
> -	int err = 0;
>  	struct pca9532_led *led = ldev_to_led(led_cdev);
> +	struct pca9532_data *data = i2c_get_clientdata(led->client);
> +	int old_state;
> +	u8 old_pwm;
> +	u8 old_psc;
> +	bool pwm_updated = false;
> +	int restore_err;
> +	int err = 0;
> +
> +	mutex_lock(&data->update_lock);
> +	old_state = led->state;
> +	old_pwm = data->pwm[PCA9532_PWM_ID_0];
> +	old_psc = data->psc[PCA9532_PWM_ID_0];
>  
>  	if (value == LED_OFF) {
>  		led->state = PCA9532_OFF;
>  	} else if (led->state == PCA9532_PWM1) {
> -		return 0; /* Non-zero brightness shall not stop HW blinking */
> +		goto out;
>  	} else if (value == LED_FULL) {
>  		led->state = PCA9532_ON;
>  	} else {
> -		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
> -		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0, 0, value);
> +		led->state = PCA9532_PWM0;
> +		err = pca9532_calcpwm(led->client, PCA9532_PWM_ID_0,
> +				      0, value);
>  		if (err)
> -			return err;
> +			goto restore_state;
> +	}
> +
> +	if (led->state == PCA9532_PWM0) {
> +		pwm_updated = true;
> +		err = __pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
> +		if (err < 0)
> +			goto restore_state;
>  	}
> -	if (led->state == PCA9532_PWM0)
> -		pca9532_setpwm(led->client, PCA9532_PWM_ID_0);
> -	pca9532_setled(led);
> +
> +	err = __pca9532_setled(led);
> +	if (err < 0)
> +		goto restore_state;
> +
> +	goto out;
> +
> +restore_state:
> +	led->state = old_state;
> +	data->pwm[PCA9532_PWM_ID_0] = old_pwm;
> +	data->psc[PCA9532_PWM_ID_0] = old_psc;
> +
> +	if (pwm_updated) {
> +		restore_err = __pca9532_setpwm(led->client,
> +					       PCA9532_PWM_ID_0);
> +		if (restore_err < 0)
> +			dev_warn(&led->client->dev,
> +				 "Failed to restore PWM settings: %d\n",
> +				 restore_err);
> +	}
> +out:
> +	mutex_unlock(&data->update_lock);
>  	return err;
>  }
>  
>  static int pca9532_update_hw_blink(struct pca9532_led *led,
> -				   unsigned long delay_on, unsigned long delay_off)
> +				   unsigned long delay_on,
> +				   unsigned long delay_off)
>  {
>  	struct pca9532_data *data = i2c_get_clientdata(led->client);
>  	unsigned int psc;
> -	int i;
> +	unsigned long period;
> +	u8 old_pwm = data->pwm[PCA9532_PWM_ID_1];
> +	u8 old_psc = data->psc[PCA9532_PWM_ID_1];
> +	int i, ret;
>  
>  	/* Look for others LEDs that already use PWM1 */
>  	for (i = 0; i < data->chip_info->num_leds; i++) {
> @@ -223,29 +306,64 @@ static int pca9532_update_hw_blink(struct pca9532_led *led,
>  		}
>  	}
>  
> -	psc = ((delay_on + delay_off) * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> -	if (psc > U8_MAX) {
> -		/* Blink period too long to be handled by hardware */
> +	if (delay_on > ULONG_MAX - delay_off)
>  		return -EINVAL;
> +
> +	period = delay_on + delay_off;
> +
> +	if (!delay_on || !delay_off)
> +		return -EINVAL;
> +
> +	if (period > ((U8_MAX + 1) * 1000) /
> +		     PCA9532_PWM_PERIOD_DIV)
> +		return -EINVAL;
> +
> +	psc = (period * PCA9532_PWM_PERIOD_DIV - 1) / 1000;
> +
> +	data->psc[PCA9532_PWM_ID_1] = psc;
> +	data->pwm[PCA9532_PWM_ID_1] =
> +		(delay_on * PCA9532_PWM_DUTY_DIV) / period;
> +
> +	ret = __pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
> +	if (ret < 0) {
> +		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
> +		data->psc[PCA9532_PWM_ID_1] = old_psc;
> +
> +		if (__pca9532_setpwm(data->client, PCA9532_PWM_ID_1) < 0)
> +			dev_warn(&data->client->dev,
> +				 "Failed to restore PWM settings\n");
> +
> +		return ret;
>  	}
>  
>  	led->state = PCA9532_PWM1;
> -	data->psc[PCA9532_PWM_ID_1] = psc;
> -	data->pwm[PCA9532_PWM_ID_1] = (delay_on * PCA9532_PWM_DUTY_DIV) / (delay_on + delay_off);
>  
> -	return pca9532_setpwm(data->client, PCA9532_PWM_ID_1);
> +	return 0;
>  }
>  
>  static int pca9532_set_blink(struct led_classdev *led_cdev,
> -	unsigned long *delay_on, unsigned long *delay_off)
> +			     unsigned long *delay_on,
> +			     unsigned long *delay_off)
>  {
>  	struct pca9532_led *led = ldev_to_led(led_cdev);
>  	struct i2c_client *client = led->client;
>  	struct pca9532_data *data = i2c_get_clientdata(client);
> +	int old_state;
> +	int restore_err;
> +	u8 old_pwm;
> +	u8 old_psc;
>  	int err;
>  
> -	if (!data->hw_blink)
> -		return -EINVAL;
> +	mutex_lock(&data->update_lock);
> +
> +	old_state = led->state;
> +	old_pwm = data->pwm[PCA9532_PWM_ID_1];
> +	old_psc = data->psc[PCA9532_PWM_ID_1];
> +
> +	if (!data->hw_blink) {
> +		err = -EINVAL;
> +		goto out;
> +	}
>  
>  	if (*delay_on == 0 && *delay_off == 0) {
>  		/* led subsystem ask us for a blink rate */
> @@ -255,26 +373,47 @@ static int pca9532_set_blink(struct led_classdev *led_cdev,
>  
>  	err = pca9532_update_hw_blink(led, *delay_on, *delay_off);
>  	if (err)
> -		return err;
> +		goto restore_state;
> +
> +	err = __pca9532_setled(led);
> +	if (err < 0) {
> +		led->state = old_state;
> +		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
> +		data->psc[PCA9532_PWM_ID_1] = old_psc;
> +
> +		restore_err = __pca9532_setpwm(client, PCA9532_PWM_ID_1);
> +		if (restore_err < 0)
> +			dev_warn(&client->dev,
> +				 "Failed to restore PWM settings: %d\n",
> +				 restore_err);
> +	}
>  
> -	pca9532_setled(led);
> +	goto out;
>  
> -	return 0;
> +restore_state:
> +	led->state = old_state;
> +out:
> +	mutex_unlock(&data->update_lock);
> +	return err;
>  }
>  
>  static int pca9532_event(struct input_dev *dev, unsigned int type,
> -	unsigned int code, int value)
> +			 unsigned int code, int value)
>  {
>  	struct pca9532_data *data = input_get_drvdata(dev);
> +	unsigned long flags;
>  
>  	if (!(type == EV_SND && (code == SND_BELL || code == SND_TONE)))
>  		return -1;
>  
> -	/* XXX: allow different kind of beeps with psc/pwm modifications */
> +	spin_lock_irqsave(&data->beep_lock, flags);
> +
>  	if (value > 1 && value < 32767)
> -		data->pwm[PCA9532_PWM_ID_1] = 127;
> +		data->beep_pwm = 127;
>  	else
> -		data->pwm[PCA9532_PWM_ID_1] = 0;
> +		data->beep_pwm = 0;
> +
> +	spin_unlock_irqrestore(&data->beep_lock, flags);
>  
>  	schedule_work(&data->work);
>  
> @@ -286,27 +425,48 @@ static void pca9532_input_work(struct work_struct *work)
>  	struct pca9532_data *data =
>  		container_of(work, struct pca9532_data, work);
>  	u8 maxleds = data->chip_info->num_leds;
> +	unsigned long flags;
> +	u8 old_pwm;
> +	u8 pwm;
> +	int ret;
> +
> +	spin_lock_irqsave(&data->beep_lock, flags);
> +	pwm = data->beep_pwm;
> +	spin_unlock_irqrestore(&data->beep_lock, flags);
>  
>  	mutex_lock(&data->update_lock);
> -	i2c_smbus_write_byte_data(data->client, PCA9532_REG_PWM(maxleds, 1),
> -		data->pwm[PCA9532_PWM_ID_1]);
> +
> +	old_pwm = data->pwm[PCA9532_PWM_ID_1];
> +	data->pwm[PCA9532_PWM_ID_1] = pwm;
> +
> +	ret = i2c_smbus_write_byte_data(data->client,
> +					PCA9532_REG_PWM(maxleds, 1), pwm);
> +	if (ret < 0) {
> +		data->pwm[PCA9532_PWM_ID_1] = old_pwm;
> +		dev_warn(&data->client->dev,
> +			 "Failed to write PWM register: %d\n", ret);
> +	}
> +
>  	mutex_unlock(&data->update_lock);
>  }
>  
> -static enum pca9532_state pca9532_getled(struct pca9532_led *led)
> +static int pca9532_getled(struct pca9532_led *led)
>  {
>  	struct i2c_client *client = led->client;
>  	struct pca9532_data *data = i2c_get_clientdata(client);
>  	u8 maxleds = data->chip_info->num_leds;
>  	int reg;
> -	enum pca9532_state ret = PCA9532_OFF;
> +	int ret;
>  
>  	mutex_lock(&data->update_lock);
>  	reg = i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
> -	if (reg >= 0)
> +
> +	if (reg >= 0) {
>  		ret = (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
> -	else
> -		dev_warn(&client->dev, "failed to read LED register: %d\n", reg);
> +	} else {
> +		ret = reg;
> +		dev_warn(&client->dev, "Failed to read LED register: %d\n", ret);
> +	}
>  	mutex_unlock(&data->update_lock);
>  	return ret;
>  }
> @@ -328,33 +488,42 @@ static int pca9532_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
>  {
>  	struct pca9532_data *data = gpiochip_get_data(gc);
>  	struct pca9532_led *led = &data->leds[offset];
> +	int old_state;
> +	int ret;
> +
> +	mutex_lock(&data->update_lock);
> +	old_state = led->state;
>  
>  	if (val)
>  		led->state = PCA9532_OFF;
>  	else
>  		led->state = PCA9532_ON;
>  
> -	pca9532_setled(led);
> +	ret = __pca9532_setled(led);
> +	if (ret < 0)
> +		led->state = old_state;
>  
> -	return 0;
> +	mutex_unlock(&data->update_lock);
> +
> +	return ret;
>  }
>  
>  static int pca9532_gpio_get_value(struct gpio_chip *gc, unsigned offset)
>  {
>  	struct pca9532_data *data = gpiochip_get_data(gc);
> -	unsigned char reg;
> +	int reg;
>  
>  	reg = i2c_smbus_read_byte_data(data->client, PCA9532_REG_INPUT(offset));
>  
> +	if (reg < 0)
> +		return reg;
> +
>  	return !!(reg & (1 << (offset % 8)));
>  }
>  
>  static int pca9532_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
>  {
> -	/* To use as input ensure pin is not driven */
> -	pca9532_gpio_set_value(gc, offset, 1);
> -
> -	return 0;
> +	return pca9532_gpio_set_value(gc, offset, 1);
>  }
>  
>  static int pca9532_gpio_direction_output(struct gpio_chip *gc, unsigned offset, int val)
> @@ -394,40 +563,57 @@ static int pca9532_configure(struct i2c_client *client,
>  	struct pca9532_data *data, struct pca9532_platform_data *pdata)
>  {
>  	int i, err = 0;
> +#ifdef CONFIG_LEDS_PCA9532_GPIO
>  	int gpios = 0;
> +#endif
>  	u8 maxleds = data->chip_info->num_leds;
>  
> -	for (i = 0; i < 2; i++)	{
> +	for (i = 0; i < 2; i++) {
>  		data->pwm[i] = pdata->pwm[i];
>  		data->psc[i] = pdata->psc[i];
> -		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PWM(maxleds, i),
> +
> +		err = i2c_smbus_write_byte_data(client,
> +						PCA9532_REG_PWM(maxleds, i),
>  						data->pwm[i]);
>  		if (err < 0)
>  			return err;
> -		err = i2c_smbus_write_byte_data(client, PCA9532_REG_PSC(maxleds, i),
> +
> +		err = i2c_smbus_write_byte_data(client,
> +						PCA9532_REG_PSC(maxleds, i),
>  						data->psc[i]);
>  		if (err < 0)
>  			return err;
>  	}
>  
>  	data->hw_blink = true;
> +
>  	for (i = 0; i < data->chip_info->num_leds; i++) {
>  		struct pca9532_led *led = &data->leds[i];
>  		struct pca9532_led *pled = &pdata->leds[i];
> +
>  		led->client = client;
>  		led->id = i;
>  		led->type = pled->type;
> +
>  		switch (led->type) {
>  		case PCA9532_TYPE_NONE:
>  			break;
>  		case PCA9532_TYPE_GPIO:
> +#ifdef CONFIG_LEDS_PCA9532_GPIO
>  			gpios++;
> +#endif
>  			break;
>  		case PCA9532_TYPE_LED:
> -			if (pled->state == PCA9532_KEEP)
> -				led->state = pca9532_getled(led);
> -			else
> +			if (pled->state == PCA9532_KEEP) {
> +				err = pca9532_getled(led);
> +				if (err < 0)
> +					goto exit;
> +
> +				led->state = err;
> +			} else {
>  				led->state = pled->state;
> +			}
> +
>  			led->name = pled->name;
>  			led->ldev.name = led->name;
>  			led->ldev.default_trigger = pled->default_trigger;
> @@ -435,6 +621,15 @@ static int pca9532_configure(struct i2c_client *client,
>  			led->ldev.brightness_set_blocking =
>  						pca9532_set_brightness;
>  			led->ldev.blink_set = pca9532_set_blink;
> +
> +			err = pca9532_setled(led);
> +			if (err < 0) {
> +				dev_err(&client->dev,
> +					"couldn't set LED %s state\n",
> +					led->name);
> +				goto exit;
> +			}
> +
>  			err = led_classdev_register(&client->dev, &led->ldev);
>  			if (err < 0) {
>  				dev_err(&client->dev,
> @@ -442,19 +637,26 @@ static int pca9532_configure(struct i2c_client *client,
>  					led->name);
>  				goto exit;
>  			}
> -			pca9532_setled(led);
>  			break;
>  		case PCA9532_TYPE_N2100_BEEP:
>  			/* PWM1 is reserved for beeper so blink will not use hardware */
>  			data->hw_blink = false;
>  			BUG_ON(data->idev);
> +
>  			led->state = PCA9532_PWM1;
> -			pca9532_setled(led);
> +			err = pca9532_setled(led);
> +			if (err < 0) {
> +				dev_err(&client->dev,
> +					"couldn't set beeper state\n");
> +				goto exit;
> +			}
> +
>  			data->idev = devm_input_allocate_device(&client->dev);
>  			if (data->idev == NULL) {
>  				err = -ENOMEM;
>  				goto exit;
>  			}
> +
>  			data->idev->name = pled->name;
>  			data->idev->phys = "i2c/pca9532";
>  			data->idev->id.bustype = BUS_HOST;
> @@ -467,6 +669,7 @@ static int pca9532_configure(struct i2c_client *client,
>  			data->idev->event = pca9532_event;
>  			input_set_drvdata(data->idev, data);
>  			INIT_WORK(&data->work, pca9532_input_work);
> +
>  			err = input_register_device(data->idev);
>  			if (err) {
>  				cancel_work_sync(&data->work);
> @@ -498,8 +701,8 @@ static int pca9532_configure(struct i2c_client *client,
>  			dev_warn(&client->dev, "could not add gpiochip\n");
>  		} else {
>  			dev_info(&client->dev, "gpios %i...%i\n",
> -				data->gpio.base, data->gpio.base +
> -				data->gpio.ngpio - 1);
> +				 data->gpio.base, data->gpio.base +
> +				 data->gpio.ngpio - 1);
>  		}
>  	}
>  #endif
> @@ -591,6 +794,7 @@ static int pca9532_probe(struct i2c_client *client)
>  	i2c_set_clientdata(client, data);
>  	data->client = client;
>  	mutex_init(&data->update_lock);
> +	spin_lock_init(&data->beep_lock);
>  
>  	return pca9532_configure(client, data, pca9532_pdata);
>  }
> -- 
> 2.56.0
> 

-- 
Lee Jones
