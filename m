From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC v5 01/57] leds: Add brightness_set_nonblocking op
Date: Wed, 19 Aug 2015 16:09:44 +0200
Message-ID: <20150819140944.GP4381@lunn.ch>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
 <1439285890-27329-2-git-send-email-j.anaszewski@samsung.com>
 <20150813141547.GB32484@lunn.ch>
 <55CD9F7F.4020706@samsung.com>
 <55D48CA7.1030504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:36194 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751728AbbHSORD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 19 Aug 2015 10:17:03 -0400
Content-Disposition: inline
In-Reply-To: <55D48CA7.1030504@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>

On Wed, Aug 19, 2015 at 04:03:19PM +0200, Jacek Anaszewski wrote:
> On 08/14/2015 09:57 AM, Jacek Anaszewski wrote:
> >H Andrew,
> >
> >On 08/13/2015 04:15 PM, Andrew Lunn wrote:
> >>On Tue, Aug 11, 2015 at 11:37:14AM +0200, Jacek Anaszewski wrote:
> >>>This patch adds a new brightness_set_nonblocking op to the LED
> >>>subsystem.
> >>>The op is intended for drivers that set brightness in a non-blocking
> >>>way,
> >>>i.e. they neither sleep nor use delays while setting brightness.
> >>>
> >>>Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> >>>Cc: Bryan Wu <cooloney@gmail.com>
> >>>Cc: Andrew Lunn <andrew@lunn.ch>
> >>>Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>Cc: Pavel Machek <pavel@ucw.cz>
> >>>Cc: Stas Sergeev <stsp@users.sourceforge.net>
> >>>---
> >>>  include/linux/leds.h |    3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>>diff --git a/include/linux/leds.h b/include/linux/leds.h
> >>>index b122eea..c32f1b8 100644
> >>>--- a/include/linux/leds.h
> >>>+++ b/include/linux/leds.h
> >>>@@ -53,6 +53,9 @@ struct led_classdev {
> >>>      /* Must not sleep, use a workqueue if needed */
> >>>      void        (*brightness_set)(struct led_classdev *led_cdev,
> >>>                        enum led_brightness brightness);
> >>>+    /* Intended for drivers that set brightness in a non-blocking
> >>>way */
> >>>+    void (*brightness_set_nonblocking)(struct led_classdev *led_cdev,
> >>>+                      enum led_brightness brightness);
> >>
> >>Hi Jacek
> >>
> >>>From an API design point of view, i'm not sure this is the best way to
> >>go. You now have two calls which do the same thing, with the plan that
> >>you want to invert the meaning of brightness_set, the old well known
> >>API call, sometime later. This inverting the meaning is going to catch
> >>people out and introduce bugs.
> >>
> >>I would rather add a brightness_set_blocking op. Then as you go
> >>thought the drivers stripping out the work queue, move the driver to
> >>use this brightness_set_blocking.
> >
> >There are around 60 drivers in the other kernel subsystems that register
> >LED class devices. If we chose the way you proposed then we would have
> >to adjust all of them to the LED core changes, which could complicate
> >the situation during merge window if there were other modifications in
> >the affected drivers.

You don't need to change anything, if the semantics of
brightness_set() does not change. All current drivers don't
sleep. They use a work queue if needed to ensure they don't
sleep. Hence they are correct.

By adding a new operation, brightness_set_blocking(), you can strip
out this work queue and move to the new op member one driver at a
time. And you can take as long as you want doing this. No flag day
when an API suddenly means something totally different.

	Andrew
