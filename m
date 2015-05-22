From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 19/20] leds: mark versatile driver with
 LED_BRIGHTNESS_FAST flag
Date: Fri, 22 May 2015 09:14:42 +0200
Message-ID: <CACRpkdbbgJzv+XVZ6O5kU4snRiaxK5ew-fS0JP4TzAq4v5RbKg@mail.gmail.com>
References: <555CA58A.10700@list.ru>
	<555DF87A.8030108@list.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <555DF87A.8030108@list.ru>
Sender: linux-kernel-owner@vger.kernel.org
To: Stas Sergeev <stsp@list.ru>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Linux kernel <linux-kernel@vger.kernel.org>, Stas Sergeev <stsp@users.sourceforge.net>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Linus Walleij <triad@df.lth.se>
List-Id: linux-leds@vger.kernel.org

On Thu, May 21, 2015 at 5:23 PM, Stas Sergeev <stsp@list.ru> wrote:

> This driver doesn't use sleeping operations in .brightness_set
> method, and can be marked with LED_BRIGHTNESS_FAST flag.
> That flag allows changing brightness at high rates (over 100Hz).
>
> CC: Bryan Wu <cooloney@gmail.com>
> CC: Richard Purdie <rpurdie@rpsys.net>
> CC: Jacek Anaszewski <j.anaszewski@samsung.com>
> CC: linux-leds@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: Linus Walleij <triad@df.lth.se>
>
> Signed-off-by: Stas Sergeev <stsp@users.sourceforge.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Interesting that you're mailing my student account from 1997.
Luckily, it still works.

Yours,
Linus Walleij
