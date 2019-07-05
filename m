From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 4/4] devicetree: Add led-backlight binding
Date: Fri, 5 Jul 2019 12:11:51 +0200
Message-ID: <20190705101151.kmyvccbjitfqe4fv@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
 <20190701151423.30768-5-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-5-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi!

> Add DT binding for led-backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Cc: devicetree@vger.kernel.org
> ---

> +Required properties:
> +  - compatible: "led-backlight"
> +  - brightness-levels: Array of distinct LED brightness levels. These
> +      are in the range from 0 to 255, passed to the LED class driver.

These days, we support more (or less) than 256 brightness levels for LED.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
