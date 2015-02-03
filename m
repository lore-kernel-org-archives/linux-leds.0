From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCHv5 2/2] leds: tlc591xx: Driver for the TI 8/16 Channel
 i2c LED driver
Date: Tue, 3 Feb 2015 11:14:41 +0200
Message-ID: <54D09181.9050206@ti.com>
References: <1421879364-8573-1-git-send-email-andrew@lunn.ch> <1421879364-8573-3-git-send-email-andrew@lunn.ch> <54C62919.8000205@ti.com> <20150126171052.GC5015@lunn.ch> <54C7727D.70000@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:51868 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843AbbBCJPc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 3 Feb 2015 04:15:32 -0500
In-Reply-To: <54C7727D.70000@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, Andrew Lunn <andrew@lunn.ch>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, vigneshr@ti.com, Matthew.Fatheree@belkin.com, linux-leds@vger.kernel.org, kaloz@openwrt.org, linux ARM <linux-arm-kernel@lists.infradead.org>

On 01/27/2015 01:11 PM, Tomi Valkeinen wrote:
> Hi,
>=20
> On 26/01/15 19:10, Andrew Lunn wrote:
>>> So... To me it's still slightly unclear when should one write a PWM
>>> driver and when a LED driver. But I would say that as the TLC591xx
>>> outputs a PWM signal, it should be a PWM driver. Then the different
>>> users of this PWM signal could be made on top of that (LED, backlig=
ht, GPO).
>>>
>>> What would be the technical drawbacks with having the TLC591xx driv=
er as
>>> a PWM, instead of LED?
>> =20
>> Hi Tomi
>>
>> We have been through this once, but the big technical drawback is th=
at
>> this hardware cannot do what the Linux Kernel defines as PWM.
>>
>> It cannot correctly implement the PMW call:
>>
>> int pwm_config(struct pwm_device *pwm, int duty_ns, int period_ns);
>>
>> This hardware has a fixed period, since it is clocked at 97-kHz.  So
>> you cannot set the period. The duty is also somewhat restrictive, in
>> that it only allows 1/256 increments of the 97Khz.

The duty_ns and period_ns will give you the on and off time your user i=
s
asking for. If you can not change frequency, then you don't (97KHz that=
 is).
1/256 is the resolution you can configure the on/off times, nothing
exceptional about it.
The twl4030/5030's LED drivers have 128 clock cycle to play with while =
twl6030
has 256 clock cycles. These PMICs also have PWM drivers which has 128 s=
teps.
drivers/pwm/pwm-twl.c and pwm-twl-led.c

and these just work fine when used via pwm-led or the pwm backlight or
whatever driver.

There's no issue to have PWM driver for tlc591xx IMHO.

> Surely other PWM devices also have restrictions in the period or duty=
 cycle?
>=20
>> This hardware does however perfectly fit the LED API:
>>
>> enum led_brightness {
>>         LED_OFF         =3D 0,
>>         LED_HALF        =3D 127,
>>         LED_FULL        =3D 255,
>> };
>>
>>         void            (*brightness_set)(struct led_classdev *led_c=
dev,
>>                                           enum led_brightness bright=
ness);
>>
>> So we can model it perfectly as an LED driver, or badly as a PWM
>> driver.
>=20
> Maybe so, but what does it mean in practice? If it's implemented as a
> PWM driver, and the existing leds-pwm driver is used for the led
> functionality, shall we miss some brightness values? Is the
> configuration more difficult? Or what?
>=20
> So my point here is that it outputs a PWM signal, so it makes sense t=
o
> have it as a PWM driver. It has restricted configurability compared t=
o
> more versatile PWM hardware, but I so far don't see why that would be=
 an
> issue.
>=20
> If it is a PWM driver, we get backlight support for free via the
> existing pwm_bl driver, and LED support via leds-pwm. And there has b=
een
> a clear acceptance on GPO functionality with PWM outputs (in the Pete=
r's
> mail thread), whereas I would bet that a LED based GPO functionality
> would encounter resistance, because that doesn't quite make sense.
>=20
>  Tomi
>=20
>=20


--=20
P=E9ter
