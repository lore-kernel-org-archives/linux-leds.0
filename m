From: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 08/24] leds: lt3593: Use led_compose_name()
Date: Thu, 8 Nov 2018 09:33:21 +0100
Message-ID: <b7deca0c-bb4f-0ec6-8b73-aec6617d2b8e@zonque.org>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-9-git-send-email-jacek.anaszewski@gmail.com>
 <42d68eae-6905-e787-3797-f0f16b0dfb84@zonque.org>
 <6666ef06-c19d-b0d8-a32b-44cecb8bc4b3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6666ef06-c19d-b0d8-a32b-44cecb8bc4b3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org
List-Id: linux-leds@vger.kernel.org

On 7/11/2018 8:49 PM, Jacek Anaszewski wrote:
> On 11/07/2018 08:37 PM, Daniel Mack wrote:
>> On 6/11/2018 11:07 PM, Jacek Anaszewski wrote:
>>> Switch to using generic LED support for composing LED class
>>> device name.
>>
>> Thanks for the rework!
>>
>>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>>> ---
>>>    drivers/leds/leds-lt3593.c | 19 ++++++++-----------
>>>    1 file changed, 8 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
>>> index de3623e..d005abc 100644
>>> --- a/drivers/leds/leds-lt3593.c
>>> +++ b/drivers/leds/leds-lt3593.c
>>> @@ -10,10 +10,10 @@
>>>    #include <linux/slab.h>
>>>    #include <linux/module.h>
>>>    #include <linux/of.h>
>>> -#include <uapi/linux/uleds.h>
>>> +
>>> +#define LED_LT3593_NAME "lt3593"
>>>      struct lt3593_led_data {
>>> -    char name[LED_MAX_NAME_SIZE];
>>>        struct led_classdev cdev;
>>>        struct gpio_desc *gpiod;
>>>    };
>>> @@ -111,6 +111,7 @@ static int lt3593_led_probe(struct platform_device
>>> *pdev)
>>>        struct fwnode_handle *child;
>>>        int ret, state = LEDS_GPIO_DEFSTATE_OFF;
>>>        enum gpiod_flags flags = GPIOD_OUT_LOW;
>>> +    struct led_init_data init_data;
>>>        const char *tmp;
>>>          if (dev_get_platdata(dev)) {
>>> @@ -138,14 +139,11 @@ static int lt3593_led_probe(struct
>>> platform_device *pdev)
>>>            return PTR_ERR(led_data->gpiod);
>>>          child = device_get_next_child_node(dev, NULL);
>>> +    init_data.fwnode = child;
>>
>> Not quite following. `fwnode' is the only member of that struct that is
>> initialized?
>>
>>>    -    ret = fwnode_property_read_string(child, "label", &tmp);
>>> -    if (ret < 0)
>>> -        snprintf(led_data->name, sizeof(led_data->name),
>>> -             "lt3593::");
>>> -    else
>>> -        snprintf(led_data->name, sizeof(led_data->name),
>>> -             "lt3593:%s", tmp);
>>> +    ret = led_compose_name(child, LED_LT3593_NAME, ":", init_data.name);
>>
>> ... and here, a member that wasn't written before is used? What am I
>> missing?
> 
> init_data.name pointer is passed to led_compose_name(), which fills
> this array with the composed name.

Ah, that's the target. Stupid me!

With this:

Acked-by: Daniel Mack <daniel@zonque.org>


Thanks,
Daniel
