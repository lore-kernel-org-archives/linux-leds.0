From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] dt: lm3532: Add lm3532 dt doc and update ti_lmu
 doc
Date: Fri, 15 Mar 2019 18:35:01 -0500
Message-ID: <20190315233501.GA26767@bogus>
References: <20190313123249.17258-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313123249.17258-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, tony@atomide.com, lee.jones@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, Mar 13, 2019 at 07:32:46AM -0500, Dan Murphy wrote:
> Add the lm3532 device tree documentation.
> Remove lm3532 device tree reference from the ti_lmu devicetree
> documentation.
> 
> With the addition of the dedicated lm3532 documentation the device
> can be removed from the ti_lmu.txt.
> 
> The reason for this is that the lm3532 dt documentation now defines
> the ability to control LED output strings against different control
> banks or groups multiple strings to be controlled by a single control
> bank.
> 
> Another addition was for ALS lighting control and configuration.  The
> LM3532 has a feature that can take in the ALS reading from 2 separate
> ALS devices and adjust the brightness on the strings that are configured
> to support this feature.
> 
> Finally the device specific properties were moved to the parent node as these
> properties are not control bank configurable.  These include the runtime ramp
> and the ALS configuration.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v4 - Appended "ti," to TI specific properties, add enable gpio documentation,
> removed an example, moved ramp to optional parent properties - https://lore.kernel.org/patchwork/patch/1050122/
> 
> v3 - No changes - https://lore.kernel.org/patchwork/patch/1049026/
> v2 - Fixed ramp-up and ramp-down properties, removed hard coded property values,
> added ranges for variable properties, I did not change the label - https://lore.kernel.org/patchwork/patch/1048805/
> 
> 
>  .../devicetree/bindings/leds/leds-lm3532.txt  | 101 ++++++++++++++++++
>  .../devicetree/bindings/mfd/ti-lmu.txt        |  20 ----
>  2 files changed, 101 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3532.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3532.txt b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
> new file mode 100644
> index 000000000000..ba793ef9b3b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3532.txt
> @@ -0,0 +1,101 @@
> +* Texas Instruments - lm3532 White LED driver with ambient light sensing
> +capability.
> +
> +The LM3532 provides the 3 high-voltage, low-side current sinks. The device is
> +programmable over an I2C-compatible interface and has independent
> +current control for all three channels. The adaptive current regulation
> +method allows for different LED currents in each current sink thus allowing
> +for a wide variety of backlight and keypad applications.
> +
> +The main features of the LM3532 include dual ambient light sensor inputs
> +each with 32 internal voltage setting resistors, 8-bit logarithmic and linear
> +brightness control, dual external PWM brightness control inputs, and up to
> +1000:1 dimming ratio with programmable fade in and fade out settings.
> +
> +Required properties:
> +	- compatible : "ti,lm3532"
> +	- reg : I2C slave address
> +	- #address-cells : 1
> +	- #size-cells : 0
> +
> +Optional properties:
> +	- enable-gpios : gpio pin to enable (active high)/disable the device.
> +	Range for ramp settings: 8us - 65536us

This should be after the 2 ramp properties.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
 
> +	- ramp-up-us - The Run time ramp rates/step are from one current
> +		       set-point to another after the device has reached its
> +		       initial target set point from turn-on
> +	- ramp-down-us - The Run time ramp rates/step are from one current
> +			 set-point to another after the device has reached its
> +			 initial target set point from turn-on
