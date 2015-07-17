From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH/RFC 40/51] leds: versatile: Mark the LED fast
Date: Fri, 17 Jul 2015 15:42:09 +0200
Message-ID: <CACRpkdaSGQgggooYOEXgPeT_VjmDN+xocvknHdo88Ze1ZxME5w@mail.gmail.com>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
	<1437122857-6765-41-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437122857-6765-41-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Stas Sergeev <stsp@users.sourceforge.net>
List-Id: linux-leds@vger.kernel.org

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
