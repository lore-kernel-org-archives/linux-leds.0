From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH 1/2 (v3)] leds-bcm6328: Reuse bcm6328_led_set() instead of
 copying its functionality
Date: Sun, 22 Nov 2015 20:40:29 +0000
Message-ID: <5652283D.1050601@simon.arlott.org.uk>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5630A9C1.5060907@samsung.com> <56327821.8020508@simon.arlott.org.uk>
 <563A2731.40204@samsung.com> <563A2850.5000506@gmail.com>
 <563B3240.9010804@samsung.com> <56488968.3070103@simon.arlott.org.uk>
 <5649EA72.20504@samsung.com> <564A3B9B.7040608@simon.arlott.org.uk>
 <564A4B92.4040401@gmail.com> <564ADA76.4040202@simon.arlott.org.uk>
 <564AE00C.7050303@samsung.com> <564AE209.7000106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from proxima.lp0.eu ([81.2.80.65]:40028 "EHLO proxima.lp0.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752656AbbKVUkh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sun, 22 Nov 2015 15:40:37 -0500
In-Reply-To: <564AE209.7000106@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

When ensuring a consistent initial LED state in bcm6328_led (as they ma=
y
be blinking instead of on/off), the LED register is set using an invert=
ed
copy of bcm6328_led_set(). To avoid further errors relating to active l=
ow
handling, call this function directly instead.

As bcm6328_led_set() expects to acquire the spinlock, call it after
unlocking. There is no need to hold the spinlock between reading the
current value and setting it again because the LED device has not yet
been registered.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
On 17/11/15 08:15, Jacek Anaszewski wrote:
> On 11/17/2015 09:06 AM, Jacek Anaszewski wrote:
>> On 11/17/2015 08:42 AM, Simon Arlott wrote:
>>> On 16/11/15 21:33, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>>> Still wrong, you are setting the led value after unlocking the spi=
nlock.
>>>
>>> I have to unlock it because bcm6328_led_set() locks that spinlock.
>>
>> Commit message from the first version of the patch justified that
>> properly. It should be preserved in the final patch:
>>
>> As bcm6328_led_set() expects to acquire the spinlock, narrow the loc=
king
>> to only cover reading of the current state. There is no need to hold=
 the
>> spinlock between reading the current value and setting it again beca=
use
>> the LED device has not yet been registered.
>=20
> Hmm, if so, then spin_lock in bcm6328_led isn't needed at all, as it
> is guaranteed that no concurrent process will be executing this
> function.

No, it's still required because it has to protect the read/modify/write
for all the other LED devices that use the same register.

 drivers/leds/leds-bcm6328.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index c7ea5c6..95d0cf9 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -314,14 +314,10 @@ static int bcm6328_led(struct device *dev, struct=
 device_node *nc, u32 reg,
 	} else {
 		led->cdev.brightness =3D LED_OFF;
 	}
-
-	if ((led->active_low && led->cdev.brightness =3D=3D LED_FULL) ||
-	    (!led->active_low && led->cdev.brightness =3D=3D LED_OFF))
-		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
-	else
-		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
 	spin_unlock_irqrestore(lock, flags);
=20
+	bcm6328_led_set(&led->cdev, led->cdev.brightness);
+
 	led->cdev.brightness_set =3D bcm6328_led_set;
 	led->cdev.blink_set =3D bcm6328_blink_set;
=20
--=20
2.1.4

--=20
Simon Arlott
