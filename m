From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Tue, 28 Apr 2015 16:26:23 +0300
Message-ID: <553F8A7F.7040700@list.ru>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com> <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp42.i.mail.ru ([94.100.177.102]:52419 "EHLO smtp42.i.mail.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965423AbbD1N0h (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 28 Apr 2015 09:26:37 -0400
In-Reply-To: <553F83DC.8080701@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>

28.04.2015 15:58, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 04/28/2015 12:12 PM, Stas Sergeev wrote:
>> 28.04.2015 11:57, Jacek Anaszewski =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> Hi Stas,
>>>
>>> Have you tested it?
>> Of course I did.
>> Works with gpio driver and provides up to 10usec precision on
>> armada-xp board.
>> This is 1000 times better than without my patch - the precision
>> was 10ms (jiffy).
> Please take into account that this could work reliably only for gpio
> LEDs. For the LEDs driven though a bus (e.g. I2C) delays below 1ms
> might be hard to achieve. The minimum available delay would vary from
> driver to driver.
>=20
> We could think of adding the hr_timer mode to the led-class.
> The mode could be turned on with use of a new led_set_high_res_timer
> API. The API would be called by drivers/leds/leds-gpio.c driver when
> a dedicated sysfs attribute was set adequately.
> The other drivers could also set this mode if they controlled device
> with a suitable LED switching rate. The minimum delay value could
> be made configurable by the driver and readable through sysfs
> when in hr_timer mode.
Why such a complexity?
Wouldn't it be enough if the driver can set the minimum delay
value, yet to always use the hrtimer?
Please note that 10ms (jiffy) is an inadequate minimum delay
pretty much for any driver, I guess. At least 1ms should be possible,
because, well, you can write 1ms to sysfs attribute even without
my patch. So even the existing options need hrtimer to work right.

>>> I tried it with Samsung M0 board and
>>> my leds-aat1290 driver. It didn't work well. And for small delay
>>> intervals it will not have a chance to work reliably with all drive=
rs,
>>> especially the ones which use mutex in their brightness_set op,
>>> since mutex can sleep.
>> OK, I can remove the nsec resolution.
> usec also didn't work, please look at my use case and warning:
>=20
> echo "timer" > trigger
> echo 1 > delay_on
> echo 1 > delay_off
> echo usec > delay_unit
> [  178.584433] hrtimer: interrupt took 300747 ns
I think I should try a tasklet then.

> Only some time later I realized that for AAT1290 brightness is set
> through ASCwire pulse protocol, which takes few ms.
>=20
> Please note that with this approach users would have to wonder why
> they are getting the warnings and why they can't get their LEDs to wo=
rk
> with given settings.
OK, so we need a tasklet and the ability for the driver to set the
minimal delay. I think I can implement the former and hope someone
else will later implement the later. :)
Lets just solve the problem step-by-step. I can't solve all the
problems at once, but you can't deny the fact that the problem
exists and needs to be solved.
