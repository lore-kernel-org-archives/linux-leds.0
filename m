From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/6] dt: bindings: lp8860: Update DT label binding
Date: Thu, 7 Dec 2017 16:45:26 -0600
Message-ID: <20171207224526.5gj5pywp4cvhnpvf@rob-hp-laptop>
References: <20171205204327.12111-1-dmurphy@ti.com>
 <20171205204327.12111-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:34027 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbdLGWp2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Dec 2017 17:45:28 -0500
Content-Disposition: inline
In-Reply-To: <20171205204327.12111-3-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Tue, Dec 05, 2017 at 02:43:23PM -0600, Dan Murphy wrote:
> Update the lp8860 label binding to the LED
> standard as documented in
> 
> Documentation/devicetree/bindings/leds/common.txt
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Added reg to child node and made it required
> 
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> index 1b2fab05ec6a..22b594d95162 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> @@ -9,7 +9,6 @@ Required properties:
>  	- compatible :
>  		"ti,lp8860"
>  	- reg : I2C slave address
> -	- label : Used for naming LEDs
>  	- #address-cells : 1
>  	- #size-cells : 0
>  
> @@ -17,6 +16,12 @@ Optional properties:
>  	- enable-gpios : gpio pin to enable/disable the device.
>  	- supply : "vled" - LED supply
>  
> +Required child properties:
> +	- reg : 0
> +
> +Optional child properties:
> +	- label : see Documentation/devicetree/bindings/leds/common.txt
> +
>  Example:
>  
>  	lp8860@2d {
> @@ -24,9 +29,12 @@ Example:
>  		#address-cells: 1
>  		#size-cells: 0
>  		reg = <0x2d>;
> -		label = "display_cluster";
>  		enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
>  		vled-supply = <&vbatt>;
> +		display_cluster: display_cluster@0 {

led@0 {

Do you really need a (dts) label here?

> +			reg=<0>;

spaces around the '='.

> +			label = "display_cluster";
> +		};
>  	}
>  
>  For more product information please see the link below:
> -- 
> 2.15.0.124.g7668cbc60
> 
