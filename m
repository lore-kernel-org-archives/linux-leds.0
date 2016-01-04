From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] leds: add HAS_IOMEM dependency to LEDS_BCM6328/LEDS_BCM6358
Date: Mon, 04 Jan 2016 10:17:59 +0100
Message-ID: <568A38C7.4090500@samsung.com>
References: <1451739949-14263-1-git-send-email-vegard.nossum@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:57248 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752481AbcADJSD (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 4 Jan 2016 04:18:03 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O0F0008K8I0AY50@mailout4.w1.samsung.com> for
 linux-leds@vger.kernel.org; Mon, 04 Jan 2016 09:18:00 +0000 (GMT)
In-reply-to: <1451739949-14263-1-git-send-email-vegard.nossum@oracle.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org

Hi Vegard,

On 01/02/2016 02:05 PM, Vegard Nossum wrote:
> Ran into this on UML:
>
> drivers/built-in.o: In function `bcm6328_leds_probe':
> drivers/leds/leds-bcm6328.c:340: undefined reference to `devm_ioremap_resource'
> drivers/built-in.o: In function `bcm6358_leds_probe':
> drivers/leds/leds-bcm6358.c:173: undefined reference to `devm_ioremap_resource'
> collect2: error: ld returned 1 exit status
>
> devm_ioremap_resource() is defined only when HAS_IOMEM is selected.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
> Cc: linux-leds@vger.kernel.org
> ---
>   drivers/leds/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index b1ab8bd..7f940c2 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -52,6 +52,7 @@ config LEDS_AAT1290
>   config LEDS_BCM6328
>   	tristate "LED Support for Broadcom BCM6328"
>   	depends on LEDS_CLASS
> +	depends on HAS_IOMEM
>   	depends on OF
>   	help
>   	  This option enables support for LEDs connected to the BCM6328
> @@ -60,6 +61,7 @@ config LEDS_BCM6328
>   config LEDS_BCM6358
>   	tristate "LED Support for Broadcom BCM6358"
>   	depends on LEDS_CLASS
> +	depends on HAS_IOMEM
>   	depends on OF
>   	help
>   	  This option enables support for LEDs connected to the BCM6358
>

Applied, thanks.

-- 
Best Regards,
Jacek Anaszewski
