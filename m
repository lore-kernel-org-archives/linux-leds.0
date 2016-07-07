From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 1/3 v2] leds: pm8058: add device tree bindings
Date: Thu, 07 Jul 2016 17:08:32 +0200
Message-ID: <577E7070.80403@samsung.com>
References: <1467841320-11251-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:25592 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752570AbcGGPIm (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 7 Jul 2016 11:08:42 -0400
In-reply-to: <1467841320-11251-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

Hi Linus,

On 07/06/2016 11:42 PM, Linus Walleij wrote:
> This adds the device tree bindings for the PM8058 LEDs.
>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix some spelling mistakes
> - Reference common bindings directly without any local descriptions
> ---
>   .../devicetree/bindings/leds/leds-pm8058.txt       | 67 ++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-pm8058.txt b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
> new file mode 100644
> index 000000000000..ee070e23fe61
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
> @@ -0,0 +1,67 @@
> +Qualcomm PM8058 LED driver
> +
> +The Qualcomm PM8058 is a multi-functional device which contains
> +an LED driver block for up to six LEDs: three normal LEDs, two
> +"flash" LEDs and one "keypad backlight" LED. The names are
> +quoted because sometimes these LED drivers are used for wildly
> +different things than flash or keypad backlight: their names
> +are more of a suggestion than a hard-wired usecase.
> +
> +Hardware-wise the different LEDs support slightly different
> +output currents. The "flash" LEDs do not need to charge nor
> +do they support external triggers. They are just powerful LED
> +drivers.
> +
> +The LEDs appear as children to the PM8058 device, with the
> +proper compatible string. For the PM8058 bindings see:
> +mfd/qcom-pm8xxx.txt.
> +
> +Each LED is represented as a sub-node of the syscon device. Each
> +node's name represents the name of the corresponding LED.
> +
> +LED sub-node properties:
> +
> +Required properties:
> +- compatible: one of
> +  "qcom,pm8058-led" (for the normal LEDs at 0x131, 0x132 and 0x133)
> +  "qcom,pm8058-keypad-led" (for the "keypad" LED at 0x48)
> +  "qcom,pm8058-flash-led" (for the "flash" LEDs at 0x49 and 0xFB)
> +
> +Optional properties:
> +- label: see Documentation/devicetree/bindings/leds/common.txt
> +- default-state: see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger: see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example:
> +
> +qcom,ssbi@500000 {
> +	pmicintc: pmic@0 {
> +		compatible = "qcom,pm8058";
> +		led@48 {
> +			compatible = "qcom,pm8058-keypad-led";
> +			reg = <0x48>;
> +			label = "keypad";

Why not "pm8058::keypad"?

Naming scheme is "devicename:colour:function".

See Documentation/leds/leds-class.txt.

> +			default-state = "off";
> +		};
> +		led@131 {
> +			compatible = "qcom,pm8058-led";
> +			reg = <0x131>;
> +			label = "pm8058:red";
> +			default-state = "off";
> +		};
> +		led@132 {
> +			compatible = "qcom,pm8058-led";
> +			reg = <0x132>;
> +			label = "pm8058:yellow";
> +			default-state = "off";
> +			linux,default-trigger = "mmc0";
> +		};
> +		led@133 {
> +			compatible = "qcom,pm8058-led";
> +			reg = <0x133>;
> +			label = "pm8058:green";
> +			default-state = "on";
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
>


-- 
Best regards,
Jacek Anaszewski
