From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v9 1/8] Documentation: leds: Add description of
 v4l2-flash sub-device
Date: Mon, 1 Jun 2015 23:58:37 +0300
Message-ID: <20150601205837.GG25595@valkosipuli.retiisi.org.uk>
References: <1432566843-6391-1-git-send-email-j.anaszewski@samsung.com>
 <1432566843-6391-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:46187 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752317AbbFAU6n (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2015 16:58:43 -0400
Content-Disposition: inline
In-Reply-To: <1432566843-6391-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com

Hi Jacek,

On Mon, May 25, 2015 at 05:13:56PM +0200, Jacek Anaszewski wrote:
> +On remove the v4l2_flash_release function has to be called, which takes one
> +argument - struct v4l2_flash pointer returned previously by v4l2_flash_init.

You might want to add this function can be safely called with NULL or error
pointer argument.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
