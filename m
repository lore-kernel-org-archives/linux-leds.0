From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: leds: Add pattern initialization
 from Device Tree
Date: Mon, 17 Dec 2018 16:40:29 -0600
Message-ID: <20181217224029.GA16132@bogus>
References: <1544613406-27026-1-git-send-email-krzk@kernel.org>
 <1544613406-27026-2-git-send-email-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544613406-27026-2-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, Dec 12, 2018 at 12:16:42PM +0100, Krzysztof Kozlowski wrote:
> Document new linux,trigger-pattern property for initialization of LED
> pattern trigger.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index aa1399814a2a..3daccd4ea8a3 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -37,6 +37,42 @@ Optional properties for child nodes:
>       "ide-disk" - LED indicates IDE disk activity (deprecated),
>                    in new implementations use "disk-activity"
>       "timer" - LED flashes at a fixed, configurable rate
> +     "pattern" - LED alters the brightness for the specified duration with one
> +                 software timer (requires "led-pattern" property)
> +
> +- led-pattern : String with default pattern for certain triggers. Each trigger
> +                may parse this string differently:
> +                - one-shot : two numbers specifying delay on and delay off,
> +                - timer : two numbers specifying delay on and delay off,

I misunderstood that these triggers applied to this. Is there any point 
to supporting these modes? Aren't they just a subset or simplification 
of a pattern?

Can we control the timer frequency from DT? The pattern could address 
that limitation.

> +                - pattern : The pattern is given by a series of tuples, of

Don't you need one-shot vs. repeat modes for patterns too?

I could imagine you'd want a pattern for any trigger. 

> +                  brightness and duration (ms).  The LED is expected to traverse
> +                  the series and each brightness value for the specified
> +                  duration.  Duration of 0 means brightness should immediately
> +                  change to new value.
> +
> +                  1. For gradual dimming, the dimming interval now is set as 50
> +                  milliseconds. So the tuple with duration less than dimming
> +                  interval (50ms) is treated as a step change of brightness,
> +                  i.e. the subsequent brightness will be applied without adding
> +                  intervening dimming intervals.
> +
> +                  The gradual dimming format of the software pattern values should be:
> +                  "brightness_1 duration_1 brightness_2 duration_2 brightness_3
> +                  duration_3 ...".
> +                  For example "0 1000 255 2000" will make the LED go gradually
> +                  from zero-intensity to max (255) intensity in 1000
> +                  milliseconds, then back to zero intensity in 2000
> +                  milliseconds.
> +
> +                  2. To make the LED go instantly from one brightness value to
> +                  another, pattern should use zero-time lengths (the brightness
> +                  must be same as the previous tuple's). So the format should be:
> +                  "brightness_1 duration_1 brightness_1 0 brightness_2
> +                  duration_2 brightness_2 0 ...".
> +                  For example "0 1000 0 0 255 2000 255 0" will make the LED
> +                  stay off for one second, then stay at max brightness for two
> +                  seconds.
> +
>  
>  - led-max-microamp : Maximum LED supply current in microamperes. This property
>                       can be made mandatory for the board configurations
> -- 
> 2.7.4
> 
