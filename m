From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 11/25] leds: lp8860: Use led_compose_name()
Date: Mon, 11 Mar 2019 12:26:47 -0500
Message-ID: <7df54f37-1cd4-b1d7-78f2-0aea894f6543@ti.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-12-jacek.anaszewski@gmail.com>
 <cf42384b-cdbc-3ad7-468f-c4036579652f@ti.com>
 <7242a6e9-ece7-22af-4d62-f2a6aa163579@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7242a6e9-ece7-22af-4d62-f2a6aa163579@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 3/11/19 12:24 PM, Jacek Anaszewski wrote:
> Dan,
> 
> On 3/11/19 1:28 PM, Dan Murphy wrote:
>> On 3/10/19 1:28 PM, Jacek Anaszewski wrote:
>>> Switch to using generic LED support for composing LED class
>>> device name.
>>>
>>> While at it, avoid iterating through available child of nodes
>>> in favor of obtaining single expected child node using single
>>> call to of_get_next_available_child().
>>>
>>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> Cc: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   drivers/leds/leds-lp8860.c | 38 +++++++++++++++++++-------------------
>>>   1 file changed, 19 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
>>> index 39c72a908f3b..7c12ccdc1f2f 100644
>>> --- a/drivers/leds/leds-lp8860.c
>>> +++ b/drivers/leds/leds-lp8860.c
>>> @@ -22,7 +22,6 @@
>>>   #include <linux/of_gpio.h>
>>>   #include <linux/gpio/consumer.h>
>>>   #include <linux/slab.h>
>>> -#include <uapi/linux/uleds.h>
>>>     #define LP8860_DISP_CL1_BRT_MSB        0x00
>>>   #define LP8860_DISP_CL1_BRT_LSB        0x01
>>> @@ -87,6 +86,8 @@
>>>     #define LP8860_CLEAR_FAULTS        0x01
>>>   +#define LP8860_NAME            "lp8860"
>>> +
>>>   /**
>>>    * struct lp8860_led -
>>>    * @lock - Lock for reading/writing the device
>>> @@ -96,7 +97,6 @@
>>>    * @eeprom_regmap - EEPROM register map
>>>    * @enable_gpio - VDDIO/EN gpio to enable communication interface
>>>    * @regulator - LED supply regulator pointer
>>> - * @label - LED label
>>>    */
>>>   struct lp8860_led {
>>>       struct mutex lock;
>>> @@ -106,7 +106,6 @@ struct lp8860_led {
>>>       struct regmap *eeprom_regmap;
>>>       struct gpio_desc *enable_gpio;
>>>       struct regulator *regulator;
>>> -    char label[LED_MAX_NAME_SIZE];
>>>   };
>>>     struct lp8860_eeprom_reg {
>>> @@ -387,25 +386,26 @@ static int lp8860_probe(struct i2c_client *client,
>>>       struct lp8860_led *led;
>>>       struct device_node *np = client->dev.of_node;
>>>       struct device_node *child_node;
>>> -    const char *name;
>>> +    struct led_init_data init_data;
>>>         led = devm_kzalloc(&client->dev, sizeof(*led), GFP_KERNEL);
>>>       if (!led)
>>>           return -ENOMEM;
>>>   -    for_each_available_child_of_node(np, child_node) {
>>> -        led->led_dev.default_trigger = of_get_property(child_node,
>>> -                            "linux,default-trigger",
>>> -                            NULL);
>>> -
>>> -        ret = of_property_read_string(child_node, "label", &name);
>>> -        if (!ret)
>>> -            snprintf(led->label, sizeof(led->label), "%s:%s",
>>> -                 id->name, name);
>>> -        else
>>> -            snprintf(led->label, sizeof(led->label),
>>> -                "%s::display_cluster", id->name);
>>> -    }
>>> +    child_node = of_get_next_available_child(np, NULL);
>>
>> Again this device has multiple outputs that can be banked or separated.
>>
>> I would prefer to leave the iteration and just change the name generation.
> 
> In [0] you agreed on removing that. This code is simply broken since
> there is only one instance of struct lp8860_led allocated.
> 

Thanks for the reminder on my ack

Dan

>>> +    if (!child_node)
>>> +        return -EINVAL;
>>> +
>>> +    init_data.fwnode = of_fwnode_handle(child_node),
>>> +
>>> +    led->led_dev.default_trigger = of_get_property(child_node,
>>> +                        "linux,default-trigger",
>>> +                        NULL);
>>> +
>>> +    ret = led_compose_name(init_data.fwnode, LP8860_NAME,
>>> +                   ":display_cluster", init_data.name);
>>> +    if (ret)
>>> +        return ret;
>>>         led->enable_gpio = devm_gpiod_get_optional(&client->dev,
>>>                              "enable", GPIOD_OUT_LOW);
>>> @@ -420,7 +420,6 @@ static int lp8860_probe(struct i2c_client *client,
>>>           led->regulator = NULL;
>>>         led->client = client;
>>> -    led->led_dev.name = led->label;
>>>       led->led_dev.brightness_set_blocking = lp8860_brightness_set;
>>>         mutex_init(&led->lock);
>>> @@ -447,7 +446,8 @@ static int lp8860_probe(struct i2c_client *client,
>>>       if (ret)
>>>           return ret;
>>>   -    ret = devm_led_classdev_register(&client->dev, &led->led_dev);
>>> +    ret = devm_led_classdev_register_ext(&client->dev, &led->led_dev,
>>> +                         &init_data);
>>>       if (ret) {
>>>           dev_err(&client->dev, "led register err: %d\n", ret);
>>>           return ret;
>>>
>>
>>
> 
> [0] https://lkml.org/lkml/2018/11/12/2231
> 


-- 
------------------
Dan Murphy
