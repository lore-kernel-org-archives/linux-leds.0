From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 24/26] leds: gpio: Use generic support for composing
 LED names
Date: Wed, 24 Apr 2019 21:02:18 +0200
Message-ID: <100da86d-44ff-a39c-0d7c-715a286083f6@gmail.com>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-25-jacek.anaszewski@gmail.com>
 <20190424140417.GE14360@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424140417.GE14360@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-leds@vger.kernel.org

Pavel,

Thanks for the review.

On 4/24/19 4:04 PM, Pavel Machek wrote:
> On Wed 2019-04-17 22:54:37, Jacek Anaszewski wrote:
>> Switch to using generic LED support for composing LED class
>> device name.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>   drivers/leds/leds-gpio.c | 23 ++++++++++-------------
>>   1 file changed, 10 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
>> index b26cf78993d1..60fb3c85cf05 100644
>> --- a/drivers/leds/leds-gpio.c
>> +++ b/drivers/leds/leds-gpio.c
>> @@ -77,11 +77,11 @@ static int gpio_blink_set(struct led_classdev *led_cdev,
>>   
>>   static int create_gpio_led(const struct gpio_led *template,
>>   	struct gpio_led_data *led_dat, struct device *parent,
>> -	struct device_node *np, gpio_blink_set_t blink_set)
>> +	struct fwnode_handle *fwnode, gpio_blink_set_t blink_set)
>>   {
>> +	struct led_init_data init_data = {};
>>   	int ret, state;
>>   
>> -	led_dat->cdev.name = template->name;
>>   	led_dat->cdev.default_trigger = template->default_trigger;
>>   	led_dat->can_sleep = gpiod_cansleep(led_dat->gpiod);
>>   	if (!led_dat->can_sleep)
>> @@ -112,7 +112,13 @@ static int create_gpio_led(const struct gpio_led *template,
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	return devm_led_classdev_register(parent, &led_dat->cdev);
>> +	if (template->name)
>> +		led_dat->cdev.name = template->name;
>> +	else
>> +		init_data.fwnode = fwnode;
>> +
>> +	return devm_led_classdev_register_ext(parent, &led_dat->cdev,
>> +					      &init_data);
> 
> Won't register_ext() overwrite template->name?

Ah, right. I will need to tweak led_classdev_register_ext() to properly
handle the case when init_data is not NULL, but struct led_classdev's
"name" property is initialized.

-- 
Best regards,
Jacek Anaszewski
