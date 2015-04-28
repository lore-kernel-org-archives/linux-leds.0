From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 28 Apr 2015 14:58:04 +0200
Message-ID: <553F83DC.8080701@samsung.com>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com>
 <553F5CFF.9090601@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41189 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965513AbbD1M6I (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 28 Apr 2015 08:58:08 -0400
In-reply-to: <553F5CFF.9090601@list.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

On 04/28/2015 12:12 PM, Stas Sergeev wrote:
> 28.04.2015 11:57, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hi Stas,
>>
>> Have you tested it?
> Of course I did.
> Works with gpio driver and provides up to 10usec precision on
> armada-xp board.
> This is 1000 times better than without my patch - the precision
> was 10ms (jiffy).

Please take into account that this could work reliably only for gpio
LEDs. For the LEDs driven though a bus (e.g. I2C) delays below 1ms
might be hard to achieve. The minimum available delay would vary from
driver to driver.

We could think of adding the hr_timer mode to the led-class.
The mode could be turned on with use of a new led_set_high_res_timer
API. The API would be called by drivers/leds/leds-gpio.c driver when
a dedicated sysfs attribute was set adequately.
The other drivers could also set this mode if they controlled device
with a suitable LED switching rate. The minimum delay value could
be made configurable by the driver and readable through sysfs
when in hr_timer mode.

>> I tried it with Samsung M0 board and
>> my leds-aat1290 driver. It didn't work well. And for small delay
>> intervals it will not have a chance to work reliably with all driver=
s,
>> especially the ones which use mutex in their brightness_set op,
>> since mutex can sleep.
> OK, I can remove the nsec resolution.

usec also didn't work, please look at my use case and warning:

echo "timer" > trigger
echo 1 > delay_on
echo 1 > delay_off
echo usec > delay_unit
[  178.584433] hrtimer: interrupt took 300747 ns

Only some time later I realized that for AAT1290 brightness is set
through ASCwire pulse protocol, which takes few ms.

Please note that with this approach users would have to wonder why
they are getting the warnings and why they can't get their LEDs to work
with given settings.

> I added it for the future, it doesn't work for me either, but
> hrtimer has an API for it, so I thought it may work on another hw.
> I don't see why it can't stay, but if it bothers you that much,
> I'll remove it.
>
>> I am afraid that we have to stay with what we have currently.
> This is a counter-productive conclusion.
 >
> My patch does 1000 times precision improvement with gpio driver.
> If you only want nsec to be removed as it doesn't work - that's
> fine with me.
>


--=20
Best Regards,
Jacek Anaszewski
