From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 2/2] Bindings documentation for ISSI is31fl319x driver
Date: Tue, 19 Jul 2016 10:52:56 +0200
Message-ID: <578DEA68.4050200@samsung.com>
References: <cover.1468915411.git.hns@goldelico.com>
 <c180cc66afdc0d0b40eb4cecaf15fe319875dcee.1468915412.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <c180cc66afdc0d0b40eb4cecaf15fe319875dcee.1468915412.git.hns@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, drivshin.allworx@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, kernel@pyra-handheld.com, marek@goldelico.com, letux-kernel@openphoenux.org, Andrey Utkin <andrey_utkin@fastmail.com>
List-Id: linux-leds@vger.kernel.org

Hi Nikolaus,

On 07/19/2016 10:03 AM, H. Nikolaus Schaller wrote:
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>   .../devicetree/bindings/leds/is31fl319x.txt        | 56 ++++++++++++++++++++++
>   1 file changed, 56 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/is31fl319x.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/is31fl319x.txt b/Documentation/devicetree/bindings/leds/is31fl319x.txt
> new file mode 100644
> index 0000000..c42c89c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/is31fl319x.txt
> @@ -0,0 +1,56 @@
> +LEDs connected to is31fl319x LED controller chip
> +
> +Required properties:
> +- compatible : Should be any of
> +	"issi,is31fl3190"
> +	"issi,is31fl3191"
> +	"issi,is31fl3193"
> +	"issi,is31fl3196"
> +	"issi,is31fl3199"
> +	"si-en,sn3199".
> +- #address-cells: Must be 1.
> +- #size-cells: Must be 0.
> +- reg: 0x64, 0x65, 0x66, 0x67.
> +
> +Optional properties:
> +- audio-gain-db : audio gain selection for external analog modulation input.
> +	Valid values: 0 - 21, step by 3 (rounded down)
> +	Default: 0
> +
> +Each led is represented as a sub-node of the issi,is31fl319x device.
> +There can be less leds subnodes than the chip can support but not more.
> +
> +Required led sub-node properties:
> +- reg : number of LED line
> +	Valid values: 1 - number of leds supported by the chip variant.
> +
> +Optional led sub-node properties:
> +- label : see Documentation/devicetree/bindings/leds/common.txt.
> +- linux,default-trigger :
> +	see Documentation/devicetree/bindings/leds/common.txt.
> +- led-max-microamp : (optional)
> +	Valid values: 5000 - 40000, step by 5000 (rounded down)
> +	Default: 20000 (20 mA)
> +	Note: a driver will take the lowest of all led limits since the
> +	chip has a single global setting.

I'd mention here that the lowest value will be chosen due to the
PWM specificity, where lower brightness is achieved by reducing
the frequency of pulses and not the current, which will always
have its peak value equal to led-max-microamp.

> +
> +Examples:
> +
> +fancy_leds: leds@65 {
> +	compatible = "issi,is31fl3196";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x65>;
> +
> +	red_aux: led@1 {
> +		label = "red:aux";
> +		reg = <1>;
> +		led-max-microamp = <10000>;
> +	};
> +
> +	green_power: led@5 {
> +		label = "green:power";
> +		reg = <5>;
> +		linux,default-trigger = "default-on";
> +	};
> +};
>


-- 
Best regards,
Jacek Anaszewski
