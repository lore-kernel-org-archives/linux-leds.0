From: Milo Kim <milo.kim@ti.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Thu, 26 Sep 2013 09:28:20 +0900
Message-ID: <52437FA4.8090501@ti.com>
References: <524340CD.4060403@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:56463 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753991Ab3IZA2Z (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 25 Sep 2013 20:28:25 -0400
In-Reply-To: <524340CD.4060403@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>

Looping Thierry who maintains the PWM subsystem.

I'm thinking your PWM driver is
https://lkml.org/lkml/2013/9/24/776.
Is it correct?

However, I can't find any pin control for the PWM output.
Just clock control and internal register access, PWM_EN and PWM_DIS.
Is the pin controlled via the registers?

Best regards,
Milo

On 09/26/2013 05:00 AM, Alexandre Belloni wrote:
> Hi,
>
> I'm using leds-pwm on an atmel sama5d31 based board. I have one
> question/issue. In __led_pwm_set(), if the duty cycle is 0,
> pwm_disable() is called. This won't work fine on that platform. What
> happens is that pwm_config() correctly sets the duty cycle to 0 which is
> behaving correctly with that controller (and in my case, putting the
> line low). But the call to pwm_disable() is making the pwm controller
> release the line and then it is set to high.
>
> I've tried various configurations, like configuring a pull-down on the
> pin but I still observe the same behavior. For now, I have a workaround
> in atmel-pwm (I activate the output overdrive when duty cycle is 0). But
> I believe, we should find another way to do that.
>
> Any input is appreciated.
>
> Regards,
>

