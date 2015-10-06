From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH 1/5] leds: core: Move LED core callbacks out of
 led-class.c
Date: Tue, 6 Oct 2015 17:31:28 +0200
Message-ID: <20151006153128.GA375@xo-6d-61-c0.localdomain>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442400464-27367-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com
List-Id: linux-leds@vger.kernel.org

On Wed 2015-09-16 12:47:40, Jacek Anaszewski wrote:
> Since the API for controlling LED brightness and blinking is defined in
> the LED core, move the related timer and work callbacks to the led-core.c,
> and initialize them through a new led_core_init API.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Acked-by: Pavel Machek <pavel@ucw.cz>
