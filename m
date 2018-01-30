From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v1] leds: Clarify supported chips by LM355x driver
Date: Tue, 30 Jan 2018 21:04:30 +0100
Message-ID: <15971fbb-2c6d-5c15-d5d7-1718af904ebb@gmail.com>
References: <20180126073828.70597-1-andriy.shevchenko@linux.intel.com>
 <0bbb47ba-4b4f-263f-a8f3-aad13d7bd753@gmail.com>
 <1517149809.7000.1288.camel@linux.intel.com>
 <5968dfb2-8bf9-917f-4299-47bf1cd97124@gmail.com>
 <1517310500.7000.1319.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34042 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752793AbeA3UFp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 30 Jan 2018 15:05:45 -0500
Received: by mail-wm0-f45.google.com with SMTP id j21so5225929wmh.1
        for <linux-leds@vger.kernel.org>; Tue, 30 Jan 2018 12:05:44 -0800 (PST)
In-Reply-To: <1517310500.7000.1319.camel@linux.intel.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>

On 01/30/2018 12:08 PM, Andy Shevchenko wrote:
> On Mon, 2018-01-29 at 21:46 +0100, Jacek Anaszewski wrote:
>> On 01/28/2018 03:30 PM, Andy Shevchenko wrote:
>>> On Fri, 2018-01-26 at 21:39 +0100, Jacek Anaszewski wrote:
>>>> On 01/26/2018 08:38 AM, Andy Shevchenko wrote:
>>>>> +	  Note, LM3555 is driven by AS3645A.
>>>>
>>>> Could you please provide more details on this relationship?
>>>> Looking at the datasheet it seems that both chips are standalone
>>>> and controlled via I2C and/or via GPIO in case of LM3555.
>>>
>>> The only difference I see looking in datasheets again that AS3645A
>>> supports dual-led mode, by using STROBE signal in case of parallel
>>> interface or thru additional bits in I2C mode.
>>>
>>> Can you be more specific what exactly makes you feel that they are
>>> not
>>> compatible?
>>
>> The expression "LM3555 is driven by AS3645A" brings on mind rather
>> some type of hardware dependency between chips than drivers
>> similarity.
>>
>> Now I understand that you meant that both devices can be driven by any
>> of leds-lm355x or leds-as3645a driver, am I right?
> 
> No. The chip in question is LM3555, and it's handled only in as3645a
> driver.
> 
>> I suspected that I got something entirely wrong here, especially
>> that both you and Pavel agreed.
>>
>> But, given that it turned out that leds-lm355x.c doesn't support
>> LM3555 and its documentation [3] indeed shows the affinity with
>> AS3645, I suppose that this patch is a result of a premature
>> conclusion drawn basing on the driver's description rather than its
>> capabilities.
>>
>> [3] http://www.ti.com/lit/ds/symlink/lm3555.pdf
>>
>> Effectively, the only sensible change seems to be:
>>
>> -	tristate "LED support for LM355x Chips, LM3554 and LM3556"
>> +	tristate "LED support for LM3554 and LM3556 chips"
>>  	depends on LEDS_CLASS && I2C
>>  	select REGMAP_I2C
>>  	help
>> -	  This option enables support for LEDs connected to LM355x.
>> -	  LM355x includes Torch, Flash and Indicator functions.
>> +	  This option enables support for LEDs connected to LM3554
>> +	  and LM3556. It includes Torch, Flash and Indicator
>> functions.
> 
> I like patch Pavel sent previously. It feels more comprehensive than
> this one.

Right. The patch subject and description will have to be tweaked a bit
then. I'll apply it once it is officially submitted.

-- 
Best regards,
Jacek Anaszewski
