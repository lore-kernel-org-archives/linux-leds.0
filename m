From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 07/17] gpio: port LoCoMo gpio support from old driver
Date: Wed, 6 May 2015 16:12:33 +0200
Message-ID: <CACRpkdahn4B_Nvx14VYkGd8tBqKVxB+5f74KgKcLwCeM_S+oRA@mail.gmail.com>
References: <1430178954-11138-1-git-send-email-dbaryshkov@gmail.com>
	<1430178954-11138-8-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36050 "EHLO
	mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbbEFOMe (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2015 10:12:34 -0400
Received: by oift201 with SMTP id t201so8279476oif.3
        for <linux-leds@vger.kernel.org>; Wed, 06 May 2015 07:12:34 -0700 (PDT)
In-Reply-To: <1430178954-11138-8-git-send-email-dbaryshkov@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Jingoo Han <jg1.han@samsung.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Andrea Adami <andrea.adami@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Linux Input <linux-input@vger.kernel.org>, linux-leds@vger.kernel.or

On Tue, Apr 28, 2015 at 1:55 AM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:

> Add gpiolib driver for gpio pins placed on the LoCoMo GA.
>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I assume this will be funneled through the MFD tree?

Yours,
Linus Walleij
