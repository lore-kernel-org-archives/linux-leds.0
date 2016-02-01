From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/3] DT: add binding for SN3218 LED driver
Date: Mon, 01 Feb 2016 10:59:42 +0100
Message-ID: <56AF2C8E.7030702@samsung.com>
References: <1454245156-15747-1-git-send-email-stefan.wahren@i2se.com>
 <1454245156-15747-3-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1454245156-15747-3-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 01/31/2016 01:59 PM, Stefan Wahren wrote:
> This patch adds the binding for Si-En Technology SN3218
> 18-Channel LED driver.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/leds/leds-sn3218.txt       |   42 ++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-sn3218.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-sn3218.txt b/Documentation/devicetree/bindings/leds/leds-sn3218.txt
> new file mode 100644
> index 0000000..5daa9b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-sn3218.txt
> @@ -0,0 +1,42 @@
> +* Si-En Technology - SN3218 18-Channel LED Driver
> +
> +Required properties:
> +- compatible :
> +	"si-en,sn3218"
> +- address-cells : must be 1
> +- size-cells : must be 0
> +- reg : I2C slave address, typically 0x54
> +
> +There must be at least 1 LED which is represented as a sub-node
> +of the sn3218 device.
> +
> +LED sub-node properties:
> +- label : (optional) see Documentation/devicetree/bindings/leds/common.txt
> +- reg : number of LED line (could be from 0 to 17)
> +- linux,default-trigger : (optional)
> +   see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +sn3218: led-controller@54 {
> +	compatible = "si-en,sn3218";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x54>;
> +
> +	led@0 {
> +		label = "led1";
> +		reg = <0x0>;
> +	};
> +
> +	led@1 {
> +		label = "led2";
> +		reg = <0x1>;
> +	};
> +
> +	led@2 {
> +		label = "led3";
> +		reg = <0x2>;
> +	};
> +};
> +

Please remove this empty line.

-- 
Best Regards,
Jacek Anaszewski
