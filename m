From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC 01/51] leds: Add led_set_brightness_sync to the
 public LED subsystem API
Date: Wed, 22 Jul 2015 09:25:27 +0200
Message-ID: <20150722072527.GB18401@amd>
References: <1437122857-6765-1-git-send-email-j.anaszewski@samsung.com>
 <1437122857-6765-2-git-send-email-j.anaszewski@samsung.com>
 <20150721095005.GB23841@amd>
 <55AE6895.3040605@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55AE6895.3040605@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: linux-leds@vger.kernel.org

On Tue 2015-07-21 17:43:17, Jacek Anaszewski wrote:
> On 21.07.2015 11:50, Pavel Machek wrote:
> >On Fri 2015-07-17 10:46:47, Jacek Anaszewski wrote:
> >>led_set_brightness_sync function was visible only internally to the
> >>LED subsystem. It is now being made publicly available since it has
> >>become apparent that this is a caller who should decide whether
> >>brightness is to be set in a synchronous or an asynchronous way.
> >>The function is modified to use brightness_set op as the second
> >>option if brightness_set_sync is not implemented. Eventually all
> >>LED subsystem drivers will be modfified to set brightness only in
> >>a synchronous way with use of brightness_set op and brightness_set_sync
> >>op will be removed. LED core will take care of calling brightness_set
> >>op asynchronously if needed.
> >
> >As I explained before, having single brightness_set callback sometimes
> >block and sometimes not based on flag elsewhere is a bad design.
> 
> The flag is not "elsewhere" but defined by the same driver that
> implements the op.

Single callback sometimes blocks and sometimes does not, based on flag
elsewhere (*). Making both human and computer analysis more tricky. Just
don't do it.

									Pavel

(*) sure, in the same driver, somewhere. but that info should be in
the callback name.
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
