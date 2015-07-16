From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] leds: netxbig: add device tree binding
Date: Thu, 16 Jul 2015 10:25:37 +0200
Message-ID: <CACRpkdZvbgZWjCOPsPeojBpsPjt+WF_rgQWG_biEqphuErR1dQ@mail.gmail.com>
References: <1434639590-27389-1-git-send-email-simon.guinot@sequanux.org>
	<1434639590-27389-2-git-send-email-simon.guinot@sequanux.org>
	<55894D0A.8000306@samsung.com>
	<20150623211711.GF4853@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:33984 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752520AbbGPIZh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2015 04:25:37 -0400
Received: by obre1 with SMTP id e1so42658832obr.1
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2015 01:25:37 -0700 (PDT)
In-Reply-To: <20150623211711.GF4853@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Vincent Donnefort <vdonnefort@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Tue, Jun 23, 2015 at 11:17 PM, Simon Guinot
<simon.guinot@sequanux.org> wrote:
> On Tue, Jun 23, 2015 at 02:11:54PM +0200, Jacek Anaszewski wrote:

>> >+Binding for the GPIO extension bus found on some LaCie/Seagate boards
>> >+(Example: 2Big/5Big Network v2, 2Big NAS).
>> >+
>> >+Required properties:
>> >+- compatible: "lacie,netxbig-gpio-ext".
>> >+- addr-gpios: GPIOs representing the address register.
>> >+- data-gpios: GPIOs representing the data register.
>> >+- enable-gpio: GPIO used to enable the new configuration (address, data).
(...)
>> >+Example:
>> >+
>> >+netxbig_gpio_ext: netxbig-gpio-ext {
>> >+    compatible = "lacie,netxbig-gpio-ext";
>> >+
>> >+    addr-gpios = <&gpio1 15 GPIO_ACTIVE_HIGH
>> >+                  &gpio1 16 GPIO_ACTIVE_HIGH
>> >+                  &gpio1 17 GPIO_ACTIVE_HIGH>;
>> >+    data-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH
>> >+                  &gpio1 13 GPIO_ACTIVE_HIGH
>> >+                  &gpio1 14 GPIO_ACTIVE_HIGH>;
(..)
>> >+    enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
>> >+};
>>
>> This needs gpio maintainer ack. Adding Linus and Alexandre.

Looks pretty straight-forward, a lot of GPIOs for LEDs, well such is life.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
