From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH 2/2] leds: add BCM6328 LED driver
Date: Sat, 18 Apr 2015 11:14:55 +0200
Message-ID: <5532208F.6070505@openwrt.org>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com> <1428246485-32305-1-git-send-email-noltari@gmail.com> <1428246485-32305-3-git-send-email-noltari@gmail.com> <552FC921.3050005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:48502 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751171AbbDRJOt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sat, 18 Apr 2015 05:14:49 -0400
In-Reply-To: <552FC921.3050005@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, =?UTF-8?B?w4FsdmFybyBGZXI=?= =?UTF-8?B?bsOhbmRleiBSb2phcw==?= <noltari@gmail.com>
Cc: linux-leds@vger.kernel.org, cooloney@gmail.com, f.fainelli@gmail.com, cernekee@gmail.com

Hi Jacek,

On 16.04.2015 16:37, Jacek Anaszewski wrote:
> Hi Alvaro,
>=20
> On 04/05/2015 05:08 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:

(snip)

>> +static int bcm6328_hwled(struct device *dev, struct device_node *nc=
, u32 reg,
>> +			 void __iomem *mem, spinlock_t *lock)
>> +{
>> +	int i, cnt;
>> +	unsigned long flags, val;
>> +
>> +	spin_lock_irqsave(lock, flags);
>> +	val =3D bcm6328_led_read(mem + REG_HWDIS);
>> +	val &=3D ~BIT(reg);
>> +	bcm6328_led_write(mem + REG_HWDIS, val);
>=20
> What is the purpose of REG_HWDIS register? Does it activate the LED o=
r
> so?

The HWDIS register controls whether the led will be controlled by a
hardware signal, with 0 meaning hardware control enabled and 1 hardware
control disabled. This is usually 1:1 for hardware to led signals, but
through the activity/link registers you have some limited control over
rerouting it. Note that even with a bit cleared there is limited contro=
l
over the led; you can still let it blink and light it up if it isn't,
but not turn it off if the hardware decided to light it up.

The default is to disable all hardware signals, and only enable them to
be driven by hardware if requested.


Regards
Jonas
