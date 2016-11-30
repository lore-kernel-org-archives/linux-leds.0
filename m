From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: leds-gpio: no GPIO labels (in debugfs)
Date: Wed, 30 Nov 2016 17:24:29 +0100
Message-ID: <3428499.pbM7ylo2PO@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:36166 "EHLO
        webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754590AbcK3QYi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 30 Nov 2016 11:24:38 -0500
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org

Hi,

I jut noticed that the used GPIOs for leds-gpio do not have an actual label 
which is visible in debugfs (/sys/kernel/debug/gpio):
> gpiochip4: GPIOs 368-383, parent: spi/spi0.2, mcp23s17, can sleep:
>  gpio-369 P0.1 (?           ) out hi
>  gpio-370 P0.2 (?           ) out lo
>  gpio-371 P0.3 (?           ) out lo
>  gpio-372 P0.4 (?           ) out lo
>  gpio-373 P0.5 (?           ) out lo
>  gpio-374 P0.6 (?           ) out lo

The reason is that the call to devm_get_gpiod_from_child() in 
gpio_leds_create() eventually calls "gpiod_request(desc, NULL);" in 
fwnode_get_named_gpiod. So no label attached to GPIO, hence "?" output.

As we have already a gpiod in create_gpio_led(), devm_gpio_request_one() with 
the proper label is not called.
I don't know much of that code, so what would be needed to have a proper GPIO 
label? And how?

Best regards,
Alexander Stein
-- 
Dipl.-Inf. Alexander Stein
SYS TEC electronic GmbH
alexander.stein@systec-electronic.com

Legal and Commercial Address:
Am Windrad 2
08468 Heinsdorfergrund
Germany

Office: +49 (0) 3765 38600-0
Fax:    +49 (0) 3765 38600-4100
 
Managing Directors:
	Director Technology/CEO: Dipl.-Phys. Siegmar Schmidt;
	Director Commercial Affairs/COO: Dipl. Ing. (FH) Armin von Collrepp
Commercial Registry:
	Amtsgericht Chemnitz, HRB 28082; USt.-Id Nr. DE150534010
