From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v6 05/36] leds: Improve setting brightness in a non
 sleeping way
Date: Mon, 24 Aug 2015 10:11:46 +0200
Message-ID: <55DAD1C2.4070107@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
 <1440081846-11697-6-git-send-email-j.anaszewski@samsung.com>
 <20150820160938.GF27457@lunn.ch> <55D6EDD9.6050202@samsung.com>
 <20150821174507.GB8193@lunn.ch> <55D78A89.2030407@gmail.com>
 <20150821204201.GD8193@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:24550 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752356AbbHXILu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 24 Aug 2015 04:11:50 -0400
In-reply-to: <20150821204201.GD8193@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>

On 08/21/2015 10:42 PM, Andrew Lunn wrote:
>> This work queue from led-class.c is used for setting brightness, when
>> blink timer is on. Blinking is the functionality from the LED core,
>> so the work queue should also belong to the core. It should be moved
>> there along with led_timer_function, for consistency reasons. In view
>> of the above, using it for setting brightness by blocking drivers
>> would be correct from the architectural point of view.
>
> So lets assume we are not doing all the changes in a single patch
> set. Its too complex. You say the work queue should be in the
> core. Lets put a work queue in the core to handle the blocking op, and
> strip it out of the drivers. That allows you to get a lot of driver
> patches merged.

Moving the work queue to the core is rather a cosmetic change and it is
not required for adapting it to setting brightness for blocking drivers.
I think that we could postpone the cosmetic changes to the moment when
other essential patches are merged.

Like I explained in the previous message, patches from 1 to 4 are
the minimum of the changes required for removing work queues from
drivers. I am aware that the changes may be hard to analyze, but the
things are entangled together and changes must be done in a few places
simultaneously. Those crucial changes are gathered in the patch [1].
I tried to explain them in the commit messages. Maybe my explanations
weren't comprehensive enough, if so, I'd be glad if you could indicate
what could be added/modified in the description to make it more clear.

> You can then work on moving led_timer_function into the core, etc,
> with a much smaller patch set, and hopefully in a number of small
> steps which are easy to review.
>
>        Andrew
>

[1] https://lkml.org/lkml/2015/8/11/191
-- 
Best Regards,
Jacek Anaszewski
