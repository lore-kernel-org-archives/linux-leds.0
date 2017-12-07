From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/6] dt: bindings: lp8860: Add trigger binding to the
 lp8860
Date: Thu, 7 Dec 2017 16:46:34 -0600
Message-ID: <20171207224634.yzaoi2ml2qdqke66@rob-hp-laptop>
References: <20171205204327.12111-1-dmurphy@ti.com>
 <20171205204327.12111-5-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:42361 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751001AbdLGWqg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 Dec 2017 17:46:36 -0500
Content-Disposition: inline
In-Reply-To: <20171205204327.12111-5-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org

On Tue, Dec 05, 2017 at 02:43:25PM -0600, Dan Murphy wrote:
> Add a default trigger optional node to the child node.
> This will allow the driver to set the trigger for a backlight.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v2 - Moved binding changes to first patch in the series.
> 
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> index 22b594d95162..3452c9c10499 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> @@ -21,6 +21,8 @@ Required child properties:
>  
>  Optional child properties:
>  	- label : see Documentation/devicetree/bindings/leds/common.txt
> +	- linux,default-trigger : (optional)

You already said this is optional.

> +	   see Documentation/devicetree/bindings/leds/common.txt
>  
>  Example:
>  
> @@ -34,6 +36,7 @@ Example:
>  		display_cluster: display_cluster@0 {
>  			reg=<0>;
>  			label = "display_cluster";
> +			linux,default-trigger = "backlight";
>  		};
>  	}
>  
> -- 
> 2.15.0.124.g7668cbc60
> 
