From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 22/26] leds: as3645a: Use generic support for composing
 LED names
Date: Wed, 24 Apr 2019 20:18:06 +0200
Message-ID: <52b9725f-ac30-0b09-af6e-879396c37819@gmail.com>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-23-jacek.anaszewski@gmail.com>
 <20190424140128.GD14360@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424140128.GD14360@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

Pavel,

On 4/24/19 4:01 PM, Pavel Machek wrote:
> Hi!
> 
>> Switch to using generic LED support for composing LED class
>> device name.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
>> +static int as3645a_led_class_setup(struct as3645a *flash)
>>   {
>>   	struct led_classdev *fled_cdev = &flash->fled.led_cdev;
>>   	struct led_classdev *iled_cdev = &flash->iled_cdev;
>> +	struct led_init_data init_data;
> 
> Not initialized.
> 
>>   	struct led_flash_setting *cfg;
>>   	int rval;
>>   
>> -	iled_cdev->name = names->indicator;
>>   	iled_cdev->brightness_set_blocking = as3645a_set_indicator_brightness;
>>   	iled_cdev->max_brightness =
>>   		flash->cfg.indicator_max_ua / AS_INDICATOR_INTENSITY_STEP;
>>   	iled_cdev->flags = LED_CORE_SUSPENDRESUME;
>>   
>> -	rval = led_classdev_register(&flash->client->dev, iled_cdev);
>> +	init_data.fwnode = flash->indicator_node;
>> +	init_data.devicename = AS_NAME;
>> +	init_data.default_label = "indicator";
> 
> And struct has one more field:
> 
> 	 +       /*
> 	 +        * indicates if LED name should always comprise
>           devicename section;
> 	 +        * only LEDs exposed by drivers of hot-pluggable
>           devices should
> 	 +        * set it to true
> 	 +        */
> 	 +       bool devname_mandatory;
> 	  };
> 
> I believe it would be cleaner to always initialize struct with zeros;
> that way you can also expand it in future.

Good point. Will fix that in v5.

-- 
Best regards,
Jacek Anaszewski
