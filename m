From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/1] leds: leds-mlxcpld: Allow compilation for 32 bit arch
Date: Thu, 1 Feb 2018 20:34:01 +0100
Message-ID: <8f2c62c9-c25f-7b04-84af-d025cbdb6ea2@gmail.com>
References: <1517472634-110307-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35841 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754606AbeBATfO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 1 Feb 2018 14:35:14 -0500
Received: by mail-wr0-f195.google.com with SMTP id y3so10413061wrh.3
        for <linux-leds@vger.kernel.org>; Thu, 01 Feb 2018 11:35:14 -0800 (PST)
In-Reply-To: <1517472634-110307-1-git-send-email-vadimp@mellanox.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>, rpurdie@rpsys.net
Cc: linux-leds@vger.kernel.org, jiri@resnulli.us

Hi Vadim,

Thanks for the patch.

On 02/01/2018 09:10 AM, Vadim Pasternak wrote:
> It makes leds-mlxcpld available for 32 bit architecture.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Reported-by: Jiri Pirko <jiri@mellanox.com>
> ---
>  drivers/leds/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 3e763d2..fe52436a7 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -688,7 +688,7 @@ config LEDS_PM8058
>  
>  config LEDS_MLXCPLD
>  	tristate "LED support for the Mellanox boards"
> -	depends on X86_64 && DMI
> +	depends on X86 && DMI
>  	depends on LEDS_CLASS
>  	help
>  	  This option enabled support for the LEDs on the Mellanox
> 

Applied to the for-4.17 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
