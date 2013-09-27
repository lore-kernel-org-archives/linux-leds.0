From: Milo Kim <milo.kim@ti.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Sat, 28 Sep 2013 00:51:51 +0900
Message-ID: <5245A997.1070305@ti.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com> <5243E6CD.4070402@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:50169 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751719Ab3I0Pv4 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 27 Sep 2013 11:51:56 -0400
In-Reply-To: <5243E6CD.4070402@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>

On 09/26/2013 04:48 PM, Alexandre Belloni wrote:
> On 26/09/2013 09:34, Milo Kim wrote:
>>
>> Ah, I didn't mean the pinctrl subsystem. Sorry for confusing you.
>>
>> I just want to know the reason why 'atmel_pwm_disable()' releases the
>> PWM pin.
>> I can't find it in the driver. Am I missing something?
>>
>
> Hum, maybe my wording was wrong. What I meant is that when that
> disabling the PWM channel by using the PWM_DIS
>   register, the PWM is not driving the pin anymore. Then, the level goes
> from low (which is correct) to high. Also, the datasheet specifies that
> the pwm has to be enabled to get the correct level when duty == 0 or
> duty == period.
>
> IIRC, this is not the same on TI SoC where duty == 0 don't give you the
> expected behavior and I can understand why there is a pwm_disable()
> there. Maybe we have to have a way to differentiate both cases ?
>
Based on your result, PWM_DIS should be updated when the driver is 
unloaded - no PWM consumer anymore.

Why don't you move PWM_DIS register access code from atmel_pwm_disable() 
to atmel_pwm_remove()?
If it makes sense, the PWM_EN code also needs to be moved to _probe().

Best regards,
Milo
