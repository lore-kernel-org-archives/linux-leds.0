From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 03/25] dt-bindings: leds: Add LED_FUNCTION definitions
Date: Thu, 28 Mar 2019 21:01:28 +0100
Message-ID: <f916ae77-1807-1e06-7dc3-8b956e1c4c39@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-4-jacek.anaszewski@gmail.com>
 <20190328000357.GA3399@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328000357.GA3399@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Hi Rob,

Thanks for the review.

On 3/28/19 1:03 AM, Rob Herring wrote:
> On Sun, Mar 10, 2019 at 07:28:14PM +0100, Jacek Anaszewski wrote:
>> Add common LED function definitions for use in Device Tree.
>> The function names were extracted from existing dts files
>> after eliminating oddities.
> 
> I'd like this to be suggestions of what to use rather than what's
> already out there. So my comments are in that context.
> 
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Baolin Wang <baolin.wang@linaro.org>
>> Cc: Daniel Mack <daniel@zonque.org>
>> Cc: Dan Murphy <dmurphy@ti.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Oleh Kravchenko <oleg@kaa.org.ua>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Simon Shields <simon@lineageos.org>
>> ---
>>   include/dt-bindings/leds/common.h | 38 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>
>> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
>> index e171d0a6beb2..ffcd46317307 100644
>> --- a/include/dt-bindings/leds/common.h
>> +++ b/include/dt-bindings/leds/common.h
>> @@ -19,4 +19,42 @@
>>   #define LEDS_BOOST_ADAPTIVE	1
>>   #define LEDS_BOOST_FIXED	2
>>   
>> +/* Standard LED functions */
>> +#define LED_FUNCTION_ACTIVITY "activity"
> 
> of what?

We have activity trigger, which provides instant feedback
on the cpu activity.

This would nicely map to that.

>> +#define LED_FUNCTION_ADSL "adsl"
> 
> wan?

Good point.

>> +#define LED_FUNCTION_ALARM "alarm"
>> +#define LED_FUNCTION_BACKLIGHT "backlight"
>> +#define LED_FUNCTION_BLUETOOTH "bluetooth"
>> +#define LED_FUNCTION_BOOT "boot"
> 
> What about boot?

Is lit when bootloader code is executed?
Turned off just before starting the kernel.

>> +#define LED_FUNCTION_CHRG "chrg"
>> +#define LED_FUNCTION_DEBUG "debug"
>> +#define LED_FUNCTION_DISK "disk"
>> +#define LED_FUNCTION_DISK_READ "disk-read"
>> +#define LED_FUNCTION_DISK_WRITE "disk-write"
>> +#define LED_FUNCTION_FAULT "fault"
>> +#define LED_FUNCTION_FLASH "flash"
>> +#define LED_FUNCTION_HDDERR "hdderr"
> 
> disk-err for consistency?

Ack.

>> +#define LED_FUNCTION_HEARTBEAT "heartbeat"
>> +#define LED_FUNCTION_INDICATOR "indicator"
>> +#define LED_FUNCTION_INFO "info"
> 
> of what?

Right, doesn't make sense alone.

>> +#define LED_FUNCTION_INTERNET "internet"
> 
> Same as wan?

OK, to be removed.

>> +#define LED_FUNCTION_LAN "lan"
>> +#define LED_FUNCTION_MMC "mmc"
> 
> Same as disk?

Not sure. The possibility to have separate LEDs for different types of
mass storage devices could be useful.

>> +#define LED_FUNCTION_NAND "nand"
>> +#define LED_FUNCTION_ON "on"
>> +#define LED_FUNCTION_PROGRAMMING "programming"
>> +#define LED_FUNCTION_PWR "pwr"
>> +#define LED_FUNCTION_RX "rx"
>> +#define LED_FUNCTION_SD "sd"
> 
>> +#define LED_FUNCTION_SLEEP "sleep"
>> +#define LED_FUNCTION_STANDBY "standby"
> 
> Same things?

Ack. Standby feels more technical so I'd remove "sleep".

>> +#define LED_FUNCTION_STATUS "status"
>> +#define LED_FUNCTION_TORCH "torch"
>> +#define LED_FUNCTION_TV "tv"
>> +#define LED_FUNCTION_TX "tx"
>> +#define LED_FUNCTION_USB "usb"
>> +#define LED_FUNCTION_WAN "wan"
>> +#define LED_FUNCTION_WLAN "wlan"
>> +#define LED_FUNCTION_WPS "wps"
>> +
>>   #endif /* __DT_BINDINGS_LEDS_H */
>> -- 
>> 2.11.0
>>
> 

-- 
Best regards,
Jacek Anaszewski
