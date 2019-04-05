From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 12/25] dt-bindings: lm3692x: Add function and color
 properties
Date: Fri, 5 Apr 2019 06:48:12 -0500
Message-ID: <a2c1bee1-cce0-fd1a-bd4a-9b3390dc63e0@ti.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
 <20190331175501.23471-13-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-13-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org
List-Id: linux-leds@vger.kernel.org

Jacek

On 3/31/19 12:54 PM, Jacek Anaszewski wrote:
> Refer to new "function" and "color" properties and mark "label"
> as deprecated.
> 
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> index 08b352840bd7..4c2d923f8758 100644
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
> +#include <dt-bindings/leds/common.h>
> +
>  led-controller@36 {
>  	compatible = "ti,lm3692x";
>  	reg = <0x36>;
> @@ -43,7 +47,8 @@ led-controller@36 {
>  
>  	led@0 {
>  		reg = <0>;
> -		label = "white:backlight_cluster";
> +		function = LED_FUNCTION_BACKLIGHT;
> +		color = <LED_COLOR_ID_WHITE>;
>  		linux,default-trigger = "backlight";
>  	};
>  }
> 

Reviewed-by: Dan Murphy <dmurphy@ti.com>

-- 
------------------
Dan Murphy
