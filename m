From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [RFC] leds: lp8860: Support additional features
Date: Tue, 12 Jan 2016 16:20:29 +0100
Message-ID: <569519BD.7010903@samsung.com>
References: <568CBD85.3040907@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:65033 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762674AbcALPUd (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Jan 2016 10:20:33 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0U001SCIM6S230@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 12 Jan 2016 15:20:30 +0000 (GMT)
In-reply-to: <568CBD85.3040907@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org

Hi Milo,

On 01/06/2016 08:08 AM, Milo Kim wrote:
> Hi Dan,
>
> I'm going to support additional features for LP8860 LED driver.
>
> * New functions
>    - SPI support (only I2C is supported at this moment)
>    - Brightness control by external PWM signal
>    - Loading EEPROM value by using Linux firmware interface
>    - Display mode support (currently, only cluster mode is supported)
>
> So, leds-lp8860 driver architecture will be changed as below.
>
>    MFD: I2C/SPI operation, loading EEPROM values from firmware file
>    Backlight: LP8860 display mode support
>    LED: LP8860 cluster mode support
>
> * MFD (new)
>    - Three files will be created.
>      lp8860-core.c, lp8860-i2c.c and lp8860-spi.c
>    - Firmware I/F
>      Firmware binary file contains default EEPROM values.
>      lp8860-core will request a firmware and write values via I2C/SPI.
>      Bin files will be delivered in separate location later.
>      This feature will support several EEPROM versions with single driver.
>    - MFD devices
>      lp8860-core will create MFD child devices based on EEPROM value.
>      LED_STRING_CONF[2:0] bits will be read.
>      mode 0: backlight
>           1: backlight + LED
>           2: backlight + LED 1, 2
>           3: backlight + LED 1, 2, 3
>           4: backlight 1, 2
>           5: backlight
>           6: backlight + LED 1, 2
>           7: LED 1,2,3,4
>      (Please refer to the page 28 and 29 of LP8860 datasheet.
>       http://www.ti.com/lit/ds/symlink/lp8860-q1.pdf)
>
> * Backlight (new)
>    - PWM control mode support
>    - Register backlight device
>
> * LED (will be modified)
>    - Unlock/lock EEPROM code will be moved to lp8860-core part
>    - Multiple LED output channels will be supported
>
> I'd like to have your opinion prior to creating patches.
>
> Jacek,
> It would be best if you have better idea for this. Thanks!

I'll wait for the first version of the patch. You haven't provided
any info on how you want to add the support for multiple channels,
so there is nothing I can refer to.

-- 
Best Regards,
Jacek Anaszewski
