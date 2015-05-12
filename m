From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: lp5523: add master_fader support
Date: Tue, 12 May 2015 09:25:46 +0200
Message-ID: <5551AAFA.5080807@samsung.com>
References: <1431371454-2035-1-git-send-email-toshik@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52095 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752687AbbELHZu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 May 2015 03:25:50 -0400
In-reply-to: <1431371454-2035-1-git-send-email-toshik@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Toshi Kikuchi <toshik@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, milo.kim@ti.com

Hi Toshi,

On 05/11/2015 09:10 PM, Toshi Kikuchi wrote:
> This patch introduces 4 new attributes:
>    master_fader_leds
>    master_fader1
>    master_fader2
>    master_fader3
>
> Fo example, to map channel 0,6 to master_fader1,
> map channel 1,7 to master_fader2,
> map channel 2,8 to master_fader3, and
> map channel 3,4,5 to none
 >
>    echo "123000123" > master_fader_leds

I propose to add ABI documentation for this driver. It already exposes
many custom attributes but I can't find documentation for them.

For this patch:

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

> A different factor can be set to each master_fader:
>
>    echo 255 > master_fader1
>    echo 100 > master_fader2
>    echo 0 > master_fader3
>
> Signed-off-by: Toshi Kikuchi <toshik@chromium.org>
> Acked-by: Milo Kim <milo.kim@ti.com>
> ---
>   drivers/leds/leds-lp5523.c | 148 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 148 insertions(+)
>
> diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
> index 4ade66a..a266f90 100644
> --- a/drivers/leds/leds-lp5523.c
> +++ b/drivers/leds/leds-lp5523.c
> @@ -51,6 +51,7 @@
>   #define LP5523_REG_OP_MODE		0x01
>   #define LP5523_REG_ENABLE_LEDS_MSB	0x04
>   #define LP5523_REG_ENABLE_LEDS_LSB	0x05
> +#define LP5523_REG_LED_CTRL_BASE	0x06
>   #define LP5523_REG_LED_PWM_BASE		0x16
>   #define LP5523_REG_LED_CURRENT_BASE	0x26
>   #define LP5523_REG_CONFIG		0x36
> @@ -58,6 +59,7 @@
>   #define LP5523_REG_RESET		0x3D
>   #define LP5523_REG_LED_TEST_CTRL	0x41
>   #define LP5523_REG_LED_TEST_ADC		0x42
> +#define LP5523_REG_MASTER_FADER_BASE	0x48
>   #define LP5523_REG_CH1_PROG_START	0x4C
>   #define LP5523_REG_CH2_PROG_START	0x4D
>   #define LP5523_REG_CH3_PROG_START	0x4E
> @@ -79,6 +81,9 @@
>   #define LP5523_EXT_CLK_USED		0x08
>   #define LP5523_ENG_STATUS_MASK		0x07
>
> +#define LP5523_FADER_MAPPING_MASK	0xC0
> +#define LP5523_FADER_MAPPING_SHIFT	6
> +
>   /* Memory Page Selection */
>   #define LP5523_PAGE_ENG1		0
>   #define LP5523_PAGE_ENG2		1
> @@ -667,6 +672,137 @@ release_lock:
>   	return pos;
>   }
>
> +#define show_fader(nr)						\
> +static ssize_t show_master_fader##nr(struct device *dev,	\
> +			    struct device_attribute *attr,	\
> +			    char *buf)				\
> +{								\
> +	return show_master_fader(dev, attr, buf, nr);		\
> +}
> +
> +#define store_fader(nr)						\
> +static ssize_t store_master_fader##nr(struct device *dev,	\
> +			     struct device_attribute *attr,	\
> +			     const char *buf, size_t len)	\
> +{								\
> +	return store_master_fader(dev, attr, buf, len, nr);	\
> +}
> +
> +static ssize_t show_master_fader(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp55xx_read(chip, LP5523_REG_MASTER_FADER_BASE + nr - 1, &val);
> +	mutex_unlock(&chip->lock);
> +
> +	if (ret == 0)
> +		ret = sprintf(buf, "%u\n", val);
> +
> +	return ret;
> +}
> +show_fader(1)
> +show_fader(2)
> +show_fader(3)
> +
> +static ssize_t store_master_fader(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t len, int nr)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int ret;
> +	unsigned long val;
> +
> +	if (kstrtoul(buf, 0, &val))
> +		return -EINVAL;
> +
> +	if (val > 0xff)
> +		return -EINVAL;
> +
> +	mutex_lock(&chip->lock);
> +	ret = lp55xx_write(chip, LP5523_REG_MASTER_FADER_BASE + nr - 1,
> +			   (u8)val);
> +	mutex_unlock(&chip->lock);
> +
> +	if (ret == 0)
> +		ret = len;
> +
> +	return ret;
> +}
> +store_fader(1)
> +store_fader(2)
> +store_fader(3)
> +
> +static ssize_t show_master_fader_leds(struct device *dev,
> +				      struct device_attribute *attr,
> +				      char *buf)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int i, ret, pos = 0;
> +	u8 val;
> +
> +	mutex_lock(&chip->lock);
> +
> +	for (i = 0; i < LP5523_MAX_LEDS; i++) {
> +		ret = lp55xx_read(chip, LP5523_REG_LED_CTRL_BASE + i, &val);
> +		if (ret)
> +			goto leave;
> +
> +		val = (val & LP5523_FADER_MAPPING_MASK)
> +			>> LP5523_FADER_MAPPING_SHIFT;
> +		if (val > 3) {
> +			ret = -EINVAL;
> +			goto leave;
> +		}
> +		buf[pos++] = val + '0';
> +	}
> +	buf[pos++] = '\n';
> +	ret = pos;
> +leave:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
> +static ssize_t store_master_fader_leds(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t len)
> +{
> +	struct lp55xx_led *led = i2c_get_clientdata(to_i2c_client(dev));
> +	struct lp55xx_chip *chip = led->chip;
> +	int i, n, ret;
> +	u8 val;
> +
> +	n = min_t(int, len, LP5523_MAX_LEDS);
> +
> +	mutex_lock(&chip->lock);
> +
> +	for (i = 0; i < n; i++) {
> +		if (buf[i] >= '0' && buf[i] <= '3') {
> +			val = (buf[i] - '0') << LP5523_FADER_MAPPING_SHIFT;
> +			ret = lp55xx_update_bits(chip,
> +						 LP5523_REG_LED_CTRL_BASE + i,
> +						 LP5523_FADER_MAPPING_MASK,
> +						 val);
> +			if (ret)
> +				goto leave;
> +		} else {
> +			ret = -EINVAL;
> +			goto leave;
> +		}
> +	}
> +	ret = len;
> +leave:
> +	mutex_unlock(&chip->lock);
> +	return ret;
> +}
> +
>   static void lp5523_led_brightness_work(struct work_struct *work)
>   {
>   	struct lp55xx_led *led = container_of(work, struct lp55xx_led,
> @@ -689,6 +825,14 @@ static LP55XX_DEV_ATTR_WO(engine1_load, store_engine1_load);
>   static LP55XX_DEV_ATTR_WO(engine2_load, store_engine2_load);
>   static LP55XX_DEV_ATTR_WO(engine3_load, store_engine3_load);
>   static LP55XX_DEV_ATTR_RO(selftest, lp5523_selftest);
> +static LP55XX_DEV_ATTR_RW(master_fader1, show_master_fader1,
> +			  store_master_fader1);
> +static LP55XX_DEV_ATTR_RW(master_fader2, show_master_fader2,
> +			  store_master_fader2);
> +static LP55XX_DEV_ATTR_RW(master_fader3, show_master_fader3,
> +			  store_master_fader3);
> +static LP55XX_DEV_ATTR_RW(master_fader_leds, show_master_fader_leds,
> +			  store_master_fader_leds);
>
>   static struct attribute *lp5523_attributes[] = {
>   	&dev_attr_engine1_mode.attr,
> @@ -701,6 +845,10 @@ static struct attribute *lp5523_attributes[] = {
>   	&dev_attr_engine2_leds.attr,
>   	&dev_attr_engine3_leds.attr,
>   	&dev_attr_selftest.attr,
> +	&dev_attr_master_fader1.attr,
> +	&dev_attr_master_fader2.attr,
> +	&dev_attr_master_fader3.attr,
> +	&dev_attr_master_fader_leds.attr,
>   	NULL,
>   };
>
>


-- 
Best Regards,
Jacek Anaszewski
