From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Mon, 01 Jun 2015 14:56:01 +0300
Message-ID: <556C4851.7060900@list.ru>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru> <556C1855.7070903@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp51.i.mail.ru ([94.100.177.111]:47359 "EHLO smtp51.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752755AbbFAL4O (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 1 Jun 2015 07:56:14 -0400
In-Reply-To: <556C1855.7070903@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>

01.06.2015 11:31, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> With this approach, the LED will remain in its current blink state, i=
n
> case LED_BRIGHTNESS_FAST flag is not set and delay to be set is below=
 LED_SLOW_MIN_PERIOD. This is because timer is deleted at the beginning
> of led_blink_set. Effectively this can result in the LED staying turn=
ed
> on when e.g. "echo 1 > delay_on" fails.
>=20
> I propose to change this part of code as follows:
>=20
>         if (!(led_cdev->flags & LED_BRIGHTNESS_FAST)) {
>         if (delay_on < LED_SLOW_MIN_PERIOD ||
>             delay_off < LED_SLOW_MIN_PERIOD)
>             led_set_brightness_async(led_cdev, LED_OFF);
>             return -ERANGE;
>         }
>     }
Sounds good.

> By this occasion it turned out that we have inconsistency:
> led_set_brightness_async calls brightness_set op, which doesn't
> set LED brightness in an asynchronous way in case of every driver.
>=20
> Before introduction of SET_BRIGHTNESS_SYNC and SET_BRIGHTNESS_ASYNC
> flags there was only brightness_set op. The flags and
> brightness_set_sync op was added for flash LED controllers to avoid
> delegating the job to work queue and assure that brightness is set
> as quickly as possible.
>=20
> I mistakenly assumed that all drivers set the brightness with use
> of a work queue.
Indeed.

> Now, to fix the issue all drivers that set brightness in the
> asynchronous way need to set the SET_BRIGHTNESS_SYNC flag and rename
> their brightness_set ops to brightness_set_sync.
> It would be also nice to rename brightness_set op to
> brightness_set_async.
>=20
> Also, led_set_brightness_async shouldn't be called directly
> anywhere, but led_set_brightness should be used, as it
> selects the appropriate op basing on the SET_BRIGHTNESS_* flag.
>=20
> I'd prefer to do these modifications before merging this patch
Sounds good: I wonder if the new flag for FAST drivers will then
be needed at all: maybe it would be enough for the driver to define
a SYNC method, and we assume the SYNC methods are always fast?
In fact, the things are more complicated: some drivers do small
udelay()'s but do not use a work-queue. I was not marking them as
=46AST, although perhaps they could still be marked as SYNC?

> set. I can produce the patch set within a few days. Or, maybe you
> would like to take care of it?
I would appreciate if you do.
I very much hate to do any non-trivial changes to the code I can't
even properly test (sometimes not even compile-test!).

Since you are at it, I'd also suggest to kill the work-queue in
led-core.c. Now that we fixed a scenario where it was mistakenly
used, I again think it is not needed for what it was initially advertis=
ed.
