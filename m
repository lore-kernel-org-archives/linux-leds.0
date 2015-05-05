From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 05 May 2015 10:22:37 +0200
Message-ID: <55487DCD.9000504@samsung.com>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com>
 <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com>
 <5542624D.70701@list.ru> <554725D4.7090805@samsung.com>
 <55476247.6030007@list.ru> <55478EBA.6000202@samsung.com>
 <5547AA4E.6040306@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:28599 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752529AbbEEIWo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 5 May 2015 04:22:44 -0400
In-reply-to: <5547AA4E.6040306@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

On 05/04/2015 07:20 PM, Stas Sergeev wrote:
> 04.05.2015 18:22, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 05/04/2015 02:12 PM, Stas Sergeev wrote:
>>> Only under that condition:
>>> ---
>>> if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>>          led_cdev->delayed_set_value =3D brightness;
>>>          schedule_work(&led_cdev->set_brightness_work);
>>> ---
>>>
>>> But the main condition is:
>>> ---
>>> if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
>>>          led_set_brightness_async(led_cdev, brightness);
>>> ---
>>>
>>> So I think it is actually unused.
>>> I don't see why schedule_work() above can't be just replaced
>>> with led_set_brightness_async(). Is there the reason not to do so?
>> set_brightness_work not only sets the brightness but also
>> stops software blinking, which was the primary reason
>> for adding this work queue I think. Here is the commit message:
> But led_trigger_set() does led_stop_software_blink(), which
> IMHO means led_set_brightness() will in most cases be called
> when sw blocking is already stopped. There seem to be just a
> few cases where this is not true: oneshot_trig_deactivate() and
> timer_trig_deactivate(), and I think I'll just change these two to
> led_stop_software_blink(). I am pretty sure the work-queue is
> not needed, but I'll have to test that with the patch it seems.

It is used e.g. in the following case:

#echo "timer" > trigger
#echo 1 > brightness

>> ------------------------
>>
>>     leds: delay led_set_brightness if stopping soft-blink
>>
>>     Delay execution of led_set_brightness() if need to stop soft-bli=
nk
>>     timer.
>>
>>     This allows led_set_brightness to be called in hard-irq context
>> even if soft-blink was activated on that LED.
> Instead of disabling the soft-blink beforehand, which is what
> led_trigger_set()
> already does? I am probably missing something.
>
>> > Now your leds-aat1290 already asks for such a change,
>>> because it can sleep but does not use a work-queue the
>>> way other drivers do.
>> It doesn't need this change - it defines two ops: brightness_set
>> (the async one) and brightness_set_sync (the sync one). The
>> former is called from led_set_brightness_async and the latter
>> form led_set_brightness_sync.
>> led_set_brightness_async is called from led_set_brightness
>> for drivers that define SET_BRIGHTNESS_ASYNC flag and
>> led_set_brightness_sync for the drivers that define
>> SET_BRIGHTNESS_SYNC flags.
>>
>> led_timer_function calls always led_set_brightness_async.
> OK, I googled the patch:
> https://lkml.org/lkml/2015/3/4/960
> So the async one uses the work-queue, and the sync one
> does not. Since led_timer_function calls always led_set_brightness_as=
ync,
> it should always be using a work-queue.
> But then I fail to explain your diagnostic that with my patch and
> your driver, the hrtimer gives warning about a high interrupt
> latency. I thought this is because your driver does sleeps and
> does not use a work queue. Its not the case. Could you please
> clarify, what then caused the high interrupt latency warning in
> your testing?

An accurate explanation would require thorough investigation.
It can be related to the fact that the driver uses delays.

>>> So what should we do?
>>> I can try the aforementioned massive clean-up with removing
>>> the work-queue from every driver and using the one in
>>> led-core, but my attempts have few chances to succeed
>>> because of no test-cases. Or can you do this instead, so
>>> that leds-aat1290 driver is in line with the others? Or any
>>> other options I can try?
>>>
>> It would have to be done for the LED core and all drivers
>> in one patch set. We would have to get acks from all LED drivers'
>> authors (or at least from majority of them).
>>
>> Once this is done we could think about adding optional hr timers
>> based triggers and invite people for testing.
> As long as all drivers use the work-queue when needed and
> there is no warning about high interrupt latency, I wonder if
> there are some short-cuts to that route. :)
> But I first need to understand where this latency came from.
>

It was probably caused by interfering delays in leds-aat1290.

In the first place we have to take into account that Linux is not
a real time operating system. The feature you're trying to implement
is realized by hardware with use of pwm. There might be narrow group
of drivers that could benefit from it in specific circumstances
(the system couldn't be too busy at the time when timer trigger is
running), but this is too weak argument in favour of supporting small
delay intervals.

--=20
Best Regards,
Jacek Anaszewski
