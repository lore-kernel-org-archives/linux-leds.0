From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7] leds: ipaq-micro: Implement brightness_set_blocking op
Date: Mon, 30 Nov 2015 09:52:05 +0100
Message-ID: <CACRpkdZ2KjgfcTwy30KYhFx8gzRO0Q79Tb7YNuFeQ6qPWxT88g@mail.gmail.com>
References: <1448035070-4871-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35963 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753808AbbK3IwF (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 30 Nov 2015 03:52:05 -0500
Received: by obdgf3 with SMTP id gf3so122841163obd.3
        for <linux-leds@vger.kernel.org>; Mon, 30 Nov 2015 00:52:05 -0800 (PST)
In-Reply-To: <1448035070-4871-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Fri, Nov 20, 2015 at 4:57 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:

> Since brightness setting can sleep for this driver, implement
> brightness_set_blocking op, instead of brightness_set.
> It makes this driver compatible with LED triggers.
>
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes from v6:
> - adjust micro_leds_brightness_set() return type to match
>   brightness_set_blocking op return type

Even better.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
