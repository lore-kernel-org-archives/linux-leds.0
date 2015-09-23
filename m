From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 3/5] leds: Rename brightness_set_sync op to
 brightness_set_blocking
Date: Wed, 23 Sep 2015 10:36:29 +0200
Message-ID: <5602648D.9040609@samsung.com>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-4-git-send-email-j.anaszewski@samsung.com>
 <20150922185426.GC20029@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:63439 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752632AbbIWIge (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 23 Sep 2015 04:36:34 -0400
In-reply-to: <20150922185426.GC20029@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, pavel@ucw.cz, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com

On 09/22/2015 08:54 PM, Andrew Lunn wrote:
> On Wed, Sep 16, 2015 at 12:47:42PM +0200, Jacek Anaszewski wrote:
>> The initial purpose of brightness_set_sync op, introduced along with
>> the LED flash class extension, was to add a means for setting torch LED
>> brightness as soon as possible, which couldn't have been guaranteed by
>> brightness_set op. This patch renames the op to brightness_set_blocking,
>> which describes its purpose in a more generic way, and is beneficial
>> in view of the prospective changes in the core related to using
>> LED core's set_brightness_work for setting brightness for LED class
>> drivers that can sleep or use delays while setting brightness.
>
> ...
>
>> -	/*
>> -	 * Set LED brightness level immediately - it can block the caller for
>> -	 * the time required for accessing a LED device register.
>> -	 */
>> -	int		(*brightness_set_sync)(struct led_classdev *led_cdev,
>> -					enum led_brightness brightness);
>> +	/* Can sleep or use delays */
>> +	int (*brightness_set_blocking)(struct led_classdev *led_cdev,
>
> I'm no expert when it comes to flash photography with digital
> cameras.

This op is now not specific to flash LEDs. The last sentence in the
commit message explains this, but now I see that it is too long.
Let's change it to:

"This patch renames the op to brightness_set_blocking,
which describes its purpose in a more generic way. It is beneficial
in view of the prospective changes in the LED core, aiming at removing
the need for using work queues in LED class drivers that can sleep
or use delays while setting brightness."

> But to me the old comment seems better.

I changed it to highlight the essence of how it differs from
brightness_set.

> Doesn't the caller
> want to know the flash is now giving out light?

We have strobe_get op for this, but it is in led-class-flash extension.
This is irrelevant here.

> The new comment gives
> no indication of this, where as the old one does?



-- 
Best Regards,
Jacek Anaszewski
