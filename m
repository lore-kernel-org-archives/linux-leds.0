From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC] leds: lp8860: Support additional features
Date: Fri, 8 Jan 2016 10:47:18 -0600
Message-ID: <568FE816.6020804@ti.com>
References: <568CBD85.3040907@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:45087 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932315AbcAHQrW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 8 Jan 2016 11:47:22 -0500
In-Reply-To: <568CBD85.3040907@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: j.anaszewski@samsung.com, linux-leds@vger.kernel.org

Milo

Thanks for the email sorry I did not get to it till now

On 01/06/2016 01:08 AM, Milo Kim wrote:
> Hi Dan,
>
> I'm going to support additional features for LP8860 LED driver.
>
> * New functions
>   - SPI support (only I2C is supported at this moment)
>   - Brightness control by external PWM signal
>   - Loading EEPROM value by using Linux firmware interface
>   - Display mode support (currently, only cluster mode is supported)
>
> So, leds-lp8860 driver architecture will be changed as below.
>
>   MFD: I2C/SPI operation, loading EEPROM values from firmware file
>   Backlight: LP8860 display mode support
>   LED: LP8860 cluster mode support
>
> * MFD (new)
>   - Three files will be created.
>     lp8860-core.c, lp8860-i2c.c and lp8860-spi.c

Why would you do this?  The led driver uses regmap.  You just need to register the
regmap interface and all the writes and reads will be directed accordingly.

You would need to create a probe that would initialize the correct interface.
MFD is not required here.

>   - Firmware I/F
>     Firmware binary file contains default EEPROM values.
>     lp8860-core will request a firmware and write values via I2C/SPI.
>     Bin files will be delivered in separate location later.

Where?  The linux-firmware repo?

>     This feature will support several EEPROM versions with single driver.

I would prefer to move this firmware loading into a bootloader.  Since this
is a back light driver it does not make sense to load the firmware once the file
system is available.  Most applications will need backlight very early in the boot
sequence to produce a SoL (Sign of Life).  Loading the firmware at file system
run time does not make sense.  When/how would create the necessary led interfaces?

It would be better to load the FW very early.  I would probably create a device tree node
that tells the driver whether to control the device directly or use the loaded firmware.

>   - MFD devices
>     lp8860-core will create MFD child devices based on EEPROM value.
>     LED_STRING_CONF[2:0] bits will be read.
>     mode 0: backlight
>          1: backlight + LED
>          2: backlight + LED 1, 2
>          3: backlight + LED 1, 2, 3
>          4: backlight 1, 2
>          5: backlight
>          6: backlight + LED 1, 2
>          7: LED 1,2,3,4
>     (Please refer to the page 28 and 29 of LP8860 datasheet.
>      http://www.ti.com/lit/ds/symlink/lp8860-q1.pdf)

Well is this something we can add to the DT and program the EEPROM on the fly for
implementations that do not require TI firmware?
Is loading the EEPROM firmware an absolute requirement?  Can't the individuals just
update the EEPROM values in the core file?
Are all the EEPROM values 0x00?  I am not seeing any default values in the TRM.

>
> * Backlight (new)
>   - PWM control mode support
>   - Register backlight device
>
> * LED (will be modified)
>   - Unlock/lock EEPROM code will be moved to lp8860-core part
>   - Multiple LED output channels will be supported
>
> I'd like to have your opinion prior to creating patches.
>
> Jacek,
> It would be best if you have better idea for this. Thanks!
>
> Best regards,
> Milo

Dan

-- 
------------------
Dan Murphy
