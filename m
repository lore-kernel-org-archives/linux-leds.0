From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Thu, 26 Sep 2013 09:48:29 +0200
Message-ID: <5243E6CD.4070402@free-electrons.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:42149 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1755754Ab3IZHsh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2013 03:48:37 -0400
In-Reply-To: <5243E38C.4090006@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>

On 26/09/2013 09:34, Milo Kim wrote:
>
> Ah, I didn't mean the pinctrl subsystem. Sorry for confusing you.
>
> I just want to know the reason why 'atmel_pwm_disable()' releases the
> PWM pin.
> I can't find it in the driver. Am I missing something?
>

Hum, maybe my wording was wrong. What I meant is that when that
disabling the PWM channel by using the PWM_DIS
 register, the PWM is not driving the pin anymore. Then, the level goes
from low (which is correct) to high. Also, the datasheet specifies that
the pwm has to be enabled to get the correct level when duty == 0 or
duty == period.

IIRC, this is not the same on TI SoC where duty == 0 don't give you the
expected behavior and I can understand why there is a pwm_disable()
there. Maybe we have to have a way to differentiate both cases ?

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

