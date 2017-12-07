From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/6] dt: bindings: lp8860: Update bindings for lp8860
Date: Thu, 7 Dec 2017 16:43:47 -0600
Message-ID: <20171207224347.hrqwygbm2xb7lzbs@rob-hp-laptop>
References: <20171205204327.12111-1-dmurphy@ti.com>
 <20171205204327.12111-2-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:45949 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750931AbdLGWns (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Dec 2017 17:43:48 -0500
Content-Disposition: inline
In-Reply-To: <20171205204327.12111-2-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Tue, Dec 05, 2017 at 02:43:22PM -0600, Dan Murphy wrote:
> Update the lp8860 bindings to fix various issues
> found.  Add address-cells and size-cells, rename
> enable-gpio to enable-gpios, update the node name
> to the device name and indent the node example.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - New patch
> 
>  .../devicetree/bindings/leds/leds-lp8860.txt       | 28 ++++++++++++----------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> index aad38dd94d4b..1b2fab05ec6a 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> @@ -6,24 +6,28 @@ current sinks that can be controlled by a PWM input
>  signal, a SPI/I2C master, or both.
>  
>  Required properties:
> -	- compatible:
> +	- compatible :
>  		"ti,lp8860"
> -	- reg -  I2C slave address
> -	- label - Used for naming LEDs
> +	- reg : I2C slave address
> +	- label : Used for naming LEDs
> +	- #address-cells : 1
> +	- #size-cells : 0

This should be added in the next patch when you have child nodes.

Rob
