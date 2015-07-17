From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH/RFC 51/51] leds: ipaq-micro: Mark the LED fast
Date: Fri, 17 Jul 2015 15:43:19 +0200
Message-ID: <CACRpkdYLwQ1itBXv63xPvBAiTyhGLLPTFfT2DdXVB5PLaZdcng@mail.gmail.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
	<1437122857-6765-52-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34529 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757844AbbGQNnU (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 09:43:20 -0400
Received: by oigd21 with SMTP id d21so28390579oig.1
        for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2015 06:43:19 -0700 (PDT)
In-Reply-To: <1437122857-6765-52-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>

On Fri, Jul 17, 2015 at 10:47 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:

> The driver neither sleeps nor uses delays in its brightness_set
> op. Mark it fast then.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

NACK. The functions called in drivers/mfd/ipaq-micro.c are
not fast, this need to be dropped.

Yours,
Linus Walleij
