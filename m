From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v1 01/11] leds: Add support for max77693 mfd flash cell
Date: Sun, 22 Mar 2015 00:44:37 +0200
Message-ID: <20150321224437.GD16613@valkosipuli.retiisi.org.uk>
References: <1426863811-12516-1-git-send-email-j.anaszewski@samsung.com>
 <1426863811-12516-2-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:47208 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751691AbbCUWoo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Sat, 21 Mar 2015 18:44:44 -0400
Content-Disposition: inline
In-Reply-To: <1426863811-12516-2-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>

Hi Jacek,

On Fri, Mar 20, 2015 at 04:03:21PM +0100, Jacek Anaszewski wrote:
> This patch adds led-flash support to Maxim max77693 chipset.
> A device can be exposed to user space through LED subsystem
> sysfs interface. Device supports up to two leds which can
> work in flash and torch mode. The leds can be triggered
> externally or by software.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>

Thanks for the update once again!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
