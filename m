From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v10 2/2] leds: sc27xx: Add pattern_set/clear interfaces
 for LED controller
Date: Thu, 6 Sep 2018 22:16:05 +0200
Message-ID: <ae29d9b4-e5f8-a00d-df74-fb20328e4634@gmail.com>
References: <5a502ec29251c019ddad8f3314ab45fc0f6feaf7.1536200860.git.baolin.wang@linaro.org>
 <975a9570c75fb4469c0cef55cc9ed42266f933af.1536200860.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <975a9570c75fb4469c0cef55cc9ed42266f933af.1536200860.git.baolin.wang@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>, pavel@ucw.cz
Cc: rteysseyre@gmail.com, bjorn.andersson@linaro.org, broonie@kernel.org, linus.walleij@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Baolin,

Thank you for the patch. I really appreciate your effort.

I see one more thing I forgot to mention in the previous
review. Please take a look at my comment to pattern_set().

On 09/06/2018 04:37 AM, Baolin Wang wrote:
> This patch implements the 'pattern_set'and 'pattern_clear'
> interfaces to support SC27XX LED breathing mode.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes from v9:
>  - Optimize the ABI documentation file.
>  - Update the brightness value in hardware pattern mode.
> 
> Changes from v8:
>  - Optimize the ABI documentation file.
> 
> Changes from v7:
>  - Add its own ABI documentation file.
> 
> Changes from v6:
>  - None.
> 
> Changes from v5:
>  - None.
> 
> Changes from v4:
>  - None.
> 
> Changes from v3:
>  - None.
> 
> Changes from v2:
>  - None.
> 
> Changes from v1:
>  - Remove pattern_get interface.
> ---
>  .../ABI/testing/sysfs-class-led-driver-sc27xx      |   22 +++++
>  drivers/leds/leds-sc27xx-bltc.c                    |  103 ++++++++++++++++++++
>  2 files changed, 125 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
> new file mode 100644
> index 0000000..d8056d5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-driver-sc27xx
> @@ -0,0 +1,22 @@
> +What:		/sys/class/leds/<led>/hw_pattern
> +Date:		September 2018
> +KernelVersion:	4.20
> +Description:
> +		Specify a hardware pattern for the SC27XX LED. For the SC27XX
> +		LED controller, it only supports 4 stages to make a single
> +		hardware pattern, which is used to configure the rise time,
> +		high time, fall time and low time for the breathing mode.
> +
> +		For the breathing mode, the SC27XX LED only expects one brightness
> +		for the high stage. To be compatible with the hardware pattern
> +		format, we should set brightness as 0 for rise stage, fall
> +		stage and low stage.
> +
> +		Min stage duration: 125 ms
> +		Max stage duration: 31875 ms
> +
> +		Since the stage duration step is 125 ms, the duration must be
> +		a multiplier of 125, like 125ms, 250ms, 375ms, 500ms ... 31875ms.
> +
> +		Thus the format of the hardware pattern values should be:
> +		"0 rise_duration brightness high_duration 0 fall_duration 0 low_duration".
> diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
> index 9d9b7aa..558a325 100644
> --- a/drivers/leds/leds-sc27xx-bltc.c
> +++ b/drivers/leds/leds-sc27xx-bltc.c
> @@ -32,8 +32,15 @@
>  #define SC27XX_DUTY_MASK	GENMASK(15, 0)
>  #define SC27XX_MOD_MASK		GENMASK(7, 0)
>  
> +#define SC27XX_CURVE_SHIFT	8
> +#define SC27XX_CURVE_L_MASK	GENMASK(7, 0)
> +#define SC27XX_CURVE_H_MASK	GENMASK(15, 8)
> +
>  #define SC27XX_LEDS_OFFSET	0x10
>  #define SC27XX_LEDS_MAX		3
> +#define SC27XX_LEDS_PATTERN_CNT	4
> +/* Stage duration step, in milliseconds */
> +#define SC27XX_LEDS_STEP	125
>  
>  struct sc27xx_led {
>  	char name[LED_MAX_NAME_SIZE];
> @@ -122,6 +129,98 @@ static int sc27xx_led_set(struct led_classdev *ldev, enum led_brightness value)
>  	return err;
>  }
>  
> +static int sc27xx_led_pattern_clear(struct led_classdev *ldev)
> +{
> +	struct sc27xx_led *leds = to_sc27xx_led(ldev);
> +	struct regmap *regmap = leds->priv->regmap;
> +	u32 base = sc27xx_led_get_offset(leds);
> +	u32 ctrl_base = leds->priv->base + SC27XX_LEDS_CTRL;
> +	u8 ctrl_shift = SC27XX_CTRL_SHIFT * leds->line;
> +	int err;
> +
> +	mutex_lock(&leds->priv->lock);
> +
> +	/* Reset the rise, high, fall and low time to zero. */
> +	regmap_write(regmap, base + SC27XX_LEDS_CURVE0, 0);
> +	regmap_write(regmap, base + SC27XX_LEDS_CURVE1, 0);
> +
> +	err = regmap_update_bits(regmap, ctrl_base,
> +			(SC27XX_LED_RUN | SC27XX_LED_TYPE) << ctrl_shift, 0);
> +
> +	ldev->brightness = LED_OFF;
> +
> +	mutex_unlock(&leds->priv->lock);
> +
> +	return err;
> +}
> +
> +static int sc27xx_led_pattern_set(struct led_classdev *ldev,
> +				  struct led_pattern *pattern,
> +				  int len, u32 repeat)
> +{
> +	struct sc27xx_led *leds = to_sc27xx_led(ldev);
> +	u32 base = sc27xx_led_get_offset(leds);
> +	u32 ctrl_base = leds->priv->base + SC27XX_LEDS_CTRL;
> +	u8 ctrl_shift = SC27XX_CTRL_SHIFT * leds->line;
> +	struct regmap *regmap = leds->priv->regmap;
> +	int err;
> +
> +	/*
> +	 * Must contain 4 tuples to configure the rise time, high time, fall
> +	 * time and low time to enable the breathing mode.
> +	 */
> +	if (len != SC27XX_LEDS_PATTERN_CNT)
> +		return -EINVAL;
> +
> +	mutex_lock(&leds->priv->lock);

Please add below macros at the top of the file and the function
shown. It will allow to nicely align the value provided by
the user to the nearest delta_t step. We have similar thing
in led_class_flash.c (led_clamp_align()), that was adopted from
v4l2-ctrls.c.

#define SC27XX_DELTA_T_MIN SC27XX_LEDS_STEP
#define SC27XX_DELTA_T_MAX (SC27XX_LEDS_STEP * 255)

static void sc27xx_led_clamp_align_delta_t(u32 *delta_t)
{
	u32 v, offset, t = *delta_t;

	v = t + SC27XX_LEDS_STEP / 2;
	v = clamp(v, SC27XX_DELTA_T_MIN, SC27XX_DELTA_T_MAX);
	offset = v - SC27XX_DELTA_T_MIN;
	offset = SC27XX_LEDS_STEP * (offset / SC27XX_LEDS_STEP);
	*delta_t = SC27XX_DELTA_T_MIN + offset;
}

Then call the function for each delta_t before writing it to the device:

sc27xx_led_clamp_align_delta_t(&pattern[0].delta_t);
sc27xx_led_clamp_align_delta_t(&pattern[1].delta_t);
sc27xx_led_clamp_align_delta_t(&pattern[2].delta_t);
sc27xx_led_clamp_align_delta_t(&pattern[3].delta_t);

Also, regarding PATCH v8 1/2, please change the types of properties
in struct led_pattern as follows:

+struct led_pattern {
+	u32 delta_t;
+	enum led_brightness brightness;
+};
+

Best regards,
Jacek Anaszewski

> +
> +	err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE0,
> +				 SC27XX_CURVE_L_MASK,
> +				 pattern[0].delta_t / SC27XX_LEDS_STEP);
> +	if (err)
> +		goto out;
> +
> +	err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE1,
> +				 SC27XX_CURVE_L_MASK,
> +				 pattern[1].delta_t / SC27XX_LEDS_STEP);
> +	if (err)
> +		goto out;
> +
> +	err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE0,
> +				 SC27XX_CURVE_H_MASK,
> +				 (pattern[2].delta_t / SC27XX_LEDS_STEP) <<
> +				 SC27XX_CURVE_SHIFT);
> +	if (err)
> +		goto out;
> +
> +
> +	err = regmap_update_bits(regmap, base + SC27XX_LEDS_CURVE1,
> +				 SC27XX_CURVE_H_MASK,
> +				 (pattern[3].delta_t / SC27XX_LEDS_STEP) <<
> +				 SC27XX_CURVE_SHIFT);
> +	if (err)
> +		goto out;
> +
> +	err = regmap_update_bits(regmap, base + SC27XX_LEDS_DUTY,
> +				 SC27XX_DUTY_MASK,
> +				 (pattern[1].brightness << SC27XX_DUTY_SHIFT) |
> +				 SC27XX_MOD_MASK);
> +	if (err)
> +		goto out;
> +
> +	/* Enable the LED breathing mode */
> +	err = regmap_update_bits(regmap, ctrl_base,
> +				 SC27XX_LED_RUN << ctrl_shift,
> +				 SC27XX_LED_RUN << ctrl_shift);
> +	if (!err)
> +		ldev->brightness = pattern[1].brightness;
> +
> +out:
> +	mutex_unlock(&leds->priv->lock);
> +
> +	return err;
> +}
> +
>  static int sc27xx_led_register(struct device *dev, struct sc27xx_led_priv *priv)
>  {
>  	int i, err;
> @@ -140,6 +239,9 @@ static int sc27xx_led_register(struct device *dev, struct sc27xx_led_priv *priv)
>  		led->priv = priv;
>  		led->ldev.name = led->name;
>  		led->ldev.brightness_set_blocking = sc27xx_led_set;
> +		led->ldev.pattern_set = sc27xx_led_pattern_set;
> +		led->ldev.pattern_clear = sc27xx_led_pattern_clear;
> +		led->ldev.default_trigger = "pattern";
>  
>  		err = devm_led_classdev_register(dev, &led->ldev);
>  		if (err)
> @@ -241,4 +343,5 @@ static int sc27xx_led_remove(struct platform_device *pdev)
>  
>  MODULE_DESCRIPTION("Spreadtrum SC27xx breathing light controller driver");
>  MODULE_AUTHOR("Xiaotong Lu <xiaotong.lu@spreadtrum.com>");
> +MODULE_AUTHOR("Baolin Wang <baolin.wang@linaro.org>");
>  MODULE_LICENSE("GPL v2");
> 
