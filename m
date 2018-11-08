From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 11/24] dt-bindings: lm3692x: Add function and color
 properties
Date: Thu, 8 Nov 2018 12:12:47 -0600
Message-ID: <7924d38c-bdde-6c1e-d79c-fa1a9d13ed8b@ti.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-12-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-12-git-send-email-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org
List-Id: linux-leds@vger.kernel.org

On 11/06/2018 04:07 PM, Jacek Anaszewski wrote:
> Refer to new "function" and "color" properties and mark "label"
> as deprecated.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Dan Murphy <dmurphy@ti.com>
> ---

Acked-by: Dan Murphy <dmurphy@ti.com>

>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> index 08b3528..62c8fe5 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -26,12 +26,16 @@ Required child properties:
>  		3 - Will enable the LED3 sync (LM36923 only)
>  
>  Optional child properties:
> -	- label : see Documentation/devicetree/bindings/leds/common.txt
> +	- function : see Documentation/devicetree/bindings/leds/common.txt
> +	- color : see Documentation/devicetree/bindings/leds/common.txt
> +	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
>  	- linux,default-trigger :
>  	   see Documentation/devicetree/bindings/leds/common.txt
>  
>  Example:
>  
> +#include <dt-bindings/leds/functions.h>
> +
>  led-controller@36 {
>  	compatible = "ti,lm3692x";
>  	reg = <0x36>;
> @@ -43,7 +47,8 @@ led-controller@36 {
>  
>  	led@0 {
>  		reg = <0>;
> -		label = "white:backlight_cluster";
> +		function = LED_BACKLIGHT_CLUSTER;
> +		color = "white";
>  		linux,default-trigger = "backlight";
>  	};
>  }
> 


-- 
------------------
Dan Murphy
