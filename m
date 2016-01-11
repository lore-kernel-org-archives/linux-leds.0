From: Milo Kim <milo.kim@ti.com>
Subject: Re: [RFC] leds: lp8860: Support additional features
Date: Mon, 11 Jan 2016 09:21:07 +0900
Message-ID: <5692F573.1050907@ti.com>
References: <568CBD85.3040907@ti.com> <568FE816.6020804@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:34951 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757375AbcAKATx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 10 Jan 2016 19:19:53 -0500
In-Reply-To: <568FE816.6020804@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: j.anaszewski@samsung.com, linux-leds@vger.kernel.org

Hi Dan,

Thanks for your comment.

On 09/01/16 01:47, Dan Murphy wrote:
> Milo
>
> Thanks for the email sorry I did not get to it till now
>
> On 01/06/2016 01:08 AM, Milo Kim wrote:
>> Hi Dan,
>>
>> I'm going to support additional features for LP8860 LED driver.
>>
>> * New functions
>>    - SPI support (only I2C is supported at this moment)
>>    - Brightness control by external PWM signal
>>    - Loading EEPROM value by using Linux firmware interface
>>    - Display mode support (currently, only cluster mode is supported)
>>
>> So, leds-lp8860 driver architecture will be changed as below.
>>
>>    MFD: I2C/SPI operation, loading EEPROM values from firmware file
>>    Backlight: LP8860 display mode support
>>    LED: LP8860 cluster mode support
>>
>> * MFD (new)
>>    - Three files will be created.
>>      lp8860-core.c, lp8860-i2c.c and lp8860-spi.c
>
> Why would you do this?  The led driver uses regmap.  You just need to register the
> regmap interface and all the writes and reads will be directed accordingly.
>
> You would need to create a probe that would initialize the correct interface.
> MFD is not required here.

Good point. I agree. Separate file is not necessary if regmap is configured.

>
>>    - Firmware I/F
>>      Firmware binary file contains default EEPROM values.
>>      lp8860-core will request a firmware and write values via I2C/SPI.
>>      Bin files will be delivered in separate location later.
>
> Where?  The linux-firmware repo?

Yes, that was my plan.

>>      This feature will support several EEPROM versions with single driver.
>
> I would prefer to move this firmware loading into a bootloader.  Since this
> is a back light driver it does not make sense to load the firmware once the file
> system is available.  Most applications will need backlight very early in the boot
> sequence to produce a SoL (Sign of Life).  Loading the firmware at file system
> run time does not make sense.  When/how would create the necessary led interfaces?

Yes, backlight control in early stage - it's true. In other backlight 
projects, some vendors write register values in both stages - bootloader 
and kernel.
With regard to LP8860, I don't have any requirement from vendor/customer 
side yet.

> It would be better to load the FW very early.  I would probably create a device tree node
> that tells the driver whether to control the device directly or use the loaded firmware.

I think this is a good option for supporting various applications.

>>    - MFD devices
>>      lp8860-core will create MFD child devices based on EEPROM value.
>>      LED_STRING_CONF[2:0] bits will be read.
>>      mode 0: backlight
>>           1: backlight + LED
>>           2: backlight + LED 1, 2
>>           3: backlight + LED 1, 2, 3
>>           4: backlight 1, 2
>>           5: backlight
>>           6: backlight + LED 1, 2
>>           7: LED 1,2,3,4
>>      (Please refer to the page 28 and 29 of LP8860 datasheet.
>>       http://www.ti.com/lit/ds/symlink/lp8860-q1.pdf)
>
> Well is this something we can add to the DT and program the EEPROM on the fly for
> implementations that do not require TI firmware?
> Is loading the EEPROM firmware an absolute requirement?  Can't the individuals just
> update the EEPROM values in the core file?

There is no requirement. Only few EEPROM values can be updated.
However, it could cause a problem if wrong values are written in EEPROM, 
so we used to provide whole values from 0x60 to 0x78.

The reason why I'm considering firmware I/F is kernel maintenance.
Without DT modification, new options can be applied through the 
firmware. It provides more useful feature in development stage.
And I spent much times to check register values on debugging. In most 
cases, wrong values were written in customer side. So I think this 
situation could be improved if the driver uses the firmware.

However, as you pointed, firmware I/F is not the best solution because 
EEPROM should be updated early as soon as possible. I agree DT property 
would be better.

Best regards,
Milo
