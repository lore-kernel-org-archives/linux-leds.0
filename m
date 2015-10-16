From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v3 02/10] leds: Rename brightness_set_sync op to
 brightness_set_blocking
Date: Fri, 16 Oct 2015 18:34:23 +0300
Message-ID: <20151016153422.GL26916@valkosipuli.retiisi.org.uk>
References: <1444209048-29415-1-git-send-email-j.anaszewski@samsung.com>
 <1444209048-29415-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1444209048-29415-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, sakari.ailus@linux.intel.com, andrew@lunn.ch
List-Id: linux-leds@vger.kernel.org

On Wed, Oct 07, 2015 at 11:10:40AM +0200, Jacek Anaszewski wrote:
> The initial purpose of brightness_set_sync op, introduced along with
> the LED flash class extension, was to add a means for setting torch LED
> brightness as soon as possible, which couldn't have been guaranteed by
> brightness_set op. This patch renames the op to brightness_set_blocking,
> which describes its purpose in a more generic way. It is beneficial
> in view of the prospective changes in the LED core, aiming at removing
> the need for using work queues in LED class drivers that can sleep
> or use delays while setting brightness.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
