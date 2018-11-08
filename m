From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 13/24] dt-bindings: lm36010: Add function and color
 properties
Date: Thu, 8 Nov 2018 12:15:28 -0600
Message-ID: <78afad2e-6b0f-eb2e-fac4-47249b05c540@ti.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-14-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-14-git-send-email-jacek.anaszewski@gmail.com>
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

>  Documentation/devicetree/bindings/leds/leds-lm3601x.txt | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3601x.txt b/Documentation/devicetree/bindings/leds/leds-lm3601x.txt
> index a88b2c4..aaffc68 100644
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
> +#include <dt-bindings/leds/functions.h>
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
> +		color = "white";
>  		led-max-microamp = <376000>;
>  		flash-max-microamp = <1500000>;
>  		flash-max-timeout-us = <1600000>;
> 


-- 
------------------
Dan Murphy
