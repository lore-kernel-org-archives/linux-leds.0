From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/3] leds: pm8058: add device tree bindings
Date: Wed, 29 Jun 2016 11:38:00 -0700
Message-ID: <20160629183800.GL1521@codeaurora.org>
References: <1467210120-8829-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1467210120-8829-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-leds@vger.kernel.org

On 06/29, Linus Walleij wrote:
> diff --git a/Documentation/devicetree/bindings/leds/leds-pm8058.txt b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
> new file mode 100644
> index 000000000000..5d4e6369b9f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-pm8058.txt
> @@ -0,0 +1,67 @@
> +Qualcomm PM8058 LED driver
> +
> +The Qualcomm PM8058 is a multi-functional device which contain

s/contain/contains/

> +a LED driver block for up to six LEDs: three normal LEDs, two

s/a/an/

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
> +- compatible: on of

s/on/one/

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
