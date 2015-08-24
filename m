From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH/RFC v6 01/36] leds: Add brightness_set_blocking op
Date: Mon, 24 Aug 2015 13:40:15 +0200
Message-ID: <20150824114015.GA22243@amd>
References: <1440081846-11697-1-git-send-email-j.anaszewski@samsung.com>
 <1440081846-11697-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:56644 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752836AbbHXLkT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 24 Aug 2015 07:40:19 -0400
Content-Disposition: inline
In-Reply-To: <1440081846-11697-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Sakari Ailus <sakari.ailus@linux.intel.com>, Stas Sergeev <stsp@users.sourceforge.net>

On Thu 2015-08-20 16:43:31, Jacek Anaszewski wrote:
> This patch adds a new brightness_set_blocking op to the LED subsystem.
> The op is intended for drivers that set brightness in a blocking way,
> i.e. they either can sleep or use delays while setting brightness.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks!
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
