From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
Date: Fri, 7 Jun 2019 15:19:44 -0700
Message-ID: <20190607220947.GR40515@google.com>
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180208113032.27810-4-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@google.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Brian Norris <briannorris@google.com>, Guenter Roeck <groeck@google.com>, Lee Jones <lee.jones@linaro.org>, Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com
List-Id: linux-leds@vger.kernel.org

Hi Enric,

some comments inline, a bit late, but I just tested this on veyron
minnie.

On Thu, Feb 08, 2018 at 12:30:31PM +0100, Enric Balletbo i Serra wrote:
> When you want to change the brightness using a PWM signal, one thing you
> need to consider is how human perceive the brightness. Human perceive
> the brightness change non-linearly, we have better sensitivity at low
> luminance than high luminance, so to achieve perceived linear dimming,
> the brightness must be matches to the way our eyes behave. The CIE 1931
> lightness formula is what actually describes how we perceive light.
> 
> This patch computes a default table with the brightness levels filled
> with the numbers provided by the CIE 1931 algorithm, the number of the
> brightness levels is calculated based on the PWM resolution.
> 
> The calculation of the table using the CIE 1931 algorithm is enabled by
> default when you do not define the 'brightness-levels' propriety in your
> device tree.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> ...
>
> +static
> +int pwm_backlight_brightness_default(struct device *dev,
> +				     struct platform_pwm_backlight_data *data,
> +				     unsigned int period)
> +{
> +	unsigned int counter = 0;
> +	unsigned int i, n;
> +	u64 retval;
> +
> +	/*
> +	 * Count the number of bits needed to represent the period number. The
> +	 * number of bits is used to calculate the number of levels used for the
> +	 * brightness-levels table, the purpose of this calculation is have a
> +	 * pre-computed table with enough levels to get linear brightness
> +	 * perception. The period is divided by the number of bits so for a
> +	 * 8-bit PWM we have 255 / 8 = 32 brightness levels or for a 16-bit PWM
> +	 * we have 65535 / 16 = 4096 brightness levels.
> +	 *
> +	 * Note that this method is based on empirical testing on different
> +	 * devices with PWM of 8 and 16 bits of resolution.
> +	 */
> +	n = period;
> +	while (n) {
> +		counter += n % 2;
> +		n >>= 1;
> +	}

I don't quite follow the heuristics above. Are you sure the number of
PWM bits can be infered from the period? What if the period value (in
ns) doesn't directly correspond to a register value? And even if it
did, counting the number of set bits (the above loops is a
re-implementation of ffs()) doesn't really result in the dividers
mentioned in the comment. E.g. a period of 32768 ns (0x8000) results
in a divider of 1, i.e. 32768 brighness levels.

On veyron minnie the period is 1000000 ns, which results in 142858
levels (1000000 / 7)!

Not sure if there is a clean solution using heuristics, a DT property
specifying the number of levels could be an alternative. This could
also be useful to limit the number of (mostly) redundant levels, even
the intended max of 4096 seems pretty high.

Another (not directly related) observation is that on minnie the
actual brightness at a nominal 50% is close to 0 (duty cycle ~3%). I
haven't tested with other devices, but I wonder if it would make
sense to have an option to drop the bottom N% of levels, since the
near 0 brightness in the lower 50% probably isn't very useful in most
use cases, but maybe it looks different on other devices.

Cheers

Matthias
