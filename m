From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for MediaTek PMIC LED driver
Date: Mon, 11 Sep 2017 22:05:35 +0200
Message-ID: <eca00e52-dcc4-2db5-f7cf-8b45be2ed91b@gmail.com>
References: <6ca394e75ef29089eef773b5856366be10745bb4.1504960075.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:38410 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750966AbdIKUG3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Sep 2017 16:06:29 -0400
In-Reply-To: <6ca394e75ef29089eef773b5856366be10745bb4.1504960075.git.sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: sean.wang@mediatek.com, rpurdie@rpsys.net, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org

Hi Sean,

On 09/09/2017 02:37 PM, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add me as maintainers to support existing SoCs and push forward
> following MediaTek PMICs with LEDs to reuse the driver.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2021738..65185bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8648,6 +8648,12 @@ M:	Sean Wang <sean.wang@mediatek.com>
>  S:	Maintained
>  F:	drivers/media/rc/mtk-cir.c
>  
> +MEDIATEK PMIC LED DRIVER
> +M:	Sean Wang <sean.wang@mediatek.com>
> +S:	Maintained
> +F:	drivers/leds/leds-mt6323.c
> +F:	Documentation/devicetree/bindings/leds/leds-mt6323.txt
> +
>  MEDIATEK RANDOM NUMBER GENERATOR SUPPORT
>  M:	Sean Wang <sean.wang@mediatek.com>
>  S:	Maintained
> 

Applied to the for-4.15 branch of linux-leds.git, thanks.

-- 
Best regards,
Jacek Anaszewski
