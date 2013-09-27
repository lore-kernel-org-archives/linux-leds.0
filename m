From: Milo Kim <milo.kim@ti.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Sat, 28 Sep 2013 02:33:21 +0900
Message-ID: <5245C161.6060704@ti.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com> <5243E6CD.4070402@free-electrons.com> <5245A997.1070305@ti.com> <5245AF24.9070700@free-electrons.com> <5245BF02.80804@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:56111 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753162Ab3I0Rdo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 27 Sep 2013 13:33:44 -0400
In-Reply-To: <5245BF02.80804@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Bo Shen <voice.shen@atmel.com>

Sorry, I meant atmel_pwm_free(), not atmel_pwm_disable().
- copy & paste disaster! :(

> 2) Move atmel PWM register code to atmel_pwm_request() and _free()
>
> static int atmel_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> {
>      struct atmel_pwm_chip *atmel_pwm = to_atmel_pwm_chip(chip);
>
>      atmel_pwm_writel(atmel_pwm, PWM_ENA, 1 << pwm->hwpwm);
>      return 0;
> }
>
> static void atmel_pwm_disable(struct pwm_chip *chip, struct pwm_device
> *pwm)

static void atmel_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)


