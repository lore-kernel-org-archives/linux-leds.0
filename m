From: Fabio Baltieri <fabio.baltieri@gmail.com>
Subject: Re: [PATCH] leds: triggers: oneshot: fix module license specification
Date: Thu, 12 Nov 2015 09:52:08 +0000
Message-ID: <CABkP77eYMQd6xsS3=tPH2ZUmcq2DvZq73Eit0Hc9oUR1YCYd1w@mail.gmail.com>
References: <1447320039-16240-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:32966 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753644AbbKLJw3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Nov 2015 04:52:29 -0500
Received: by lbbkw15 with SMTP id kw15so31871180lbb.0
        for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2015 01:52:28 -0800 (PST)
In-Reply-To: <1447320039-16240-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, kernel@pengutronix.de, linux-leds@vger.kernel.org

On Thu, Nov 12, 2015 at 9:20 AM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The header of this file fixes the license to GPL 2 only without the
> option to use later version. So use the string "GPL v2" that is to be
> used in this case.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Acked-by: Fabio Baltieri <fabio.baltieri@gmail.com>

> ---
>  drivers/leds/trigger/ledtrig-oneshot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/tr=
igger/ledtrig-oneshot.c
> index fbd02cdc3ad7..c1bab74b22a0 100644
> --- a/drivers/leds/trigger/ledtrig-oneshot.c
> +++ b/drivers/leds/trigger/ledtrig-oneshot.c
> @@ -201,4 +201,4 @@ module_exit(oneshot_trig_exit);
>
>  MODULE_AUTHOR("Fabio Baltieri <fabio.baltieri@gmail.com>");
>  MODULE_DESCRIPTION("One-shot LED trigger");
> -MODULE_LICENSE("GPL");
> +MODULE_LICENSE("GPL v2");
> --
> 2.6.1
>



--=20
=46abio Baltieri
