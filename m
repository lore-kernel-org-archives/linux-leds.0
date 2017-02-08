From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/4] mfd: mt6397: Add MT6323 LED support into MT6397
 driver
Date: Wed, 8 Feb 2017 12:21:37 +0000
Message-ID: <20170208122137.qi6ondxend2lejyk@dell>
References: <1486520357-13096-1-git-send-email-sean.wang@mediatek.com>
 <1486520357-13096-5-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:36492 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754313AbdBHMVl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Feb 2017 07:21:41 -0500
Received: by mail-wr0-f172.google.com with SMTP id k90so59359808wrc.3
        for <linux-leds@vger.kernel.org>; Wed, 08 Feb 2017 04:21:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1486520357-13096-5-git-send-email-sean.wang@mediatek.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: sean.wang@mediatek.com
Cc: rpurdie@rpsys.net, jacek.anaszewski@gmail.com, matthias.bgg@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, keyhaede@gmail.com

On Wed, 08 Feb 2017, sean.wang@mediatek.com wrote:

> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add compatible string as "mt6323-led" that will make
> the OF core spawn child devices for the LED subnode
> of that MT6323 MFD device.
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index e14d8b0..8e601c8 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -48,6 +48,10 @@
>  		.name = "mt6323-regulator",
>  		.of_compatible = "mediatek,mt6323-regulator"
>  	},
> +	{
> +		.name = "mt6323-led",
> +		.of_compatible = "mediatek,mt6323-led"
> +	},
>  };
>  
>  static const struct mfd_cell mt6397_devs[] = {

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
