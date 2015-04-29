From: Stas Sergeev <stsp@list.ru>
Subject: Re: [PATCH v2 0/3] leds: blink resolution improvements
Date: Wed, 29 Apr 2015 14:26:53 +0300
Message-ID: <5540BFFD.4090205@list.ru>
References: <553E6CF5.4030601@list.ru> <553F4B60.20204@samsung.com> <553F5CFF.9090601@list.ru> <553F83DC.8080701@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <553F83DC.8080701@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

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
>=20
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
I've found the SET_BRIGHTNESS_ASYNC and SET_BRIGHTNESS_SYNC flags.
Sounds interesting for my patch, but the only "documentation" I was
able to find, is this:
---
        /* Setting a torch brightness needs to have immediate effect */
        led_cdev->flags &=3D ~SET_BRIGHTNESS_ASYNC;
        led_cdev->flags |=3D SET_BRIGHTNESS_SYNC;
---
Aren't these flags mutually exclusive, and so just one could have
been used?
Anyway, from that comment I can try to guess that if the driver
supports ASYNC mode, it should be fast enough and without sleeps.
The drivers that do i2c transfers with sleeps, should be using SYNC
mode. Or was the intention for these flags entirely different?

My intention is to use either a work-queue or a direct hrtimer
callback, depending on whether the driver supports sync or async
mode. This is instead of the driver being able to set the minimum
delay - much simpler to implement. Makes sense?
Can I use the above flags for that purpose, or will I need
a new one?
