From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 14/25] dt-bindings: lm36010: Add function and color
 properties
Date: Fri, 5 Apr 2019 06:48:44 -0500
Message-ID: <adf1f4fe-6a23-4244-db71-b5c3dbcf9615@ti.com>
References: <20190331175501.23471-1-jacek.anaszewski@gmail.com>
 <20190331175501.23471-15-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190331175501.23471-15-jacek.anaszewski@gmail.com>
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
>  Documentation/devicetree/bindings/leds/leds-lm3601x.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
> index a88b2c41e75b..095dafb6ec7f 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
> @@ -22,9 +22,14 @@ Required properties for flash LED child nodes:
>  	- led-max-microamp : Range from 2.4mA - 376mA
>  
>  Optional child properties:
> -	- label : see Documentation/devicetree/bindings/leds/common.txt
> +	- function : see Documentation/devicetree/bindings/leds/common.txt
> +	- color : see Documentation/devicetree/bindings/leds/common.txt
> +	- label : see Documentation/devicetree/bindings/leds/common.txt (deprecated)
>  
>  Example:
> +
> +#include <dt-bindings/leds/common.h>
> +
>  led-controller@64 {
>  	compatible = "ti,lm36010";
>  	#address-cells = <1>;
> @@ -33,7 +38,8 @@ led-controller@64 {
>  
>  	led@0 {
>  		reg = <1>;
> -		label = "white:torch";
> +		function = LED_FUNCTION_TORCH;
> +		color = <LED_COLOR_ID_WHITE>;
>  		led-max-microamp = <376000>;
>  		flash-max-microamp = <1500000>;
>  		flash-max-timeout-us = <1600000>;
> 

Reviewed-by: Dan Murphy <dmurphy@ti.com>

-- 
------------------
Dan Murphy
