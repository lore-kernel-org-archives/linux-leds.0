From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/5] leds: core: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Thu, 8 Oct 2015 17:50:37 +0200
Message-ID: <20151008155036.GF11776@xo-6d-61-c0.localdomain>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com
List-Id: linux-leds@vger.kernel.org

On Mon 2015-09-21 16:29:26, Jacek Anaszewski wrote:
> This patch removes SET_BRIGHTNESS_ASYNC and SET_BRIGHTNESS flags.
> led_set_brightness now calls led_set_brightness_nosleep instead of
> choosing between sync and async op basing on the flags defined by the
> driver.

Are those flags unused in the version of kernel you are patching?

If so, tell us so in the changelog. Thanks,
								Pavel
