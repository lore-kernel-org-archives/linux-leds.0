From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Add LED driven by multiple gpio.
Date: Wed, 27 Apr 2016 08:56:36 +0200
Message-ID: <572062A4.6020601@samsung.com>
References: <1461572078.2269.2.camel@dlinux> <571DE205.1000407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56261 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785AbcD0G4k (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 Apr 2016 02:56:40 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O6A001B95YD2Y40@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 27 Apr 2016 07:56:37 +0100 (BST)
In-reply-to: <571DE205.1000407@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Bondar <bond@simicon.com>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

On 04/25/2016 11:23 AM, Jacek Anaszewski wrote:
> Hi Dmitry,
>
> First of all, please don't send patches as attachments but use
> git send-email on each of them.
>
> Regarding the driver - if the LEDs are not driven by some LED controller
> device, then this patch fits better for GPIO subsystem IMO.

Of course the driver should register LED class device anyway, but
the main question is how the GPIO logic is implemented. Is it some
publicly available chip or a circuit composed of discrete elements?

> On 04/25/2016 10:14 AM, Dmitry Bondar wrote:
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
>


-- 
Best regards,
Jacek Anaszewski
