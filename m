From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] leds: rt5033: add DT binding for RT5033
Date: Fri, 2 Oct 2015 09:31:58 -0500
Message-ID: <CAL_JsqL13SC132eGRrUmrH4LTD61ZtNshFibSWLC8OEP+4zoQA@mail.gmail.com>
References: <1443778875-18261-1-git-send-email-ingi2.kim@samsung.com> <1443778875-18261-2-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443778875-18261-2-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Fri, Oct 2, 2015 at 4:41 AM, Ingi Kim <ingi2.kim@samsung.com> wrote:
> This patch adds the device tree bindings for RT5033 flash LEDs.
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>

Acked-by: Rob Herring <robh@kernel.org>

> ---
>  .../devicetree/bindings/leds/leds-rt5033.txt       | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-rt5033.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-rt5033.txt b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
> new file mode 100644
> index 0000000..2ef7bdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-rt5033.txt
> @@ -0,0 +1,38 @@
> +* Richtek Technology Corporation - RT5033 Flash LED Driver
> +
> +The RT5033 Flash LED Circuit is designed for one or two LEDs driving
> +for torch and strobe applications, it provides an I2C software command
> +to trigger the torch and strobe operation.
> +
> +Required properties:
> +- compatible : Must be "richtek,rt5033-led".
> +
> +A discrete LED element connected to the device must be represented by a child
> +node - see Documentation/devicetree/bindings/leds/common.txt.
> +
> +Required properties of the LED child node:
> +  See Documentation/devicetree/bindings/leds/common.txt
> +- led-max-microamp : Minimum Threshold for Timer protection
> +  is defined internally (Maximum 200mA).
> +- flash-max-microamp : Flash LED maximum current
> +- flash-max-timeout-us : Flash LED maximum timeout
> +
> +Optional properties of the LED child node:
> +- label : see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +rt5033 {
> +       compatible = "richtek,rt5033";
> +
> +       led {
> +               compatible = "richtek,rt5033-led";
> +
> +               flash-led {
> +                       label = "rt5033-flash";
> +                       led-max-microamp = <200000>;
> +                       flash-max-microamp = <800000>;
> +                       flash-max-timeout-us = <1216000>;
> +               };
> +       };
> +}
> --
> 2.0.5
>
