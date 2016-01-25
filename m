From: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 09/22] leds: Fix dependencies for !HAS_IOMEM archs
Date: Mon, 25 Jan 2016 23:42:15 +0100
Message-ID: <56A6A4C7.7090906@nod.at>
References: <1453760661-1444-1-git-send-email-richard@nod.at>
 <1453760661-1444-10-git-send-email-richard@nod.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from a.ns.miles-group.at ([95.130.255.143]:11949 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932761AbcAYWmS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Mon, 25 Jan 2016 17:42:18 -0500
In-Reply-To: <1453760661-1444-10-git-send-email-richard@nod.at>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: user-mode-linux-devel@lists.sourceforge.net, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

Am 25.01.2016 um 23:24 schrieb Richard Weinberger:
> Not every arch has io memory.
> So, unbreak the build by fixing the dependencies.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  drivers/leds/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 7f940c2..e76a45c 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -54,6 +54,7 @@ config LEDS_BCM6328
>  	depends on LEDS_CLASS
>  	depends on HAS_IOMEM
>  	depends on OF
> +	depends on HAS_IOMEM
>  	help
>  	  This option enables support for LEDs connected to the BCM6328
>  	  LED HW controller accessed via MMIO registers.
> @@ -63,6 +64,7 @@ config LEDS_BCM6358
>  	depends on LEDS_CLASS
>  	depends on HAS_IOMEM
>  	depends on OF
> +	depends on HAS_IOMEM

Please drop this patch too.
Did not notice that this was fixed already.

Thanks,
//richard
