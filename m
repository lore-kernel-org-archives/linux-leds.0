From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 02/26] leds: class: Improve LED and LED flash class
 registration API
Date: Wed, 24 Apr 2019 20:04:57 +0200
Message-ID: <5a738825-a8f9-f4ca-0a38-773fe145048f@gmail.com>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-3-jacek.anaszewski@gmail.com>
 <20190424134633.GA14360@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424134633.GA14360@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Baolin Wang <baolin.wang@linaro.org>, Dan Murphy <dmurphy@ti.com>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for the review.

On 4/24/19 3:46 PM, Pavel Machek wrote:
> Hi!
> 
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
>> +/**
>> + * led_classdev_register_ext - register a new object of LED class with
>> + *			       init data
>> + * @parent: LED controller device this LED is driven by
>> + * @led_cdev: the led_classdev structure for this device
>> + * @init_data: the LED class device initialization data
>> + *
>> + * Returns: 0 on success or negative error value on failure
>> + */
>> +extern int led_classdev_register_ext(struct device *parent,
>> +				     struct led_classdev *led_cdev,
>> +				     struct led_init_data *init_data);
>> +#define led_classdev_register(parent, led_cdev)			\
>> +	led_classdev_register_ext(parent, led_cdev, NULL)
>> +extern int devm_led_classdev_register_ext(struct device *parent,
>> +					  struct led_classdev *led_cdev,
>> +					  struct led_init_data *init_data);
>> +#define devm_led_classdev_register(parent, led_cdev)		\
>> +	devm_led_classdev_register_ext(parent, led_cdev, NULL)
> 
> Static inline (instead of macro) might be preffered. More type safety
> and less confusing behaviour in case of errors...

This is kind of alias. You have type control in the function being
mapped. With inline we'd have to nest the function calls, i.e.
it will worsen performance by this one additional call level.

-- 
Best regards,
Jacek Anaszewski
