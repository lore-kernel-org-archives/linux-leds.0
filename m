From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 01/20] leds: implement LED_BRIGHTNESS_FAST flag
Date: Mon, 01 Jun 2015 16:19:22 +0200
Message-ID: <556C69EA.10000@samsung.com>
References: <555CA58A.10700@list.ru> <555CA5FA.2080308@list.ru>
 <556C1855.7070903@samsung.com> <556C4851.7060900@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:31943 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751447AbbFAOT0 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2015 10:19:26 -0400
In-reply-to: <556C4851.7060900@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Kyungmin Park <kyungmin.park@samsung.com>

On 06/01/2015 01:56 PM, Stas Sergeev wrote:
> 01.06.2015 11:31, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> With this approach, the LED will remain in its current blink state, =
in
>> case LED_BRIGHTNESS_FAST flag is not set and delay to be set is belo=
w LED_SLOW_MIN_PERIOD. This is because timer is deleted at the beginnin=
g
>> of led_blink_set. Effectively this can result in the LED staying tur=
ned
>> on when e.g. "echo 1 > delay_on" fails.
>>
>> I propose to change this part of code as follows:
>>
>>          if (!(led_cdev->flags & LED_BRIGHTNESS_FAST)) {
>>          if (delay_on < LED_SLOW_MIN_PERIOD ||
>>              delay_off < LED_SLOW_MIN_PERIOD)
>>              led_set_brightness_async(led_cdev, LED_OFF);
>>              return -ERANGE;
>>          }
>>      }
> Sounds good.
>
>> By this occasion it turned out that we have inconsistency:
>> led_set_brightness_async calls brightness_set op, which doesn't
>> set LED brightness in an asynchronous way in case of every driver.
>>
>> Before introduction of SET_BRIGHTNESS_SYNC and SET_BRIGHTNESS_ASYNC
>> flags there was only brightness_set op. The flags and
>> brightness_set_sync op was added for flash LED controllers to avoid
>> delegating the job to work queue and assure that brightness is set
>> as quickly as possible.
>>
>> I mistakenly assumed that all drivers set the brightness with use
>> of a work queue.
> Indeed.
>
>> Now, to fix the issue all drivers that set brightness in the
>> asynchronous way need to set the SET_BRIGHTNESS_SYNC flag and rename
>> their brightness_set ops to brightness_set_sync.
>> It would be also nice to rename brightness_set op to
>> brightness_set_async.
>>
>> Also, led_set_brightness_async shouldn't be called directly
>> anywhere, but led_set_brightness should be used, as it
>> selects the appropriate op basing on the SET_BRIGHTNESS_* flag.
>>
>> I'd prefer to do these modifications before merging this patch
> Sounds good: I wonder if the new flag for FAST drivers will then
> be needed at all: maybe it would be enough for the driver to define
> a SYNC method, and we assume the SYNC methods are always fast?

=46lash LED controllers also set SYNC flag, but they are not fast.
They require to implement async method (current brightness_set),
for staying compatible with triggers.

> In fact, the things are more complicated: some drivers do small
> udelay()'s but do not use a work-queue. I was not marking them as
> FAST, although perhaps they could still be marked as SYNC?

This could be handled by adding a property to struct led_classdev
for defining minimum acceptable delay. Then FAST flag should not
be needed.

>> set. I can produce the patch set within a few days. Or, maybe you
>> would like to take care of it?
> I would appreciate if you do.
> I very much hate to do any non-trivial changes to the code I can't
> even properly test (sometimes not even compile-test!).

OK, I'll do that.

> Since you are at it, I'd also suggest to kill the work-queue in
> led-core.c. Now that we fixed a scenario where it was mistakenly
> used, I again think it is not needed for what it was initially advert=
ised.
>

OK, I'll check this.

--=20
Best Regards,
Jacek Anaszewski
