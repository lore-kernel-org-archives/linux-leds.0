From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add SC27xx breathing light
 controller documentation
Date: Mon, 7 May 2018 16:10:41 -0500
Message-ID: <20180507211041.GA10205@rob-hp-laptop>
References: <099f4075ec489e425b5f1e7668a078c05f0d8509.1525427961.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <099f4075ec489e425b5f1e7668a078c05f0d8509.1525427961.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com, xiaotong.lu@spreadtrum.com, broonie@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Fri, May 04, 2018 at 06:08:35PM +0800, Baolin Wang wrote:
> This patch adds the binding documentation for Spreadtrum SC27xx series
> breathing light controller, which supports 3 outputs: red LED, green
> LED and blue LED.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
>  .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |   39 ++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
> new file mode 100644
> index 0000000..d4e267d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt
> @@ -0,0 +1,39 @@
> +LEDs connected to Spreadtrum SC27XX PMIC breathing light controller
> +
> +The SC27xx breathing light controller supports to 3 outputs:
> +red LED, green LED and blue LED. Each LED can work at normal
> +PWM mode or breath light mode.
> +
> +Required properties:
> +- compatible: should be "sprd,sc27xx-bltc".

Don't use wildcards in compatible strings.
