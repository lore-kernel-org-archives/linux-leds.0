From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Add LED driven by multiple gpio.
Date: Fri, 29 Apr 2016 15:07:18 +0200
Message-ID: <57235C86.2090904@samsung.com>
References: <1461572078.2269.2.camel@dlinux>
 <20160426162658.761a88e7.drivshin.allworx@gmail.com>
 <572356BF.2040804@samsung.com> <20160429125816.GA30794@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39624 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753510AbcD2NHX (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 29 Apr 2016 09:07:23 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O6E00FCICG8EJB0@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 29 Apr 2016 14:07:20 +0100 (BST)
In-reply-to: <20160429125816.GA30794@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>, Dmitry Bondar <bond@simicon.com>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

Hi Pavel,

On 04/29/2016 02:58 PM, Pavel Machek wrote:
> Hi!
>
>>> I'm hoping that if the RGB LED framework comes to fruition, that there
>>> will be some way to combine arbitrary single-color LED devices into a
>>> logical RGB LED.
>>
>> It turns out that rgb-pattern trigger, we were discussing some time ago,
>> would be useful also for LEDs of arbitrary colors. It should be given
>> more generic name then, e.g. three-led-composite or so. The "color"
>> sysfs attribute exposed by the trigger could be replaced with
>> "subled_id", that would accept values 0, 1 or 2.
>>
>> Brightness of such a compound LED could be set with:
>>
>> led_trigger_3led_event(sturct led_trigger *trig,
>>                         enum led_brightness led1,
>>                         enum led_brightness led2,
>>                         enum led_brightness led3)
>>
>> Maybe we should think about making this scalable using
>> C ellipsis feature:
>>
>> led_trigger_3led_event(sturct led_trigger *trig,
>>                         enum led_brightness led1,
>>                         ...)
>
> You don't need (and should not need) elipsis.
>
> led_trigger_many_leds_event(sturct led_trigger *trig,
> 			      int num_leds,
>                                enum led_brightness *brightness)

Right, this is more straightforward approach.

-- 
Best regards,
Jacek Anaszewski
