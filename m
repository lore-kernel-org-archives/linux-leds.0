From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v9 2/8] media: Add registration helpers for V4L2 flash
 sub-devices
Date: Mon, 1 Jun 2015 23:59:21 +0300
Message-ID: <20150601205921.GH25595@valkosipuli.retiisi.org.uk>
References: <1432566843-6391-1-git-send-email-j.anaszewski@samsung.com>
 <1432566843-6391-3-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432566843-6391-3-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Mon, May 25, 2015 at 05:13:57PM +0200, Jacek Anaszewski wrote:
> This patch adds helper functions for registering/unregistering
> LED Flash class devices as V4L2 sub-devices. The functions should
> be called from the LED subsystem device driver. In case the
> support for V4L2 Flash sub-devices is disabled in the kernel
> config the functions' empty versions will be used.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: Hans Verkuil <hans.verkuil@cisco.com>

Thanks for adding indicator support!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
