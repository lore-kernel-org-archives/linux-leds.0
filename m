From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v9 3/8] leds: max77693: add support for V4L2 Flash
 sub-device
Date: Tue, 2 Jun 2015 00:21:23 +0300
Message-ID: <20150601212123.GJ25595@valkosipuli.retiisi.org.uk>
References: <1432566843-6391-1-git-send-email-j.anaszewski@samsung.com>
 <1432566843-6391-4-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:46359 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751889AbbFAVV6 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 1 Jun 2015 17:21:58 -0400
Content-Disposition: inline
In-Reply-To: <1432566843-6391-4-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com

Hi Jacek,

On Mon, May 25, 2015 at 05:13:58PM +0200, Jacek Anaszewski wrote:
> Add support for V4L2 Flash sub-device to the max77693 LED Flash class
> driver. The support allows for V4L2 Flash sub-device to take the control
> of the LED Flash class device.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Sakari Ailus <sakari.ailus@iki.fi>

For this and the rest in the set:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Many thanks to you for your efforts on this! It's great to see it in this
state after all the review rounds. :-)

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
