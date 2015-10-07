From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 10/10] media: flash: use led_set_brightness_sync for
 torch brightness
Date: Wed, 7 Oct 2015 12:49:38 +0200
Message-ID: <20151007104938.GA3725@xo-6d-61-c0.localdomain>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
 <1444209048-29415-11-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444209048-29415-11-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com, andrew@lunn.ch, linux-media@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed 2015-10-07 11:10:48, Jacek Anaszewski wrote:
> LED subsystem shifted responsibility for choosing between SYNC or ASYNC
> way of setting brightness from drivers to the caller. Adapt the wrapper
> to those changes.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>

7-10 of the series:

Acked-by: Pavel Machek <pavel@ucw.cz>
