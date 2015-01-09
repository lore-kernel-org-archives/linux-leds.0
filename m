From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/2] leds: tlc59116: Document binding for the TI 16
 Channel i2c LED driver
Date: Thu, 8 Jan 2015 17:02:07 -0800
Message-ID: <CAK5ve-+VNn+NBp_fXq1OZY9DbC90_GmPtLfkL22L5tjNX3xtfw@mail.gmail.com>
References: <1420763178-10115-1-git-send-email-andrew@lunn.ch> <1420763178-10115-2-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ig0-f179.google.com ([209.85.213.179]:42358 "EHLO
	mail-ig0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751120AbbAIBC2 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 8 Jan 2015 20:02:28 -0500
In-Reply-To: <1420763178-10115-2-git-send-email-andrew@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux ARM <linux-arm-kernel@lists.infradead.org>, Matthew.Fatheree@belkin.com

On Thu, Jan 8, 2015 at 4:26 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> Document the binding for the TLC59116 LED driver.
>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Cc: Matthew.Fatheree@belkin.com
> ---
>  .../devicetree/bindings/leds/leds-tlc59116.txt     | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-tlc59116.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-tlc59116.txt b/Documentation/devicetree/bindings/leds/leds-tlc59116.txt
> new file mode 100644
> index 000000000000..9526731eda95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-tlc59116.txt
> @@ -0,0 +1,41 @@
> +LEDs connected to tcl59116
> +
> +Required properties
> +- compatible: should be "ti,tlc59116"
> +- #address-cells: must be 1
> +- #size-cells: must be 0
> +- reg: typically 0x68
> +
> +Each led is represented as a sub-node of the ti,,tlc59116.
> +See Documentation/devicetree/bindings/leds/common.txt
> +
> +LED sub-node properties:
> +- reg: number of LED line, 0 to 15
> +- label: (optional) name of LED
> +- linux,default-trigger : (optional)
> +
> +Examples:
> +
> +tlc59116@68 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       #gpio-cells = <2>;

What's gpio-cells for? Or missing document?

> +       compatible = "ti,tlc59116";
> +       reg = <0x68>;
> +
> +       wan@0 {
> +               label = "wrt1900ac:amber:wan";
> +               reg = <0x0>;
> +       };
> +
> +       2g@2 {
> +               label = "wrt1900ac:white:2g";
> +               reg = <0x2>;
> +       };
> +
> +       alive@9 {
> +               label = "wrt1900ac:green:alive";
> +               reg = <0x9>;
> +               linux,default_trigger = "heartbeat";
> +       };
> +};
> --
> 2.1.3
>
