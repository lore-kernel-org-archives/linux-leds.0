From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Mon, 04 May 2015 17:22:34 +0200
Message-ID: <55478EBA.6000202@samsung.com>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com>
 <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com>
 <5542624D.70701@list.ru> <554725D4.7090805@samsung.com>
 <55476247.6030007@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:59891 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752148AbbEDPWi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2015 11:22:38 -0400
In-reply-to: <55476247.6030007@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

On 05/04/2015 02:12 PM, Stas Sergeev wrote:
> 04.05.2015 10:55, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> So it seems the problem is already solved on the per-driver
>>> basis. I don't have leds-aat1290 driver, it is probably not
>>> in the kernel.
>> It is currently on linux-next/master branch.
> So that driver is not in line with others.
>
>>> It is likely forgetting to use the work-queue
>>> the way all other drivers do. So I think my patch is good for
>>> the in-kernel drivers.
>>>
>>> There is also a led_cdev->set_brightness_work, and it looks
>>> unused. I could use it for my patch, but for what, if the
>>> drivers already use the work queue when needed?
>> It is used in led_set_brightness function.
> Only under that condition:
> ---
> if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>          led_cdev->delayed_set_value =3D brightness;
>          schedule_work(&led_cdev->set_brightness_work);
> ---
>
> But the main condition is:
> ---
> if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
>          led_set_brightness_async(led_cdev, brightness);
> ---
>
> So I think it is actually unused.
> I don't see why schedule_work() above can't be just replaced
> with led_set_brightness_async(). Is there the reason not to do so?

set_brightness_work not only sets the brightness but also
stops software blinking, which was the primary reason
for adding this work queue I think. Here is the commit message:

------------------------

     leds: delay led_set_brightness if stopping soft-blink

     Delay execution of led_set_brightness() if need to stop soft-blink
     timer.

     This allows led_set_brightness to be called in hard-irq context ev=
en if
     soft-blink was activated on that LED.

------------------------


Moreover, I've just realized that there is inconsistency among
LED drivers, related to the brightness_set op implementation.
Some drivers use work queue in brightness_set op it and some of them
don't, despite they do locking either directly or indirectly.
Those drivers are incompatible with timer trigger.

>> I think that using work queues would compromise the whole idea of
>> introducing intervals less than 1ms. After the task is delegated to
>> work queue we are losing the control over the moment when it will ge=
t
>> executed.
> No one is going to allow sub-ms intervals when work-queue
> is used. The proper solution would be to use work-queue for
> drivers that can sleep, and allow sub-ms resolution for others.
 >
> Fortunately the drivers seem to already have that information
> internally, and use work-queue on their own when needed.
> leds-aat1290 may be an exception from that.

leds-aat1290 also uses work queue in its brightness_set op
which is called from led_timer_function when timer trigger
is on.

>> I am becoming reluctant towards the whole idea, as we will be
>> unable to guarantee the stability of a delay interval.
> So why are you against the idea of improving the precision,
> rather than against the code that prevents us from doing so?
> The per-driver work queue use can be moved to led-core,
> and the precise intervals can be guaranteed for the drivers
> that do not need work queue.

Removing work queues from drivers and using brightness_set_work
instead would be nice. We had also discussion about similar
solution during LED Flash class implementation, however it
wasn't as clear as right now that the solution had been almost ready.

> Now your leds-aat1290 already asks for such a change,
> because it can sleep but does not use a work-queue the
> way other drivers do.

It doesn't need this change - it defines two ops: brightness_set
(the async one) and brightness_set_sync (the sync one). The
former is called from led_set_brightness_async and the latter
form led_set_brightness_sync.
led_set_brightness_async is called from led_set_brightness
for drivers that define SET_BRIGHTNESS_ASYNC flag and
led_set_brightness_sync for the drivers that define
SET_BRIGHTNESS_SYNC flags.

led_timer_function calls always led_set_brightness_async.

> So what should we do?
> I can try the aforementioned massive clean-up with removing
> the work-queue from every driver and using the one in
> led-core, but my attempts have few chances to succeed
> because of no test-cases. Or can you do this instead, so
> that leds-aat1290 driver is in line with the others? Or any
> other options I can try?
>

It would have to be done for the LED core and all drivers
in one patch set. We would have to get acks from all LED drivers'
authors (or at least from majority of them).

Once this is done we could think about adding optional hr timers
based triggers and invite people for testing.

--=20
Best Regards,
Jacek Anaszewski
