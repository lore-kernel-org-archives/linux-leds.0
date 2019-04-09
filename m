From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
Date: Tue, 9 Apr 2019 11:55:03 +0200
Message-ID: <20190409095503.GB32344@atrey.karlin.mff.cuni.cz>
References: <20190409001642.249197-1-ncrews@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190409001642.249197-1-ncrews@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nick Crews <ncrews@chromium.org>
Cc: enric.balletbo@collabora.com, bleung@chromium.org, linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, dlaurie@chromium.org, sjg@google.com, groeck@google.com, dtor@google.com
List-Id: linux-leds@vger.kernel.org

> The EC is in charge of controlling the keyboard backlight on
> the Wilco platform. We expose a standard LED class device at
> /sys/class/leds/chromeos::kbd_backlight. This driver is modeled

As discussed, please use platform::.

								Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
