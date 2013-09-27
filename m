From: Milo Kim <milo.kim@ti.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Sat, 28 Sep 2013 02:23:14 +0900
Message-ID: <5245BF02.80804@ti.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com> <5243E6CD.4070402@free-electrons.com> <5245A997.1070305@ti.com> <5245AF24.9070700@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:42723 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752196Ab3I0RXW (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 27 Sep 2013 13:23:22 -0400
In-Reply-To: <5245AF24.9070700@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Bo Shen <voice.shen@atmel.com>

On 09/28/2013 01:15 AM, Alexandre Belloni wrote:
> Cc the atmel maintainers that may want to chime in.
>
> On 27/09/2013 17:51, Milo Kim wrote:
>> On 09/26/2013 04:48 PM, Alexandre Belloni wrote:
>>>
>>> Hum, maybe my wording was wrong. What I meant is that when that
>>> disabling the PWM channel by using the PWM_DIS
>>>    register, the PWM is not driving the pin anymore. Then, the level goes
>>> from low (which is correct) to high. Also, the datasheet specifies that
>>> the pwm has to be enabled to get the correct level when duty == 0 or
>>> duty == period.
>>>
>>> IIRC, this is not the same on TI SoC where duty == 0 don't give you the
>>> expected behavior and I can understand why there is a pwm_disable()
>>> there. Maybe we have to have a way to differentiate both cases ?
>>>
>> Based on your result, PWM_DIS should be updated when the driver is
>> unloaded - no PWM consumer anymore.
>>
>> Why don't you move PWM_DIS register access code from
>> atmel_pwm_disable() to atmel_pwm_remove()?
>> If it makes sense, the PWM_EN code also needs to be moved to _probe().
>>
>
> If we do what you suggest, I'm afraid we will enable pwm channels that
> have no consumers. Isn't pwm_disable() suppose to disable the pwm
> channels ? I believe that is what is done on the other platforms.
>

Ah, I missed that point, thanks.
What about using pwm_request() and pwm_free()?

1) Add pwm_request() and pwm_free ops in the atmel-pwm driver.

static const struct pwm_ops atmel_pwm_ops = {
+	.request = atmel_pwm_request,
+	.free = atmel_pwm_free,
	.config = atmel_pwm_config,
	.set_polarity = atmel_pwm_set_polarity,
	.enable = atmel_pwm_enable,
	.disable = atmel_pwm_disable,
	.owner = THIS_MODULE,
};

2) Move atmel PWM register code to atmel_pwm_request() and _free()

static int atmel_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
{
	struct atmel_pwm_chip *atmel_pwm = to_atmel_pwm_chip(chip);

	atmel_pwm_writel(atmel_pwm, PWM_ENA, 1 << pwm->hwpwm);
	return 0;
}

static void atmel_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
{
	struct atmel_pwm_chip *atmel_pwm = to_atmel_pwm_chip(chip);

	atmel_pwm_writel(atmel_pwm, PWM_DIS, 1 << pwm->hwpwm);
}

It still has some issue which you pointed if a PWM consumer doesn't call 
pwm_enable() after pwm_get().
However, it's better idea than enabling the PWM channel at initial time.

Best regards,
Milo
