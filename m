From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Sat, 18 Nov 2017 15:19:00 +0100
Message-ID: <c8ab9939-9da7-6e66-af0c-56e8da494110@gmail.com>
References: <20171115194203.13572-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40634 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761288AbdKROUA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 18 Nov 2017 09:20:00 -0500
In-Reply-To: <20171115194203.13572-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

Hi Dan,

On 11/15/2017 08:42 PM, Dan Murphy wrote:
> This adds the devicetree bindings for the LM3692x
> I2C LED string driver.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v3 - No changes
> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
> 
>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> new file mode 100644
> index 000000000000..cfef67bd4100
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -0,0 +1,28 @@
> +* Texas Instruments - LM3692x Highly Efficient Dual-String White LED Driver
> +
> +The LM36922 is an ultra-compact, highly efficient,
> +two string white-LED driver designed for LCD display
> +backlighting.
> +
> +Required properties:
> +	- compatible:
> +		"ti,lm3692x"
> +	- reg -  I2C slave address
> +
> +Optional properties:
> +	- label - Used for naming LEDs
> +	- enable-gpio - gpio pin to enable/disable the device.
> +	- supply - "vled" - LED supply
> +
> +Example:
> +
> +leds: leds@6 {
> +	compatible = "ti,lm3692x";
> +	reg = <0x36>;
> +	label = "backlight_cluster";

Documentation/devicetree/bindings/leds/common.txt states that
each LED component has to be represented as a child node
(for consistency it should apply also to the arrangements with one
LED).

> +	enable-gpio = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	vled-supply = <&vbatt>;
> +}
> +
> +For more product information please see the link below:
> +http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> 

-- 
Best regards,
Jacek Anaszewski
