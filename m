From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: add PM8058 LEDs to the APQ8060 Dragonboard
Date: Fri, 19 Aug 2016 21:13:01 +0200
Message-ID: <57B75A3D.4010305@gmail.com>
References: <1471596407-4601-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1471596407-4601-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

On 08/19/2016 10:46 AM, Linus Walleij wrote:
> This adds the PM8058 LEDs as used in the platform.
>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Rename the infrared LED to "pm8058:infrared:proximitysensor"
> ---
>   arch/arm/boot/dts/qcom-apq8060-dragonboard.dts | 39 ++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> index 0abc93e5bb00..6c0038398ef2 100644
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
> +					label = "pm8058:infrared:proximitysensor";
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

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best regards,
Jacek Anaszewski
