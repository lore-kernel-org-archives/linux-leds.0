From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Mon, 04 May 2015 09:55:00 +0200
Message-ID: <554725D4.7090805@samsung.com>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com>
 <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com>
 <5542624D.70701@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34137 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbbEDHzE (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 4 May 2015 03:55:04 -0400
In-reply-to: <5542624D.70701@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

On 04/30/2015 07:11 PM, Stas Sergeev wrote:
> 28.04.2015 15:58, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> I tried it with Samsung M0 board and
>>>> my leds-aat1290 driver. It didn't work well. And for small delay
>>>> intervals it will not have a chance to work reliably with all driv=
ers,
>>>> especially the ones which use mutex in their brightness_set op,
>>>> since mutex can sleep.
>>> OK, I can remove the nsec resolution.
>>
>> usec also didn't work, please look at my use case and warning:
>>
>> echo "timer" > trigger
>> echo 1 > delay_on
>> echo 1 > delay_off
>> echo usec > delay_unit
>> [  178.584433] hrtimer: interrupt took 300747 ns
>>
>> Only some time later I realized that for AAT1290 brightness is set
>> through ASCwire pulse protocol, which takes few ms.
>>
>> Please note that with this approach users would have to wonder why
>> they are getting the warnings and why they can't get their LEDs to w=
ork
>> with given settings.
> I've now found that the drivers itself use a work queue
> when needed. And some drivers, like leds_gpio, even do this:
> ---
>          if (led_dat->can_sleep) {
>                  led_dat->new_level =3D level;
>                  schedule_work(&led_dat->work);
>          } else {
>                  set_brightness_now();
>          }
> ---

This is to handle GPIO expander chips, for which gpio set/get functions
must sleep while waiting for I2C or SPI transfer completion.

> So it seems the problem is already solved on the per-driver
> basis. I don't have leds-aat1290 driver, it is probably not
> in the kernel.

It is currently on linux-next/master branch.

> It is likely forgetting to use the work-queue
> the way all other drivers do. So I think my patch is good for
> the in-kernel drivers.
>
> There is also a led_cdev->set_brightness_work, and it looks
> unused. I could use it for my patch, but for what, if the
> drivers already use the work queue when needed?

It is used in led_set_brightness function.

I think that using work queues would compromise the whole idea of
introducing intervals less than 1ms. After the task is delegated to
work queue we are losing the control over the moment when it will get
executed.

I am becoming reluctant towards the whole idea, as we will be
unable to guarantee the stability of a delay interval.

--=20
Best Regards,
Jacek Anaszewski
