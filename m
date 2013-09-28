From: Milo Kim <milo.kim@ti.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Sat, 28 Sep 2013 22:29:45 +0900
Message-ID: <5246D9C9.80600@ti.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com> <5243E6CD.4070402@free-electrons.com> <5245A997.1070305@ti.com> <5245AF24.9070700@free-electrons.com> <5245BF02.80804@ti.com> <5245C161.6060704@ti.com> <5245CFC7.9070506@free-electrons.com> <5245E09A.2030400@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:58052 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753537Ab3I1N3x (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sat, 28 Sep 2013 09:29:53 -0400
In-Reply-To: <5245E09A.2030400@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Bo Shen <voice.shen@atmel.com>

On 09/28/2013 04:46 AM, Alexandre Belloni wrote:
> On 27/09/2013 20:34, Alexandre Belloni wrote:
>>
>> Ok, I tested that and it seems to be working fine.
>>
>
> One last question though. What about power management ?
>
> For example, in pwm_bl, pwm_backlight_suspend calls:
>
>      pwm_config(pb->pwm, 0, pb->period);
>      pwm_disable(pb->pwm);
>
> Which is fine because it will correctly set up the PWM to a low level.

OK.

> Then, to disable the pwm itself and its clock, I suppose we would have
> to define some pm_ops in atmel_pwm, am I right ?

Maybe the suspend/resume() can be handled by the PWM driver.
However, not every PWM consumer of atmel-pwm needs the PM code.
I think it would be better if those are handled by each the PWM consumer.

> So we will have to be extra careful to correctly set a low level on the
> pin at that time.

If you only care about the leds-pwm, then no additional handling is 
required.
The LED subsystem provides a 'LED_CORE_SUSPENDRESUME' flag which enables 
the PM automatically.
The brightness is set to 0 forcedly on the suspend, and the stored 
brightness is recovered on the resume.
The leds-pwm driver enables this flag.
On the suspend mode, pwm_config() and pwm_disable() are called in 
__led_pwm_set(). That's exactly what you need.

Best regards,
Milo

