From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v8 1/1] media: i2c/adp1653: Devicetree support for adp1653
Date: Thu, 16 Apr 2015 07:58:18 +0200
Message-ID: <20150416055817.GA2749@amd>
References: <1429141034-29237-1-git-send-email-sakari.ailus@iki.fi>
 <20150416052442.GA31095@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150416052442.GA31095@earth>
Sender: linux-media-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu 2015-04-16 07:24:42, Sebastian Reichel wrote:
> Hi Sakari,
> 
> Since this driver won't make it into 4.1 anyways, I have one more
> comment:

Like this driver did not receive enough bikesheding.

> > +	} else {
> > +		gpiod_set_value(flash->platform_data->enable_gpio, on);
> > +		if (on)
> > +			/* Some delay is apparently required. */
> > +			udelay(20);
> > +	}
> 
> I suggest to remove the power callback from platform data. Instead
> you can require to setup a gpiod lookup table in the boardcode, if
> platform data based initialization is used (see for example si4713
> initialization in board-rx51-periphals.c).
> 
> This will reduce complexity in the driver and should be fairly easy
> to implement, since there is no adp1653 platform code user in the
> mainline kernel anyways.

I'd hate to break out of tree users for very little gain.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
