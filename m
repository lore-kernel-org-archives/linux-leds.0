From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 3/5] leds: Rename brightness_set_sync op to
 brightness_set_blocking
Date: Tue, 6 Oct 2015 17:36:51 +0200
Message-ID: <20151006153651.GC375@xo-6d-61-c0.localdomain>
References: <1442400464-27367-1-git-send-email-j.anaszewski@samsung.com>
 <1442400464-27367-4-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442400464-27367-4-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com, stsp@users.sourceforge.net, ospite@studenti.unina.it, davem@davemloft.net, linus.walleij@linaro.org, ricardo.ribalda@gmail.com, p.meerwald@bct-electronic.com
List-Id: linux-leds@vger.kernel.org

On Wed 2015-09-16 12:47:42, Jacek Anaszewski wrote:
> The initial purpose of brightness_set_sync op, introduced along with
> the LED flash class extension, was to add a means for setting torch LED
> brightness as soon as possible, which couldn't have been guaranteed by
> brightness_set op. This patch renames the op to brightness_set_blocking,
> which describes its purpose in a more generic way, and is beneficial
> in view of the prospective changes in the core related to using
> LED core's set_brightness_work for setting brightness for LED class
> drivers that can sleep or use delays while setting brightness.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Acked-by: Pavel Machek <pavel@ucw.cz>
