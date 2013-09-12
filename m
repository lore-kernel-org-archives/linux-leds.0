From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
Subject: Re: [PATCH 1/1] leds: blinkm: Remove redundant break
Date: Thu, 12 Sep 2013 09:33:22 +0200
Message-ID: <1410181.xU4E5WGzpD@aragorn.auenland.lan>
References: <1378959629-19523-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.15]:62944 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756628Ab3ILHfa convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 12 Sep 2013 03:35:30 -0400
Received: from aragorn.auenland.lan ([95.90.185.134]) by mail.gmx.com
 (mrgmx102) with ESMTPSA (Nemesis) id 0LjLwB-1Vwuxa1Jx1-00dUTw for
 <linux-leds@vger.kernel.org>; Thu, 12 Sep 2013 09:35:29 +0200
In-Reply-To: <1378959629-19523-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-leds@vger.kernel.org, cooloney@gmail.com

Acked-by.=20

--=20

Dipl.-Ing.
Jan-Simon M=F6ller

jansimon.moeller@gmx.de
On Thursday 12 September 2013 09:50:29 Sachin Kamat wrote:
> 'break' after return is redundant. Remove it.
>=20
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/leds/leds-blinkm.c |    3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index a502678..66d0a57 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -161,13 +161,10 @@ static ssize_t show_color_common(struct device =
*dev,
> char *buf, int color) switch (color) {
>  	case RED:
>  		return scnprintf(buf, PAGE_SIZE, "%02X\n", data->red);
> -		break;
>  	case GREEN:
>  		return scnprintf(buf, PAGE_SIZE, "%02X\n", data->green);
> -		break;
>  	case BLUE:
>  		return scnprintf(buf, PAGE_SIZE, "%02X\n", data->blue);
> -		break;
>  	default:
>  		return -EINVAL;
>  	}

--
To unsubscribe from this list: send the line "unsubscribe linux-leds" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
