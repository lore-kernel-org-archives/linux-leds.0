From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 05/11] leds: Add driver for AAT1290 flash LED
 controller
Date: Sun, 29 Mar 2015 00:57:52 +0200
Message-ID: <20150328225752.GA18321@valkosipuli.retiisi.org.uk>
References: <1427464185-27950-1-git-send-email-j.anaszewski@samsung.com>
 <1427464185-27950-6-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from nblzone-211-213.nblnetworks.fi ([83.145.211.213]:52853 "EHLO
	hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752013AbbC1W5z (ORCPT
	<rfc822;linux-leds@vger.kernel.org>);
	Sat, 28 Mar 2015 18:57:55 -0400
Content-Disposition: inline
In-Reply-To: <1427464185-27950-6-git-send-email-j.anaszewski@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com

On Fri, Mar 27, 2015 at 02:49:39PM +0100, Jacek Anaszewski wrote:
> This patch adds a driver for the 1.5A Step-Up Current Regulator
> for Flash LEDs. The device is programmed through a Skyworks proprietary
> AS2Cwire serial digital interface.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
