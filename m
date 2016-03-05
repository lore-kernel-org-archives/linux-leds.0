From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/4] DT: leds: Add binding for the ISSI IS31FL32xx family
 of LED controllers
Date: Fri, 4 Mar 2016 22:28:34 -0600
Message-ID: <20160305042834.GT13525@rob-hp-laptop>
References: <1456974095-1867-1-git-send-email-drivshin.allworx@gmail.com>
 <1456974095-1867-3-git-send-email-drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456974095-1867-3-git-send-email-drivshin.allworx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Wed, Mar 02, 2016 at 10:01:33PM -0500, David Rivshin (Allworx) wrote:
> From: David Rivshin <drivshin@allworx.com>
> 
> This adds a binding description for the is31fl3236/35/18/16 I2C LED
> controllers.
> 
> Signed-off-by: David Rivshin <drivshin@allworx.com>
> ---
> 
> Rob,
>  I went with the 1-based 'reg' property here. I inferred that that
> would be your preference based on the previous thread [1]. Let me
> know if that's not the case.
> 
> Changes from RFC:
>  - Removed max-brightness property.
>  - Added #address-cells and #size-cells properties to the example.
> 
> [1] http://www.spinics.net/lists/linux-leds/msg05589.html
> 
>  .../devicetree/bindings/leds/leds-is31fl32xx.txt   | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> new file mode 100644
> index 0000000..539df2e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> @@ -0,0 +1,49 @@
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
> +- label :  (optional)
> +  see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger :  (optional)
> +  see Documentation/devicetree/bindings/leds/common.txt
> +
> +
> +Example:
> +
> +leds: is31fl3236@3c {

Other way around: is31fl3236: leds@3c

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
