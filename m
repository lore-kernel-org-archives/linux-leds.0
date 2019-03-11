From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 03/25] dt-bindings: leds: Add LED_FUNCTION definitions
Date: Mon, 11 Mar 2019 18:22:43 +0100
Message-ID: <9b02a7fd-3cec-f935-23e0-7c3b1263dbc4@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
 <20190310182836.20841-4-jacek.anaszewski@gmail.com>
 <ac860282-af12-8a1f-5d85-2f587856d669@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ac860282-af12-8a1f-5d85-2f587856d669@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

Hi Dan,

Thanks for the review.

On 3/11/19 1:22 PM, Dan Murphy wrote:
> Jacek
> 
> On 3/10/19 1:28 PM, Jacek Anaszewski wrote:
>> Add common LED function definitions for use in Device Tree.
>> The function names were extracted from existing dts files
>> after eliminating oddities.
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
>> +#define LED_FUNCTION_ADSL "adsl"
>> +#define LED_FUNCTION_ALARM "alarm"
>> +#define LED_FUNCTION_BACKLIGHT "backlight"
>> +#define LED_FUNCTION_BLUETOOTH "bluetooth"
>> +#define LED_FUNCTION_BOOT "boot"
>> +#define LED_FUNCTION_CHRG "chrg"
> 
> Why not spell out charge?

It was in one of existing dts files.
I have no issue with that, will change it to "charge".

> 
>> +#define LED_FUNCTION_DEBUG "debug"
>> +#define LED_FUNCTION_DISK "disk"
>> +#define LED_FUNCTION_DISK_READ "disk-read"
>> +#define LED_FUNCTION_DISK_WRITE "disk-write"
>> +#define LED_FUNCTION_FAULT "fault"
>> +#define LED_FUNCTION_FLASH "flash"
>> +#define LED_FUNCTION_HDDERR "hdderr"
>> +#define LED_FUNCTION_HEARTBEAT "heartbeat"
>> +#define LED_FUNCTION_INDICATOR "indicator"
>> +#define LED_FUNCTION_INFO "info"
>> +#define LED_FUNCTION_INTERNET "internet"
> 
> LEDs function can be for keyboards and keypads.
> 
> Keypad for hand held devices
> 
> #define LED_FUNCTION_KEYBOARD "keyboard"
> #define LED_FUNCTION_KEYPAD "keypad"

Ack.

> 
>> +#define LED_FUNCTION_LAN "lan"
>> +#define LED_FUNCTION_MMC "mmc"
>> +#define LED_FUNCTION_NAND "nand"
>> +#define LED_FUNCTION_ON "on"
>> +#define LED_FUNCTION_PROGRAMMING "programming"
>> +#define LED_FUNCTION_PWR "pwr"
> 
> Same comment as above on chrg

Ack.

>> +#define LED_FUNCTION_RX "rx"
>> +#define LED_FUNCTION_SD "sd"
>> +#define LED_FUNCTION_SLEEP "sleep"
>> +#define LED_FUNCTION_STANDBY "standby"
>> +#define LED_FUNCTION_STATUS "status"
>> +#define LED_FUNCTION_TORCH "torch"
>> +#define LED_FUNCTION_TV "tv"
>> +#define LED_FUNCTION_TX "tx"
>> +#define LED_FUNCTION_USB "usb"
>> +#define LED_FUNCTION_WAN "wan"
>> +#define LED_FUNCTION_WLAN "wlan"
>> +#define LED_FUNCTION_WPS "wps"
>> +
> 
> Dan
> 
>>   #endif /* __DT_BINDINGS_LEDS_H */
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski
