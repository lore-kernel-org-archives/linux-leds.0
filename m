From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds: add BCM6328 LED driver
Date: Mon, 20 Apr 2015 09:12:49 +0200
Message-ID: <5534A6F1.1020406@samsung.com>
References: <1427975661-29964-1-git-send-email-noltari@gmail.com>
 <1428246485-32305-1-git-send-email-noltari@gmail.com>
 <1428246485-32305-3-git-send-email-noltari@gmail.com>
 <552FC921.3050005@samsung.com> <5532208F.6070505@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54951 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753646AbbDTHMw (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 20 Apr 2015 03:12:52 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NN3009HBG9CO240@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 20 Apr 2015 08:17:36 +0100 (BST)
In-reply-to: <5532208F.6070505@openwrt.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, linux-leds@vger.kernel.org, cooloney@gmail.com, f.fainelli@gmail.com, cernekee@gmail.com

Hi Jonas,

On 04/18/2015 11:14 AM, Jonas Gorski wrote:
> Hi Jacek,
>
> On 16.04.2015 16:37, Jacek Anaszewski wrote:
>> Hi Alvaro,
>>
>> On 04/05/2015 05:08 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>
> (snip)
>
>>> +static int bcm6328_hwled(struct device *dev, struct device_node *n=
c, u32 reg,
>>> +			 void __iomem *mem, spinlock_t *lock)
>>> +{
>>> +	int i, cnt;
>>> +	unsigned long flags, val;
>>> +
>>> +	spin_lock_irqsave(lock, flags);
>>> +	val =3D bcm6328_led_read(mem + REG_HWDIS);
>>> +	val &=3D ~BIT(reg);
>>> +	bcm6328_led_write(mem + REG_HWDIS, val);
>>
>> What is the purpose of REG_HWDIS register? Does it activate the LED =
or
>> so?
>
> The HWDIS register controls whether the led will be controlled by a
> hardware signal, with 0 meaning hardware control enabled and 1 hardwa=
re
> control disabled. This is usually 1:1 for hardware to led signals, bu=
t
> through the activity/link registers you have some limited control ove=
r
> rerouting it. Note that even with a bit cleared there is limited cont=
rol
> over the led; you can still let it blink and light it up if it isn't,
> but not turn it off if the hardware decided to light it up.
>
> The default is to disable all hardware signals, and only enable them =
to
> be driven by hardware if requested.

Thanks for the explanation. In the associated DT documentation there ar=
e
provided examples with brcm,hardware-controlled property, but no relate=
d
brcm,link-signal-sources and brcm,activity-signal-sources properties.
What is the default routing then? It should be mentioned in the
documentation as well.

--=20
Best Regards,
Jacek Anaszewski
