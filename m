From: Andrea Scian - DAVE Embedded Systems <andrea.scian@dave.eu>
Subject: Re: about pca955x led driver gpio management
Date: Wed, 25 Oct 2017 00:36:04 +0200
Message-ID: <7c7304df-9a08-4343-8c73-da2d54436d77@dave.eu>
References: <f4a6919a-83c8-79c9-94ed-48f803a3191f@dave.eu>
 <ea6795ac-806e-4e15-c18b-8cf4aab95ca8@kaod.org>
 <f5b716ff-0b9b-982b-2236-970333dcbb0a@dave.eu>
 <998d7654-f69a-1a99-d4e7-19abd0a54da0@kaod.org>
 <4ac527f2-c59e-70a2-efd4-da52370ea557@dave.eu>
 <36851faf-6236-3717-f75d-cbec9bded7b7@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx.dave-tech.it ([2.229.21.40]:51232 "EHLO mx.dave-tech.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751781AbdJXWgK (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 24 Oct 2017 18:36:10 -0400
In-Reply-To: <36851faf-6236-3717-f75d-cbec9bded7b7@kaod.org>
Content-Language: it-IT
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>


Il 24/10/2017 07:51, Cédric Le Goater ha scritto:
> On 10/17/2017 11:16 AM, Andrea Scian - DAVE Embedded Systems wrote:
>>
>>> On 10/17/2017 10:20 AM, Andrea Scian - DAVE Embedded Systems wrote:
>>>>
>>>> Il 17/10/2017 10:18, Cédric Le Goater ha scritto:
>>>>> On 10/17/2017 09:36 AM, Andrea Scian - DAVE Embedded Systems wrote:
>>>>>> Dear all,
>>>>>>
>>>>>> I'm working on an iMX6 based board with a PCA9555 which is used both to drive LEDs and manage some GPIOs.
>>>>> The PCA9555 chip and the PCA955[0-3] chips have different control
>>>>> registers. You need a different led driver for it.
>>>>
>>>> My typo sorry, as you can see in the device tree below, I'm using pca9551
>>>
>>> ok.
>>>
>>> You might want to take a look at how we mixed gpios and leds on the witherspoon
>>> system using pca9552 chips. we added a gpio-leds binding.
>>>
>>> https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>>
>> understood: you configure all pins of PCA955x as GPIOs and the map the one you need as led with gpio-leds binding.
> 
> Sorry I got distracted.
> 
>> However to me this is a kind of workaround or, at least, there's nothing about this limitation into the devicetree binding (in fact, IMHO, the device tree binding example will just fail)
> 
> euh ? what do you mean. There is a real system using this device tree.
> I think we would know about it if it didn't work. Please explain
> 

I mean that, for what I understand, your configuration is working 
because all pin of 9551 are configured as GPIOs (and the binded back as led)
In my configuration I have some pins configured as led and some as 
GPIOs, and this is not working.

>> I wrote the attached patch which should fix the issue and allow a more generic approach. WDYT?
>>
>> (in case it looks good, I'll send the patch in the correct way)
> 
> Please send the patch to discuss, add Andrew Jeffery <andrew@aj.id.au>
> in cc:
> 

Sorry for the delay but I'm busy in Prague with OSSummit and ELCE. I'll 
send a proper patch and more comments, if needed, by the begin of next week.

(BTW, if some of you are here, drop me a line and have a beer together! 
;-) )
