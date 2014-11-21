From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Fri, 21 Nov 2014 09:15:31 +0100
Message-ID: <546EF4A3.2000101@samsung.com>
References: <20141120131713.GC27527@amd> <546DEEC3.7090508@samsung.com>
 <546DFF3A.7020702@samsung.com> <20141120205254.GA19174@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51527 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757467AbaKUIPg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 21 Nov 2014 03:15:36 -0500
In-reply-to: <20141120205254.GA19174@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net

Hi Pavel,

On 11/20/2014 09:52 PM, Pavel Machek wrote:
> On Thu 2014-11-20 15:48:26, Jacek Anaszewski wrote:
>> On 11/20/2014 02:38 PM, Jacek Anaszewski wrote:
>>> Hi Pavel,
>>>
>>> On 11/20/2014 02:17 PM, Pavel Machek wrote:
>>>>
>>>> Add attributes neccessary for LED flashes to
>>>> devicetree/bindings/leds/common.txt .
>>>>
>>>> This will allow me to add device tree support for adp1653 i2c flash
>>>> LED driver, and allow Jacek Anaszewski to add support for more LED
>>>> drivers..
> ..
>>
>> Actually, we've agreed with Sakari that we can handle
>> indicator-pattern later.
>
> Good.
>
>> I would remove references to you, me and adp1653 driver from the commit
>> message and mention that this modifications adjust the led common
>> bindings to the LED Flash class that is to be added.
>
> Ok, who can take this patch? Can you edit the changelog, or should I
> do it? Anything else that needs changing?

It's your patch :) For me the contents of the patch are ok.
It requires device tree maintainer approval anyway.

Regards,
Jacek
