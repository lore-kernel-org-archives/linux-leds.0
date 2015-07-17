From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH/RFC 36/51] leds: syscon: Mark the LED fast
Date: Fri, 17 Jul 2015 15:41:41 +0200
Message-ID: <CACRpkdZk-Jn+ZCtWb7+g_7z4xE2TFksEbq6s2RMwR_MWU+P-ZA@mail.gmail.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
	<1437122857-6765-37-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36382 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757373AbbGQNlm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jul 2015 09:41:42 -0400
Received: by obnw1 with SMTP id w1so65943752obn.3
        for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2015 06:41:41 -0700 (PDT)
In-Reply-To: <1437122857-6765-37-git-send-email-j.anaszewski@samsung.com>
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
