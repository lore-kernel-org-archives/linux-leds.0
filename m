From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v6 5/5] leds: lm3533: Support initialization from Device
 Tree
Date: Tue, 31 Jan 2017 22:15:55 +0100
Message-ID: <2bd1d1a7-9892-25bc-21fe-980a637e4d2f@gmail.com>
References: <20170130211719.31017-1-bjorn.andersson@linaro.org>
 <20170130211719.31017-5-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170130211719.31017-5-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
List-Id: linux-leds@vger.kernel.org

Hi Bjorn,

Thanks for the patch.

On 01/30/2017 10:17 PM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> 
> Implement support for initialization of the lm3533 LED driver from
> Device Tree.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Note that this patch can be merged independently of the other patches in the
> series.
> 
> Changes since v5:
> - None
> 
> Changes since v4:
> - None
> 
> Changes since v3:
> - Moved LED DT parsing from mfd driver
> - Gave driver its own compatible
> 
>  drivers/leds/leds-lm3533.c | 98 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 95 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index 5b529dc013d2..3eedad0ea9df 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
> @@ -15,6 +15,7 @@
>  #include <linux/leds.h>
>  #include <linux/mfd/core.h>
>  #include <linux/mutex.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> @@ -648,12 +649,92 @@ static int lm3533_led_setup(struct lm3533_led *led,
>  	return lm3533_ctrlbank_set_pwm(&led->cb, pdata->pwm);
>  }
>  
> +static int lm3533_of_parse_pwm_zones(struct device_node *node)
> +{
> +	const char *propname = "ti,pwm-zones";
> +	u32 zones[5];
> +	int count;
> +	int ret;
> +	int i;
> +
> +	count = of_property_count_u32_elems(node, propname);
> +	if (count == -EINVAL)
> +		return 0;
> +	if (count <= 0)
> +		return count;
> +	if (count >= ARRAY_SIZE(zones))
> +		return -EINVAL;
> +
> +	ret = of_property_read_u32_array(node, propname, zones, count);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Enable pwm input, and enable the selected zones */
> +	ret = BIT(0);
> +	for (i = 0; i < count; i++)
> +		ret |= BIT(zones[i] + 1);
> +
> +	return ret;
> +}
> +
> +static struct lm3533_led_platform_data *lm3533_led_of_parse(struct device *dev,
> +							    int *id)
> +{
> +	struct lm3533_led_platform_data *led_pdata;
> +	struct device_node *node = dev->of_node;
> +	int ret;
> +	u32 reg;
> +	u32 val;
> +
> +	led_pdata = devm_kzalloc(dev, sizeof(*led_pdata), GFP_KERNEL);
> +	if (!led_pdata)
> +		return NULL;
> +
> +	ret = of_property_read_u32(node, "reg", &reg);
> +	if (ret < 0) {
> +		dev_err(dev, "invalid reg property\n");
> +		return NULL;
> +	}
> +	*id = reg;
> +
> +	ret = of_property_read_string(node, "label",
> +				      (const char **)&led_pdata->name);

leds/common.txt says:

- label :  The label for this LED. If omitted, the label is taken from
           the node name.

Please refer to the other LED class drivers.

> +	if (ret < 0) {
> +		dev_err(dev, "unable to parse label\n");
> +		return NULL;
> +	}
> +
> +	ret = of_property_read_u32(node, "led-max-microamp", &val);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to parse led-max-microamp\n");
> +		return NULL;
> +	}
> +	led_pdata->max_current = val;
> +
> +	ret = of_property_read_string(node, "linux,default-trigger",
> +				      &led_pdata->default_trigger);
> +	if (ret < 0 && ret != -EINVAL) {
> +		dev_err(dev, "unable to parse default-trigger\n");
> +		return NULL;
> +	}
> +
> +	ret = lm3533_of_parse_pwm_zones(node);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to parse ti,pwm-zones\n");
> +		return NULL;
> +	}
> +	led_pdata->pwm = ret;
> +
> +	return led_pdata;
> +}
> +
>  static int lm3533_led_probe(struct platform_device *pdev)
>  {
>  	struct lm3533 *lm3533;
>  	struct lm3533_led_platform_data *pdata;
>  	struct lm3533_led *led;
>  	int ret;
> +	int id;
>  
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
>  
> @@ -661,14 +742,18 @@ static int lm3533_led_probe(struct platform_device *pdev)
>  	if (!lm3533)
>  		return -EINVAL;
>  
> +	id = pdev->id;
>  	pdata = dev_get_platdata(&pdev->dev);
> +	if (!pdata)
> +		pdata = lm3533_led_of_parse(&pdev->dev, &id);
> +
>  	if (!pdata) {
>  		dev_err(&pdev->dev, "no platform data\n");
>  		return -EINVAL;
>  	}
>  
> -	if (pdev->id < 0 || pdev->id >= LM3533_LVCTRLBANK_COUNT) {
> -		dev_err(&pdev->dev, "illegal LED id %d\n", pdev->id);
> +	if (id < 0 || id >= LM3533_LVCTRLBANK_COUNT) {
> +		dev_err(&pdev->dev, "illegal LED id %d\n", id);
>  		return -EINVAL;
>  	}
>  
> @@ -684,7 +769,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
>  	led->cdev.blink_set = lm3533_led_blink_set;
>  	led->cdev.brightness = LED_OFF;
>  	led->cdev.groups = lm3533_led_attribute_groups,
> -	led->id = pdev->id;
> +	led->id = id;
>  
>  	mutex_init(&led->mutex);
>  
> @@ -739,9 +824,16 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
>  	lm3533_led_set(&led->cdev, LED_OFF);		/* disable blink */
>  }
>  
> +static const struct of_device_id lm3533_led_of_match[] = {
> +	{ .compatible = "ti,lm3533-led", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, lm3533_led_of_match);
> +
>  static struct platform_driver lm3533_led_driver = {
>  	.driver = {
>  		.name = "lm3533-leds",
> +		.of_match_table = lm3533_led_of_match,
>  	},
>  	.probe		= lm3533_led_probe,
>  	.remove		= lm3533_led_remove,
> 

-- 
Best regards,
Jacek Anaszewski
