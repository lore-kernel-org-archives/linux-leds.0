From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH v3 2/3] leds: ktd2692: add device tree bindings for ktd2692
Date: Fri, 20 Mar 2015 10:49:51 -0500
Message-ID: <CAL_Jsq+q6Dzqj5NTM4xwSp013-fZdSdPxBKbju1f6cSURExA0Q@mail.gmail.com>
References: <1426829466-13559-1-git-send-email-ingi2.kim@samsung.com> <1426829466-13559-3-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426829466-13559-3-git-send-email-ingi2.kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Sakari Ailus <sakari.ailus@iki.fi>, Jacek Anaszewski <j.anaszewski@samsung.com>, Varka Bhadram <varkabhadram@gmail.com>, sw0312.kim@samsung.com, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, Inha Song <ideal.song@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, Mar 20, 2015 at 12:31 AM, Ingi Kim <ingi2.kim@samsung.com> wrote:
> This patch adds the device tree bindings for ktd2692 flash LEDs.
> Add optional properties 'flash-timeout-us' to control flash timeout
> and 'vin-supply' for flash-led regulator
>
> Signed-off-by: Ingi Kim <ingi2.kim@samsung.com>
> ---
>  .../devicetree/bindings/leds/leds-ktd2692.txt      | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-ktd2692.txt b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
> new file mode 100644
> index 0000000..75e16f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-ktd2692.txt
> @@ -0,0 +1,34 @@
> +* Kinetic Technologies - KTD2692 Flash LED Driver
> +
> +KTD2692 is the ideal power solution for high-power flash LEDs.
> +It uses ExpressWire single-wire programming for maximum flexibility.
> +
> +The ExpressWire interface through CTRL pin can control LED on/off and
> +enable/disable the IC, Movie(max 1/3 of Flash current) / Flash mode current,
> +Flash timeout, LVP(low voltage protection).
> +
> +Also, When the AUX pin is pulled high while CTRL pin is high,
> +LED current will be ramped up to the flash-mode current level.
> +
> +Required properties:
> +       - compatible: "kinetic,ktd2692"
> +       - ctrl-gpio, aux-gpio : gpio pin in order control ktd2692 flash led.
> +               There is an internal 300kOhm pull-down resistor at each pin
> +       - supply : "vin" LED supply (2.7V to 5.5V)

This should be "vin-supply", right?

> +               See Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +Optional property:
> +       - flash-timeout-us : Maximum flash timeout in microseconds.
> +                       flash timeout ranges from 0 to 1835000us and
> +                       default is 1049000us.
> +
> +Example:
> +
> +flash-led {
> +       compatible = "kinetic,ktd2692";
> +       ctrl-gpio = <&gpc0 1 0>;
> +       aux-gpio = <&gpc0 2 0>;
> +       flash-timeout-us = <1835000>;
> +       vin-supply = <&vbat>;
> +};
> +
> --
> 2.0.5
>
