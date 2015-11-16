From: =?iso-8859-1?Q?Hofst=E4tter_Markus?= <Markus.Hofstaetter@ait.ac.at>
Subject: Re: [PATCH 1/1] leds: call led_pwm_set() in leds-pwm to enforce
 default LED_OFF
Date: Mon, 16 Nov 2015 13:48:18 +0000
Message-ID: <683FCC1FA91F7D4681B11BC13D4A787754C8A73C@S0MSMAIL112.arc.local>
References: <1447242029-29335-1-git-send-email-markus.hofstaetter@ait.ac.at>,<5649BBF3.6050104@samsung.com>,<683FCC1FA91F7D4681B11BC13D4A787754C8A721@S0MSMAIL112.arc.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.ait.ac.at ([62.218.164.131]:38051 "EHLO mx1.ait.ac.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752032AbbKPNsh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 08:48:37 -0500
In-Reply-To: <683FCC1FA91F7D4681B11BC13D4A787754C8A721@S0MSMAIL112.arc.local>
Content-Language: de-AT
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Jacek,

thx for looking into the patch.

> AFAICS default brightness is hard coded to LED_OFF, so this
> will turn active-low LEDs on.

LED_OFF will turn a active led on only if you don't set active-low in t=
he dt. In latter case  the behaviour is inverted to match the same brig=
htness meanings (for pwms that don't support inversion in the driver).
As you saw the LED_OFF setting is hard coded and set it in the device s=
tructure by the probe/pwm add routine.

The issue here is that this will only report a brightness of 0 (e.g., c=
at ..led/brightness is LED_OFF), but it never configures the associated=
 pwm to that state. So the PIN will be left at its default resp. previo=
us state until you set a new brightness value.

E.g., in my case on the i.MX6Q, the default PIN setting outputs low -->=
 led is at full brightness and cat brightness reports 0. Setting 0 brig=
htness again, turns the light off.
Also, I had looked at the PWM register and saw that it has not been con=
figured until I have set the brightness again.
Anyhow, this would also be an issue for active-high leds, if  the defau=
lt/previous PIN state were active-high, as it would not be set to low. =
This however, is not the case in most scenarios.

Best regards,

Markus Hofst=E4tter

________________________________________
Von: Jacek Anaszewski [j.anaszewski@samsung.com]
Gesendet: Montag, 16. November 2015 12:20
An: Hofst=E4tter Markus
Cc: Bryan Wu; Richard Purdie; linux-leds@vger.kernel.org
Betreff: Re: [PATCH 1/1] leds: call led_pwm_set() in leds-pwm to enforc=
e default LED_OFF

Hi Markus,

On 11/11/2015 12:40 PM, Markus Hofstaetter wrote:
> Some PWMs are disabled by default or the default pin setting
> does not match the LED_OFF state (e.g., active-low leds).
> Hence, the driver may end up reporting 0 brightness, but
> the leds are actually on using full brightness, because
> it never enforces its default configuration.

AFAICS default brightness is hard coded to LED_OFF, so this
will turn active-low LEDs on.

> So enforce it by calling led_pwm_set() after successfully
> registering the device.
>
> Tested on a Phytec phyFLEX i.MX6Q board based on kernel
> v3.19.5.
>
> Signed-off-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
> Tested-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
> ---
>   drivers/leds/leds-pwm.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 1d07e3e..3149dbe 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -132,6 +132,7 @@ static int led_pwm_add(struct device *dev, struct=
 led_pwm_priv *priv,
>       ret =3D led_classdev_register(dev, &led_data->cdev);
>       if (ret =3D=3D 0) {
>               priv->num_leds++;
> +             led_pwm_set(&led_data->cdev, led_data->cdev.brightness)=
;
>       } else {
>               dev_err(dev, "failed to register PWM led for %s: %d\n",
>                       led->name, ret);
>


--
Best Regards,
Jacek Anaszewski
