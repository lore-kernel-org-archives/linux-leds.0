From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 1/3] leds: Add of_led_get() and led_put()
Date: Tue, 25 Aug 2015 14:18:53 +0200
Message-ID: <20150825121853.GB14871@lunn.ch>
References: <1440502442-19531-1-git-send-email-tomi.valkeinen@ti.com>
 <1440502442-19531-2-git-send-email-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([178.209.37.122]:39285 "EHLO vps0.lunn.ch"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754795AbbHYM0Z (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 25 Aug 2015 08:26:25 -0400
Content-Disposition: inline
In-Reply-To: <1440502442-19531-2-git-send-email-tomi.valkeinen@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org

On Tue, Aug 25, 2015 at 02:34:00PM +0300, Tomi Valkeinen wrote:
> This patch adds basic support for a kernel driver to get a LED device.
> This will be used by the led-backlight driver.
> 
> Only OF version is implemented for now, and the behavior is similar to
> PWM's of_pwm_get() and pwm_put().

Hi Tomi

Is this the correct way to do it?  I would of expected an xlate
function.

I'm also wondering if this is the right place, in the class. Don't you
just need the core?

     Andrew
