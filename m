From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH] drivers/leds/leds-ss4200: add depend on x86 arch
Date: Tue, 19 Apr 2016 09:14:44 +0200
Message-ID: <5715DAE4.7000900@samsung.com>
References: <1460892472-7228-1-git-send-email-martin.dummer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53496 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752173AbcDSHOt (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 19 Apr 2016 03:14:49 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O5V0050YDGL6C30@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 19 Apr 2016 08:14:45 +0100 (BST)
In-reply-to: <1460892472-7228-1-git-send-email-martin.dummer@gmx.net>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Martin Dummer <martin.dummer@gmx.net>
Cc: rpurdie@rpsys.net, linux-leds@vger.kernel.org

Hi Martin,

Thanks for the patch, applied.

Best regards,
Jacek Anaszewski

On 04/17/2016 01:27 PM, Martin Dummer wrote:
> There is only one x86 hardware where the driver leds-ss4200 applies to.
> Add kconfig dependency to x86 architecture, fix help text whitespace.
>
> Signed-off-by: Martin Dummer <martin.dummer@gmx.net>
> ---
>   drivers/leds/Kconfig | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 2251478..5ae2834 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -413,10 +413,11 @@ config LEDS_INTEL_SS4200
>   	tristate "LED driver for Intel NAS SS4200 series"
>   	depends on LEDS_CLASS
>   	depends on PCI && DMI
> +	depends on X86
>   	help
>   	  This option enables support for the Intel SS4200 series of
> -	  Network Attached Storage servers.  You may control the hard
> -	  drive or power LEDs on the front panel.  Using this driver
> +	  Network Attached Storage servers. You may control the hard
> +	  drive or power LEDs on the front panel. Using this driver
>   	  can stop the front LED from blinking after startup.
>
>   config LEDS_LT3593
>
