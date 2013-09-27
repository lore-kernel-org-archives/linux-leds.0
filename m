From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: leds-pwm: issue in  __led_pwm_set()
Date: Fri, 27 Sep 2013 20:34:47 +0200
Message-ID: <5245CFC7.9070506@free-electrons.com>
References: <524340CD.4060403@free-electrons.com> <52437FA4.8090501@ti.com> <5243DEB3.5020405@free-electrons.com> <5243E38C.4090006@ti.com> <5243E6CD.4070402@free-electrons.com> <5245A997.1070305@ti.com> <5245AF24.9070700@free-electrons.com> <5245BF02.80804@ti.com> <5245C161.6060704@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from top.free-electrons.com ([176.31.233.9]:51459 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754203Ab3I0Seu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Sep 2013 14:34:50 -0400
In-Reply-To: <5245C161.6060704@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Bo Shen <voice.shen@atmel.com>

On 27/09/2013 19:33, Milo Kim wrote:
> Sorry, I meant atmel_pwm_free(), not atmel_pwm_disable().
> - copy & paste disaster! :(
>
>> 2) Move atmel PWM register code to atmel_pwm_request() and _free()
>>
>> static int atmel_pwm_request(struct pwm_chip *chip, struct pwm_device
>> *pwm)
>> {
>>      struct atmel_pwm_chip *atmel_pwm = to_atmel_pwm_chip(chip);
>>
>>      atmel_pwm_writel(atmel_pwm, PWM_ENA, 1 << pwm->hwpwm);
>>      return 0;
>> }
>>
>> static void atmel_pwm_disable(struct pwm_chip *chip, struct pwm_device
>> *pwm)
>
> static void atmel_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
>
>

Ok, I tested that and it seems to be working fine.

Thanks !

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

