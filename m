From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/4] Documentation: devicetree: Add LED subnode
 binding for MT6323 PMIC
Date: Wed, 8 Feb 2017 12:22:16 +0000
Message-ID: <20170208122216.tfp3k4dkxjom26dz@dell>
References: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
 <1486520357-13096-3-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37524 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754395AbdBHMXY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Feb 2017 07:23:24 -0500
Received: by mail-wm0-f54.google.com with SMTP id v77so188437885wmv.0
        for <linux-leds@vger.kernel.org>; Wed, 08 Feb 2017 04:22:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1486520357-13096-3-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: sean.wang@mediatek.com
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com

On Wed, 08 Feb 2017, sean.wang@mediatek.com wrote:

> From: Sean Wang <sean.wang@mediatek.com>
> 
> This patch adds documentation for devicetree bindings
> for LED support as the subnode of MT6323 PMIC
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 949c85f..c568d52 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -34,6 +34,10 @@ Optional subnodes:
>  - clk
>  	Required properties:
>  		- compatible: "mediatek,mt6397-clk"
> +- led
> +	Required properties:
> +		- compatible: "mediatek,mt6323-led"
> +	see Documentation/devicetree/bindings/leds/leds-mt6323.txt
>  
>  Example:
>  	pwrap: pwrap@1000f000 {

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
