From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: document new usb-ports property
Date: Tue, 3 Jan 2017 14:52:02 -0600
Message-ID: <20170103205202.5ztb5i56d7qmgx5t@rob-hp-laptop>
References: <20161229130306.30400-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161229130306.30400-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Dec 29, 2016 at 02:03:04PM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> Some LEDs can be related to particular USB ports (common case for home
> routers). This property allows describing such a relation.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> This patch is based on top of commit 52e847dc431 ("DT: leds: Improve examples
> by adding some context") sitting in the linux-leds.git (for-4.11).
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 24b6560..fcfe661 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -49,6 +49,14 @@ Optional properties for child nodes:
>  - panic-indicator : This property specifies that the LED should be used,
>  		    if at all possible, as a panic indicator.
>  
> +- usb-ports : List of USB ports related to this LED. Some devices have LEDs that
> +	      should be used to indicate USB device activity. This can be
> +	      described with this property.
> +	      There can be more than one LED like this, e.g. some vendors use
> +	      one controller per USB version. It's then common to use different
> +	      color LEDs depending on device USB standard (like USB 2.0 vs.
> +	      USB 3.0).

I don't like this being USB specific. Either we should have a generic 
way to link triggers to other DT nodes or the existing trigger property 
should be used (and be capable of listing more than 1 port). I'd prefer 
the latter as I don't think we need another way to specify triggers.

> +
>  Required properties for flash LED child nodes:
>  - flash-max-microamp : Maximum flash LED supply current in microamperes.
>  - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
> @@ -69,6 +77,11 @@ gpio-leds {
>  		linux,default-trigger = "heartbeat";
>  		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
>  	};
> +
> +	usb {
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +		usb-ports = <&ohci_port1>, <&ehci_port1>;
> +	};
>  };
>  
>  max77693-led {
> -- 
> 2.10.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
