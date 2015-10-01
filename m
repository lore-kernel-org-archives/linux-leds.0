From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 00/12] LED core improvements
Date: Thu, 1 Oct 2015 16:22:19 +0300
Message-ID: <560D338B.6010800@linux.intel.com>
References: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:22202 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752163AbbJANWX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 1 Oct 2015 09:22:23 -0400
In-Reply-To: <1443445641-9529-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch, rpurdie@rpsys.net

Hi Jacek,

Jacek Anaszewski wrote:
> This is a second version of the patch set preparing the
> ground for removing work queues from LED class drivers.
> Andrew and Sakari - thanks for a review.
> 
> ================
> Changes from v1:
> ================
> - removed useless use of else in led_set_brightness()
> - switched to removing error code instead of emitting
>   warning from led_set_brightness_sync() in case software
>   blink fallback is enabled
> - moved __led_set_brightness() contents to set_brightness_delayed()
> - removed description of internal led_set_brightness_nosleep() from
>   led-class.txt documentation, and modified description of
>   led_set_brightness() and led_set_brightness_sync()
> - renamed LED_BLINK_CHANGE flag to more meaningful
>   LED_BLINK_BRIGHTNESS_CHANGE
> - Fixed stylistic issues in a few comments
> - Adopted old brightness_set_sync() op description to
>   a new brightness_set_blocking() op
> - Fixed led_set_brightness_nosleep to avoid scheduling
>   spurious set_brightness_work
> - made LED core using EXPORT_SYMBOL_GPL consistently
> - switched v4l2-flash-led-class wrapper to using
>   led_set_brightness_sync API for setting torch brightness
> - merged with patch set
>   "LED flash: Set brightness in a sync way on demand"

Thanks for the update.

A few comments on no particular patch ---

- Synchronous brightness setting is only possible with drivers that
implement blocking brigtness setting op. Should the work queue be
removed from the rest of the drivers, this would be easy to fix.

- led_classdev_suspend() and led_classdev_resume() still unconditionally
call ->brightness_set() which may now be NULL. This needs to be fixed.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
