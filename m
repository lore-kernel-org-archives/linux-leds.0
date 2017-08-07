From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 3/4] leds: pca955x: add GPIO support
Date: Mon, 7 Aug 2017 18:45:23 +0200
Message-ID: <d0b7772d-44e1-9380-550a-018f6e9d973e@gmail.com>
References: <1501589349-5681-1-git-send-email-clg@kaod.org>
 <1501589349-5681-4-git-send-email-clg@kaod.org>
 <c9276953-7c4c-d77b-f393-4d3144e0cbd9@gmail.com>
 <677ff6db-cd84-2c72-9dba-a3f3f9e1ed23@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36238 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751930AbdHGQqI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Aug 2017 12:46:08 -0400
In-Reply-To: <677ff6db-cd84-2c72-9dba-a3f3f9e1ed23@kaod.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, linux-leds@vger.kernel.org
Cc: Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>

On 08/07/2017 11:09 AM, Cédric Le Goater wrote:
> On 08/06/2017 11:42 PM, Jacek Anaszewski wrote:
>> Hi Cedric,
>>
>> On 08/01/2017 02:09 PM, Cédric Le Goater wrote:
>>> The PCA955x family of chips are I2C LED blinkers whose pins not used
>>> to control LEDs can be used as general purpose I/Os (GPIOs).
>>>
>>> The following adds such a support by defining different operation
>>> modes for the pins (See bindings documentation for more details). The
>>> pca955x driver is then extended with a gpio_chip when some of pins are
>>> operating as GPIOs. The default operating mode is to behave as a LED.
>>>
>>> The GPIO support is conditioned by CONFIG_LEDS_PCA955X_GPIO.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  drivers/leds/Kconfig                    |  11 +++
>>>  drivers/leds/leds-pca955x.c             | 158 +++++++++++++++++++++++++++-----
>>>  include/dt-bindings/leds/leds-pca955x.h |  16 ++++
>>>  3 files changed, 162 insertions(+), 23 deletions(-)
>>>  create mode 100644 include/dt-bindings/leds/leds-pca955x.h
>>>
>>> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
>>> index 594b24d410c3..3013cd35c65e 100644
>>> --- a/drivers/leds/Kconfig
>>> +++ b/drivers/leds/Kconfig
>>> @@ -377,6 +377,17 @@ config LEDS_PCA955X
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
>>> +
>>>  config LEDS_PCA963X
>>>  	tristate "LED support for PCA963x I2C chip"
>>>  	depends on LEDS_CLASS
>>> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
>>> index a8918ff0a7e9..ac0f726ff1af 100644
>>> --- a/drivers/leds/leds-pca955x.c
>>> +++ b/drivers/leds/leds-pca955x.c
>>> @@ -53,6 +53,8 @@
>>>  #include <linux/slab.h>
>>>  #include <linux/string.h>
>>>  
>>> +#include <dt-bindings/leds/leds-pca955x.h>
>>> +
>>>  /* LED select registers determine the source that drives LED outputs */
>>>  #define PCA955X_LS_LED_ON	0x0	/* Output LOW */
>>>  #define PCA955X_LS_LED_OFF	0x1	/* Output HI-Z */
>>> @@ -118,6 +120,9 @@ struct pca955x {
>>>  	struct pca955x_led *leds;
>>>  	struct pca955x_chipdef	*chipdef;
>>>  	struct i2c_client	*client;
>>> +#ifdef CONFIG_LEDS_PCA955X_GPIO
>>> +	struct gpio_chip gpio;
>>> +#endif
>>>  };
>>>  
>>>  struct pca955x_led {
>>> @@ -125,6 +130,7 @@ struct pca955x_led {
>>>  	struct led_classdev	led_cdev;
>>>  	int			led_num;	/* 0 .. 15 potentially */
>>>  	char			name[32];
>>> +	u32			type;
>>>  	const char		*default_trigger;
>>>  };
>>>  
>>> @@ -259,6 +265,65 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
>>>  	return 0;
>>>  }
>>>  
>>> +#ifdef CONFIG_LEDS_PCA955X_GPIO
>>> +/*
>>> + * Read the INPUT register, which contains the state of LEDs.
>>> + */
>>> +static u8 pca955x_read_input(struct i2c_client *client, int n)
>>> +{
>>> +	return (u8)i2c_smbus_read_byte_data(client, n);
>>> +}
>>> +
>>> +static int pca955x_gpio_request_pin(struct gpio_chip *gc, unsigned int offset)
>>> +{
>>> +	struct pca955x *pca955x = gpiochip_get_data(gc);
>>> +	struct pca955x_led *led = &pca955x->leds[offset];
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
>>> +	struct pca955x_led *led = &pca955x->leds[offset];
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
>>> +	struct pca955x_led *led = &pca955x->leds[offset];
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
>>>  #if IS_ENABLED(CONFIG_OF)
>>>  static struct pca955x_platform_data *
>>>  pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
>>> @@ -297,6 +362,8 @@ pca955x_pdata_of_init(struct i2c_client *client, struct pca955x_chipdef *chip)
>>>  		snprintf(pdata->leds[reg].name, sizeof(pdata->leds[reg].name),
>>>  			 "%s", name);
>>>  
>>> +		pdata->leds[reg].type = PCA955X_TYPE_LED;
>>> +		of_property_read_u32(child, "type", &pdata->leds[reg].type);
>>>  		of_property_read_string(child, "linux,default-trigger",
>>>  					&pdata->leds[reg].default_trigger);
>>>  	}
>>> @@ -332,6 +399,7 @@ static int pca955x_probe(struct i2c_client *client,
>>>  	struct i2c_adapter *adapter;
>>>  	int i, err;
>>>  	struct pca955x_platform_data *pdata;
>>> +	int ngpios = 0;
>>>  
>>>  	if (id) {
>>>  		chip = &pca955x_chipdefs[id->driver_data];
>>> @@ -391,36 +459,52 @@ static int pca955x_probe(struct i2c_client *client,
>>>  	pca955x->chipdef = chip;
>>>  
>>>  	for (i = 0; i < chip->bits; i++) {
>>> +		struct pca955x_led *pdata_led = &pdata->leds[i];
>>> +
>>>  		pca955x_led = &pca955x->leds[i];
>>>  		pca955x_led->led_num = i;
>>>  		pca955x_led->pca955x = pca955x;
>>> -
>>> -		/* Platform data can specify LED names and default triggers */
>>> -		if (pdata) {
>>> -			if (pdata->leds[i].name)
>>> +		pca955x_led->type = pdata_led->type;
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
>>
>> Similarly as in 1/4: this check seems to be redundant and we could
>> simplify the code a bit here.
> 
> yes.
> 
>  
>>> +				if (pdata->leds[i].name)
>>> +					snprintf(pca955x_led->name,
>>> +						 sizeof(pca955x_led->name),
>>> +						 "pca955x:%s",
>>> +						 pdata->leds[i].name);
>>
>> DT label property should contain also vendor prefix, and there should be
>> no need to concatenate the segments here. The situation when label is
>> not provided and LED class device name is taken from DT node name
>> should be considered as a fallback.
> 
> So, should I start the patchset with a preliminary cleanup removing all
> the calls doing snprintf(pdata->leds[reg].name ...) ? This is the case in :
> pca955x_pdata_of_init()

I've looked at the DT documentation and it fact it doesn't mention
the label format. This is Documentation/leds/leds-class.txt which
defines the LED class device name format. Since some other LED class
drivers also add device prefix to the name taken from platform data,
and what's more there are users of this one, let's not modify that.
Please only remove redundant "if (pdata)" checks.

Please note that I'll be able to review the next patch set no sooner
than in the beginning of the next week.

-- 
Best regards,
Jacek Anaszewski
