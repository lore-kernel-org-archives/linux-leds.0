From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: mfd: Add LED subnode binding for
 MT6323 PMIC
Date: Mon, 13 Mar 2017 13:00:31 +0100
Message-ID: <c86eacdb-d5c8-2f0a-11f1-1a3bc623b4b0@gmail.com>
References: <1488549385-19899-1-git-send-email-sean.wang@mediatek.com>
 <1488549385-19899-3-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:33601 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751557AbdCMMAk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 13 Mar 2017 08:00:40 -0400
In-Reply-To: <1488549385-19899-3-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: sean.wang@mediatek.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com, lee.jones@linaro.org



On 03/03/17 14:56, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
>
> This patch adds documentation for devicetree bindings
> for LED support as the subnode of MT6323 PMIC
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index 949c85f..522a3bb 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -6,6 +6,7 @@ MT6397/MT6323 is a multifunction device with the following sub modules:
>  - Audio codec
>  - GPIO
>  - Clock
> +- LED
>
>  It is interfaced to host controller using SPI interface by a proprietary hardware
>  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
> @@ -34,6 +35,10 @@ Optional subnodes:
>  - clk
>  	Required properties:
>  		- compatible: "mediatek,mt6397-clk"
> +- led
> +	Required properties:
> +		- compatible: "mediatek,mt6323-led"
> +	see Documentation/devicetree/bindings/leds/leds-mt6323.txt

Part of this patch is already part of linux-next:
05daab3 ("Documentation: devicetree: Add LED subnode binding for MT6323 
PMIC")

Regards,
Matthias
