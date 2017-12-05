From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] dt: bindings: as3645a: Fix the example node
Date: Tue, 5 Dec 2017 14:03:31 -0600
Message-ID: <dfc49b89-b9d3-147f-68e0-a009823f9092@ti.com>
References: <20171205133637.30022-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171205133637.30022-1-dmurphy-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

+Sakari driver maintainer

On 12/05/2017 07:36 AM, Dan Murphy wrote:
> Fix the address-cells and size-cells example node
> to reflect to the correct representation.
> 
> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/leds/ams,as3645a.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/ams,as3645a.txt b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> index fdc40e354a64..8a49ccfec29b 100644
> --- a/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> +++ b/Documentation/devicetree/bindings/leds/ams,as3645a.txt
> @@ -59,8 +59,8 @@ Example
>  =======
>  
>  	as3645a@30 {
> -		#address-cells: 1
> -		#size-cells: 0
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		reg = <0x30>;
>  		compatible = "ams,as3645a";
>  		flash@0 {
> 


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
