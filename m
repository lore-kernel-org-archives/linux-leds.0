From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 0/4] Add a generic driver for LED-based backlight
Date: Fri, 5 Jul 2019 12:14:34 +0200
Message-ID: <20190705101434.fw5rpctnqt6dwg6e@devuan>
References: <20190701151423.30768-1-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
List-Id: linux-leds@vger.kernel.org

On Mon 2019-07-01 17:14:19, Jean-Jacques Hiblot wrote:
> This series aims to add a led-backlight driver, similar to pwm-backlight,
> but using a LED class device underneath.
> 
> A few years ago (2015), Tomi Valkeinen posted a series implementing a
> backlight driver on top of a LED device:
> https://patchwork.kernel.org/patch/7293991/
> https://patchwork.kernel.org/patch/7294001/
> https://patchwork.kernel.org/patch/7293981/
> 
> The discussion stopped because Tomi lacked the time to work on it.
> 
> This series takes it from there and implements the binding that was
> discussed in https://patchwork.kernel.org/patch/7293991/. In this new
> binding the backlight device is a child of the LED controller instead of
> being another platform device that uses a phandle to reference a LED.

Other option would be to have backlight trigger. What are
advantages/disadvantages relative to that?
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
