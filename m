From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v4 01/12] DT: leds: Improve description of flash LEDs
 related properties
Date: Wed, 8 Apr 2015 11:17:24 +0200
Message-ID: <20150408091724.GD5646@amd>
References: <1427809965-25540-1-git-send-email-j.anaszewski@samsung.com>
 <1427809965-25540-2-git-send-email-j.anaszewski@samsung.com>
 <20150403120910.GL20756@valkosipuli.retiisi.org.uk>
 <5524ECDC.1070609@samsung.com>
 <20150408091129.GT20756@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150408091129.GT20756@valkosipuli.retiisi.org.uk>
Sender: linux-media-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, kyungmin.park@samsung.com, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com, Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> > I think that a board designed so that it can be damaged because of
> > software bugs should be considered not eligible for commercial
> > use.

Hello? It is 2015. Yes, that was nice rule... in 1995 or so :-).

> > As I mentioned in the previous message in this subject, the max-microamp
> > property refers also to non-flash LEDs. Since existing LED class devices
> > does not require them, then it should be left optional and default to
> > max. It would however be inconsistent with flash LEDs related
> > properties.

For non-flash LEDs and backward compatibility, I guess you are
right. Inconsistency is fine in this case...
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
