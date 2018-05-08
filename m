From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add SC27xx breathing light
 controller documentation
Date: Tue, 8 May 2018 10:43:53 -0500
Message-ID: <20180508154353.GA28859@rob-hp-laptop>
References: <f393ca5a99059e7086307b99fc435777fe09018b.1525757122.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f393ca5a99059e7086307b99fc435777fe09018b.1525757122.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, mark.rutland@arm.com, xiaotong.lu@spreadtrum.com, broonie@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, May 08, 2018 at 01:39:44PM +0800, Baolin Wang wrote:
> This patch adds the binding documentation for Spreadtrum SC27xx series
> breathing light controller, which supports 3 outputs: red LED, green
> LED and blue LED.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
> ---
> Changes since v1:
>  - Change the compatible string to be one explicit SoC name.
>  - Change the child node name.
>  - Change to be upper case for the first character.
> ---
>  .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |   41 ++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-sc27xx-bltc.txt

Reviewed-by: Rob Herring <robh@kernel.org>
