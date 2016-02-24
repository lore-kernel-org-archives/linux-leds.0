From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH RFC 2/3] DT: leds: Add binding for the ISSI IS31FL32xx
 family of LED drivers
Date: Wed, 24 Feb 2016 17:04:49 +0100
Message-ID: <56CDD4A1.5030802@samsung.com>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
 <1456251445-23970-3-git-send-email-drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:43575 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751750AbcBXQEx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 24 Feb 2016 11:04:53 -0500
In-reply-to: <1456251445-23970-3-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>

Hi David,

Thanks for the patch.

On 02/23/2016 07:17 PM, David Rivshin (Allworx) wrote:
> From: David Rivshin <drivshin@allworx.com>
>
> This adds a binding description for the is31fl3236/35/18/16 I2C LED
> drivers.
>
> Signed-off-by: David Rivshin <drivshin@allworx.com>
> ---
>   .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 51 ++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> new file mode 100644
> index 0000000..0a05a1d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> @@ -0,0 +1,51 @@
> +Binding for ISSI IS31FL32xx LED Drivers
> +
> +The IS31FL32xx family of LED drivers are I2C devices with multiple
> +constant-current channels, each with independent 256-level PWM control.
> +Each LED is represented as a sub-node of the device.
> +
> +Required properties:
> +- compatible: one of
> +	issi,is31fl3236
> +	issi,is31fl3235
> +	issi,is31fl3218
> +	issi,is31fl3216
> +- reg: I2C slave address
> +- address-cells : must be 1
> +- size-cells : must be 0
> +
> +LED sub-node properties:
> +- reg : LED channel number (1..N)
> +- max-brightness : (optional) Maximum brightness possible for the LED.

Please use led-max-microamp instead. You can refer to
Documentation/devicetree/bindings/leds/common.txt for detailed
description.

> +  Default is 255.
> +- label :  (optional)
> +  see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger :  (optional)
> +  see Documentation/devicetree/bindings/leds/common.txt
> +
> +
> +Example:
> +
> +leds: is31fl3236@3c {
> +	compatible = "issi,is31fl3236";
> +	reg = <0x3c>;

You're missing address-cells and size-cells in this example.

> +
> +	led@1 {
> +		reg = <1>;
> +		label = "EB:blue:usr0";
> +		max-brightness = <128>;
> +	};
> +	led@2 {
> +		reg = <2>;
> +		label = "EB:blue:usr1";
> +	};
> +	...
> +	led@36 {
> +		reg = <36>;
> +		label = "EB:blue:usr35";
> +		max-brightness = <255>;
> +	};
> +};
> +
> +For more product information please see the link below:
> +http://www.issi.com/US/product-analog-fxled-driver.shtml
> \ No newline at end of file
>


-- 
Best regards,
Jacek Anaszewski
