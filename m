From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Mon, 04 May 2015 20:20:14 +0300
Message-ID: <5547AA4E.6040306@list.ru>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com> <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com> <5542624D.70701@list.ru> <554725D4.7090805@samsung.com> <55476247.6030007@list.ru> <55478EBA.6000202@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55478EBA.6000202@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

04.05.2015 18:22, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 05/04/2015 02:12 PM, Stas Sergeev wrote:
>> Only under that condition:
>> ---
>> if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
>>          led_cdev->delayed_set_value =3D brightness;
>>          schedule_work(&led_cdev->set_brightness_work);
>> ---
>>
>> But the main condition is:
>> ---
>> if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
>>          led_set_brightness_async(led_cdev, brightness);
>> ---
>>
>> So I think it is actually unused.
>> I don't see why schedule_work() above can't be just replaced
>> with led_set_brightness_async(). Is there the reason not to do so?
> set_brightness_work not only sets the brightness but also
> stops software blinking, which was the primary reason
> for adding this work queue I think. Here is the commit message:
But led_trigger_set() does led_stop_software_blink(), which
IMHO means led_set_brightness() will in most cases be called
when sw blocking is already stopped. There seem to be just a
few cases where this is not true: oneshot_trig_deactivate() and
timer_trig_deactivate(), and I think I'll just change these two to
led_stop_software_blink(). I am pretty sure the work-queue is
not needed, but I'll have to test that with the patch it seems.

> ------------------------
>
>     leds: delay led_set_brightness if stopping soft-blink
>
>     Delay execution of led_set_brightness() if need to stop soft-blin=
k
>     timer.
>
>     This allows led_set_brightness to be called in hard-irq context=20
> even if=20
> soft-blink was activated on that LED.
Instead of disabling the soft-blink beforehand, which is what=20
led_trigger_set()
already does? I am probably missing something.

> > Now your leds-aat1290 already asks for such a change,
>> because it can sleep but does not use a work-queue the
>> way other drivers do.
> It doesn't need this change - it defines two ops: brightness_set
> (the async one) and brightness_set_sync (the sync one). The
> former is called from led_set_brightness_async and the latter
> form led_set_brightness_sync.
> led_set_brightness_async is called from led_set_brightness
> for drivers that define SET_BRIGHTNESS_ASYNC flag and
> led_set_brightness_sync for the drivers that define
> SET_BRIGHTNESS_SYNC flags.
>
> led_timer_function calls always led_set_brightness_async.
OK, I googled the patch:
https://lkml.org/lkml/2015/3/4/960
So the async one uses the work-queue, and the sync one
does not. Since led_timer_function calls always led_set_brightness_asyn=
c,
it should always be using a work-queue.
But then I fail to explain your diagnostic that with my patch and
your driver, the hrtimer gives warning about a high interrupt
latency. I thought this is because your driver does sleeps and
does not use a work queue. Its not the case. Could you please
clarify, what then caused the high interrupt latency warning in
your testing?

>> So what should we do?
>> I can try the aforementioned massive clean-up with removing
>> the work-queue from every driver and using the one in
>> led-core, but my attempts have few chances to succeed
>> because of no test-cases. Or can you do this instead, so
>> that leds-aat1290 driver is in line with the others? Or any
>> other options I can try?
>>
> It would have to be done for the LED core and all drivers
> in one patch set. We would have to get acks from all LED drivers'
> authors (or at least from majority of them).
>
> Once this is done we could think about adding optional hr timers
> based triggers and invite people for testing.
As long as all drivers use the work-queue when needed and
there is no warning about high interrupt latency, I wonder if
there are some short-cuts to that route. :)
But I first need to understand where this latency came from.
