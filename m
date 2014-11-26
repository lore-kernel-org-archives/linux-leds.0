From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Wed, 26 Nov 2014 08:57:55 +0100
Message-ID: <54758803.4080400@samsung.com>
References: <20141120131713.GC27527@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <20141120131713.GC27527@amd>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: sakari.ailus@iki.fi, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

I would change the commit message to:

DT: leds: Add flash led devices related properties

Addition of a LED Flash class extension entails the need for flash led
specific device tree properties. The properties being added are:
max-microamp, flash-max-microamp, flash-timeout-microsec.

After that you can add:

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>


Best Regards,
Jacek Anaszewski


On 11/20/2014 02:17 PM, Pavel Machek wrote:
>
> Add attributes neccessary for LED flashes to
> devicetree/bindings/leds/common.txt .
>
> This will allow me to add device tree support for adp1653 i2c flash
> LED driver, and allow Jacek Anaszewski to add support for more LED
> drivers..
>
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
>
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 2d88816..e9acbbc 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -14,6 +14,15 @@ Optional properties for child nodes:
>        "ide-disk" - LED indicates disk activity
>        "timer" - LED flashes at a fixed, configurable rate
>
> +- max-microamp : maximum intensity in microamperes of the LED
> +  	         (torch LED for flash devices)
> +- flash-max-microamp : maximum intensity in microamperes of the
> +                       flash LED; it is mandatory if the LED should
> +		       support the flash mode
> +- flash-timeout-microsec : timeout in microseconds after which the flash
> +                           LED is turned off
> +
> +
>   Examples:
>
>   system-status {
> @@ -21,3 +30,10 @@ system-status {
>   	linux,default-trigger = "heartbeat";
>   	...
>   };
> +
> +camera-flash {
> +	label = "Flash";
> +	max-microamp = <50000>;
> +	flash-max-microamp = <320000>;
> +	flash-timeout-microsec = <500000>;
> +}
>

