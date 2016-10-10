From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 08/10] leds: Add binding for Juniper's I2CS FPGA
Date: Mon, 10 Oct 2016 11:41:45 +0200
Message-ID: <36af086b-ffae-8f69-ee32-6a2956822bc6@samsung.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com>
 <CGME20161007152351eucas1p1685ee4ca39b4b8845ae5076a023445d5@eucas1p1.samsung.com>
 <1475853669-22480-9-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-reply-to: <1475853669-22480-9-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Richard Purdie <rpurdie@rpsys.net>, Jean Delvare <jdelvare@suse.com>, Peter Rosin <peda@axentia.se>, Avirup Banerjee <abanerjee@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pantelis,

On 10/07/2016 05:21 PM, Pantelis Antoniou wrote:
> From: Georgi Vlaev <gvlaev@juniper.net>
>
> Document bindings for the I2CS FPGA leds.
>
> Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
> [Ported from Juniper kernel]
> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> ---
>  .../devicetree/bindings/leds/leds-i2cs.txt         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-i2cs.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-i2cs.txt b/Documentation/devicetree/bindings/leds/leds-i2cs.txt
> new file mode 100644
> index 0000000..100e584
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-i2cs.txt
> @@ -0,0 +1,34 @@
> +Juniper I2CS LED driver.
> +
> +This is present in Juniper platforms that use a I2CS Slave FPGA.
> +
> +Required properties:
> +  - compatible: must be "jnx,leds-i2cs"

s/compatible:/compatible :/

Also treat the description as a regular sentence, i.e. begin it
with a capital letter and put a dot at the end.

> +  - #address-cells : must be 1.
> +  - #size-cells : must be 0.

s/must/Must/

> +Each led is represented as a sub-node of the jnx,leds-i2cs device.
> +
> +LED sub-node properties:
> +- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
> +- reg : number of LED
> +- linux,default-trigger : (optional)
> +   see Documentation/devicetree/bindings/leds/common.txt

Driver uses also "hw-blink" property. Please document it here, but
add also a prefix:

jnx,hw-blink

Also "jnx" entry should be added to 
Documentation/devicetree/bindings/vendor-prefixes.txt.

> +Example:
> +
> +leds_fpc0: leds-jnx-i2cs {
> +	compatible = "jnx,leds-i2cs";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	fpc0-fail {
> +		reg = <1>;

It would be good to provide also an example of "label"
property to suggest LED class device name according to
the LED class device naming convention.
See Documentation/leds/leds-class.txt for details.

> +		linux,default-trigger = "fpc0-fail";
> +	};
> +
> +	fpc0-ok {
> +		reg = <2>;
> +		linux,default-trigger = "fpc0-ok";
> +	};
> +};
>


-- 
Best regards,
Jacek Anaszewski
