From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: leds: document new led-triggers
 property
Date: Fri, 20 Jan 2017 23:35:20 +0100
Message-ID: <29f27028-20f3-3eb9-502f-1b51958640f9@gmail.com>
References: <20170120215605.15728-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35183 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751774AbdATWhA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 20 Jan 2017 17:37:00 -0500
In-Reply-To: <20170120215605.15728-1-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

Hi Rafał,

On 01/20/2017 10:56 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Some LEDs can be related to particular devices described in DT. This
> property allows specifying such relations. E.g. USB LED should usually
> be used to indicate some USB port(s) state.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Replace "usb-ports" with "led-triggers" property which is more generic and
>     allows specifying other devices as well.
> 
> When bindings patch is related to some followup implementation, they usually go
> through the same tree.
> 
> Greg: this patch is based on top of e64b8cc72bf9 ("DT: leds: Improve examples by
> adding some context") from kernel/git/j.anaszewski/linux-leds.git . Is there any
> way to solve this dependency issue? Or should this patch wait until 3.11 is
> released?
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 24b656014089..17632a041196 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -49,6 +49,17 @@ Optional properties for child nodes:
>  - panic-indicator : This property specifies that the LED should be used,
>  		    if at all possible, as a panic indicator.
>  
> +- led-triggers : List of devices that should trigger this LED activity. Some
> +		 LEDs can be related to a specific device and should somehow
> +		 indicate its state. E.g. USB 2.0 LED may react to device(s) in
> +		 a USB 2.0 port(s). Another common example is switch or router
> +		 with multiple Ethernet ports each of them having its own LED
> +		 assigned (assuminled-trigger-usbportg they are not hardwired).
> +		 In such cases this property should contain phandle(s) of
> +		 related device(s). In many cases LED can be related to more
> +		 than one device (e.g. one USB LED vs. multiple USB ports) so a
> +		 list of entries can be specified.
> +

This implies that it is possible to define multiple triggers for
a LED class device but it is not supported by LED Trigger core.
There is linux,default-trigger property which allows to define one
trigger that will be initially assigned.

I am aware that this is renamed usb-ports property from v1,
that attempts to address Rob's comment, but we can't do that this way.
Maybe usb-ports property could be documented in led-trigger-usbport's
specific bindings and a reference to it could be added next to the
related entry on the list of the available LED triggers (which is
actually missing) in Documentation/devicetree/bindings/leds/common.txt.

>  Required properties for flash LED child nodes:
>  - flash-max-microamp : Maximum flash LED supply current in microamperes.
>  - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
> @@ -69,6 +80,11 @@ gpio-leds {
>  		linux,default-trigger = "heartbeat";
>  		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
>  	};
> +
> +	usb {
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +		led-triggers = <&ohci_port1>, <&ehci_port1>;
> +	};
>  };
>  
>  max77693-led {
> 

-- 
Best regards,
Jacek Anaszewski
