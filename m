From: Milo Kim <milo.kim@ti.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Thu, 26 Sep 2013 16:34:36 +0900
Message-ID: <5243E38C.4090006@ti.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:55477 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755746Ab3IZHek (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 26 Sep 2013 03:34:40 -0400
In-Reply-To: <5243DEB3.5020405@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>

Hi Alexandre,

On 09/26/2013 04:13 PM, Alexandre Belloni wrote:
> On 26/09/2013 02:28, Milo Kim wrote:
>> However, I can't find any pin control for the PWM output.
>> Just clock control and internal register access, PWM_EN and PWM_DIS.
>> Is the pin controlled via the registers?
>>
>
> Pin control is taken care of by the pinctrl-at91 driver, shouldn't that
> be enough ?

Ah, I didn't mean the pinctrl subsystem. Sorry for confusing you.

I just want to know the reason why 'atmel_pwm_disable()' releases the 
PWM pin.
I can't find it in the driver. Am I missing something?

- Milo

