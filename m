From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Mon, 04 May 2015 15:12:55 +0300
Message-ID: <55476247.6030007@list.ru>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com> <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com> <5542624D.70701@list.ru> <554725D4.7090805@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <554725D4.7090805@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

04.05.2015 10:55, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> So it seems the problem is already solved on the per-driver
>> basis. I don't have leds-aat1290 driver, it is probably not
>> in the kernel.
> It is currently on linux-next/master branch.
So that driver is not in line with others.

>> It is likely forgetting to use the work-queue
>> the way all other drivers do. So I think my patch is good for
>> the in-kernel drivers.
>>
>> There is also a led_cdev->set_brightness_work, and it looks
>> unused. I could use it for my patch, but for what, if the
>> drivers already use the work queue when needed?
> It is used in led_set_brightness function.
Only under that condition:
---
if (led_cdev->blink_delay_on || led_cdev->blink_delay_off) {
         led_cdev->delayed_set_value =3D brightness;
         schedule_work(&led_cdev->set_brightness_work);
---

But the main condition is:
---
if (led_cdev->flags & SET_BRIGHTNESS_ASYNC) {
         led_set_brightness_async(led_cdev, brightness);
---

So I think it is actually unused.
I don't see why schedule_work() above can't be just replaced
with led_set_brightness_async(). Is there the reason not to do so?

> I think that using work queues would compromise the whole idea of
> introducing intervals less than 1ms. After the task is delegated to
> work queue we are losing the control over the moment when it will get
> executed.
No one is going to allow sub-ms intervals when work-queue
is used. The proper solution would be to use work-queue for
drivers that can sleep, and allow sub-ms resolution for others.
=46ortunately the drivers seem to already have that information
internally, and use work-queue on their own when needed.
leds-aat1290 may be an exception from that.

> I am becoming reluctant towards the whole idea, as we will be
> unable to guarantee the stability of a delay interval.
So why are you against the idea of improving the precision,
rather than against the code that prevents us from doing so?
The per-driver work queue use can be moved to led-core,
and the precise intervals can be guaranteed for the drivers
that do not need work queue.
Now your leds-aat1290 already asks for such a change,
because it can sleep but does not use a work-queue the
way other drivers do.
If I do such a massive change, I will certainly not be able
to properly test it, while you have a good test-case and
even a driver that needs such a change anyway. So I don't
see the point of being against that.

So what should we do?
I can try the aforementioned massive clean-up with removing
the work-queue from every driver and using the one in
led-core, but my attempts have few chances to succeed
because of no test-cases. Or can you do this instead, so
that leds-aat1290 driver is in line with the others? Or any
other options I can try?
