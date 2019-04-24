From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v4 04/26] dt-bindings: leds: Add LED_COLOR_ID definitions
Date: Wed, 24 Apr 2019 20:14:41 +0200
Message-ID: <569cc402-f63a-c8e3-8af1-132a674c5da3@gmail.com>
References: <20190417205439.17685-1-jacek.anaszewski@gmail.com>
 <20190417205439.17685-5-jacek.anaszewski@gmail.com>
 <20190424134915.GB14360@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424134915.GB14360@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, dtor@google.com, linux@roeck-us.net, Baolin Wang <baolin.wang@linaro.org>, Dan Murphy <dmurphy@ti.com>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Pavel,

On 4/24/19 3:49 PM, Pavel Machek wrote:
> On Wed 2019-04-17 22:54:17, Jacek Anaszewski wrote:
>> Add common LED color identifiers.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Dan Murphy <dmurphy@ti.com>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Simon Shields <simon@lineageos.org>
>> ---
>>   include/dt-bindings/leds/common.h | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
>> index da0539490cea..d8c8c38700bd 100644
>> --- a/include/dt-bindings/leds/common.h
>> +++ b/include/dt-bindings/leds/common.h
>> @@ -56,4 +56,15 @@
>>   #define LED_FUNCTION_WLAN "wlan"
>>   #define LED_FUNCTION_WPS "wps"
>>   
>> +/* Standard LED colors */
>> +#define LED_COLOR_ID_WHITE	0
>> +#define LED_COLOR_ID_RED	1
>> +#define LED_COLOR_ID_GREEN	2
>> +#define LED_COLOR_ID_BLUE	3
>> +#define LED_COLOR_ID_AMBER	4
>> +#define LED_COLOR_ID_VIOLET	5
>> +#define LED_COLOR_ID_YELLOW	6
>> +#define LED_COLOR_ID_IR		7
>> +#define LED_COLOR_ID_COUNT	8
> 
> The "_COUNT" define confused me. I was trying to figure out what color
> it is. We sometimes have "_MAX" in that meaning. 

Ack.

> Probably can be merged with previous patch?

Ack.

-- 
Best regards,
Jacek Anaszewski
