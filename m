From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/5] leds: leds-ss4200: fix incorrect placement of
 __initdata marker
Date: Thu, 27 Feb 2014 10:00:06 -0800
Message-ID: <CAK5ve-KG4a8GEsb6A4zno7wX=ZSqtFxX-nPbe+8hbDaYyD0szA@mail.gmail.com>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:39022 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751030AbaB0SA1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 27 Feb 2014 13:00:27 -0500
Received: by mail-lb0-f169.google.com with SMTP id l4so1080033lbv.14
        for <linux-leds@vger.kernel.org>; Thu, 27 Feb 2014 10:00:26 -0800 (PST)
In-Reply-To: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Dave Hansen <dave@linux.vnet.ibm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Tue, Feb 25, 2014 at 9:09 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> The __initdata marker can be virtually anywhere on the line,
> EXCEPT right after "struct". The preferred location is before
> the "=" sign if there is one, or before the trailing ";"
> otherwise. It also fixes the following chechpatch warning.
>
>   WARNING: __initdata should be placed after nodetect
>

Good, I merged it.
Thanks, -Bryan

> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/leds/leds-ss4200.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 5b8f938..3faf550 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -78,7 +78,7 @@ static int __init ss4200_led_dmi_callback(const struct dmi_system_id *id)
>         return 1;
>  }
>
> -static bool __initdata nodetect;
> +static bool nodetect __initdata;
>  module_param_named(nodetect, nodetect, bool, 0);
>  MODULE_PARM_DESC(nodetect, "Skip DMI-based hardware detection");
>
> --
> 1.7.10.4
>
>
