From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] leds: pca955x: add GPIO support
Date: Mon, 15 May 2017 21:23:14 +0200
Message-ID: <e03da89b-b5b3-0a32-bca8-621bfa0bc305@gmail.com>
References: <1494311772-21872-1-git-send-email-clg@kaod.org>
 <20b94199-a154-53cd-96d1-910ae3de1085@gmail.com>
 <7d30134c-c8c6-3475-1a7a-534199167b5c@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7d30134c-c8c6-3475-1a7a-534199167b5c-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
Cc: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Cedric,

On 05/12/2017 08:24 AM, Cédric Le Goater wrote:
> Hello Jacek,
> 
> On 05/11/2017 10:23 PM, Jacek Anaszewski wrote:
>> Hi Cedric,
>>
>> Thanks for the patch.
>>
>> Generally I'd split it into two patches:
>> 1/2: addition of  LED class specific DT support
>> 2/2: addition of GPIO support (for this one please cc also
>>      GPIO subsystem maintainer)
> 
> OK. I will in next version.
>  
>> Please also see my comments below.
>>
>> On 05/09/2017 08:36 AM, Cédric Le Goater wrote:
>>> The PCA955x family of chips are I2C LED blinkers whose pins not used
>>> to control LEDs can be used as general purpose I/Os (GPIOs).
>>>
>>> The following adds support for device tree and Open Firmware to be
>>> able do define different operation modes for each pin. See bindings
>>> documentation for more details. The pca955x driver is then extended
>>> with a gpio_chip when pins are operating in GPIO mode.
>>>
>>> Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
>>> ---
>>>  .../devicetree/bindings/leds/leds-pca955x.txt      | 103 ++++++++
>>>  drivers/leds/Kconfig                               |  11 +
>>>  drivers/leds/leds-pca955x.c                        | 290 ++++++++++++++++++---
>>>  3 files changed, 374 insertions(+), 30 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
>>> new file mode 100644
>>> index 000000000000..98d1053dd1b0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
>>> @@ -0,0 +1,103 @@
>>> +LEDs connected to pca9550, pca9551, pca9552, pca9553,
>>> +
>>> +Required properties:
>>> +- compatible : should be one of :
>>> +	"nxp,pca9550"
>>> +	"nxp,pca9551"
>>> +	"nxp,pca9552"
>>> +	"nxp,pca9553"
>>> +- #address-cells: must be 1
>>> +- #size-cells: must be 0
>>> +- reg: I2C slave address. depends on the model.
>>> +
>>> +Optional properties:
>>> +- gpio-controller: allows pins to be used as GPIOs.
>>> +- #gpio-cells: if present, must not be 0.
>>> +- gpio-base : base number of the pins used as GPIOs. If there are more
>>> +              than one, they should be contiguous. See 'type' property
>>> +              below.
>>> +
>>> +LED sub-node properties:
>>> +- reg   : number of LED line.
>>> +		from 0 to  1 in pca9550
>>> +		from 0 to  7 in pca9551
>>> +		from 0 to 15 in pca9552
>>> +		from 0 to  3 in pca9553
>>> +- compatible: either "none", "led" (default) or "gpio".
>>> +- label : (optional)
>>> +          see Documentation/devicetree/bindings/leds/common.txt
>>> +- linux,default-trigger : (optional)
>>> +          see Documentation/devicetree/bindings/leds/common.txt
>>> +
>>> +Examples:
>>> +
>>> +pca9552: pca9552@60 {
>>> +	compatible = "nxp,pca9552";
>>> +	#address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +	reg = <0x60>;
>>> +
>>> +	gpio-controller;
>>> +	#gpio-cells = <2>;
>>> +	gpio-base = <12>;
>>> +
>>> +	gpio@12 {
>>> +		label = "GPIO12";
>>> +		reg = <12>;
>>> +		compatible = "gpio";
>>> +	};
>>> +	gpio@13 {
>>> +		label = "GPIO13";
>>> +		reg = <13>;
>>> +		compatible = "gpio";
>>> +	};
>>> +	gpio@14 {
>>> +		label = "GPIO14";
>>> +		reg = <14>;
>>> +		compatible = "gpio";
>>> +	};
>>> +	gpio@15 {
>>> +		label = "GPIO15";
>>> +		reg = <15>;
>>> +		compatible = "gpio";
>>> +	};
>>
>> I think that for GPIO pins we should have GPIO specific bindings,
>> but DT maintainer would have to give his opinion here.
> 
> I have got my inspiration from the tca6507 bindings.

Right, but AFAIK there was no DT maintainer position at that time
and those bindings don't have relevant ack. I'd rather wait for
DT maintainer opinion so as to avoid spawning wrong practices.

>> Also I'm not sure if using compatible property this way is correct.
> 
> yes.
> 
>>
>>> +	led@0 {
>>> +		label = "LED0";
>>
>> This is not in line with LED class device naming scheme:
>>
>> "devicename:colour:function"
>>
>> Please compare other LED class bindings.
> 
> OK. I didn't pay enough attention to the naming. I will change
> that.
> 
>>
>>> +		linux,default-trigger = "default-on";
>>> +		reg = <0>;
>>> +	};
>>> +	led@1 {
>>> +		label = "LED1";
>>> +		reg = <1>;
>>> +	};
>>> +	led@2 {
>>> +		label = "LED2";
>>> +		reg = <2>;
>>> +	};
>>> +	led@3 {
>>> +		label = "LED3";
>>> +		reg = <3>;
>>> +	};
>>> +
>>> +	none@4 {
>>> +		reg = <4>;
>>> +		compatible = "none";
>>> +	};
>>> +	none@5 {
>>> +		reg = <5>;
>>> +		compatible = "none";
>>> +	};
>>> +	none@6 {
>>> +		reg = <6>;
>>> +		compatible = "none";
>>> +	};
>>> +	none@7 {
>>> +		reg = <7>;
>>> +		compatible = "none";
>>> +	};
>>
>> Why would we need to define nodes for pins that will not be used?
> 
> yes :) I agree. And anyway, the driver will consider the pins unused 
> if the 'reg' property is not defined in the DT.  
> 
>>> +
>>> +	led@8 {
>>> +		label = "LED8";
>>> +		reg = <8>;
>>> +	};
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index c621cbbb5768..0177a36dab3d 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -352,6 +352,17 @@ config LEDS_PCA955X
>>>  	  LED driver chips accessed via the I2C bus.  Supported
>>>  	  devices include PCA9550, PCA9551, PCA9552, and PCA9553.
>>>  
>>> +config LEDS_PCA955X_GPIO
>>> +	bool "Enable GPIO support for PCA955X"
>>> +	depends on LEDS_PCA955X
>>> +	depends on GPIOLIB
>>> +	help
>>> +	  Allow unused pins on PCA955X to be used as gpio.
>>> +
>>> +	  To use a pin as gpio the pin type should be set to
>>> +	  PCA955X_TYPE_GPIO in the device tree.
>>> +
>>
>> I wonder if GPIO subsystem wouldn't be a better place for this config.
>>
>> Adding Linus Walleij.
> 
> This config is similar to :
> 
> 	config LEDS_PCA9532_GPIO
> 
> which is defined under the LED subsystem.

OK, let's follow this scheme.

> 
>>>  config LEDS_PCA963X
>>>  	tristate "LED support for PCA963x I2C chip"
>>>  	depends on LEDS_CLASS
>>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>>> index 78a7ce816a47..afbdccb0e8b6 100644
>>> --- a/drivers/leds/leds-pca955x.c
>>> +++ b/drivers/leds/leds-pca955x.c
>>> @@ -45,10 +45,13 @@
>>>  #include <linux/delay.h>
>>>  #include <linux/string.h>
>>>  #include <linux/ctype.h>
>>> +#include <linux/gpio.h>
>>>  #include <linux/leds.h>
>>>  #include <linux/err.h>
>>>  #include <linux/i2c.h>
>>>  #include <linux/slab.h>
>>> +#include <linux/of.h>
>>> +#include <linux/of_device.h>
>>
>> Please sort include directives alphabetically as we are at it.
> 
> ok
> 
>>>  
>>>  /* LED select registers determine the source that drives LED outputs */
>>>  #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
>>> @@ -56,6 +59,10 @@
>>>  #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
>>>  #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
>>>  
>>> +#define PCA955X_TYPE_NONE         0
>>> +#define PCA955X_TYPE_LED          1
>>> +#define PCA955X_TYPE_GPIO         2
>>> +
>>>  enum pca955x_type {
>>>  	pca9550,
>>>  	pca9551,
>>> @@ -115,6 +122,9 @@ struct pca955x {
>>>  	struct pca955x_led *leds;
>>>  	struct pca955x_chipdef	*chipdef;
>>>  	struct i2c_client	*client;
>>> +#ifdef CONFIG_LEDS_PCA955X_GPIO
>>> +	struct gpio_chip gpio;
>>> +#endif
>>>  };
>>>  
>>>  struct pca955x_led {
>>> @@ -122,6 +132,14 @@ struct pca955x_led {
>>>  	struct led_classdev	led_cdev;
>>>  	int			led_num;	/* 0 .. 15 potentially */
>>>  	char			name[32];
>>> +	u32			type;
>>> +	const char		*default_trigger;
>>> +};
>>> +
>>> +struct pca955x_platform_data {
>>> +	struct pca955x_led	*leds;
>>> +	int			num_leds;
>>> +	int			gpio_base;
>>>  };
>>>  
>>>  /* 8 bits per input register */
>>> @@ -200,6 +218,14 @@ static u8 pca955x_read_ls(struct i2c_client *client, int n)
>>>  		pca95xx_num_input_regs(pca955x->chipdef->bits) + 4 + n);
>>>  }
>>>  
>>> +/*
>>> + * Read the INPUT register, which constains the state of LEDs.
>>> + */
>>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
>>> +{
>>> +	return (u8)i2c_smbus_read_byte_data(client, n);
>>> +}
>>> +
>>>  static int pca955x_led_set(struct led_classdev *led_cdev,
>>>  			    enum led_brightness value)
>>>  {
>>> @@ -250,6 +276,156 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>>>  	return 0;
>>>  }
>>>  
>>> +#ifdef CONFIG_LEDS_PCA955X_GPIO
>>> +static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
>>> +{
>>> +	struct pca955x *pca955x = gpiochip_get_data(gc);
>>> +	struct pca955x_led *led = &pca955x->leds[gc->base + offset];
>>> +
>>> +	if (led->type == PCA955X_TYPE_GPIO)
>>> +		return 0;
>>> +
>>> +	return -EBUSY;
>>> +}
>>> +
>>> +static void pca955x_gpio_set_value(struct gpio_chip *gc, unsigned int offset,
>>> +				   int val)
>>> +{
>>> +	struct pca955x *pca955x = gpiochip_get_data(gc);
>>> +	struct pca955x_led *led = &pca955x->leds[gc->base + offset];
>>> +
>>> +	if (val)
>>> +		pca955x_led_set(&led->led_cdev, LED_FULL);
>>> +	else
>>> +		pca955x_led_set(&led->led_cdev, LED_OFF);
>>> +}
>>> +
>>> +static int pca955x_gpio_get_value(struct gpio_chip *gc, unsigned int offset)
>>> +{
>>> +	struct pca955x *pca955x = gpiochip_get_data(gc);
>>> +	struct pca955x_led *led = &pca955x->leds[gc->base + offset];
>>> +	u8 reg = pca955x_read_input(pca955x->client, led->led_num / 8);
>>> +
>>> +	return !!(reg & (1 << (led->led_num % 8)));
>>> +}
>>> +
>>> +static int pca955x_gpio_direction_input(struct gpio_chip *gc,
>>> +					unsigned int offset)
>>> +{
>>> +	/* To use as input ensure pin is not driven */
>>> +	pca955x_gpio_set_value(gc, offset, 0);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int pca955x_gpio_direction_output(struct gpio_chip *gc,
>>> +					 unsigned int offset, int val)
>>> +{
>>> +	pca955x_gpio_set_value(gc, offset, val);
>>> +
>>> +	return 0;
>>> +}
>>> +#endif /* CONFIG_LEDS_PCA955X_GPIO */
>>> +
>>> +#if IS_ENABLED(CONFIG_OF)
>>> +static struct pca955x_platform_data *
>>> +pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
>>> +{
>>> +	struct device_node *np = client->dev.of_node;
>>> +	struct device_node *child;
>>> +	struct pca955x_platform_data *pdata;
>>> +	int count;
>>> +
>>> +	count = of_get_child_count(np);
>>> +	if (!count || count > chip->bits)
>>> +		return ERR_PTR(-ENODEV);
>>> +
>>> +	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>>> +	if (!pdata)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	pdata->leds = devm_kzalloc(&client->dev,
>>> +			   sizeof(struct pca955x_led) * chip->bits, GFP_KERNEL);
>>> +	if (!pdata->leds)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	for_each_child_of_node(np, child) {
>>> +		const char *name;
>>> +		u32 reg;
>>> +		int res;
>>> +
>>> +		res = of_property_read_u32(child, "reg", &reg);
>>> +		if ((res != 0) || (reg >= chip->bits))
>>> +			continue;
>>> +
>>> +		if (of_property_read_string(child, "label", &name))
>>> +			name = child->name;
>>> +
>>> +		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
>>> +			 "%s", name);
>>> +
>>> +		pdata->leds[reg].type = PCA955X_TYPE_LED;
>>> +		if (of_property_match_string(child, "compatible", "gpio") >= 0)
>>> +			pdata->leds[reg].type = PCA955X_TYPE_GPIO;
>>> +		if (of_property_match_string(child, "compatible", "none") >= 0)
>>> +			pdata->leds[reg].type = PCA955X_TYPE_NONE;
>>> +
>>> +		of_property_read_u32(child, "type", &pdata->leds[reg].type);
>>> +		of_property_read_string(child, "linux,default-trigger",
>>> +					&pdata->leds[reg].default_trigger);
>>> +	}
>>> +
>>> +	pdata->num_leds = chip->bits;
>>> +
>>> +	if (of_property_read_u32(np, "gpio-base", &pdata->gpio_base))
>>> +		pdata->gpio_base = -1;
>>> +
>>> +	return pdata;
>>> +}
>>> +
>>> +static const struct of_device_id of_pca955x_match[] = {
>>> +	{ .compatible = "nxp,pca9550", .data = (void *)pca9550 },
>>> +	{ .compatible = "nxp,pca9551", .data = (void *)pca9551 },
>>> +	{ .compatible = "nxp,pca9552", .data = (void *)pca9552 },
>>> +	{ .compatible = "nxp,pca9553", .data = (void *)pca9553 },
>>> +	{},
>>> +};
>>> +
>>> +MODULE_DEVICE_TABLE(of, of_pca955x_match);
>>> +#else
>>> +static struct pca955x_platform_data *
>>> +pca955x_pdata_of_init(struct i2c_client *client, struct pca963x_chipdef *chip)
>>> +{
>>> +	return ERR_PTR(-ENODEV);
>>> +}
>>> +#endif
>>> +
>>> +static int pca955x_destroy_devices(struct pca955x *data, int n_devs)
>>> +{
>>> +	int i = n_devs;
>>> +
>>> +	if (!data)
>>> +		return -EINVAL;
>>> +
>>> +	while (--i >= 0) {
>>> +		switch (data->leds[i].type) {
>>> +		case PCA955X_TYPE_NONE:
>>> +		case PCA955X_TYPE_GPIO:
>>> +			break;
>>> +		case PCA955X_TYPE_LED:
>>> +			led_classdev_unregister(&data->leds[i].led_cdev);
>>
>> If you switched to using devm_led_classdev_register() then you
>> wouldn't need this loop.
> 
> ok.
> 
> Thanks for the review,
> 
> C.
> 
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +#ifdef CONFIG_LEDS_PCA955X_GPIO
>>> +	if (data->gpio.parent)
>>> +		gpiochip_remove(&data->gpio);
>>> +#endif
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static int pca955x_probe(struct i2c_client *client,
>>>  					const struct i2c_device_id *id)
>>>  {
>>> @@ -257,8 +433,9 @@ static int pca955x_probe(struct i2c_client *client,
>>>  	struct pca955x_led *pca955x_led;
>>>  	struct pca955x_chipdef *chip;
>>>  	struct i2c_adapter *adapter;
>>> -	struct led_platform_data *pdata;
>>>  	int i, err;
>>> +	struct pca955x_platform_data *pdata;
>>> +	int ngpios = 0;
>>>  
>>>  	if (id) {
>>>  		chip = &pca955x_chipdefs[id->driver_data];
>>> @@ -272,6 +449,11 @@ static int pca955x_probe(struct i2c_client *client,
>>>  	}
>>>  	adapter = to_i2c_adapter(client->dev.parent);
>>>  	pdata = dev_get_platdata(&client->dev);
>>> +	if (!pdata) {
>>> +		pdata =	pca955x_pdata_of_init(client, chip);
>>> +		if (IS_ERR(pdata))
>>> +			return PTR_ERR(pdata);
>>> +	}
>>>  
>>>  	/* Make sure the slave address / chip type combo given is possible */
>>>  	if ((client->addr & ~((1 << chip->slv_addr_shift) - 1)) !=
>>> @@ -313,36 +495,52 @@ static int pca955x_probe(struct i2c_client *client,
>>>  	pca955x->chipdef = chip;
>>>  
>>>  	for (i = 0; i < chip->bits; i++) {
>>> +		struct pca955x_led *pled = &pdata->leds[i];
>>> +
>>>  		pca955x_led = &pca955x->leds[i];
>>>  		pca955x_led->led_num = i;
>>>  		pca955x_led->pca955x = pca955x;
>>> -
>>> -		/* Platform data can specify LED names and default triggers */
>>> -		if (pdata) {
>>> -			if (pdata->leds[i].name)
>>> +		pca955x_led->type = pled->type;
>>> +
>>> +		switch (pca955x_led->type) {
>>> +		case PCA955X_TYPE_NONE:
>>> +			break;
>>> +		case PCA955X_TYPE_GPIO:
>>> +			ngpios++;
>>> +			break;
>>> +		case PCA955X_TYPE_LED:
>>> +			/*
>>> +			 * Platform data can specify LED names and
>>> +			 * default triggers
>>> +			 */
>>> +			if (pdata) {
>>> +				if (pdata->leds[i].name)
>>> +					snprintf(pca955x_led->name,
>>> +						 sizeof(pca955x_led->name),
>>> +						 "pca955x:%s",
>>> +						 pdata->leds[i].name);
>>> +				if (pdata->leds[i].default_trigger)
>>> +					pca955x_led->led_cdev.default_trigger =
>>> +						pdata->leds[i].default_trigger;
>>> +			} else {
>>>  				snprintf(pca955x_led->name,
>>> -					sizeof(pca955x_led->name), "pca955x:%s",
>>> -					pdata->leds[i].name);
>>> -			if (pdata->leds[i].default_trigger)
>>> -				pca955x_led->led_cdev.default_trigger =
>>> -					pdata->leds[i].default_trigger;
>>> -		} else {
>>> -			snprintf(pca955x_led->name, sizeof(pca955x_led->name),
>>> -				 "pca955x:%d", i);
>>> -		}
>>> +					 sizeof(pca955x_led->name),
>>> +					 "pca955x:%d", i);
>>> +			}
>>>  
>>> -		pca955x_led->led_cdev.name = pca955x_led->name;
>>> -		pca955x_led->led_cdev.brightness_set_blocking = pca955x_led_set;
>>> +			pca955x_led->led_cdev.name = pca955x_led->name;
>>> +			pca955x_led->led_cdev.brightness_set_blocking =
>>> +				pca955x_led_set;
>>>  
>>> -		err = led_classdev_register(&client->dev,
>>> -					&pca955x_led->led_cdev);
>>> -		if (err < 0)
>>> -			goto exit;
>>> -	}
>>> +			err = led_classdev_register(&client->dev,
>>> +						    &pca955x_led->led_cdev);
>>> +			if (err < 0)
>>> +				goto exit;
>>>  
>>> -	/* Turn off LEDs */
>>> -	for (i = 0; i < pca95xx_num_led_regs(chip->bits); i++)
>>> -		pca955x_write_ls(client, i, 0x55);
>>> +			/* Turn off LEDs */
>>> +			pca955x_led_set(&pca955x_led->led_cdev, LED_OFF);
>>> +		}
>>> +	}
>>>  
>>>  	/* PWM0 is used for half brightness or 50% duty cycle */
>>>  	pca955x_write_pwm(client, 0, 255-LED_HALF);
>>> @@ -354,22 +552,53 @@ static int pca955x_probe(struct i2c_client *client,
>>>  	pca955x_write_psc(client, 0, 0);
>>>  	pca955x_write_psc(client, 1, 0);
>>>  
>>> +#ifdef CONFIG_LEDS_PCA955X_GPIO
>>> +	if (ngpios) {
>>> +		if (pdata->gpio_base == -1) {
>>> +			dev_warn(&client->dev, "gpio-base is undefined\n");
>>> +			goto exit;
>>> +		}
>>> +
>>> +		pca955x->gpio.label = "gpio-pca955x";
>>> +		pca955x->gpio.direction_input = pca955x_gpio_direction_input;
>>> +		pca955x->gpio.direction_output = pca955x_gpio_direction_output;
>>> +		pca955x->gpio.set = pca955x_gpio_set_value;
>>> +		pca955x->gpio.get = pca955x_gpio_get_value;
>>> +		pca955x->gpio.request = pca955x_gpio_request_pin;
>>> +		pca955x->gpio.can_sleep = 1;
>>> +		pca955x->gpio.base = pdata->gpio_base;
>>> +		pca955x->gpio.ngpio = ngpios;
>>> +		pca955x->gpio.parent = &client->dev;
>>> +		pca955x->gpio.owner = THIS_MODULE;
>>> +
>>> +		err = gpiochip_add_data(&pca955x->gpio, pca955x);
>>> +		if (err) {
>>> +			/* Use data->gpio.dev as a flag for freeing gpiochip */
>>> +			pca955x->gpio.parent = NULL;
>>> +			dev_warn(&client->dev, "could not add gpiochip\n");
>>> +		} else {
>>> +			dev_info(&client->dev, "gpios %i...%i\n",
>>> +				 pca955x->gpio.base, pca955x->gpio.base +
>>> +				 pca955x->gpio.ngpio - 1);
>>> +		}
>>> +	}
>>> +#endif
>>> +
>>>  	return 0;
>>>  
>>>  exit:
>>> -	while (i--)
>>> -		led_classdev_unregister(&pca955x->leds[i].led_cdev);
>>> -
>>> +	pca955x_destroy_devices(pca955x, i);
>>>  	return err;
>>>  }
>>>  
>>>  static int pca955x_remove(struct i2c_client *client)
>>>  {
>>>  	struct pca955x *pca955x = i2c_get_clientdata(client);
>>> -	int i;
>>> +	int err;
>>>  
>>> -	for (i = 0; i < pca955x->chipdef->bits; i++)
>>> -		led_classdev_unregister(&pca955x->leds[i].led_cdev);
>>> +	err = pca955x_destroy_devices(pca955x, pca955x->chipdef->bits);
>>> +	if (err)
>>> +		return err;
>>>  
>>>  	return 0;
>>>  }
>>> @@ -378,6 +607,7 @@ static struct i2c_driver pca955x_driver = {
>>>  	.driver = {
>>>  		.name	= "leds-pca955x",
>>>  		.acpi_match_table = ACPI_PTR(pca955x_acpi_ids),
>>> +		.of_match_table = of_match_ptr(of_pca955x_match),
>>>  	},
>>>  	.probe	= pca955x_probe,
>>>  	.remove	= pca955x_remove,
>>>
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
