From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v8 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Fri, 08 May 2015 10:33:31 +0200
Message-ID: <554C74DB.5060503@samsung.com>
References: <1431054225-16635-1-git-send-email-ingi2.kim@samsung.com>
 <1431054225-16635-3-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1431054225-16635-3-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, sakari.ailus@iki.fi, varkabhadram@gmail.com, joe@perches.com, sw0312.kim@samsung.com, cw00.choi@samsung.com, jh80.chung@samsung.com, ideal.song@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Ingi,

On 05/08/2015 05:03 AM, Ingi Kim wrote:
> This patch adds the device tree bindings for ktd2692 flash LEDs.
> Add Optional properties of child node for Flash LED
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> Acked-by: Seung-Woo Kim <sw0312.kim@samsung.com>
> Reviewed-by: Varka Bhadram <varkabhadram@gmail.com>
> ---
>   .../devicetree/bindings/leds/leds-ktd2692.txt      | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
> new file mode 100644
> index 0000000..cf45492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
> @@ -0,0 +1,50 @@
> +* Kinetic Technologies - KTD2692 Flash LED Driver
> +
> +KTD2692 is the ideal power solution for high-power flash LEDs.
> +It uses ExpressWire single-wire programming for maximum flexibility.
> +
> +The ExpressWire interface through CTRL pin can control LED on/off and
> +enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode current,
> +Flash timeout, LVP(low voltage protection).
> +
> +Also, When the AUX pin is pulled high while CTRL pin is high,
> +LED current will be ramped up to the flash-mode current level.
> +
> +Required properties:
> +- compatible: "kinetic,ktd2692"

How about:

compatible : Should be "kinetic,ktd2692".

Pleas put space between the property name and a colon consequently.

> +- ctrl-gpio : gpio pin in order control CTRL pin
> +- aux-gpio : gpio pin in order control AUX pin

Documentation/devicetree/bindings/gpio/gpio.txt states:

"GPIO properties should be named "[<name>-]gpios".

Please adhere to this. Also please begin description after colon
with a capital letter and put a dot at the end of sentence, e.g.:

ctrl-gpios : Specifier of the GPIO connected to CTRL pin.
aux-gpio : Specifier of the GPIO connected to AUX pin.

> +Optional properties:
> +- vin-supply : "vin" LED supply (2.7V to 5.5V)
> +  See Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +A discrete LED element connected to the device must be represented by a child
> +node - see Documentation/devicetree/bindings/leds/common.txt.
> +
> +Required properties for flash LED child nodes:
> +  See Documentation/devicetree/bindings/leds/common.txt
> +- led-max-microamp : Minimum Threshold for Timer protection
> +  is defined internally (Maximum 300mA)
> +- flash-max-microamp : Flash LED maximum current
> +  Formula : I(mA) = 15000 / Rset
> +- flash-max-timeout-us : Flash LED maximum timeout
> +
> +Optional properties for flash LED child nodes:
> +- label : see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +ktd2692 {
> +	compatible = "kinetic,ktd2692";
> +	ctrl-gpio = <&gpc0 1 0>;
> +	aux-gpio = <&gpc0 2 0>;

ctrl-gpios = <&gpc0 1 0>;
aux-gpios = <&gpc0 2 0>;

> +	vin-supply = <&vbat>;
> +
> +	flash-led {
> +		label = "ktd2692-flash";
> +		led-max-microamp = <300000>;
> +		flash-max-microamp = <1500000>;
> +		flash-max-timeout-us = <1835000>;
> +	};
> +};
>


-- 
Best Regards,
Jacek Anaszewski
