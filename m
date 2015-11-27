From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2 3/9] Documentation: dt-bindings: leds: add LM3633 LED
 binding information
Date: Fri, 27 Nov 2015 12:19:14 +0100
Message-ID: <56583C32.5030307@samsung.com>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-4-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:42164 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752475AbbK0LTS (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Nov 2015 06:19:18 -0500
In-reply-to: <1448521025-2796-4-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: robh+dt@kernel.org, lee.jones@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Milo,

On 11/26/2015 07:56 AM, Milo Kim wrote:
> LM3633 LED device is one of TI LMU device list.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Milo Kim <milo.kim@ti.com>
> ---
>   .../devicetree/bindings/leds/leds-lm3633.txt       | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3633.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3633.txt b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
> new file mode 100644
> index 0000000..a553894
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-lm3633.txt
> @@ -0,0 +1,24 @@
> +TI LMU LM3633 LED device tree bindings
> +
> +Required properties:
> +  - compatible: "ti,lm3633-leds"
> +
> +Child nodes:
> +  Each node matches with LED control bank.
> +  Please refer to the datasheet [1].

leds/common.txt documentation says that child nodes represent discrete
LED elements.

> +  Required properties of a child node:
> +  - led-sources: List of enabled channels from 0 to 5.
> +                 Please refer to LED binding [2].

led-sources property should contain always one element -
a control bank identifier that the iout is to be associated with.
For example, if there are three LEDs and they should be controlled
with control bank A, then the bindings should look as follows
(assuming that control bank identifiers start from 0 [A:0, B:1,
C:2, etc. - it has to be also explicitly stated in the documentation]:

lvled1 {
	led-sources = <2>;
	led-max-microamp = <1000>;
}

lvled2 {
	led-sources = <2>;
	led-max-microamp = <29000>;
}

lvled3 {
	led-sources = <2>;
	led-max-microamp = <7000>;
}

The driver should expose singled LED class device for this arrangement.

Since all of these LEDs will be controlled by the common bank, the
lowest led-max-micromp constraint value from the three should be taken
as a base for calculating max_brightness property of the LED class
device. Of course in the sane case all these properties should have
the same values.

If the LEDs are to be connected to separate banks, then DT child nodes
should look e.g. as follows (led-max-microamp values are set
arbitrarily here):

lvled4 {
	led-sources = <6>;
	led-max-microamp = <20000>;
}

lvled5 {
	led-sources = <7>;
	led-max-microamp = <17000>;
}

lvled6 {
	led-sources = <8>;
	led-max-microamp = <11000>;
}

You can of course add label properties to the child nodes.
LED class device name could be composed out of LED names
separated with colon, so here it would be:

lvled4:levled5:lvled6

> +  Optional properties of a child node:
> +  - label: LED channel identification. Please refer to LED binding [2].
> +  - led-max-microamp: Max current setting. Type is <u32>.
> +                      Unit is microampere. Range is from 5000 to 30000.
> +                      Step is 1000. Please refer to LED binding [2].
> +
> +Example: Please refer to ti-lmu dt-bindings [3].
> +
> +[1] http://www.ti.com/product/LM3633/datasheet
> +[2] ../leds/common.txt
> +[2] ../mfd/ti-lmu.txt

Last index should be [3] and all references above should be corrected
accordingly.

-- 
Best Regards,
Jacek Anaszewski
