From: Raul Piper <raulpblooper@gmail.com>
Subject: gpio-led driver
Date: Wed, 20 Jul 2016 16:47:31 +0530
Message-ID: <CAEwN+MDByMJGjhc6x6TubV6XgubnZtTNM=jjNVVr8gsChhe9Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33128 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752356AbcGTLRc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 20 Jul 2016 07:17:32 -0400
Received: by mail-oi0-f65.google.com with SMTP id l9so4511488oih.0
        for <linux-leds@vger.kernel.org>; Wed, 20 Jul 2016 04:17:32 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-leds@vger.kernel.org

Hi,
I wanted to know the part number for the leds-gpio.c in the
driver/leds folder and the device tree bindings for this driver .Can
some one point out to me where in Linux kernel it is?

Also why below line has been used.Is it mandatory?
...
.of_match_table = of_gpio_leds_match,
},

thanks in advance ,
Rp
