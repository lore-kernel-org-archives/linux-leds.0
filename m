From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/2] leds: clevo-mail: Fix incorrect placement of __initdata
Date: Wed, 7 Aug 2013 14:05:17 -0700
Message-ID: <CAK5ve-KjBe_kLo9hv+_Wj3weqE9C+vAffZbQWFKwRKzb8cPhdQ@mail.gmail.com>
References: <1375867843-19162-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:54200 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933100Ab3HGVFj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 7 Aug 2013 17:05:39 -0400
Received: by mail-lb0-f177.google.com with SMTP id r11so1862221lbv.8
        for <linux-leds@vger.kernel.org>; Wed, 07 Aug 2013 14:05:37 -0700 (PDT)
In-Reply-To: <1375867843-19162-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, =?ISO-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>

On Wed, Aug 7, 2013 at 2:30 AM, Sachin Kamat <sachin.kamat@linaro.org> =
wrote:
> __initdata should be placed between the variable name and equal
> sign for the variable to be placed in the intended section.
>

Merged, thanks.
-Bryan

> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: M=E1rton N=E9meth <nm127@freemail.hu>
> ---
>  drivers/leds/leds-clevo-mail.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo=
-mail.c
> index 6a8405d..d93e245 100644
> --- a/drivers/leds/leds-clevo-mail.c
> +++ b/drivers/leds/leds-clevo-mail.c
> @@ -40,7 +40,7 @@ static int __init clevo_mail_led_dmi_callback(const=
 struct dmi_system_id *id)
>   * detected as working, but in reality it is not) as low as
>   * possible.
>   */
> -static struct dmi_system_id __initdata clevo_mail_led_dmi_table[] =3D=
 {
> +static struct dmi_system_id clevo_mail_led_dmi_table[] __initdata =3D=
 {
>         {
>                 .callback =3D clevo_mail_led_dmi_callback,
>                 .ident =3D "Clevo D410J",
> --
> 1.7.9.5
>
--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
