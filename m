From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
Date: Tue, 28 Feb 2017 22:38:41 +0100
Message-ID: <a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170228120452.10043-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Hi Rafał,

Thanks for continuing this effort.

I think that it would be simpler if we could initially see
a complete sample dts implementation containing all required DT
nodes. The example could contain timer trigger as well as usb-port
trigger specific bindings.

I suppose that we should see DT nodes containing #list-cells
properties that define the quantity of phandle arguments.

It seems that this approach allows for defining a list of elements
with variable number of arguments, i.e. what you were initially
asking for.


Best regards,
Jacek Anaszewski

On 02/28/2017 01:04 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> There was a long discussion on describing LED trigger sources in DT.
> Few solutions were posted but neither was clear & flexible enough. It's
> really hard to design DT bindings for a LED node that will allow
> describing any kinds of triggers.
> 
> Finally Jacek suggested a different design. It involved using separated
> DT node for each trigger.
> 
> This documentation follows that idea. It really simplifies DT bindings
> and allows clear support for different trigger types. With this solution
> every type can have its own specific properties.
> 
> Please note an example will be added later with the first supported
> trigger bindings. The point is to have nodes like:
> foo-trigger {
> 	trigger-type = "foo";
> 	...
> };
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/leds/common.txt   |  3 +++
>  Documentation/devicetree/bindings/leds/triggers.txt | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/triggers.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 696be5792625..0bc91556a47a 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -49,6 +49,9 @@ Optional properties for child nodes:
>  - panic-indicator : This property specifies that the LED should be used,
>  		    if at all possible, as a panic indicator.
>  
> +- triggers : List of nodes of triggers that should control this LED state. For
> +	     more details see triggers.txt.
> +
>  Required properties for flash LED child nodes:
>  - flash-max-microamp : Maximum flash LED supply current in microamperes.
>  - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
> diff --git a/Documentation/devicetree/bindings/leds/triggers.txt b/Documentation/devicetree/bindings/leds/triggers.txt
> new file mode 100644
> index 000000000000..a1fbf3a75d67
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/triggers.txt
> @@ -0,0 +1,13 @@
> +Common trigger properties.
> +
> +Triggers describe the way LEDs should be controlled, e.g. under what conditions
> +they should be turned on or off. Depending on a trigger type various events can
> +be used to determine a LED state. Some triggers can be hardware independent
> +(e.g. time based), some can react to a specific hardware events.
> +
> +Common properties:
> +- trigger-type : Type of a trigger. Choosing a trigger determines what kind of
> +		 events will be used to control LED. See specific trigger
> +		 documentation for more details.
> +
> +More properties can be available depending on the chosen trigger type.
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
