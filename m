From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/2] leds: leds-ss4200: remove unnecessary __initdata marker
Date: Fri, 28 Feb 2014 14:33:58 -0800
Message-ID: <CAK5ve-LfpGy0ST8_5Wbu77G9jEVLgTsQ10VgKbRUO7B+wCqhyw@mail.gmail.com>
References: <000c01cf3456$34b8ecc0$9e2ac640$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:58164 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752023AbaB1WeT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2014 17:34:19 -0500
Received: by mail-lb0-f175.google.com with SMTP id w7so3124989lbi.34
        for <linux-leds@vger.kernel.org>; Fri, 28 Feb 2014 14:34:18 -0800 (PST)
In-Reply-To: <000c01cf3456$34b8ecc0$9e2ac640$%han@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Dave Hansen <dave@linux.vnet.ibm.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On Thu, Feb 27, 2014 at 11:25 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> Remove unnecessary __initdata marker, because it is not right
> for a module parameter. It may make the kernel oops problem.
>

Merged, thanks,
-Bryan

> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/leds/leds-ss4200.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 2bdf642..2eb3ef6 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -78,7 +78,7 @@ static int __init ss4200_led_dmi_callback(const struct dmi_system_id *id)
>         return 1;
>  }
>
> -static bool __initdata nodetect;
> +static bool nodetect;
>  module_param_named(nodetect, nodetect, bool, 0);
>  MODULE_PARM_DESC(nodetect, "Skip DMI-based hardware detection");
>
> --
> 1.7.10.4
>
>
