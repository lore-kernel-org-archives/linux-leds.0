From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Fri, 27 Sep 2013 18:15:32 +0200
Message-ID: <5245AF24.9070700@free-electrons.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com> <5243E6CD.4070402@free-electrons.com> <5245A997.1070305@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:50843 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751185Ab3I0QPh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 12:15:37 -0400
In-Reply-To: <5245A997.1070305@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Bo Shen <voice.shen@atmel.com>

Cc the atmel maintainers that may want to chime in.

On 27/09/2013 17:51, Milo Kim wrote:
> On 09/26/2013 04:48 PM, Alexandre Belloni wrote:
>>
>> Hum, maybe my wording was wrong. What I meant is that when that
>> disabling the PWM channel by using the PWM_DIS
>>   register, the PWM is not driving the pin anymore. Then, the level goes
>> from low (which is correct) to high. Also, the datasheet specifies that
>> the pwm has to be enabled to get the correct level when duty == 0 or
>> duty == period.
>>
>> IIRC, this is not the same on TI SoC where duty == 0 don't give you the
>> expected behavior and I can understand why there is a pwm_disable()
>> there. Maybe we have to have a way to differentiate both cases ?
>>
> Based on your result, PWM_DIS should be updated when the driver is
> unloaded - no PWM consumer anymore.
>
> Why don't you move PWM_DIS register access code from
> atmel_pwm_disable() to atmel_pwm_remove()?
> If it makes sense, the PWM_EN code also needs to be moved to _probe().
>

If we do what you suggest, I'm afraid we will enable pwm channels that
have no consumers. Isn't pwm_disable() suppose to disable the pwm
channels ? I believe that is what is done on the other platforms.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

