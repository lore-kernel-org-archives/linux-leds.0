From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] leds: pwm: Remove unneeded header file
Date: Sat, 18 Nov 2017 21:32:44 +0100
Message-ID: <ba174690-fbe0-fc17-d798-79f7324689c8@gmail.com>
References: <1511036566-25369-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:43549 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423431AbdKRUdo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 18 Nov 2017 15:33:44 -0500
Received: by mail-wm0-f67.google.com with SMTP id x63so12231645wmf.2
        for <linux-leds@vger.kernel.org>; Sat, 18 Nov 2017 12:33:43 -0800 (PST)
In-Reply-To: <1511036566-25369-1-git-send-email-festevam@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-leds@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>

Hi Fabio,

Thanks for the patch.

On 11/18/2017 09:22 PM, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> There is nothing provided by <linux/fb.h> that is used here,
> so remove this unneeded header file.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/leds/leds-pwm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
> index 8d456dc6..df80c89 100644
> --- a/drivers/leds/leds-pwm.c
> +++ b/drivers/leds/leds-pwm.c
> @@ -16,7 +16,6 @@
>  #include <linux/kernel.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_platform.h>
> -#include <linux/fb.h>
>  #include <linux/leds.h>
>  #include <linux/err.h>
>  #include <linux/pwm.h>
> 

Applied to the for-4.16 branch of linux-leds.git.

-- 
Best regards,
Jacek Anaszewski
