From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 3/3] leds: leds-mc13783: Add devicetree support
Date: Sat, 07 Dec 2013 12:47:18 +0100
Message-ID: <4531338.dvjMOzW3sA@flatron>
References: <1386397464-31033-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ea0-f180.google.com ([209.85.215.180]:64817 "EHLO
	mail-ea0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754212Ab3LGLrY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 7 Dec 2013 06:47:24 -0500
In-Reply-To: <1386397464-31033-1-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Philippe =?ISO-8859-1?Q?R=E9tornaz?= <philippe.retornaz@epfl.ch>, Sascha Hauer <kernel@pengutronix.de>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>

Hi Alexander,

Please see my comments inline.

On Saturday 07 of December 2013 10:24:24 Alexander Shiyan wrote:
> This patch adds devicetree support for the MC13XXX LED driver.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  Documentation/devicetree/bindings/mfd/mc13xxx.txt |  38 +++++
>  drivers/leds/leds-mc13783.c                       | 161 ++++++++++++++--------
>  2 files changed, 143 insertions(+), 56 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mc13xxx.txt b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> index abd9e3c..bdf31e8 100644
> --- a/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> +++ b/Documentation/devicetree/bindings/mfd/mc13xxx.txt
> @@ -10,9 +10,37 @@ Optional properties:
>  - fsl,mc13xxx-uses-touch : Indicate the touchscreen controller is being used
>  
>  Sub-nodes:
> +- leds : Contain the led nodes and initial register values in property
> +  "led_control". Number of register depends of used IC, for MC13783 is 6,
> +  for MC13892 is 4. See datasheet for bits definitions of these register.

Can't the driver somehow derive correct register values from LEDs listed
as subnodes of this node? If not, I'd say that more fine grained
properties should be used instead. What kind of configuration do these
register control?

Also s/_/-/ in property names.

> +  Each led node should contain "reg", which used as LED ID (described below).
> +  Optional properties "label" and "linux,default-trigger" is described in
> +  Documentation/devicetree/bindings/leds/common.txt.
>  - regulators : Contain the regulator nodes. The regulators are bound using
>    their names as listed below with their registers and bits for enabling.
>  
> +MC13783 LED IDs:
> +    0  : Main display
> +    1  : AUX display
> +    2  : Keypad
> +    3  : Red 1
> +    4  : Green 1
> +    5  : Blue 1
> +    6  : Red 2
> +    7  : Green 2
> +    8  : Blue 2
> +    9  : Red 3
> +    10 : Green 3
> +    11 : Blue 3
> +
> +MC13892 LED IDs:
> +    12 : Main display
> +    13 : AUX display
> +    14 : Keypad
> +    15 : Red
> +    16 : Green
> +    17 : Blue

This looks a bit strange. Does the numbering relate to hardware design
in any way? From what I can see, those are just enums values from Linux
driver, which doesn't seem the right namespace to export to DT.

> +
>  MC13783 regulators:
>      sw1a      : regulator SW1A      (register 24, bit 0)
>      sw1b      : regulator SW1B      (register 25, bit 0)
> @@ -89,6 +117,16 @@ ecspi@70010000 { /* ECSPI1 */
>  		interrupt-parent = <&gpio0>;
>  		interrupts = <8>;
>  
> +		leds {
> +			led_control = <0x000 0x000 0x0e0 0x000>;
> +
> +			system_led {

s/_/-/ in node name and also whenever reg property is present, node name
should be followed by @unit-address suffix where unit-address is the
value of first address in reg property.

> +				reg = <15>;
> +				label = "system:red:live";
> +				linux,default-trigger = "heartbeat";
> +			};
> +		};
> +
>  		regulators {
>  			sw1_reg: mc13892__sw1 {
>  				regulator-min-microvolt = <600000>;
> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
> index ca87a1b..bc3ea2b 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c
> @@ -20,26 +20,27 @@
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
>  #include <linux/leds.h>
> +#include <linux/of.h>
>  #include <linux/workqueue.h>
>  #include <linux/mfd/mc13xxx.h>
>  
> -#define MC13XXX_REG_LED_CONTROL(x)	(51 + (x))
> -

This and related changes qualify for a separate patch that would be
a simple refactoring.

>  struct mc13xxx_led_devtype {
>  	int	led_min;
>  	int	led_max;
>  	int	num_regs;
> +	u32	ledctrl_base;
>  };
>  
>  struct mc13xxx_led {
>  	struct led_classdev	cdev;
>  	struct work_struct	work;
> -	struct mc13xxx		*master;
>  	enum led_brightness	new_brightness;
>  	int			id;
> +	struct mc13xxx_leds	*leds;
>  };
>  
>  struct mc13xxx_leds {
> +	struct mc13xxx			*master;
>  	struct mc13xxx_led_devtype	*devtype;
>  	int				num_leds;
>  	struct mc13xxx_led		led[0];
> @@ -48,23 +49,24 @@ struct mc13xxx_leds {
>  static void mc13xxx_led_work(struct work_struct *work)
>  {
>  	struct mc13xxx_led *led = container_of(work, struct mc13xxx_led, work);
> -	int reg, mask, value, bank, off, shift;
> +	struct mc13xxx_leds *leds = led->leds;
> +	unsigned int reg, mask, value, bank, off, shift;
>  
>  	switch (led->id) {
>  	case MC13783_LED_MD:
> -		reg = MC13XXX_REG_LED_CONTROL(2);
> +		reg = 2;
>  		shift = 9;
>  		mask = 0x0f;
>  		value = led->new_brightness >> 4;
>  		break;
>  	case MC13783_LED_AD:
> -		reg = MC13XXX_REG_LED_CONTROL(2);
> +		reg = 2;
>  		shift = 13;
>  		mask = 0x0f;
>  		value = led->new_brightness >> 4;
>  		break;
>  	case MC13783_LED_KP:
> -		reg = MC13XXX_REG_LED_CONTROL(2);
> +		reg = 2;
>  		shift = 17;
>  		mask = 0x0f;
>  		value = led->new_brightness >> 4;
> @@ -80,25 +82,25 @@ static void mc13xxx_led_work(struct work_struct *work)
>  	case MC13783_LED_B3:
>  		off = led->id - MC13783_LED_R1;
>  		bank = off / 3;
> -		reg = MC13XXX_REG_LED_CONTROL(3) + bank;
> +		reg = 3 + bank;
>  		shift = (off - bank * 3) * 5 + 6;
>  		value = led->new_brightness >> 3;
>  		mask = 0x1f;
>  		break;
>  	case MC13892_LED_MD:
> -		reg = MC13XXX_REG_LED_CONTROL(0);
> +		reg = 0;
>  		shift = 3;
>  		mask = 0x3f;
>  		value = led->new_brightness >> 2;
>  		break;
>  	case MC13892_LED_AD:
> -		reg = MC13XXX_REG_LED_CONTROL(0);
> +		reg = 0;
>  		shift = 15;
>  		mask = 0x3f;
>  		value = led->new_brightness >> 2;
>  		break;
>  	case MC13892_LED_KP:
> -		reg = MC13XXX_REG_LED_CONTROL(1);
> +		reg = 1;
>  		shift = 3;
>  		mask = 0x3f;
>  		value = led->new_brightness >> 2;
> @@ -108,7 +110,7 @@ static void mc13xxx_led_work(struct work_struct *work)
>  	case MC13892_LED_B:
>  		off = led->id - MC13892_LED_R;
>  		bank = off / 2;
> -		reg = MC13XXX_REG_LED_CONTROL(2) + bank;
> +		reg = 2 + bank;
>  		shift = (off - bank * 2) * 12 + 3;
>  		value = led->new_brightness >> 2;
>  		mask = 0x3f;
> @@ -117,7 +119,8 @@ static void mc13xxx_led_work(struct work_struct *work)
>  		BUG();
>  	}
>  
> -	mc13xxx_reg_rmw(led->master, reg, mask << shift, value << shift);
> +	mc13xxx_reg_rmw(leds->master, leds->devtype->ledctrl_base + reg,
> +			mask << shift, value << shift);
>  }
>  
>  static void mc13xxx_led_set(struct led_classdev *led_cdev,
> @@ -130,80 +133,121 @@ static void mc13xxx_led_set(struct led_classdev *led_cdev,
>  	schedule_work(&led->work);
>  }
>  
> +static int __init mc13xxx_led_setup_of(struct mc13xxx_leds *leds,
> +				       struct device_node *parent)
> +{
> +#ifdef CONFIG_OF
> +	struct device_node *child;
> +	int ret, i = 0;
> +
> +	for_each_child_of_node(parent, child) {
> +		ret = of_property_read_u32(child, "reg", &leds->led[i].id);
> +		if (ret)
> +			return ret;
> +		leds->led[i].cdev.name = of_get_property(child, "label", NULL);
> +		leds->led[i].cdev.default_trigger =
> +			of_get_property(child, "linux,default-trigger", NULL);
> +		i++;
> +	}
> +
> +	return 0;
> +#else
> +	return -ENOTSUPP;
> +#endif
> +}

I believe the preferred way to use conditional compilation is:

#ifdef CONFIG_OF
static int __init mc13xxx_led_setup_of(struct mc13xxx_leds *leds,
				       struct device_node *parent)
{
	/* enabled variant */
}
#else
static inline int mc13xxx_led_setup_of(struct mc13xxx_leds *leds,
				       struct device_node *parent)
{
	return -ENOTSUPP;
}
#endif

This doesn't pollute function body with #ifdefs and allows explicitly
marking the disabled variant inline.

> +
>  static int __init mc13xxx_led_probe(struct platform_device *pdev)
>  {
> -	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(&pdev->dev);
> -	struct mc13xxx *mcdev = dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev = &pdev->dev;
> +	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(dev);
> +	struct mc13xxx *mcdev = dev_get_drvdata(dev->parent);
>  	struct mc13xxx_led_devtype *devtype =
>  		(struct mc13xxx_led_devtype *)pdev->id_entry->driver_data;
> +	int i, num_leds = 0, ret = 0;
> +	struct device_node *parent;
>  	struct mc13xxx_leds *leds;
> -	int i, id, num_leds, ret = -ENODATA;
> -	u32 reg, init_led = 0;
> -
> -	if (!pdata) {
> -		dev_err(&pdev->dev, "Missing platform data\n");
> -		return -ENODEV;
> +	u32 *ctrls = NULL, init_led = 0;
> +
> +	of_node_get(dev->parent->of_node);
> +	parent = of_find_node_by_name(dev->parent->of_node, "leds");

Both lines above should be executed only if the device has been
instantiated using DT.

Also of_find_node_by_name() is not the correct function to use. Please
refer to its documentation to learn why. The function that should be used
here is of_get_child_by_name().

> +
> +	if (pdata) {
> +		num_leds = pdata->num_leds;
> +		ctrls = pdata->led_control;
> +	} else if (parent) {
> +		num_leds = of_get_child_count(parent);
> +		ret = of_property_read_u32_array(parent, "led_control", ctrls,
> +						 devtype->num_regs);

Huh? Does this even work? The argument in place of ctrls is supposed to be
the destination memory for read array. Your code sets ctrls to NULL above
and then passes it to this function.

> +		if (ret)
> +			goto out_node_put;
> +	} else {
> +		return -ENODATA;
>  	}

In general, I would rather adopt a completely different approach to DT
enablement in this driver. Instead of splitting the probe into two almost
completely different code paths in large if blocks, what about making
mc13xxx_led_setup_of() allocate a platform data structure and fill it
in with data parsed from DT, so the driver would then proceed normally as
if the platform data were available? IMHO this should make the code much
simpler and more readable.

Best regards,
Tomasz
