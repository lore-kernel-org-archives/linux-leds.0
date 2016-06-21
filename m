From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] leds: ncp5623: Add device tree binding documentation
Date: Tue, 21 Jun 2016 16:52:18 -0500
Message-ID: <20160621215218.GA12971@rob-hp-laptop>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:34767 "EHLO
	mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbcFUWIl (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 21 Jun 2016 18:08:41 -0400
Content-Disposition: inline
In-Reply-To: <1466494154-3786-2-git-send-email-florian.vaussard@heig-vd.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Vaussard <florian.vaussard@gmail.com>
Cc: devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Vaussard <florian.vaussard@heig-vd.ch>

On Tue, Jun 21, 2016 at 09:29:13AM +0200, Florian Vaussard wrote:
> Add device tree binding documentation for On Semiconductor NCP5623 I2C
> LED driver. The driver can independently control the PWM of the 3
> channels with 32 levels of intensity.
> 
> The current delivered by the current source can be controlled using the
> led-max-microamp property. In order to control this value, it is also
> necessary to know the current on the Iref pin, hence the
> onnn,led-iref-microamp property. It is usually set using an external
> bias resistor, following Iref = Vref/Rbias with Vref=0.6V.
> 
> Signed-off-by: Florian Vaussard <florian.vaussard@heig-vd.ch>
> ---
>  .../devicetree/bindings/leds/leds-ncp5623.txt      | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-ncp5623.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-ncp5623.txt b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
> new file mode 100644
> index 0000000..0dc8345
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-ncp5623.txt
> @@ -0,0 +1,44 @@
> +* ON Semiconductor - NCP5623 3-Channel LED Driver
> +
> +The NCP5623 is a 3-channel I2C LED driver. The brightness of each
> +channel can be independently set using 32 levels. Each LED is represented
> +as a sub-node of the device.
> +
> +Required properties:
> +  - compatible: Should be "onnn,ncp5623"
> +  - reg: I2C slave address (fixed to 0x38)
> +  - #address-cells: must be 1
> +  - #size-cells: must be 0
> +  - onnn,led-iref-microamp: Current on the Iref pin in microampere
> +  - led-max-microamp: Desired maximum current for each LED in microampere
> +                      (maximum 30000uA)
> +
> +LED sub-node properties:
> +  - reg : LED channel number (0..2)
> +  - For other LED properties see:
> +      Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +led1: ncp5623@38 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "onnn,ncp5623";
> +	reg = <0x38>;
> +
> +	led1_r@0 {

Don't use underscores in node names.

> +		label = "ncp:power:red";
> +		reg = <0>;
> +		linux,default-trigger = "default-on";
> +	};
> +
> +	led1_b@1 {
> +		label = "ncp:power:blue";
> +		reg = <1>;
> +	};
> +
> +	led1_g@2 {
> +		label = "ncp:power:green";
> +		reg = <2>;
> +	};
> +};
> -- 
> 2.5.0
> 
