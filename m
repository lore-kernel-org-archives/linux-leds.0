From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 5/5] leds: ktd2692: Remove work queue
Date: Thu, 8 Oct 2015 17:50:44 +0200
Message-ID: <20151008155044.GG11776@xo-6d-61-c0.localdomain>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-6-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442845770-17800-6-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, Ingi Kim <ingi2.kim@samsung.com>
List-Id: linux-leds@vger.kernel.org

On Mon 2015-09-21 16:29:30, Jacek Anaszewski wrote:
> Now the core implements the work queue, remove it from the drivers,
> and switch to using brightness_set_blocking op.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Ingi Kim <ingi2.kim@samsung.com>

Patches 3-5: Acked-by: Pavel Machek <pavel@ucw.cz>
