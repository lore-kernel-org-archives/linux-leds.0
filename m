From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 10/24] leds: lp8860: Use led_compose_name()
Date: Thu, 8 Nov 2018 21:48:20 +0100
Message-ID: <bfa4cf6d-1d78-3d48-4846-eb4bcc9e8a98@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-11-git-send-email-jacek.anaszewski@gmail.com>
 <d0d4eff7-5840-95d7-a1a1-104188d1b619@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d0d4eff7-5840-95d7-a1a1-104188d1b619@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org
List-Id: linux-leds@vger.kernel.org

Dan,

On 11/08/2018 07:16 PM, Dan Murphy wrote:
> On 11/06/2018 04:07 PM, Jacek Anaszewski wrote:
>> Switch to using generic LED support for composing LED class
>> device name.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>> ---
>>  drivers/leds/leds-lp8860.c | 38 +++++++++++++++++++-------------------
>>  1 file changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
>> index 39c72a9..7c12ccd 100644
>> --- a/drivers/leds/leds-lp8860.c
>> +++ b/drivers/leds/leds-lp8860.c
>> @@ -22,7 +22,6 @@
>>  #include <linux/of_gpio.h>
>>  #include <linux/gpio/consumer.h>
>>  #include <linux/slab.h>
>> -#include <uapi/linux/uleds.h>
>>  
>>  #define LP8860_DISP_CL1_BRT_MSB		0x00
>>  #define LP8860_DISP_CL1_BRT_LSB		0x01
>> @@ -87,6 +86,8 @@
>>  
>>  #define LP8860_CLEAR_FAULTS		0x01
>>  
>> +#define LP8860_NAME			"lp8860"
>> +
>>  /**
>>   * struct lp8860_led -
>>   * @lock - Lock for reading/writing the device
>> @@ -96,7 +97,6 @@
>>   * @eeprom_regmap - EEPROM register map
>>   * @enable_gpio - VDDIO/EN gpio to enable communication interface
>>   * @regulator - LED supply regulator pointer
>> - * @label - LED label
>>   */
>>  struct lp8860_led {
>>  	struct mutex lock;
>> @@ -106,7 +106,6 @@ struct lp8860_led {
>>  	struct regmap *eeprom_regmap;
>>  	struct gpio_desc *enable_gpio;
>>  	struct regulator *regulator;
>> -	char label[LED_MAX_NAME_SIZE];
>>  };
>>  
>>  struct lp8860_eeprom_reg {
>> @@ -387,25 +386,26 @@ static int lp8860_probe(struct i2c_client *client,
>>  	struct lp8860_led *led;
>>  	struct device_node *np = client->dev.of_node;
>>  	struct device_node *child_node;
>> -	const char *name;
>> +	struct led_init_data init_data;
>>  
>>  	led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
>>  	if (!led)
>>  		return -ENOMEM;
>>  
>> -	for_each_available_child_of_node(np, child_node) {
>> -		led->led_dev.default_trigger = of_get_property(child_node,
>> -						    "linux,default-trigger",
>> -						    NULL);
>> -
>> -		ret = of_property_read_string(child_node, "label", &name);
>> -		if (!ret)
>> -			snprintf(led->label, sizeof(led->label), "%s:%s",
>> -				 id->name, name);
>> -		else
>> -			snprintf(led->label, sizeof(led->label),
>> -				"%s::display_cluster", id->name);
>> -	}
> 
> We need to keep a loop here looking for additional nodes as this device has string support and just
> not cluster support.
> 
> Just need to get the other LED patches done.

In the current shape only the properties from the last parsed child node
will be used for initializing the LED class device. So, this should be
meant also a fix removing this obscurity. Worth mentioning in the commit
message. Or I'm not getting it right?

>> +	child_node = of_get_next_available_child(np, NULL);
>> +	if (!child_node)
>> +		return -EINVAL;
>> +
>> +	init_data.fwnode = of_fwnode_handle(child_node),
>> +
>> +	led->led_dev.default_trigger = of_get_property(child_node,
>> +					    "linux,default-trigger",
>> +					    NULL);
>> +
>> +	ret = led_compose_name(init_data.fwnode, LP8860_NAME,
>> +			       ":display_cluster", init_data.name);
> 
> Should we use the #defines here for display_cluster?

Right, will fix in the next version.

>> +	if (ret)
>> +		return ret;
>>  
>>  	led->enable_gpio = devm_gpiod_get_optional(&client->dev,
>>  						   "enable", GPIOD_OUT_LOW);
>> @@ -420,7 +420,6 @@ static int lp8860_probe(struct i2c_client *client,
>>  		led->regulator = NULL;
>>  
>>  	led->client = client;
>> -	led->led_dev.name = led->label;
>>  	led->led_dev.brightness_set_blocking = lp8860_brightness_set;
>>  
>>  	mutex_init(&led->lock);
>> @@ -447,7 +446,8 @@ static int lp8860_probe(struct i2c_client *client,
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = devm_led_classdev_register(&client->dev, &led->led_dev);
>> +	ret = devm_led_classdev_register_ext(&client->dev, &led->led_dev,
>> +					     &init_data);
>>  	if (ret) {
>>  		dev_err(&client->dev, "led register err: %d\n", ret);
>>  		return ret;
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski
