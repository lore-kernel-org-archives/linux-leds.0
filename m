From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH/RFC v6 05/36] leds: Improve setting brightness in a non
 sleeping way
Date: Fri, 21 Aug 2015 22:31:05 +0200
Message-ID: <55D78A89.2030407@gmail.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com> <1440081846-11697-6-git-send-email-j.anaszewski@samsung.com> <20150820160938.GF27457@lunn.ch> <55D6EDD9.6050202@samsung.com> <20150821174507.GB8193@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:33437 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752542AbbHUUbM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 21 Aug 2015 16:31:12 -0400
In-Reply-To: <20150821174507.GB8193@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>

On 08/21/2015 07:45 PM, Andrew Lunn wrote:
> On Fri, Aug 21, 2015 at 11:22:33AM +0200, Jacek Anaszewski wrote:
>> Hi Andrew,
>>
>> Thanks for the review.
>>
>> On 08/20/2015 06:09 PM, Andrew Lunn wrote:
>>> On Thu, Aug 20, 2015 at 04:43:35PM +0200, Jacek Anaszewski wrote:
>>>> This patch replaces led_set_brightness_async with
>>>> led_set_brightness_nosleep in all places where the most vital was setting
>>>> brightness in a non sleeping way but not necessarily asynchronously, which
>>>> is not needed for non-blocking drivers.
>>>
>>> O.K, so i've lost the plot. _sync, _asymc, _nosleep, etc. Too many
>>> changes without a clearly documented vision of what you are trying to
>>> achieve.
>>>
>>> How about splitting this up into at least two patch sets.
>>>
>>> 1) Add the brightness_set_blocking op and the minimum of changes
>>> needed to the core to make it work, and the driver changes taking out
>>> the work queue.
>>
>> The minimum of changes needed includes harnessing existing
>> set_brightness_work for setting brightness instead of the work queues
>> in the drivers.
>
> I'm not sure that is the correct architecture.
>
> The work queue is in the class, not the core. So you need to define
> the core API to not need this work queue.

If we wanted to follow this logic then we should also ask
if led_timer_function shouldn't be placed in the core too.
set_brightness_work was introduced only because of out-of-tree
user which called led_set_brightness from hard irq context,
which caused problems related to locking between hard and
softirq, when timer trigger was enabled.

> What exactly is the core
> API? What does it say about blocking and non-blocking, synchronous and
> non-synchronous?

The core API is everything in linux/leds.h not prefixed with
led_classdev_, i.e functions for controlling brightness, blinking,
and triggers. Until the addition of LED flash class extension
things like sync/async, blocking/non_blocking weren't considered
neither by the API, nor by documentation. There was only a comment
over brightness_set op declaration, that it mustn't sleep.
This requirement stems from the fact that some triggers, e.g. timer,
set brightness from soft irq context.

While implementing LED flash extension we noticed that LED subsystem
doesn't provide a means for setting brightness synchronously,
and we added led_set_brightness_sync API for this, SET_BRIGHTNESS_SYNC,
and SET_BRIGHTNESS_ASYNC flags. Recently we agreed that this is not
a driver that should decide about sync/async way of brightness setting,
but the caller. That's why I am removing the flags and modifying the
sync API. Actually I tried to tell this story in the commit messages of
the patches making up my recent patch set.

> Adding the work queue to the core is the quick and simple way of
> removing it from the drivers. Maybe that is the way forward. You can
> then later come back and sort out the core API and the class API, and
> clean up the documentation.

This work queue from led-class.c is used for setting brightness, when
blink timer is on. Blinking is the functionality from the LED core, so 
the work queue should also belong to the core. It should be moved
there along with led_timer_function, for consistency reasons. In view
of the above, using it for setting brightness by blocking drivers
would be correct from the architectural point of view.

-- 
Best Regards,
Jacek Anaszewski
