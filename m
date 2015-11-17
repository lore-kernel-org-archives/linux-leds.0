From: Simon Arlott <simon@fire.lp0.eu>
Subject: Re: [PATCH 1/2 (v2)] leds-bcm6328: Reuse bcm6328_led_set() instead of
 copying its functionality
Date: Tue, 17 Nov 2015 07:42:46 +0000
Message-ID: <564ADA76.4040202@simon.arlott.org.uk>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5630A9C1.5060907@samsung.com> <56327821.8020508@simon.arlott.org.uk>
 <563A2731.40204@samsung.com> <563A2850.5000506@gmail.com>
 <563B3240.9010804@samsung.com> <56488968.3070103@simon.arlott.org.uk>
 <5649EA72.20504@samsung.com> <564A3B9B.7040608@simon.arlott.org.uk>
 <564A4B92.4040401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from proxima.lp0.eu ([81.2.80.65]:54819 "EHLO proxima.lp0.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751339AbbKQHmw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 17 Nov 2015 02:42:52 -0500
In-Reply-To: <564A4B92.4040401@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Jonas Gorski <jogo@openwrt.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 16/11/15 21:33, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
> Still wrong, you are setting the led value after unlocking the spinlo=
ck.

I have to unlock it because bcm6328_led_set() locks that spinlock.

> El 16/11/2015 a las 21:24, Simon Arlott escribi=C3=B3:
>> When ensuring a consistent initial LED state in bcm6328_led (as they=
 may
>> be blinking instead of on/off), the LED register is set using an inv=
erted
>> copy of bcm6328_led_set(). To avoid further errors relating to activ=
e low
>> handling, call this function directly instead.
>>
>> As bcm6328_led_set() acquires the same spinlock again when updating =
the
>> register, it is called after unlocking.
>>
>> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
>> ---
>>   drivers/leds/leds-bcm6328.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328=
=2Ec
>> index c7ea5c6..95d0cf9 100644
>> --- a/drivers/leds/leds-bcm6328.c
>> +++ b/drivers/leds/leds-bcm6328.c
>> @@ -314,14 +314,10 @@ static int bcm6328_led(struct device *dev, str=
uct device_node *nc, u32 reg,
>>   	} else {
>>   		led->cdev.brightness =3D LED_OFF;
>>   	}
>> -
>> -	if ((led->active_low && led->cdev.brightness =3D=3D LED_FULL) ||
>> -	    (!led->active_low && led->cdev.brightness =3D=3D LED_OFF))
>> -		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
>> -	else
>> -		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
>>   	spin_unlock_irqrestore(lock, flags);
>>  =20
>> +	bcm6328_led_set(&led->cdev, led->cdev.brightness);
>> +
>>   	led->cdev.brightness_set =3D bcm6328_led_set;
>>   	led->cdev.blink_set =3D bcm6328_blink_set;
>>  =20
>=20


--=20
Simon Arlott
