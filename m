From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH/RFC v6 05/36] leds: Improve setting brightness in a non
 sleeping way
Date: Fri, 21 Aug 2015 11:22:33 +0200
Message-ID: <55D6EDD9.6050202@samsung.com>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
 <1440081846-11697-6-git-send-email-j.anaszewski@samsung.com>
 <20150820160938.GF27457@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20150820160938.GF27457@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

Hi Andrew,

Thanks for the review.

On 08/20/2015 06:09 PM, Andrew Lunn wrote:
> On Thu, Aug 20, 2015 at 04:43:35PM +0200, Jacek Anaszewski wrote:
>> This patch replaces led_set_brightness_async with
>> led_set_brightness_nosleep in all places where the most vital was setting
>> brightness in a non sleeping way but not necessarily asynchronously, which
>> is not needed for non-blocking drivers.
>
> O.K, so i've lost the plot. _sync, _asymc, _nosleep, etc. Too many
> changes without a clearly documented vision of what you are trying to
> achieve.
>
> How about splitting this up into at least two patch sets.
>
> 1) Add the brightness_set_blocking op and the minimum of changes
> needed to the core to make it work, and the driver changes taking out
> the work queue.

The minimum of changes needed includes harnessing existing
set_brightness_work for setting brightness instead of the work queues
in the drivers. First three patches in the patch set are indispensable
to implement this and avoid breakage of blinking feature. Especially
patch 3/36 is quite complex, but I didn't have better idea on how to
tackle this problem without breaking bisect,

> 2) A set of patches cleaning up the core and its API. We want a well
> documented linux/leds.h and drivers/led/leds.h defining the APIs which
> users and triggers should be using.

Of course, I will document led_set_brightness_async and
led_set_brightness_nosleep functions.

-- 
Best Regards,
Jacek Anaszewski
