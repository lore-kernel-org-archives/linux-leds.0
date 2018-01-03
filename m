From: =?UTF-8?Q?Ga=c3=abtan_Carlier?= <gcembed@gmail.com>
Subject: Re: Add driver for MCP45HV51 (digital potentiometer)
Date: Wed, 3 Jan 2018 20:37:23 +0100
Message-ID: <13bcf912-56c7-5f18-aef7-4a5f5332e30d@gmail.com>
References: <17da226a-247b-153a-6743-3e33264a1f0c@gmail.com>
 <20180103175628.GA31502@amd> <b4331c91-b35c-5e02-d70e-daf7cc689442@gmail.com>
 <20180103190026.GA4564@amd> <48a0948b-daca-5526-2fa4-f82fa0074606@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:41669 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750928AbeACThZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jan 2018 14:37:25 -0500
Received: by mail-wm0-f44.google.com with SMTP id g75so4567078wme.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Jan 2018 11:37:25 -0800 (PST)
In-Reply-To: <48a0948b-daca-5526-2fa4-f82fa0074606@gmail.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org

On 01/03/2018 08:25 PM, Gaëtan Carlier wrote:
> On 01/03/2018 08:00 PM, Pavel Machek wrote:
>> On Wed 2018-01-03 19:38:31, Gaëtan Carlier wrote:
>>> Hi Pavel,
>>> On 01/03/2018 06:56 PM, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>> I want to integrate MCP45HV51 I2C device to Linux kernel. It is a 
>>>>> digital
>>>>> potentiometer.
>>>>> I have several questions:
>>>>> - Is "leds driver" the correct section ?
>>>>> - On which existing I2C leds driver should I base my code to use 
>>>>> the most
>>>>> recent API/pratice ?
>>>>> - Maybe it is not needed to write a C driver and everything can be 
>>>>> done via
>>>>> devicetree ?
>>>>
>>>> Umm. What makes you think that LED driver is correct section? LEDs are
>>>> little lights...
>>>
>>> I know that, but like Led and Backlight, digital potentiometers are 
>>> just a
>>> device that needs a 0 to 255 value...
>>> So I don't know where to put it maybe in IIO driver ?
>>
>> Is that _output_ device? What does it control?
>>
>>                                     Pavel
>>
> 
> It is an output with a variable resistance (like DAC is an output with a 
> variable voltage).[1]
> So regarding the webpage of IIO[2], digital potentiometer must be coded 
> on IIO API.
> 
> Thank you taking time to answer me,
> Gaëtan.
> 
> 
> [1] https://en.wikipedia.org/wiki/Digital_potentiometer
> [2] https://wiki.analog.com/software/linux/docs/iio/iio
After a deeper search on a recent branch, potentiometer are already 
handled in IIO layer :D
