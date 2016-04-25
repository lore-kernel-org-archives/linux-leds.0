From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Add LED driven by multiple gpio.
Date: Mon, 25 Apr 2016 11:23:17 +0200
Message-ID: <571DE205.1000407@samsung.com>
References: <1461572078.2269.2.camel@dlinux>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52235 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753658AbcDYJXV (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 25 Apr 2016 05:23:21 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O66001G7NETZ610@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 25 Apr 2016 10:23:17 +0100 (BST)
In-reply-to: <1461572078.2269.2.camel@dlinux>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Bondar <bond@simicon.com>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>

Hi Dmitry,

First of all, please don't send patches as attachments but use
git send-email on each of them.

Regarding the driver - if the LEDs are not driven by some LED controller
device, then this patch fits better for GPIO subsystem IMO.

On 04/25/2016 10:14 AM, Dmitry Bondar wrote:
> Hello, on our board we have one LED with 2 gpio connected to it:
>   - when gpio0 is on and gpio1 on - LED is orange.
>   - when gpio0 is on and gpio1 off - LED is green.
>   - when gpio0 is off and gpio1 on - LED is red.
>   - when gpio0 is off and gpio1 off - LED is off.
> We want use led_trigger (nand-disk) on this LED.
> Below patch which we use for get one LED on 2 gpios.
> Can be this in mainline, or may be exist other - better way?
>


-- 
Best regards,
Jacek Anaszewski
