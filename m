From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] leds: ss4200: Fix incorrect placement of __initdata
Date: Wed, 7 Aug 2013 14:07:58 -0700
Message-ID: <CAK5ve-KX2e0DGAQBwUnoo6gvu5FDHk0KDq+f5Z+rNpN-MR7yuw@mail.gmail.com>
References: <1375867843-19162-1-git-send-email-sachin.kamat@linaro.org> <1375867843-19162-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:34898 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933311Ab3HGVIT (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 7 Aug 2013 17:08:19 -0400
Received: by mail-la0-f49.google.com with SMTP id ev20so1548792lab.22
        for <linux-leds@vger.kernel.org>; Wed, 07 Aug 2013 14:08:18 -0700 (PDT)
In-Reply-To: <1375867843-19162-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Dave Hansen <dave@sr71.net>

On Wed, Aug 7, 2013 at 2:30 AM, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> __initdata should be placed between the variable name and equal
> sign for the variable to be placed in the intended section.
>

Merged, thanks.
-Bryan

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Dave Hansen <dave@sr71.net>
> ---
>  drivers/leds/leds-ss4200.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index 51bb0ee..5b8f938 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -91,7 +91,7 @@ MODULE_PARM_DESC(nodetect, "Skip DMI-based hardware detection");
>   * detected as working, but in reality it is not) as low as
>   * possible.
>   */
> -static struct dmi_system_id __initdata nas_led_whitelist[] = {
> +static struct dmi_system_id nas_led_whitelist[] __initdata = {
>         {
>                 .callback = ss4200_led_dmi_callback,
>                 .ident = "Intel SS4200-E",
> --
> 1.7.9.5
>
