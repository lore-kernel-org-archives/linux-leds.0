From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/1] leds: call led_pwm_set() in leds-pwm to enforce
 default LED_OFF
Date: Mon, 16 Nov 2015 15:06:01 +0100
Message-ID: <5649E2C9.6040408@samsung.com>
References: <1447242029-29335-1-git-send-email-markus.hofstaetter@ait.ac.at>
 <5649BBF3.6050104@samsung.com>
 <683FCC1FA91F7D4681B11BC13D4A787754C8A721@S0MSMAIL112.arc.local>
 <683FCC1FA91F7D4681B11BC13D4A787754C8A73C@S0MSMAIL112.arc.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:31591 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752883AbbKPOGF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Nov 2015 09:06:05 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NXW00456V63C480@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 16 Nov 2015 14:06:03 +0000 (GMT)
In-reply-to: <683FCC1FA91F7D4681B11BC13D4A787754C8A73C@S0MSMAIL112.arc.local>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Hofst=E4tter_Markus?= <Markus.Hofstaetter@ait.ac.at>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Markus,

Thanks for your explanation. I missed that led_pwm_set behaves
differently when active-low DT property is set.
I've just applied that patch to the LED tree, for-next branch.

Thanks,
Jacek Anaszewski

On 11/16/2015 02:48 PM, Hofst=E4tter Markus wrote:
> Hi Jacek,
>
> thx for looking into the patch.
>
>> AFAICS default brightness is hard coded to LED_OFF, so this
>> will turn active-low LEDs on.
>
> LED_OFF will turn a active led on only if you don't set active-low in=
 the dt. In latter case  the behaviour is inverted to match the same br=
ightness meanings (for pwms that don't support inversion in the driver)=
=2E
> As you saw the LED_OFF setting is hard coded and set it in the device=
 structure by the probe/pwm add routine.
>
> The issue here is that this will only report a brightness of 0 (e.g.,=
 cat ..led/brightness is LED_OFF), but it never configures the associat=
ed pwm to that state. So the PIN will be left at its default resp. prev=
ious state until you set a new brightness value.
>
> E.g., in my case on the i.MX6Q, the default PIN setting outputs low -=
-> led is at full brightness and cat brightness reports 0. Setting 0 br=
ightness again, turns the light off.
> Also, I had looked at the PWM register and saw that it has not been c=
onfigured until I have set the brightness again.
> Anyhow, this would also be an issue for active-high leds, if  the def=
ault/previous PIN state were active-high, as it would not be set to low=
=2E This however, is not the case in most scenarios.
>
> Best regards,
>
> Markus Hofst=E4tter
>
> ________________________________________
> Von: Jacek Anaszewski [j.anaszewski@samsung.com]
> Gesendet: Montag, 16. November 2015 12:20
> An: Hofst=E4tter Markus
> Cc: Bryan Wu; Richard Purdie; linux-leds@vger.kernel.org
> Betreff: Re: [PATCH 1/1] leds: call led_pwm_set() in leds-pwm to enfo=
rce default LED_OFF
>
> Hi Markus,
>
> On 11/11/2015 12:40 PM, Markus Hofstaetter wrote:
>> Some PWMs are disabled by default or the default pin setting
>> does not match the LED_OFF state (e.g., active-low leds).
>> Hence, the driver may end up reporting 0 brightness, but
>> the leds are actually on using full brightness, because
>> it never enforces its default configuration.
>
> AFAICS default brightness is hard coded to LED_OFF, so this
> will turn active-low LEDs on.
>
>> So enforce it by calling led_pwm_set() after successfully
>> registering the device.
>>
>> Tested on a Phytec phyFLEX i.MX6Q board based on kernel
>> v3.19.5.
>>
>> Signed-off-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
>> Tested-by: Markus Hofstaetter <markus.hofstaetter@ait.ac.at>
>> ---
>>    drivers/leds/leds-pwm.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
>> index 1d07e3e..3149dbe 100644
>> --- a/drivers/leds/leds-pwm.c
>> +++ b/drivers/leds/leds-pwm.c
>> @@ -132,6 +132,7 @@ static int led_pwm_add(struct device *dev, struc=
t led_pwm_priv *priv,
>>        ret =3D led_classdev_register(dev, &led_data->cdev);
>>        if (ret =3D=3D 0) {
>>                priv->num_leds++;
>> +             led_pwm_set(&led_data->cdev, led_data->cdev.brightness=
);
>>        } else {
>>                dev_err(dev, "failed to register PWM led for %s: %d\n=
",
>>                        led->name, ret);
>>
>
>
> --
> Best Regards,
> Jacek Anaszewski
> --
> To unsubscribe from this list: send the line "unsubscribe linux-leds"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
