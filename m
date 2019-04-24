From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 20/26] leds: aat1290: Use generic support for composing
 LED names
Date: Wed, 24 Apr 2019 20:16:55 +0200
Message-ID: <713cd359-4c93-7841-c3b7-bbf3d3ceec45@gmail.com>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-21-jacek.anaszewski@gmail.com>
 <20190424135719.GC14360@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424135719.GC14360@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net
List-Id: linux-leds@vger.kernel.org

On 4/24/19 3:57 PM, Pavel Machek wrote:
> Hi!
> 
>> Switch to using generic LED support for composing LED class
>> device name.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
>> @@ -257,9 +257,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
>>   		return -EINVAL;
>>   	}
>>   
>> -	led_cdev->name = of_get_property(child_node, "label", NULL) ? :
>> -						child_node->name;
>> -
>>   	ret = of_property_read_u32(child_node, "led-max-microamp",
>>   				&cfg->max_mm_current);
>>   	/*
>> @@ -469,6 +466,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
>>   	struct aat1290_led *led;
>>   	struct led_classdev *led_cdev;
>>   	struct led_classdev_flash *fled_cdev;
>> +	struct led_init_data init_data = {};
> 
> You can do directly = { .devicename = ...; }, at least for the name.

In previous versions I applied similar approach in few places but
later figured out it will be more consistent if all assignments are
next to each other.

> Anyway, that's a detail.
> 
> 8, 10, 12, 14, 16, 18, 20: Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks!

-- 
Best regards,
Jacek Anaszewski
