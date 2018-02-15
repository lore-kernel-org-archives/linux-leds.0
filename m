From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v7 1/2] leds: fix Kconfig text for MLXCPLD and SYSCON
Date: Thu, 15 Feb 2018 07:48:41 +0100
Message-ID: <20180215064841.GA2942@localhost>
References: <1518682525-101578-1-git-send-email-vadimp@mellanox.com>
 <1518682525-101578-2-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:52799 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161881AbeBOPUv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Feb 2018 10:20:51 -0500
Content-Disposition: inline
In-Reply-To: <1518682525-101578-2-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: jacek.anaszewski@gmail.com, rpurdie@rpsys.net, linux-leds@vger.kernel.org, jiri@resnulli.us

On Thu 2018-02-15 08:15:24, Vadim Pasternak wrote:
> It fixes grammatical errors in Kconfig file for LEDS_SYSCON and
> LEDS_MLXCPLD.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Reported-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> ---
>  drivers/leds/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index a3fdf83..ed44013 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -674,7 +674,7 @@ config LEDS_SYSCON
>  	depends on MFD_SYSCON
>  	depends on OF
>  	help
> -	  This option enabled support for the LEDs on syscon type
> +	  This option enable support for the LEDs on syscon type

"enables".

								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
