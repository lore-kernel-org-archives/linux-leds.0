From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 04/10] i2c: i2c-mux-i2cs: Add device tree bindings
Date: Mon, 10 Oct 2016 17:48:51 +0200
Message-ID: <83dc46b5-9c37-2813-0eca-267250e7cf2e@axentia.se>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1475853669-22480-5-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1475853669-22480-5-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Jean Delvare <jdelvare@suse.com>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 2016-10-07 17:21, Pantelis Antoniou wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
> 
> Add binding document for the i2c mux driver of Juniper's I2CS FPGA.
> 
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  .../devicetree/bindings/i2c/jnx,i2c-mux-i2cs.txt   | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/jnx,i2c-mux-i2cs.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/jnx,i2c-mux-i2cs.txt b/Documentation/devicetree/bindings/i2c/jnx,i2c-mux-i2cs.txt
> new file mode 100644
> index 0000000..03d917f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/jnx,i2c-mux-i2cs.txt
> @@ -0,0 +1,27 @@
> +* Juniper I2C Mux on I2CS
> +
> +	I2C mux driver for switching the RE access to the FPC i2c bus.
> +	Compatible with the FPC variant of the I2CS.
> +
> +Required properties:
> +
> +  - compatible: "jnx,i2cs-mux-i2cs".

jnx,i2c-mux-i2cs

> +
> +The following required properties are defined externally:
> +
> +  - Standard I2C mux properties. See i2c-mux.txt in this directory.

To accommodate changes pending for 4.9, change "mux" to "gate" in
this line...

> +  - I2C child bus nodes. See i2c-mux.txt in this directory.

This line is wrong since the child nodes themselves are optional in
i2c-gate.txt (and i2c-mux.txt). I guess you can just drop it since
the child nodes are mentioned in i2c-gate.txt (and i2c-mux.txt).

> +
> +Example:
> +
> +fpc0_mux {
> +	compatible = "jnx,i2c-mux-i2cs";
> +	#address-cells = <1>;
> +	#size-cells = <0>;

...drop these two...

> +
> +	fpc0i2c0: i2c@0 {

...change i2c@0 to i2c-gate...

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;

...and drop reg.

Cheers,
Peter

> +	};
> +};
> 

