From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/2 (v3)] leds-bcm6328: Reuse bcm6328_led_set() instead of
 copying its functionality
Date: Mon, 23 Nov 2015 11:19:55 +0100
Message-ID: <5652E84B.1060804@samsung.com>
References: <562BB799.7000708@simon.arlott.org.uk>
 <562DE832.6070903@samsung.com>
 <ed10b1e070e8b0d4a9eda6b32b686d1ab5b71759@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <5630A9C1.5060907@samsung.com> <56327821.8020508@simon.arlott.org.uk>
 <563A2731.40204@samsung.com> <563A2850.5000506@gmail.com>
 <563B3240.9010804@samsung.com> <56488968.3070103@simon.arlott.org.uk>
 <5649EA72.20504@samsung.com> <564A3B9B.7040608@simon.arlott.org.uk>
 <564A4B92.4040401@gmail.com> <564ADA76.4040202@simon.arlott.org.uk>
 <564AE00C.7050303@samsung.com> <564AE209.7000106@samsung.com>
 <5652283D.1050601@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5652283D.1050601@simon.arlott.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Arlott <simon@fire.lp0.eu>
Cc: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>, Jonas Gorski <jogo@openwrt.org>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 11/22/2015 09:40 PM, Simon Arlott wrote:
> When ensuring a consistent initial LED state in bcm6328_led (as they =
may
> be blinking instead of on/off), the LED register is set using an inve=
rted
> copy of bcm6328_led_set(). To avoid further errors relating to active=
 low
> handling, call this function directly instead.
>
> As bcm6328_led_set() expects to acquire the spinlock, call it after
> unlocking. There is no need to hold the spinlock between reading the
> current value and setting it again because the LED device has not yet
> been registered.
>
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> On 17/11/15 08:15, Jacek Anaszewski wrote:
>> On 11/17/2015 09:06 AM, Jacek Anaszewski wrote:
>>> On 11/17/2015 08:42 AM, Simon Arlott wrote:
>>>> On 16/11/15 21:33, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>>>>> Still wrong, you are setting the led value after unlocking the sp=
inlock.
>>>>
>>>> I have to unlock it because bcm6328_led_set() locks that spinlock.
>>>
>>> Commit message from the first version of the patch justified that
>>> properly. It should be preserved in the final patch:
>>>
>>> As bcm6328_led_set() expects to acquire the spinlock, narrow the lo=
cking
>>> to only cover reading of the current state. There is no need to hol=
d the
>>> spinlock between reading the current value and setting it again bec=
ause
>>> the LED device has not yet been registered.
>>
>> Hmm, if so, then spin_lock in bcm6328_led isn't needed at all, as it
>> is guaranteed that no concurrent process will be executing this
>> function.
>
> No, it's still required because it has to protect the read/modify/wri=
te
> for all the other LED devices that use the same register.

Right, other already registered LED class devices can interfere.

>   drivers/leds/leds-bcm6328.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.=
c
> index c7ea5c6..95d0cf9 100644
> --- a/drivers/leds/leds-bcm6328.c
> +++ b/drivers/leds/leds-bcm6328.c
> @@ -314,14 +314,10 @@ static int bcm6328_led(struct device *dev, stru=
ct device_node *nc, u32 reg,
>   	} else {
>   		led->cdev.brightness =3D LED_OFF;
>   	}
> -
> -	if ((led->active_low && led->cdev.brightness =3D=3D LED_FULL) ||
> -	    (!led->active_low && led->cdev.brightness =3D=3D LED_OFF))
> -		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
> -	else
> -		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
>   	spin_unlock_irqrestore(lock, flags);
>
> +	bcm6328_led_set(&led->cdev, led->cdev.brightness);
> +
>   	led->cdev.brightness_set =3D bcm6328_led_set;
>   	led->cdev.blink_set =3D bcm6328_blink_set;
>
>


--=20
Best Regards,
Jacek Anaszewski
