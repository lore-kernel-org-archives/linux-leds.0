From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] Documentation: devicetree: Add document bindings
 for leds-mt6323
Date: Mon, 27 Feb 2017 19:14:31 -0600
Message-ID: <20170228011431.ogms4cr3dgoysfv3@rob-hp-laptop>
References: <1487962041-6548-1-git-send-email-sean.wang@mediatek.com>
 <1487962041-6548-2-git-send-email-sean.wang@mediatek.com>
 <709ff2c2-38f3-a3dd-f686-de3db873997d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:35630 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751392AbdB1BOg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Feb 2017 20:14:36 -0500
Content-Disposition: inline
In-Reply-To: <709ff2c2-38f3-a3dd-f686-de3db873997d@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: sean.wang@mediatek.com, rpurdie@rpsys.net, lee.jones@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com

On Sun, Feb 26, 2017 at 06:35:11PM +0100, Jacek Anaszewski wrote:
> Hi Sean,
> 
> Thanks for the update. I have one comment below.
> 
> On 02/24/2017 07:47 PM, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > This patch adds documentation for devicetree bindings
> > for LED support on MT6323 PMIC
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  .../devicetree/bindings/leds/leds-mt6323.txt       | 64 ++++++++++++++++++++++
> >  1 file changed, 64 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6323.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> > new file mode 100644
> > index 0000000..950b8c6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
> > @@ -0,0 +1,64 @@
> > +Device Tree Bindings for LED support on MT6323 PMIC
> > +
> > +MT6323 LED controller is subfunction provided by
> > +MT6323 PMIC, so the LED controllers are defined as
> > +the subnode of the function node provided by MT6323
> > +PMIC controller that is being defined as one kind of
> > +Muti-Function Device (MFD) using shared bus called
> > +PMIC wrapper for each subfunction to access remote
> > +MT6323 PMIC hardware.
> > +
> > +For MT6323 MFD bindings see:
> > +Documentation/devicetree/bindings/mfd/mt6397.txt
> > +For MediaTek PMIC wrapper bindings see:
> > +Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> > +
> > +There's sub-node for the LED controller that describes
> > +the initial behavior for each LED physically and currently
> > +only four LED sub-nodes can be supported.
> > +
> > +Required properties:
> > +- compatible : Must be "mediatek,mt6323-led"
> > +- reg : LED channel number (0..3)
> > +
> > +Optional properties:
> > +- label : (optional)
> > +  see Documentation/devicetree/bindings/leds/common.txt
> > +- linux,default-trigger : (optional)
> > +  see Documentation/devicetree/bindings/leds/common.txt
> > +- default-state: (optional) The initial state of the LED
> > +  see Documentation/devicetree/bindings/leds/common.txt
> > +
> > +Example:
> > +
> > +&pwrap {
> > +	pmic: mt6323 {
> > +		compatible = "mediatek,mt6323";
> > +		interrupt-parent = <&pio>;
> > +		interrupts = <150 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-controller;
> > +		#interrupt-cells = <2>;
> > +
> > +		mt6323led: mt6323led{
> > +			compatible = "mediatek,mt6323-led";
> 
> You require here also:
> 
> #address-cells = <1>;
> #size-cells = <0>;
> 
> Without these entries you should notice a warning from dtc compiler.
> 
> 
> > +
> > +			led0: isink0 {

Also, these should be "led@0"

> > +				reg = <0>;
> > +				label = "LED0"
> > +				linux,default-trigger = "timer";
> > +				default-state = "on";
> > +			};
> > +			led1: isink1 {
> > +				reg = <1>;
> > +				label = "LED1";
> > +				default-state = "on";
> > +			};
> > +			led2: isink2 {
> > +				reg = <2>;
> > +				label = "LED2";
> > +				linux,default-trigger = "timer";
> > +				default-state = "off";
> > +			};
> > +		};
> > +	};
> > +};
> > 
> 
> -- 
> Best regards,
> Jacek Anaszewski
