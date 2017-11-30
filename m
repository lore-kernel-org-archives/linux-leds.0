From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] leds: pm8058: Make ledtype pointer sized type
Date: Thu, 30 Nov 2017 10:18:14 +0100
Message-ID: <CACRpkdYg-dUpaMQwvovBrmjp=zHdPS9geBW=xuS0ioLqfvPaGw@mail.gmail.com>
References: <20171130113516.42c8bde2@canb.auug.org.au> <20171130030543.1071-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171130030543.1071-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Nov 30, 2017 at 4:05 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The pointer returned by of_device_get_match_data() doesn't have the same
> size as u32 on 64-bit architectures, causing issues when compile testing
> the driver on such platform. Make ledtype unsigned long instead, to
> solve this problem.
>
> Fixes: 7f866986e705 ("leds: add PM8058 LEDs driver")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks for covering my ass.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
