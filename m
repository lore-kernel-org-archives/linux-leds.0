From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Add LED driven by multiple gpio.
Date: Fri, 29 Apr 2016 14:42:39 +0200
Message-ID: <572356BF.2040804@samsung.com>
References: <1461572078.2269.2.camel@dlinux>
 <20160426162658.761a88e7.drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:61551 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752964AbcD2Mmn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 29 Apr 2016 08:42:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O6E00KQWBB43HA0@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 29 Apr 2016 13:42:40 +0100 (BST)
In-reply-to: <20160426162658.761a88e7.drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: Dmitry Bondar <bond@simicon.com>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>

Hi David,

On 04/26/2016 10:26 PM, David Rivshin (Allworx) wrote:
> On Mon, 25 Apr 2016 11:14:38 +0300
> Dmitry Bondar <bond@simicon.com> wrote:
>
>> Hello, on our board we have one LED with 2 gpio connected to it:
>>   - when gpio0 is on and gpio1 on - LED is orange.
>>   - when gpio0 is on and gpio1 off - LED is green.
>>   - when gpio0 is off and gpio1 on - LED is red.
>>   - when gpio0 is off and gpio1 off - LED is off.
>> We want use led_trigger (nand-disk) on this LED.
>> Below patch which we use for get one LED on 2 gpios.
>> Can be this in mainline, or may be exist other - better way?
>>
>
> It sounds like what you have is two independent GPIO controlled LEDs:
> one green and the other red (even if they are part of the same IC).
> Given the current infrastructure, I have modeled such cases as two
> separate LEDs in the devicetree, named <device>:green:<function> and
> <device>:red:<function>. Userspace is then responsible for controlling
> them appropriately to get the desired color.
>
> Unless I'm mistaken, in your case (nand-disk) there are blinking
> combinations you wouldn't be able to achieve this way, but there
> are a number you can do:
> - off/green:  	green:nand-disk	red:off
> - off/red: 	green:off 	red:nand-disk
> - off/orange:	green:nand-disk	red:nand-disk
> - green/orange:	green:on	red:nand-disk
> - red/orange:	green:nand-disk	red:on
> The other cases (e.g. green/red) would need an inverted nand-disk
> trigger (on while inactive, off while active).
>
> I'm hoping that if the RGB LED framework comes to fruition, that there
> will be some way to combine arbitrary single-color LED devices into a
> logical RGB LED.

It turns out that rgb-pattern trigger, we were discussing some time ago,
would be useful also for LEDs of arbitrary colors. It should be given
more generic name then, e.g. three-led-composite or so. The "color"
sysfs attribute exposed by the trigger could be replaced with
"subled_id", that would accept values 0, 1 or 2.

Brightness of such a compound LED could be set with:

led_trigger_3led_event(sturct led_trigger *trig,
                        enum led_brightness led1,
                        enum led_brightness led2,
                        enum led_brightness led3)

Maybe we should think about making this scalable using
C ellipsis feature:

led_trigger_3led_event(sturct led_trigger *trig,
                        enum led_brightness led1,
                        ...)

-- 
Best regards,
Jacek Anaszewski
