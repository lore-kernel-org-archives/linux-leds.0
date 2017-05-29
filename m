From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: leds: document new trigger-sources
 property
Date: Mon, 29 May 2017 21:52:20 +0200
Message-ID: <c12584bf-f0ab-337e-a8e8-e66e88026735@gmail.com>
References: <20170529140142.13496-1-zajec5@gmail.com>
 <20170529140142.13496-2-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34598 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750873AbdE2TxE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 May 2017 15:53:04 -0400
In-Reply-To: <20170529140142.13496-2-zajec5@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

Hi Rafał,

On 05/29/2017 04:01 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Some LEDs can be related to a specific device(s) described in the DT.
> This property allows specifying such relations. E.g. USB LED should
> usually be used to indicate some USB port(s) state.
> 
> Please note this binding is designed to be generic and not influenced by
> any operating system design. Linux developers may find "trigger" part a
> bit confusing since in Linux triggers are separated drivers. It
> shouldn't define the binding though (we shouldn't add an extra level of
> indirection).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Replace "usb-ports" with "led-triggers" property which is more generic and
>     allows specifying other devices as well.
> V3: Use "trigger-sources" which is even more accurate as devices aren't
>     precisely triggers.
> ---
>  Documentation/devicetree/bindings/leds/common.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 24b656014089..e6e300975a4c 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -49,6 +49,19 @@ Optional properties for child nodes:
>  - panic-indicator : This property specifies that the LED should be used,
>  		    if at all possible, as a panic indicator.
>  
> +- trigger-sources : List of devices which should be used as a source triggering
> +		    this LED activity. Some LEDs can be related to a specific
> +		    device and should somehow indicate its state. E.g. USB 2.0
> +		    LED may react to device(s) in a USB 2.0 port(s).
> +		    Another common example is switch or router with multiple
> +		    Ethernet ports each of them having its own LED assigned
> +		    (assuming they are not hardwired). In such cases this
> +		    property should contain phandle(s) of related source
> +		    device(s).
> +		    In many cases LED can be related to more than one device
> +		    (e.g. one USB LED vs. multiple USB ports) so a list of
> +		    sources can be specified.
> +
>  Required properties for flash LED child nodes:
>  - flash-max-microamp : Maximum flash LED supply current in microamperes.
>  - flash-max-timeout-us : Maximum timeout in microseconds after which the flash
> @@ -69,6 +82,11 @@ gpio-leds {
>  		linux,default-trigger = "heartbeat";
>  		gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
>  	};
> +
> +	usb {
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +		led-triggers = <&ohci_port1>, <&ehci_port1>;

Didn't you mean "trigger-sources" here instead?

> +	};
>  };
>  
>  max77693-led {
> 

-- 
Best regards,
Jacek Anaszewski
