From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH] leds: Turn off led if blinking is disabled
Date: Thu, 6 Feb 2014 09:48:28 -0800
Message-ID: <CAK5ve-+zxABRZ0DEAzDZ-mwdO0xi+Z-h=QzZ0gXVyxn8mK7caw@mail.gmail.com>
References: <1391501502-12870-1-git-send-email-stefan.sorensen@spectralink.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173]:37187 "EHLO
	mail-lb0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752849AbaBFRst convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 6 Feb 2014 12:48:49 -0500
Received: by mail-lb0-f173.google.com with SMTP id s7so218857lbd.18
        for <linux-leds@vger.kernel.org>; Thu, 06 Feb 2014 09:48:48 -0800 (PST)
In-Reply-To: <1391501502-12870-1-git-send-email-stefan.sorensen@spectralink.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?ISO-8859-1?Q?Stefan_S=F8rensen?= <stefan.sorensen@spectralink.com>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>

On Tue, Feb 4, 2014 at 12:11 AM, Stefan S=F8rensen
<stefan.sorensen@spectralink.com> wrote:
> When using the timer trigger and setting delay_on to 0, the led
> will stay in whatever state is was in, while intuitively one
> would expect it to turn off. This patch changes the behaviour to
> turn it off.
>

Good to me, applied to my tree.
Thanks,
-Bryan

> Signed-off-by: Stefan S=F8rensen <stefan.sorensen@spectralink.com>
> ---
>  drivers/leds/led-core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index ce8921a..71b40d3 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -39,9 +39,11 @@ static void led_set_software_blink(struct led_clas=
sdev *led_cdev,
>         led_cdev->blink_delay_on =3D delay_on;
>         led_cdev->blink_delay_off =3D delay_off;
>
> -       /* never on - don't blink */
> -       if (!delay_on)
> +       /* never on - just set to off */
> +       if (!delay_on) {
> +               __led_set_brightness(led_cdev, LED_OFF);
>                 return;
> +       }
>
>         /* never off - just set to brightness */
>         if (!delay_off) {
> --
> 1.8.5.3
>
