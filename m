From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: max77650: add MODULE_ALIAS()
Date: Thu, 4 Jul 2019 14:58:37 +0200
Message-ID: <20190704125837.cdseto3p6ddfsgh6@devuan>
References: <20190703084738.9501-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190703084738.9501-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-leds@vger.kernel.org


> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Define a MODULE_ALIAS() in the LED sub-driver for max77650 so that
> the appropriate module gets loaded together with the core mfd driver.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

ACK.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
