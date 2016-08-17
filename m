From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] ARM: dts: add PM8058 LEDs to the APQ8060 Dragonboard
Date: Wed, 17 Aug 2016 23:40:32 +0200
Message-ID: <57B4D9D0.8070000@gmail.com>
References: <1471376759-9561-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:34726 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752761AbcHQVlL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 17 Aug 2016 17:41:11 -0400
In-Reply-To: <1471376759-9561-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>

On 08/16/2016 09:45 PM, Linus Walleij wrote:
> This adds the PM8058 LEDs as used in the platform.
>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> These DT bindings have been ACKed by Rob Herring and Bjorn Andersson
> so I think the patch is safe to merge to the Qcom tree.
> ---
>   arch/arm/boot/dts/qcom-apq8060-dragonboard.dts | 39 ++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> index 0abc93e5bb00..b0800b988174 100644
> --- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> @@ -239,6 +239,45 @@
>   						};
>   					};
>   				};
> +
> +				led@48 {
> +					/*
> +					 * The keypad LED @0x48 is routed to
> +					 * the sensor board where it is
> +					 * connected to an infrared LED
> +					 * SFH4650 (60mW, @850nm) next to the
> +					 * ambient light and proximity sensor
> +					 * Capella Microsystems CM3605.
> +					 */
> +					compatible = "qcom,pm8058-keypad-led";
> +					reg = <0x48>;
> +					label = "proximity0";

In DT bindings documentation it was changed to "pm8050:white:keypad" to
adhere to the LED class device naming convention. I assume that having
it in this form is an omission here.

> +					default-state = "off";
> +				};
> +				led@131 {
> +					compatible = "qcom,pm8058-led";
> +					reg = <0x131>;
> +					label = "pm8058:red";
> +					default-state = "off";
> +				};
> +				led@132 {
> +					/*
> +					 * This is actually green too on my
> +					 * board, but documented as yellow.
> +					 */
> +					compatible = "qcom,pm8058-led";
> +					reg = <0x132>;
> +					label = "pm8058:yellow";
> +					default-state = "off";
> +					linux,default-trigger = "mmc0";
> +				};
> +				led@133 {
> +					compatible = "qcom,pm8058-led";
> +					reg = <0x133>;
> +					label = "pm8058:green";
> +					default-state = "on";
> +					linux,default-trigger = "heartbeat";
> +				};
>   			};
>   		};
>
>

-- 
Best regards,
Jacek Anaszewski
