From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] ARM/leds: move ARM Versatile LED driver to leds subsystem
Date: Tue, 11 Mar 2014 13:19:00 +0100
Message-ID: <CACRpkdZo0jpr9sCkYDbtYiK8rFrgqt36OhyMR-iLjEmAtLGnAA@mail.gmail.com>
References: <1393509500-26002-1-git-send-email-linus.walleij@linaro.org>
	<1393509500-26002-2-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f181.google.com ([209.85.214.181]:63998 "EHLO
	mail-ob0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755098AbaCKMTB (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 11 Mar 2014 08:19:01 -0400
Received: by mail-ob0-f181.google.com with SMTP id wp4so8265582obc.40
        for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2014 05:19:00 -0700 (PDT)
In-Reply-To: <1393509500-26002-2-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>

On Thu, Feb 27, 2014 at 2:58 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> Now that we have converted this driver to a real platform device
> module-based thing, we move the driver down into the LEDs
> subsystem and rename the config option to LEDS_VERSATILE.
>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Bryan: can you provide an ACK for this patch so I can funnel
> this through the ARM SoC tree?

Ping on this.

Yours,
Linus Walleij
