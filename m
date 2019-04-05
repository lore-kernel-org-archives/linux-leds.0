From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 10/25] dt-bindings: lp8860: Add function and color
 properties
Date: Fri, 5 Apr 2019 06:47:56 -0500
Message-ID: <ed50b431-eaec-0470-649b-4fc50801a075@ti.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
 <20190331175501.23471-11-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-11-jacek.anaszewski@gmail.com>
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
>  Documentation/devicetree/bindings/leds/leds-lp8860.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp8860.txt b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> index 5f0e892ad759..9863220db4ba 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp8860.txt
> @@ -20,12 +20,16 @@ Required child properties:
>  	- reg : 0
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
>  led-controller@2d {
>  	compatible = "ti,lp8860";
>  	#address-cells = <1>;
> @@ -36,7 +40,8 @@ led-controller@2d {
>  
>  	led@0 {
>  		reg = <0>;
> -		label = "white:backlight";
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
