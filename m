From: Rob Herring <robh@kernel.org>
Subject: Re: [patch v2 1/1 - resend] Documentation: dt-bindings: Add Device
 Tree bindings for Mellanox programming devices
Date: Thu, 10 Aug 2017 12:40:13 -0500
Message-ID: <20170810174013.lt3vaqe2oq5lfq2j@rob-hp-laptop>
References: <1501761859-22149-1-git-send-email-vadimp@mellanox.com>
 <1501761859-22149-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33528 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752580AbdHJRkQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Aug 2017 13:40:16 -0400
Content-Disposition: inline
In-Reply-To: <1501761859-22149-2-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, pavel@ucw.cz, j.anaszewski@samsung.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us, jacek.anaszewski@gmail.com

On Thu, Aug 03, 2017 at 12:04:19PM +0000, Vadim Pasternak wrote:
> The mlxreg a multifunction device driver handling LEDs, events, exposing
> through sysfs reset signal, and reset causes info. These components share
> a common register space.

"dt-bindings: mfd: ..." for the subject please.

> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  .../devicetree/bindings/mfd/mellanox,mlxreg-core   | 346 +++++++++++++++++++++
>  1 file changed, 346 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> new file mode 100644
> index 0000000..a90933e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> @@ -0,0 +1,346 @@
> +Mellanox programmable device control.
> +-------------------------------------
> +This binding defines the device control interface over I2C bus for Mellanox BMC
> +based switches.
> +
> +Required properties:
> +- compatible = "mellanox,mlxreg-i2c",
> +	       "mellanox,mlxreg-i2c-16",
> +	       "mellanox,mlxreg-core";

This is all one compatible entry? Why 3 compatibles?

> +- #address-cells : must be 1;
> +- #size-cells : must be 0;
> +- reg : I2C address;
> +
> +Optional properties:
> +- interrupt-parent : phandle of parent interrupt controller;
> +- interrupts : interrupt line;
> +- deferred - I2C deferred bus phandle;
> +	     For example, for the case when device attached to I2C bus number 4
> +	     performs dynamic attachment of device to bus 12 upon some event.
> +	     Due to this reason bus 4 is enforced to be activated after bus 12;

I don't understand...

> +- cell - top aggregation register offset;
> +- mask - top aggregation register mask;
> +- psu - power supply unit nodes:

This section is "Optional Properties" and this is a sub-node. Each 
subnode should have its own section.

> +	- aggr_mask - effective bit in aggregation mask;

Don't use '_' in node or property names.

> +	- reg - register offset for all group members;
> +	- mask - register mask;
> +	- phandles - list of relevant device nodes;

Other than reg, I don't understand what any of these are.

>From what I can tell you are describing things down to register bit 
level which generally is too much detail in DT. How many variations of 
h/w do you have? Do you really need to be able to define any possible 
combination or have some finite set?

Rob
