From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] leds: lp55xx: handle enable pin in driver
Date: Tue, 22 Oct 2013 18:57:29 +0200
Message-ID: <CACRpkdZzoQ4auk1Q1wB=H-i4Aw7tPaHf3J8Dsa3vA_0Wx65qtw@mail.gmail.com>
References: <1382446896-28436-1-git-send-email-sre@debian.org>
	<1382446896-28436-2-git-send-email-sre@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oa0-f49.google.com ([209.85.219.49]:48002 "EHLO
	mail-oa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753832Ab3JVQ5a (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 22 Oct 2013 12:57:30 -0400
Received: by mail-oa0-f49.google.com with SMTP id j10so6822140oah.22
        for <linux-leds@vger.kernel.org>; Tue, 22 Oct 2013 09:57:30 -0700 (PDT)
In-Reply-To: <1382446896-28436-2-git-send-email-sre@debian.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sebastian Reichel <sre@debian.org>
Cc: Sebastian Reichel <sre@ring0.de>, =?ISO-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Rob Landley <rob@landley.net>, Milo Kim <milo.kim@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>

On Tue, Oct 22, 2013 at 3:01 PM, Sebastian Reichel <sre@debian.org> wrote:

> This patch moves the handling of the chip's enable pin from the board
> code into the driver. It also updates all board-code files using the
> driver to incorporate this change.
>
> This is needed for device tree support of the enable pin.
>
> Signed-off-by: Sebastian Reichel <sre@debian.org>

Looks good to me.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

BTW: should we disable the GPIO when remove()ing the module?
This is a topic of another patch but...

Yours,
Linus Walleij
