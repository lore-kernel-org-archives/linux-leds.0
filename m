From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] leds: gpio: Add pinctrl PM select sleep,default state in suspend/resume
Date: Fri, 20 Jan 2017 23:12:14 +0200
Message-ID: <CAHp75VeeHeBGj8mo7GAAb0a52GK3fdNhv8wd5CmrLUrWnLxyCg@mail.gmail.com>
References: <20170120164553.27565-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170120164553.27565-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Jan 20, 2017 at 6:45 PM, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> This patch allows users to use an alternate pinctrl "sleep" in order to
> clamp outputs to a wanted state at suspend.

> +#ifdef CONFIG_PM_SLEEP
> +static int gpio_led_suspend(struct device *dev)

Switch to __maybe_unused

-- 
With Best Regards,
Andy Shevchenko
