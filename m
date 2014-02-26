From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
Subject: Re: [PATCH 5/5] leds: blinkm: remove unnecessary spaces
Date: Wed, 26 Feb 2014 07:25:40 +0100
Message-ID: <2477568.SBlftA00dv@samweis.auenland.lan>
References: <000b01cf32b0$eb62fe40$c228fac0$%han@samsung.com> <000f01cf32b1$dd460ef0$97d22cd0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:49329 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750712AbaBZGZ6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2014 01:25:58 -0500
Received: from samweis.auenland.lan ([46.193.142.205]) by mail.gmx.com
 (mrgmx003) with ESMTPSA (Nemesis) id 0MJSQ7-1WGcGW05Sl-0033HB for
 <linux-leds@vger.kernel.org>; Wed, 26 Feb 2014 07:25:56 +0100
In-Reply-To: <000f01cf32b1$dd460ef0$97d22cd0$%han@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: 'Bryan Wu' <cooloney@gmail.com>, linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>

Acked-by: Jan-Simon M=F6ller <dl9pf@gmx.de>

--=20

Dipl.-Ing.
Jan-Simon M=F6ller

jansimon.moeller@gmx.de
Am Mittwoch, 26. Februar 2014, 14:16:11 schrieb Jingoo Han:
> Remove unnecessary space in order to fix the following
> checkpatch issues.
>=20
>   WARNING: space prohibited before semicolon
>=20
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  drivers/leds/leds-blinkm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/leds-blinkm.c b/drivers/leds/leds-blinkm.c
> index 0c50860..d0452b0 100644
> --- a/drivers/leds/leds-blinkm.c
> +++ b/drivers/leds/leds-blinkm.c
> @@ -443,7 +443,7 @@ static void led_work(struct work_struct *work)
>  {
>  	int ret;
>  	struct blinkm_led *led;
> -	struct blinkm_data *data ;
> +	struct blinkm_data *data;
>  	struct blinkm_work *blm_work =3D work_to_blmwork(work);
>=20
>  	led =3D blm_work->blinkm_led;
