From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/4] dt: bindings: lm3692x: Update binding for LED sync
 control
Date: Mon, 16 Jul 2018 15:08:45 -0600
Message-ID: <20180716210845.GA26337@rob-hp-laptop>
References: <20180702181216.19660-1-dmurphy@ti.com>
 <20180702181216.19660-3-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180702181216.19660-3-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: mark.rutland@arm.com, jacek.anaszewski@gmail.com, andy.shevchenko@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, Jul 02, 2018 at 01:12:15PM -0500, Dan Murphy wrote:
> Update the binding to be able to configure the LED
> sync to turn on.

s/sync/sink/ ? As in a current sink.

> 
> The LM36922 has one output but can sync current to 2 LED
> strings.  The user may only use one sync so the other
> syncs need to be disabled.
> 
> The LM36923 has 3 LED syncs.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> index 6c9074f84a51..08b352840bd7 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> @@ -20,7 +20,10 @@ Optional properties:
>  	- vled-supply : LED supply
>  
>  Required child properties:
> -	- reg : 0
> +	- reg : 0 - Will enable all LED sync paths
> +		1 - Will enable the LED1 sync
> +		2 - Will enable the LED2 sync
> +		3 - Will enable the LED3 sync (LM36923 only)
>  
>  Optional child properties:
>  	- label : see Documentation/devicetree/bindings/leds/common.txt
> -- 
> 2.17.0.582.gccdcbd54c
> 
