From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v7 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Tue, 5 Dec 2017 07:43:49 -0600
Message-ID: <c3b98113-9976-c264-fa8b-f48a44f01335@ti.com>
References: <20171204184107.682-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from fllnx209.ext.ti.com ([198.47.19.16]:13879 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752151AbdLENpR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Dec 2017 08:45:17 -0500
In-Reply-To: <20171204184107.682-1-dmurphy@ti.com>
Content-Language: en-US
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On 12/04/2017 12:41 PM, Dan Murphy wrote:
> This adds the devicetree bindings for the LM3692x
> I2C LED string driver.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v7 - No changes - https://patchwork.kernel.org/patch/10087475/
> v6 - No changes -https://patchwork.kernel.org/patch/10085567/
> v5 - No Changes - https://patchwork.kernel.org/patch/10081071/
> v4 - Fix example node, added trigger entry, removed ambiguous x for compatible and
> added common.txt pointer for label - https://patchwork.kernel.org/patch/10060107
> v3 - No changes
> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
> 
>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> new file mode 100644
> index 000000000000..c259cde2226f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -0,0 +1,39 @@
> +* Texas Instruments - LM3692x Highly Efficient White LED Driver
> +
> +The LM3692x is an ultra-compact, highly efficient,
> +white-LED driver designed for LCD display backlighting.
> +
> +The main difference between the LM36922 and LM36923 is the number of
> +LED strings it supports.  The LM36922 supports two strings while the LM36923
> +supports three strings.
> +
> +Required properties:
> +	- compatible:
> +		"ti,lm36922"
> +		"ti,lm36923"
> +	- reg :  I2C slave address
> +
> +Optional properties:
> +	- label : see Documentation/devicetree/bindings/leds/common.txt
> +	- enable-gpios : gpio pin to enable/disable the device.
> +	- vled-supply : LED supply
> +	- linux,default-trigger : (optional)
> +	   see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +lm3692x@36 {
> +	compatible = "ti,lm3692x";
> +	reg = <0x36>;
> +

address-cells and size-cells are missing.

> +	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> +	vled-supply = <&vbatt>;
> +
> +	backlight: backlight@0 {

Child needs to have reg property.

> +		label = "backlight_cluster";
> +		linux,default-trigger = "backlight";
> +	};
> +}
> +
> +For more product information please see the link below:
> +http://www.ti.com/lit/ds/snvsa29/snvsa29.pdf
> 

Dan

-- 
------------------
Dan Murphy
