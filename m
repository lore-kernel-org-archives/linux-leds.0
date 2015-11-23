From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds-bcm6328: Swap LED ON and OFF definitions
Date: Mon, 23 Nov 2015 11:20:14 +0100
Message-ID: <5652E85E.3040507@samsung.com>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5630A9C1.5060907@samsung.com> <56327821.8020508@simon.arlott.org.uk>
 <563A2731.40204@samsung.com> <563A2850.5000506@gmail.com>
 <563B3240.9010804@samsung.com> <56488968.3070103@simon.arlott.org.uk>
 <564889ED.4070204@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <564889ED.4070204@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 11/15/2015 02:34 PM, Simon Arlott wrote:
> The values of BCM6328_LED_MODE_ON and BCM6328_LED_MODE_OFF were named
> for active low LEDs. These should be swapped so that they are named f=
or
> the default case of active high LEDs.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> On 05/11/15 10:41, Jacek Anaszewski wrote:
>> On 11/04/2015 04:46 PM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>> BCM6328_LED_MODE_ON and BCM6328_LED_MODE_OFF values were extracted =
from
>>> Broadcom's GPL code, in which they assume leds are active low by de=
fault.
>>> I can confirm the code is correct as it is right now, since those v=
alues
>>> match the active high / low values of the LEDs managed by GPIO inst=
ead
>>> of by using this driver.
>>
>> BCM6328_LED_MODE_ON and BCM6328_LED_MODE_OFF should represent the va=
lues
>> that actually set the LED state according to the current logic.
>> Otherwise it will confuse people who will be analyzing this code.
>> We are interested in the logic as it is seen from this driver's
>> perspective and not GPIO perspective.
>>
>> IMO the values should be swapped.
>
>   drivers/leds/leds-bcm6328.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.=
c
> index 95d0cf9..0329dee 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -48,10 +48,10 @@
>   					 BCM6328_SERIAL_LED_SHIFT_DIR)
>
>   #define BCM6328_LED_MODE_MASK		3
> -#define BCM6328_LED_MODE_OFF		0
> +#define BCM6328_LED_MODE_ON		0
>   #define BCM6328_LED_MODE_FAST		1
>   #define BCM6328_LED_MODE_BLINK		2
> -#define BCM6328_LED_MODE_ON		3
> +#define BCM6328_LED_MODE_OFF		3
>   #define BCM6328_LED_SHIFT(X)		((X) << 1)
>
>   /**
> @@ -126,9 +126,9 @@ static void bcm6328_led_set(struct led_classdev *=
led_cdev,
>   	*(led->blink_leds) &=3D ~BIT(led->pin);
>   	if ((led->active_low && value =3D=3D LED_OFF) ||
>   	    (!led->active_low && value !=3D LED_OFF))
> -		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
> -	else
>   		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
> +	else
> +		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
>   	spin_unlock_irqrestore(led->lock, flags);
>   }
>
> @@ -303,8 +303,8 @@ static int bcm6328_led(struct device *dev, struct=
 device_node *nc, u32 reg,
>   			val =3D bcm6328_led_read(mode) >>
>   			      BCM6328_LED_SHIFT(shift % 16);
>   			val &=3D BCM6328_LED_MODE_MASK;
> -			if ((led->active_low && val =3D=3D BCM6328_LED_MODE_ON) ||
> -			    (!led->active_low && val =3D=3D BCM6328_LED_MODE_OFF))
> +			if ((led->active_low && val =3D=3D BCM6328_LED_MODE_OFF) ||
> +			    (!led->active_low && val =3D=3D BCM6328_LED_MODE_ON))
>   				led->cdev.brightness =3D LED_FULL;
>   			else
>   				led->cdev.brightness =3D LED_OFF;
>

Applied, thanks.

--=20
Best Regards,
Jacek Anaszewski
