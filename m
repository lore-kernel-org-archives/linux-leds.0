From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/9] Documentation: dt-bindings: regulator: add LM363x
 regulator binding information
Date: Fri, 27 Nov 2015 14:57:42 -0600
Message-ID: <20151127205742.GA20729@rob-hp-laptop>
References: <1448521025-2796-1-git-send-email-milo.kim@ti.com>
 <1448521025-2796-5-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:55792 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754450AbbK0U5r (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Fri, 27 Nov 2015 15:57:47 -0500
Content-Disposition: inline
In-Reply-To: <1448521025-2796-5-git-send-email-milo.kim@ti.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: lee.jones@linaro.org, j.anaszewski@samsung.com, broonie@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Nov 26, 2015 at 03:57:00PM +0900, Milo Kim wrote:
> This binding describes LM3631 and LM3632 regulator properties.
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
>  .../bindings/regulator/lm363x-regulator.txt        | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
> new file mode 100644
> index 0000000..8f14df9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/lm363x-regulator.txt
> @@ -0,0 +1,34 @@
> +TI LMU LM363x regulator device tree bindings
> +
> +LM363x regulator driver supports LM3631 and LM3632.
> +LM3631 has five regulators and LM3632 supports three regulators.
> +
> +Required property:
> +  - compatible: "ti,lm363x-regulator"
> +
> +Optional properties:
> +  LM3632 has external enable pins for two LDOs.
> +  - ti,lcm-en1-gpio: A GPIO specifier for Vpos control pin.
> +  - ti,lcm-en2-gpio: A GPIO specifier for Vneg control pin.

Use "-gpios" please.

> +
> +Child nodes:
> +  LM3631
> +  - vboost
> +  - vcont
> +  - voref
> +  - vpos
> +  - vneg
> +
> +  LM3632
> +  - vboost
> +  - vpos
> +  - vneg
> +
> +  Optional properties of a child node:
> +  Each sub-node should contain the constraints and initialization.
> +  Please refer to [1].

What about the regulator names?

> +
> +Examples: Please refer to ti-lmu dt-bindings [2].
> +
> +[1] ../regulator/regulator.txt
> +[2] ../mfd/ti-lmu.txt
> -- 
> 1.9.1
> 
