From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC] leds: lp8860: Support additional features
Date: Fri, 8 Jan 2016 12:33:06 -0600
Message-ID: <569000E2.2010205@ti.com>
References: <568CBD85.3040907@ti.com> <568FE816.6020804@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:54118 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932696AbcAHSdK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 8 Jan 2016 13:33:10 -0500
In-Reply-To: <568FE816.6020804@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: j.anaszewski@samsung.com, linux-leds@vger.kernel.org

Milo
On 01/08/2016 10:47 AM, Dan Murphy wrote:
> <snip>
>>   - MFD devices
>>     lp8860-core will create MFD child devices based on EEPROM value.
>>     LED_STRING_CONF[2:0] bits will be read.
>>     mode 0: backlight
>>          1: backlight + LED
>>          2: backlight + LED 1, 2
>>          3: backlight + LED 1, 2, 3
>>          4: backlight 1, 2
>>          5: backlight
>>          6: backlight + LED 1, 2
>>          7: LED 1,2,3,4
>>     (Please refer to the page 28 and 29 of LP8860 datasheet.
>>      http://www.ti.com/lit/ds/symlink/lp8860-q1.pdf)
> Well is this something we can add to the DT and program the EEPROM on the fly for
> implementations that do not require TI firmware?
> Is loading the EEPROM firmware an absolute requirement?  Can't the individuals just
> update the EEPROM values in the core file?
> Are all the EEPROM values 0x00?  I am not seeing any default values in the TRM.

Ok I found a default table in the data sheet based on part value.
So there may be a need to use the default EEPROM values and adjust
during boot.

Dan
>
>> * Backlight (new)
>>   - PWM control mode support
>>   - Register backlight device
>>
>> * LED (will be modified)
>>   - Unlock/lock EEPROM code will be moved to lp8860-core part
>>   - Multiple LED output channels will be supported
>>
>> I'd like to have your opinion prior to creating patches.
>>
>> Jacek,
>> It would be best if you have better idea for this. Thanks!
>>
>> Best regards,
>> Milo
> Dan
>


-- 
------------------
Dan Murphy
