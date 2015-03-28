From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 01/11] leds: unify the location of led-trigger API
Date: Sun, 29 Mar 2015 00:33:49 +0200
Message-ID: <20150328223349.GW18321@valkosipuli.retiisi.org.uk>
References: <1427464185-27950-1-git-send-email-j.anaszewski@samsung.com>
 <1427464185-27950-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427464185-27950-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com
List-Id: linux-leds@vger.kernel.org

On Fri, Mar 27, 2015 at 02:49:35PM +0100, Jacek Anaszewski wrote:
> Part of led-trigger API was in the private drivers/leds/leds.h header.
> Move it to the include/linux/leds.h header to unify the API location
> and announce it as public. It has been already exported from
> led-triggers.c with EXPORT_SYMBOL_GPL macro.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
