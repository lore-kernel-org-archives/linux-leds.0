From: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v2 3/4] dt-bindings: backlight: Add led-backlight binding
Date: Mon, 8 Jul 2019 11:50:26 +0100
Message-ID: <20190708105026.jfl4krv2veb7gzow@holly.lan>
References: <20190708102700.23138-1-jjhiblot@ti.com>
 <20190708102700.23138-4-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190708102700.23138-4-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, lee.jones@linaro.org, jingoohan1@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
List-Id: linux-leds@vger.kernel.org

On Mon, Jul 08, 2019 at 12:26:59PM +0200, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> ---
>  .../bindings/leds/backlight/led-backlight.txt | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..4f545316b288
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> @@ -0,0 +1,29 @@
> +led-backlight bindings
> +
> +This binding is used to describe a basic backlight device made of LEDs.
> +It can also be used to describe a backlight device controlled by the output of
> +a LED driver.
> +
> +Required properties:
> +  - compatible: "led-backlight"
> +  - leds: a list of LEDs
> +
> +Optional properties:
> +  - brightness-levels: Array of distinct brightness levels. These
> +                       are in the range from 0 to 255. The actual brightness
> +                       level programmed in each LED will be adjusted based on
> +                       its maximum brightness:
> +                       led brightness = (level * maximum brightness) / 255

8-bits is a narrow range and likely to make animated backlight effects
impossible because the stepping artefacts would be too obvious.

I'd rather see the brightness-levels table expressed in the native
steps of the LEDs in the leds list.

I know this means that the LEDs must have identical ranges but I think
it is OK. A backlight design whose LEDs are connected to non-identical
drivers is either badly broken or sufficiently exotic to need to special
purpose driver. The driver can therefore fail to probe if the LEDs are
mismatched.

> +
> +  - default-brightness-level: The default brightness level (index into the
> +                              array defined by the "brightness-levels" property).

The brightness-levels property is optional... this text needs to be
updated.


Daniel.
