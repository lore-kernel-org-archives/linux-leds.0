From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] leds: leds-gpio: Fix legacy GPIO number case
Date: Thu, 6 Nov 2014 13:50:32 +0200
Message-ID: <20141106115032.GN1618@lahna.fi.intel.com>
References: <1415273003-27674-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:64677 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750828AbaKFLvB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 6 Nov 2014 06:51:01 -0500
Content-Disposition: inline
In-Reply-To: <1415273003-27674-1-git-send-email-geert+renesas@glider.be>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Bryan Wu <cooloney@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Linus Walleij <linus.walleij@linaro.org>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 06, 2014 at 12:23:23PM +0100, Geert Uytterhoeven wrote:
> In the legacy case, led_dat->gpiod is initialized correctly, but
> overwritten later by template->gpiod, which is NULL, causing leds-gpio
> to fail with:
> 
>     gpiod_direction_output: invalid GPIO
>     leds-gpio: probe of leds-gpio failed with error -22
> 
> Move the initialization of led_dat->gpiod from template->gpiod up, and
> always use led_dat->gpiod later, to fix this.
> 
> Fixes: 5c51277a9ababfa4 ("leds: leds-gpio: Add support for GPIO descriptors")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
