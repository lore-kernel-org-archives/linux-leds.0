From: "Kim, Milo" <Milo.Kim@ti.com>
Subject: RE: Registering GPIO LEDs
Date: Fri, 9 Aug 2013 02:08:44 +0000
Message-ID: <A874F61F95741C4A9BA573A70FE3998F82E868B9@DQHE06.ent.ti.com>
References: <ktuj0g$qci$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:37128 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030205Ab3HICIv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Aug 2013 22:08:51 -0400
In-Reply-To: <ktuj0g$qci$1@ger.gmane.org>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ian Pilcher <arequipeno@gmail.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

Hi Ian,

> I've discovered that it's quite simple to control the drive activity
> LEDs on my Thecus N5550 with the standard gpio_ich module.  AFAIK, this
> means that I should be able to use them with the leds_gpio module.  I
> just need to register them.
> 
> I've found this page that gives an example:
> 
>   http://fabiobaltieri.com/2011/09/21/linux-led-subsystem/
> 
> I'm confused, however, about the .gpio member of the struct gpio_led.
> I'm guessing that it's the GPIO number, but (at least in the case of
> gpio_ich) that number can vary depending on the base number for that
> chip.

>From the viewpoint of a GPIO consumer, we don't care the base GPIO number.
That is required when a GPIO controller is added.
Just check '/sys/kernel/debug/gpio' and use available GPIOs for LEDs.

Regards,
Milo
