From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 2/5] leds: core: Add LED_BLINK_CHANGE and
 LED_BLINK_DISABLE flags
Date: Tue, 6 Oct 2015 17:35:06 +0200
Message-ID: <20151006153506.GB375@xo-6d-61-c0.localdomain>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442400464-27367-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com
List-Id: linux-leds@vger.kernel.org


On Wed 2015-09-16 12:47:41, Jacek Anaszewski wrote:
> This patch adds LED_BLINK_CHANGE flag to indicate that blink brightness
> has changed, and LED_BLINK_DISABLE flag to indicate that blinking
> deactivation has been requested. In order to use the flags
> led_timer_function and set_brightness_delayed callbacks as well as
> led_set_brightness function are being modified. The main goal of these
> modifications is to prepare set_brightness_work for extension of the
> scope of its responsibilities.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Acked-by: Pavel Machek <pavel@ucw.cz>


-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
