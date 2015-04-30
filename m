From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 05/10] leds: Add driver for AAT1290 flash LED
 controller
Date: Thu, 30 Apr 2015 19:47:24 +0200
Message-ID: <20150430174724.GD23579@amd>
References: <1430205530-20873-1-git-send-email-j.anaszewski@samsung.com>
 <1430205530-20873-6-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430205530-20873-6-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, kyungmin.park@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, sakari.ailus@iki.fi, s.nawrocki@samsung.com
List-Id: linux-leds@vger.kernel.org


> +struct aat1290_led_config_data {
> +	/* maximum LED current in movie mode */
> +	u32 max_mm_current;
> +	/* maximum LED current in flash mode */
> +	u32 max_flash_current;
> +	/* maximum flash timeout */
> +	u32 max_flash_tm;

Ok, the comments tell us what should be already obvious from the
variable names... but it would be nice to add units. (mA? uA? msec?)
(I guess in subsequent patch).
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
