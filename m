From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/6] leds: netdev trigger: allow setting initial
 values in device tree
Date: Thu, 28 Mar 2019 11:28:42 -0500
Message-ID: <20190328162842.GA11865@bogus>
References: <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-1-linux@rasmusvillemoes.dk>
 <20190314140619.3309-7-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190314140619.3309-7-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Pavel Machek <pavel@ucw.cz>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Mar 14, 2019 at 03:06:19PM +0100, Rasmus Villemoes wrote:
> It can be quite convenient to initialize a netdev-triggered LED with a
> device name and setting the rx,tx,link properties from device tree,
> instead of having to do that in an init script (or udev rule) in
> userspace.
> 
> My main motivation for this is to be able to switch away from the
> deprecated CONFIG_CAN_LEDS. The example added to common.txt
> corresponds to switching linux,default-trigger = "can0-rxtx" to
> "netdev" and adding the indicated netdev subnode.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  .../devicetree/bindings/leds/common.txt       | 11 +++++++
>  drivers/leds/trigger/ledtrig-netdev.c         | 30 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 7cb88460a47c..f8078c4cf6f8 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -43,6 +43,17 @@ Optional properties for child nodes:
>                  Documentation/ABI/testing/sysfs-class-led-trigger-netdev)
>                  to reflect the state and activity of a net device.
>  
> +                The optional child node netdev can be used to
> +                configure initial values for the link, rx, tx and
> +                device_name properties. For example,
> +
> +                netdev {

I was going to let the use of netdev slide, but now you have it 
twice and that's a Linuxism.

> +                    rx;
> +                    tx;
> +                    link;

What do these mean?

> +                    device-name = "can0";

can0 is a linux thing and doesn't belong in DT.

> +                };

I really don't like this. What's this going to look like if every 
trigger wants to add something like this? What's special about netdev 
leds?

We really need to decouple the Linux LED trigger design from the DT 
bindings. I have no problem associating LEDs with devices in DT, but it 
shouldn't just bring the LED trigger design into the bindings.
