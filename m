From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/3] leds: core: Introduce generic pattern interface
Date: Thu, 6 Jul 2017 05:18:01 +0200
Message-ID: <20170706031801.GB12954@xo-6d-61-c0.localdomain>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-2-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170714224520.467-2-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fenglin Wu <fenglinw@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

Hi!

> Some LED controllers have support for autonomously controlling
> brightness over time, according to some preprogrammed pattern or
> function.
> 
> This adds a new optional operator that LED class drivers can implement
> if they support such functionality as well as a new device attribute to
> configure the pattern for a given LED.

> @@ -61,3 +61,23 @@ Description:
>  		gpio and backlight triggers. In case of the backlight trigger,
>  		it is useful when driving a LED which is intended to indicate
>  		a device in a standby like state.
> +
> +What:		/sys/class/leds/<led>/pattern
> +Date:		July 2017
> +KernelVersion:	4.14
> +Description:
> +		Specify a pattern for the LED, for LED hardware that support
> +		altering the brightness as a function of time.
> +
> +		The pattern is given by a series of tuples, of brightness and
> +		duration (ms). The LED is expected to traverse the series and
> +		each brightness value for the specified duration.
> +
> +		Additionally a repeat marker ":|" can be appended to the
> +		series, which should cause the pattern to be repeated
> +		endlessly.
> +
> +		As LED hardware might have different capabilities and precision
> +		the requested pattern might be slighly adjusted by the driver
> +		and the resulting pattern of such operation should be returned
> +		when this file is read.

Well. I believe this is mostly useful for RGB LEDs. Unfortunately, having patterns
per-LED will present opportunity for different channels becoming de-synchronized
from each other, which will not look nice.

Best regards,
										Pavel
