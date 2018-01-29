From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Mon, 29 Jan 2018 21:46:14 +0100
Message-ID: <5968dfb2-8bf9-917f-4299-47bf1cd97124@gmail.com>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
 <0bbb47ba-4b4f-263f-a8f3-aad13d7bd753@gmail.com>
 <1517149809.7000.1288.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f181.google.com ([209.85.128.181]:42354 "EHLO
        mail-wr0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753049AbeA2Ur2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jan 2018 15:47:28 -0500
Received: by mail-wr0-f181.google.com with SMTP id 41so7326805wrc.9
        for <linux-leds@vger.kernel.org>; Mon, 29 Jan 2018 12:47:27 -0800 (PST)
In-Reply-To: <1517149809.7000.1288.camel@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>

On 01/28/2018 03:30 PM, Andy Shevchenko wrote:
> On Fri, 2018-01-26 at 21:39 +0100, Jacek Anaszewski wrote:
>> On 01/26/2018 08:38 AM, Andy Shevchenko wrote:
> 
>>> +	  Note, LM3555 is driven by AS3645A.
>>
>> Could you please provide more details on this relationship?
>> Looking at the datasheet it seems that both chips are standalone
>> and controlled via I2C and/or via GPIO in case of LM3555.
> 
> The only difference I see looking in datasheets again that AS3645A
> supports dual-led mode, by using STROBE signal in case of parallel
> interface or thru additional bits in I2C mode.
> 
> Can you be more specific what exactly makes you feel that they are not
> compatible?

The expression "LM3555 is driven by AS3645A" brings on mind rather
some type of hardware dependency between chips than drivers similarity.

Now I understand that you meant that both devices can be driven by any
of leds-lm355x or leds-as3645a driver, am I right?

If so, then I don't see the compatibility:

Excerpt from both drivers showing register addresses:

drivers/leds/leds-as3645a.c:

#define AS_DESIGN_INFO_REG			0x00
#define AS_VERSION_CONTROL_REG			0x01
#define AS_INDICATOR_AND_TIMER_REG		0x02
#define AS_CURRENT_SET_REG			0x03
#define AS_CONTROL_REG				0x04
#define AS_FAULT_INFO_REG			0x05
#define AS_BOOST_REG				0x0d
#define AS_PASSWORD_REG				0x0f

drivers/leds/leds-lm355x.c:

struct lm355x_reg_data {
        u8 regno; // this is register address
        u8 mask;
        u8 shift;
};

static struct lm355x_reg_data lm3554_regs[REG_MAX] = {
	[REG_FLAG] = {0xD0, 0xBF, 0},
	[REG_TORCH_CFG] = {0xE0, 0x80, 7},
	[REG_TORCH_CTRL] = {0xA0, 0x38, 3},
	[REG_STROBE_CFG] = {0xE0, 0x04, 2},
	[REG_FLASH_CTRL] = {0xB0, 0x78, 3},
	[REG_INDI_CFG] = {0xE0, 0x08, 3},
	[REG_INDI_CTRL] = {0xA0, 0xC0, 6},
	[REG_OPMODE] = {0xA0, 0x03, 0},
};

static struct lm355x_reg_data lm3556_regs[REG_MAX] = {
	[REG_FLAG] = {0x0B, 0xFF, 0},
	[REG_TORCH_CFG] = {0x0A, 0x10, 4},
	[REG_TORCH_CTRL] = {0x09, 0x70, 4},
	[REG_STROBE_CFG] = {0x0A, 0x20, 5},
	[REG_FLASH_CTRL] = {0x09, 0x0F, 0},
	[REG_INDI_CFG] = {0xFF, 0xFF, 0},
	[REG_INDI_CTRL] = {0x09, 0x70, 4},
	[REG_OPMODE] = {0x0A, 0x03, 0},
};


This is consistent with documentation:

[0] http://www.ti.com/lit/ds/symlink/lm3554.pdf
[1] http://www.ti.com/lit/ds/symlink/lm3556.pdf
[2] https://www.mouser.com/ds/2/588/AS3645_Datasheet_EN_v3-1214758.pdf

I suspected that I got something entirely wrong here, especially
that both you and Pavel agreed.

But, given that it turned out that leds-lm355x.c doesn't support
LM3555 and its documentation [3] indeed shows the affinity with
AS3645, I suppose that this patch is a result of a premature
conclusion drawn basing on the driver's description rather than its
capabilities.

[3] http://www.ti.com/lit/ds/symlink/lm3555.pdf

Effectively, the only sensible change seems to be:

-	tristate "LED support for LM355x Chips, LM3554 and LM3556"
+	tristate "LED support for LM3554 and LM3556 chips"
 	depends on LEDS_CLASS && I2C
 	select REGMAP_I2C
 	help
-	  This option enables support for LEDs connected to LM355x.
-	  LM355x includes Torch, Flash and Indicator functions.
+	  This option enables support for LEDs connected to LM3554
+	  and LM3556. It includes Torch, Flash and Indicator functions.



-- 
Best regards,
Jacek Anaszewski
