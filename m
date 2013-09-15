From: Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH] leds: lp55xx: enable setting default trigger
Date: Mon, 16 Sep 2013 08:42:26 +0900
Message-ID: <523645E2.9040108@ti.com>
References: <1379242217-32398-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:40657 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754158Ab3IOXmg (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sun, 15 Sep 2013 19:42:36 -0400
In-Reply-To: <1379242217-32398-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org

On 09/15/2013 07:50 PM, Linus Walleij wrote:
> This enables setting a default trigger on an LP55xx channel,
> either from platform data or device tree. This mechanism is
> identical to the mechanism for GPIO LEDs and references the
> common LEDs device tree bindings.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Milo Kim <milo.kim@ti.com>

> ---
>   Documentation/devicetree/bindings/leds/leds-lp55xx.txt | 10 +++++++---
>   drivers/leds/leds-lp55xx-common.c                      |  3 +++
>   include/linux/platform_data/leds-lp55xx.h              |  1 +
>   3 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> index a61727f..d221e75 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.txt
> @@ -17,12 +17,15 @@ Optional properties:
>            2: D1~6 with VOUT, D7~9 with VDD
>            3: D1~9 are connected to VOUT
>
> -Alternatively, each child can have specific channel name
> -- chan-name: Name of each channel name
> +Alternatively, each child can have a specific channel name and trigger:
> +- chan-name (optional): name of channel
> +- linux,default-trigger (optional): see
> +  Documentation/devicetree/bindings/leds/common.txt
>
>   example 1) LP5521
>   3 LED channels, external clock used. Channel names are 'lp5521_pri:channel0',
> -'lp5521_pri:channel1' and 'lp5521_pri:channel2'
> +'lp5521_pri:channel1' and 'lp5521_pri:channel2', with a heartbeat trigger
> +on channel 0.
>
>   lp5521@32 {
>   	compatible = "national,lp5521";
> @@ -33,6 +36,7 @@ lp5521@32 {
>   	chan0 {
>   		led-cur = /bits/ 8 <0x2f>;
>   		max-cur = /bits/ 8 <0x5f>;
> +		linux,default-trigger = "heartbeat";
>   	};

And this DT example works well with 'ledtrig-heartbeat' module.

Tested-by: Milo Kim <milo.kim@ti.com>

Thanks.

Best regards,
Milo
