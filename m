From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Sun, 11 Nov 2018 21:02:41 +0100
Message-ID: <96296b4d-d49e-2b08-4306-196605a9f5dc@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
 <20181111113157.GK27666@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181111113157.GK27666@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thanks for the review.

On 11/11/2018 12:31 PM, Pavel Machek wrote:
> Hi!
> 
>> Add common LED function definitions for use in Device Tree.
>> The function names were extracted from existing dts files
>> after eliminating oddities.
> 
> Thanks for doing this.
> 
>> diff --git a/include/dt-bindings/leds/functions.h b/include/dt-bindings/leds/functions.h
>> new file mode 100644
>> index 0000000..3f94e09
>> --- /dev/null
>> +++ b/include/dt-bindings/leds/functions.h
>> @@ -0,0 +1,101 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
> 
>> +#define LED_FUNCTION_2G "2g"
>> +#define LED_FUNCTION_ACTIVITY "activity"
>> +#define LED_FUNCTION_ADSL "adsl"
>> +#define LED_FUNCTION_ALARM "alarm"
>> +#define LED_FUNCTION_ALIVE "alive"
>> +#define LED_FUNCTION_ALL "all"
>> +#define LED_FUNCTION_APP "app"
>> +#define LED_FUNCTION_AUX "aux"
>> +#define LED_FUNCTION_BACKUP "backup"
>> +#define LED_FUNCTION_BACKLIGHT "backlight"
>> +#define LED_FUNCTION_BACKLIGHT_CLUSTER "backlight_cluster"
> 
> Sounds like one of backlight and backlight_cluster should be deprecated?

I think so.

>> +#define LED_FUNCTION_BEEP "beep"
>> +#define LED_FUNCTION_BLUETOOTH "bluetooth"
>> +#define LED_FUNCTION_BOOT "boot"
>> +#define LED_FUNCTION_BOTTOM "bottom"
> 
> I believe some of these should get comments. For example what does
> "all" and "bottom" LEDs do?

It would be best to ask the author, but for now,
I'd just remove all of "bottom", "up", "left", "right"
etc.

>> +#define LED_FUNCTION_BRICK_STATUS "brick-status"
>> +#define LED_FUNCTION_CEL "cel"
>> +#define LED_FUNCTION_CEL_PWR "cel-pwr"
>> +#define LED_FUNCTION_CEL_RESET "cel-reset"
>> +#define LED_FUNCTION_CHRG "chrg"
>> +#define LED_FUNCTION_COM "com"
>> +#define LED_FUNCTION_COPY "copy"
>> +#define LED_FUNCTION_CPU "cpu"
>> +#define LED_FUNCTION_DEBUG "debug"
>> +#define LED_FUNCTION_DIA "dia"
> 
> What does this one do?

I'd opt for something like "diagnostics", but this is a blind shot.
Let's remove it then and, and let people add more meaningful
definition in case it is needed.

>> +#define LED_FUNCTION_DISK "disk"
> 
> We have disk, hd, hdd and sata. Deprecate some?

Disk should be the best choice, especially given that we have
identically named trigger.

>> +#define LED_FUNCTION_DISPLAY_CLUSTER "display_cluster"
>> +#define LED_FUNCTION_DOWN "down"
>> +#define LED_FUNCTION_DSL "dsl"
>> +#define LED_FUNCTION_ENOCEAN "enocean"
>> +#define LED_FUNCTION_ENTER "enter"
>> +#define LED_FUNCTION_ERROR "error"
>> +#define LED_FUNCTION_ESATA "esata"
>> +#define LED_FUNCTION_ETHERNET_STATUS "ethernet-status"
>> +#define LED_FUNCTION_FAIL "fail"
>> +#define LED_FUNCTION_FAULT "fault"
>> +#define LED_FUNCTION_FLASH "flash"
>> +#define LED_FUNCTION_FRONT "front"
>> +#define LED_FUNCTION_FUNC "func"
>> +#define LED_FUNCTION_GPIO "gpio"
>> +#define LED_FUNCTION_GSM "gsm"
> 
>> +#define LED_FUNCTION_HD "hd"
>> +#define LED_FUNCTION_HDD "hdd"
>> +#define LED_FUNCTION_HDDERR "hdderr"
> 
> Ok, I'll 

Hmm?

> 
>> +#define LED_FUNCTION_HEALTH "health"
>> +#define LED_FUNCTION_HEARTBEAT "heartbeat"
> 
> Sounds same as alive, deprecate alive?

Heartbeat may be designated specifically for registration
for events from the trigger with the same name.

>> +#define LED_FUNCTION_WIFI "wifi"
>> +#define LED_FUNCTION_WIRELESS "wireless"
>> +#define LED_FUNCTION_WLAN "wlan"
> 
> Same as wifi and wireless, I guess, deprecate some?

I'd remove "wireless" and "wlan".

> I'll touch same subject in another email.
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski
