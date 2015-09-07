From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/3] leds: Add of_led_get() and led_put()
Date: Mon, 07 Sep 2015 16:10:14 +0200
Message-ID: <55ED9AC6.3020505@samsung.com>
References: <1440502442-19531-1-git-send-email-tomi.valkeinen@ti.com>
 <1440502442-19531-2-git-send-email-tomi.valkeinen@ti.com>
 <55DC6CB9.5060301@samsung.com> <55ED8E99.9060004@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18995 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752917AbbIGOKR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2015 10:10:17 -0400
In-reply-to: <55ED8E99.9060004@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>

On 09/07/2015 03:18 PM, Tomi Valkeinen wrote:
> Hi,
>
> On 25/08/15 16:25, Jacek Anaszewski wrote:
>> Hi Tomi,
>>
>> Thanks for the patch. Generally, I'd prefer to add files
>> drivers/leds/of.c and include/linux/of_leds.h and put related functions
>> there. Those functions' names should begin with "of_". Please provide
>
> So I presume leds/of.c should be linked together with led-class.c.
> Afaics, that means I need to either rename the resulting led-class.ko or
> led-class.c, so that I can do it in the Makefile. Any preferences?

Let's rename led-class.ko to led-class-objs.ko.

> Alternatively I could create a led-of.ko, but that doesn't feel right.


-- 
Best Regards,
Jacek Anaszewski
