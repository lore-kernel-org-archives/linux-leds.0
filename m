From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH/RFC v5 02/57] leds: Add LED_BRIGHTNESS_BLOCKING flag
Date: Thu, 13 Aug 2015 16:05:22 +0200
Message-ID: <20150813140522.GA32484@lunn.ch>
References: <1439285890-27329-1-git-send-email-j.anaszewski@samsung.com>
 <1439285890-27329-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:59014 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751996AbbHMOMf (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 13 Aug 2015 10:12:35 -0400
Content-Disposition: inline
In-Reply-To: <1439285890-27329-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, stsp@users.sourceforge.net, Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>

On Tue, Aug 11, 2015 at 11:37:15AM +0200, Jacek Anaszewski wrote:
> This patch adds LED_BRIGHTNESS_BLOCKING flag to the LED core to make it
> capable of discerning between drivers that implement brightness_set op
> in the old manner, i.e. the ones which use work queue internally, and
> drivers that implement brightness_set op in the new manner, i.e. they
> are aware that brightness_set op will be called from a work queue task
> by the LED core.
> In the new approach all drivers that implement brightness_set op should
> also set LED_BRIGHTNESS_BLOCKING flag.

Hi Jacek

Why have the drivers set this flag? The core code can look at the two
ops function pointers and figure it out for itself.

    Andrew
