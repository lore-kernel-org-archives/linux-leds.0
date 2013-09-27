From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Fri, 27 Sep 2013 21:46:34 +0200
Message-ID: <5245E09A.2030400@free-electrons.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com> <5243E6CD.4070402@free-electrons.com> <5245A997.1070305@ti.com> <5245AF24.9070700@free-electrons.com> <5245BF02.80804@ti.com> <5245C161.6060704@ti.com> <5245CFC7.9070506@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:47333 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753911Ab3I0Tqh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 15:46:37 -0400
In-Reply-To: <5245CFC7.9070506@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Bo Shen <voice.shen@atmel.com>

On 27/09/2013 20:34, Alexandre Belloni wrote:
>
> Ok, I tested that and it seems to be working fine.
>

One last question though. What about power management ?

For example, in pwm_bl, pwm_backlight_suspend calls:

    pwm_config(pb->pwm, 0, pb->period);
    pwm_disable(pb->pwm);

Which is fine because it will correctly set up the PWM to a low level.
Then, to disable the pwm itself and its clock, I suppose we would have
to define some pm_ops in atmel_pwm, am I right ?

So we will have to be extra careful to correctly set a low level on the
pin at that time.

Thanks,

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

