From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [RESEND PATCH 4/4] leds: leds-ns2: depends on MACH_ARMADA_370
Date: Mon, 22 Jun 2015 16:33:08 +0200
Message-ID: <55881CA4.9080306@samsung.com>
References: <1434640650-28086-1-git-send-email-simon.guinot@sequanux.org>
 <1434640650-28086-5-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42573 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750906AbbFVOdL (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jun 2015 10:33:11 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NQC00GS0OF9BH90@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 22 Jun 2015 15:33:10 +0100 (BST)
In-reply-to: <1434640650-28086-5-git-send-email-simon.guinot@sequanux.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vincent Donnefort <vdonnefort@gmail.com>

Hi Simon,

On 06/18/2015 05:17 PM, Simon Guinot wrote:
> The leds-ns2 driver is also used by the n090401 board (Seagate NAS
> 4-Bay), which is based on the Marvell Armada-370 SoC.
>
> Then this patch allows to select the leds-ns2 driver if MACH_ARMADA_370
> is enabled. Additionally, this also updates the Kconfig help message.
>
> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> ---
>   drivers/leds/Kconfig | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 966b9605f5f0..68fd6b2b12be 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -431,12 +431,16 @@ config LEDS_MC13783
>   config LEDS_NS2
>   	tristate "LED support for Network Space v2 GPIO LEDs"
>   	depends on LEDS_CLASS
> -	depends on MACH_KIRKWOOD
> +	depends on MACH_KIRKWOOD || MACH_ARMADA_370
>   	default y
>   	help
> -	  This option enable support for the dual-GPIO LED found on the
> -	  Network Space v2 board (and parents). This include Internet Space v2,
> -	  Network Space (Max) v2 and d2 Network v2 boards.
> +	  This option enables support for the dual-GPIO LEDs found on the
> +	  following LaCie/Seagate boards:
> +
> +		Network Space v2 (and parents: Max, Mini)
> +		Internet Space v2
> +		d2 Network v2
> +		n090401 (Seagate NAS 4-Bay)
>
>   config LEDS_NETXBIG
>   	tristate "LED support for Big Network series LEDs"
>

Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

-- 
Best Regards,
Jacek Anaszewski
