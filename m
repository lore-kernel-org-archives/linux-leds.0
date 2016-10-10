From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 10/10] hwmon: i2cs-fan: Add hwmon dts binding
 documentation
Date: Mon, 10 Oct 2016 15:29:03 -0500
Message-ID: <20161010202903.GA9122@rob-hp-laptop>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1475853669-22480-11-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1475853669-22480-11-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 07, 2016 at 06:21:09PM +0300, Pantelis Antoniou wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Adds the I2CS Fan Tray hwmon device tree node documentation.
> 
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  Documentation/devicetree/bindings/hwmon/i2cs-fan.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt b/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
> new file mode 100644
> index 0000000..4ef880c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/i2cs-fan.txt
> @@ -0,0 +1,19 @@
> +Hwmon driver for Juniper fan trays on I2CS Slave FPGA

This is a h/w description, not a driver.

> +
> +Required properties:
> +
> +- compatible: "i2cs-fan-hwmon"

I doubt any fan control h/w has "hwmon" in the name.

> +
> +Optional properties:
> +
> +- num-fans: fans per tray (default 14)
> +
> +- tach-factor: TACH count scaling factor (default 120)

vendor prefixes needed.

> +
> +Example:
> +
> +fan-hwmon {
> +	compatible = "jnx,i2cs-fan-hwmon";
> +	num-fans = <6>;
> +	tach-factor = <33>;
> +};
> -- 
> 1.9.1
> 
