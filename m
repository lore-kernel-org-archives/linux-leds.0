From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/5] backlight: lm3533: Support initialization from
 Device Tree
Date: Fri, 10 Mar 2017 14:45:31 +0100
Message-ID: <5ba1150c-aad1-7f86-6c9f-b3d426390ca2@linaro.org>
References: <20170130211719.31017-1-bjorn.andersson@linaro.org>
 <20170130211719.31017-3-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170130211719.31017-3-bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 30/01/17 22:17, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
>
> Implement support for initialization of the lm3533 backlight from Device
> Tree.
>
> Acked-by: Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Acked-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> ---
>
> Note that this patch can be merged independently of the other patches in the
> series.
>
> Changes since v5:
> - None
>
> Changes since v4:
> - Acks from Pavel and Jingoo
>
> Changes since v3:
> - Moved backlight DT parsing from mfd driver
> - Gave driver its own compatible
>
>  drivers/video/backlight/lm3533_bl.c | 98 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 95 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index 0e2337f367b6..2f132199e604 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -22,6 +22,7 @@
>
>
>  #define LM3533_HVCTRLBANK_COUNT		2
> +#define LM3533_BL_DEFAULT_BRIGHTNESS	200
>  #define LM3533_BL_MAX_BRIGHTNESS	255
>
>  #define LM3533_REG_CTRLBANK_AB_BCONF	0x1a
> @@ -269,6 +270,86 @@ static int lm3533_bl_setup(struct lm3533_bl *bl,
>  	return lm3533_ctrlbank_set_pwm(&bl->cb, pdata->pwm);
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
> +static struct lm3533_bl_platform_data *lm3533_bl_of_parse(struct device *dev,
> +							  int *id)
> +{
> +	struct lm3533_bl_platform_data *bl_pdata;
> +	struct device_node *node = dev->of_node;
> +	int ret;
> +	u32 reg;
> +	u32 val;
> +
> +	bl_pdata = devm_kzalloc(dev, sizeof(*bl_pdata), GFP_KERNEL);
> +	if (!bl_pdata)
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
> +				      (const char **)&bl_pdata->name);
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
> +	bl_pdata->max_current = val;
> +
> +	val = LM3533_BL_DEFAULT_BRIGHTNESS;
> +	ret = of_property_read_u32(node, "default-brightness", &val);
> +	if (ret < 0 && ret != -EINVAL) {
> +		dev_err(dev, "unable to parse default-brightness\n");
> +		return NULL;
> +	}
> +	bl_pdata->default_brightness = val;
> +
> +	ret = lm3533_of_parse_pwm_zones(node);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to parse ti,pwm-zones\n");
> +		return NULL;
> +	}
> +	bl_pdata->pwm = ret;
> +
> +	return bl_pdata;
> +}
> +
>  static int lm3533_bl_probe(struct platform_device *pdev)
>  {
>  	struct lm3533 *lm3533;
> @@ -277,6 +358,7 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  	struct backlight_device *bd;
>  	struct backlight_properties props;
>  	int ret;
> +	int id;
>
>  	dev_dbg(&pdev->dev, "%s\n", __func__);
>
> @@ -284,14 +366,17 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  	if (!lm3533)
>  		return -EINVAL;
>
> +	id = pdev->id;
>  	pdata = dev_get_platdata(&pdev->dev);
> +	if (!pdata)
> +		pdata = lm3533_bl_of_parse(&pdev->dev, &id);
>  	if (!pdata) {
>  		dev_err(&pdev->dev, "no platform data\n");
>  		return -EINVAL;
>  	}
>
> -	if (pdev->id < 0 || pdev->id >= LM3533_HVCTRLBANK_COUNT) {
> -		dev_err(&pdev->dev, "illegal backlight id %d\n", pdev->id);
> +	if (id < 0 || id >= LM3533_HVCTRLBANK_COUNT) {
> +		dev_err(&pdev->dev, "illegal backlight id %d\n", id);
>  		return -EINVAL;
>  	}
>
> @@ -300,7 +385,7 @@ static int lm3533_bl_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>
>  	bl->lm3533 = lm3533;
> -	bl->id = pdev->id;
> +	bl->id = id;
>
>  	bl->cb.lm3533 = lm3533;
>  	bl->cb.id = lm3533_bl_get_ctrlbank_id(bl);
> @@ -394,10 +479,17 @@ static void lm3533_bl_shutdown(struct platform_device *pdev)
>  	lm3533_ctrlbank_disable(&bl->cb);
>  }
>
> +static const struct of_device_id lm3533_bl_of_match[] = {
> +	{ .compatible = "ti,lm3533-backlight", },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, lm3533_bl_of_match);
> +
>  static struct platform_driver lm3533_bl_driver = {
>  	.driver = {
>  		.name	= "lm3533-backlight",
>  		.pm	= &lm3533_bl_pm_ops,
> +		.of_match_table = lm3533_bl_of_match,
>  	},
>  	.probe		= lm3533_bl_probe,
>  	.remove		= lm3533_bl_remove,
>
