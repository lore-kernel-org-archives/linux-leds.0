From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH 1/5] leds: triggers: Allow to switch the trigger to
 "panic" on a kernel panic
Date: Mon, 25 Apr 2016 13:27:36 -0300
Message-ID: <CAAEAJfC=O1akKKdW-9P7OkFZyDfE-ApbWhdYr7HPhszDrFcV1Q@mail.gmail.com>
References: <1459801326-5541-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1459801326-5541-2-git-send-email-ezequiel@vanguardiasur.com.ar>
	<20160424092551.GB23015@amd>
	<20160424092951.GA25596@amd>
	<571DBFAE.7060605@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35585 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933062AbcDYQ1h convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 25 Apr 2016 12:27:37 -0400
Received: by mail-wm0-f54.google.com with SMTP id e201so91977302wme.0
        for <linux-leds@vger.kernel.org>; Mon, 25 Apr 2016 09:27:37 -0700 (PDT)
In-Reply-To: <571DBFAE.7060605@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Pavel Machek <pavel@ucw.cz>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Richard Purdie <rpurdie@rpsys.net>

On 25 April 2016 at 03:56, Jacek Anaszewski <j.anaszewski@samsung.com> =
wrote:
> On 04/24/2016 11:29 AM, Pavel Machek wrote:
>>
>> On Sun 2016-04-24 11:25:51, Pavel Machek wrote:
>>>
>>> On Mon 2016-04-04 17:22:02, Ezequiel Garcia wrote:
>>>>
>>>> This commit adds a new led_cdev flag LED_BLINK_AT_PANIC, which
>>>> allows to mark a specific LED to be switched to the "panic"
>>>> trigger, on a kernel panic.
>>>>
>>>> This is useful to allow the user to assign a regular trigger
>>>> to a given LED, and still blink that LED on a kernel panic.
>>>>
>>>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>>
>>>
>>>
>>>>   drivers/leds/led-triggers.c | 52
>>>> +++++++++++++++++++++++++++++++++++++++++++++
>>>>   include/linux/leds.h        |  1 +
>>>
>>>
>>> Could we get this out of the core? I'm pretty sure most users are n=
ot
>>> interested...
>
>
> Good point.
>

Not sure how we can get it out of the core, and still implement it.

The goal is to run-time switch user-specified LEDs and blink them when
the kernel panics, and so it needs to mess up with some core private
structures.

Unless we don't want this feature at all.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
