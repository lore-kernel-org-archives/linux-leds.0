Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10C12AD03
	for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 13:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726809; cv=pass; b=NJfUrnL0eVIEO5ZZqDQlI92SV10APSz9JO1p81VQQMxiPIEyJpmZq1Dhm8Q0ohs1MGOLtnhZ6E8ODlExt3JQ5Yg3/oqLQ9yHzVv9BpzkGBfHDbE1LKPKfWh2/P0fP5otA2LxDjAOSxFWmd0TW2u3iigsyaPV5zvT63uswPZysvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726809; c=relaxed/simple;
	bh=+J5TAF/PMhzkq1pFiEhO8B/4yorJ6kRiJ4Xs8sDph6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hBBsQHAojN+JhrEvBPKBWk8IZLmu64T7EqYlLYDzUBiG9IOJd793afrayn3ZUYcDOcT/m/Cpw1bhb0azm9AqnIK6oGLeIbQ8wfUzz9GZpksqkbHsvf+rq7PUbIbIgbbNUq8D1s64C+m9WbykV2J0wVYID/JVGSyZjnL+XHS2FxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCUtyCdC; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCUtyCdC"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-353804b591eso1943345eec.0
        for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 06:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726806; cv=none;
        d=google.com; s=arc-20260327;
        b=qHvLEM/SptzQHMP+/8qPNe7pw1OKy6Ir6mz85uTJ2g2gEeVMZWo2YIfc12ssSggB0X
         W2eB3MzIIwDlu8WbYVLG49M16jDbeKL2Fa0hXHnmJn8AUBl2cFVhuaOh3VUdX99NOlrL
         0Wx1oJ00cIdHjZJ0fYUKah2F7L2dgNKF1cvmBsPEUXpjz/14+ho782N35Qg8sSZoYppp
         GpayYpE71bPA6fwyfriFZMrJB3NHhvFK6ge1AbYrJUZLgRppryyso/gbUWJjGKA/gw4Z
         wARmiPQoKGLSu/Q0fLYdS+XOb11Qy+5d+syXa9GVVA8dwFxfhsOXKUFl/V6kxZUbtGT3
         08bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o40FtQbyPEZWv/i/4tebVask9tQiIU9thNUyzitDfqs=;
        fh=Fc8veu7uv1gdf28H7JkhoQ/X9xH8BGguldrYv5Ihvhc=;
        b=P1cvSH5JCA3rahN0iJAFd2APMjjvJwE6JjwGXN75eFgmizolQGSdeFt/Z8lgg/Digd
         hCnf/9fWABnWRNo2QCSpHwTnKds2Lcn7rffzxK5t1EhMbyl7FlyMn6Kmv9w5bXS6fKLW
         fOyp2O3g/qHqnjJ8UOVzkDZEgnx9ZfAwbJ0PaV6hhGIH0BABQroK2NxN63HsjpHyyTUa
         InCByxOaP0DqZNm09qaKO6iABc0q5zEV9wOwr6MnElf0/03D+MQi0kRwzmq/GJhqy7Az
         fyZSKQk4VOW30XNag0j5A+8KeBcAKEbOY66WFBor102ycriWukrT4+DCn8utjxTDx5Zd
         tU1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726806; x=1792331606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o40FtQbyPEZWv/i/4tebVask9tQiIU9thNUyzitDfqs=;
        b=QCUtyCdCwhuAzDd/k4A9IzVH72AOoYCGi/bNd9IxRBXSUWr8Iz+A4US+eGj4S6Zi0i
         Ly1lIBx8EMt6zE85XjTxVZjhpHrn6ghzDGEfY/YEc18ProxQKd79MHBX+NwvFp//mZ1o
         qRoDqf0o+zPI2ifxel/jfuJBNROwoMk+evfl3YMI+eA0quk8vyui6xjH0v2jfD94cRef
         hj1bXcApSKwBVkncaH0Ck7nlZSfsiu13svlptyAbJYIsJ0ruGjrL7aTZL/jJ6zR4TZKn
         mk5BLIaGFSS9Ff3Lf5RMvIATAgx4xvZJTqu8d/NGj9U2/AChEYjb+wtSOPXqriTTby8T
         gr1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726806; x=1792331606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o40FtQbyPEZWv/i/4tebVask9tQiIU9thNUyzitDfqs=;
        b=fWrMRBW4x0pM0Z0MBlN4kAtG13o3FuE3AGDBzDofq6XAsWZ/5M0vZ6+J/AyGTmkQEj
         PAt4qGTtajNM2IRT8ql1y4eqp8aDwRy9clEo8OanfRcJBde/eFwyc9gnARP1cT1HfkAa
         +dGndX2J0bvdJHAt8k3WIoXsqWZkWUZvLmx0Hs6G91FioiJjx1C24KnPUi2EkpgTOigM
         s/05Mju9uwxEaVepB+GuX4zsySpOzMZoltYS6SAShc1j9d2p9d0V8iehk7APlORNeEKA
         i/0ZJQwunnjzLX6irb3rj6WNH70TpJVZSw8SE5NyfzsJ8h6J+gkRmViz8ri1tOvFAWSs
         zTwg==
X-Forwarded-Encrypted: i=1; AKwUvBwMoGRgP9NZCEK89KMy/fZRn9NktLXgWO1GQhT7EJk7XQ08I0DiP/fsUgl8fvTHHDAMQY6XYQhztVmV@vger.kernel.org
X-Gm-Message-State: AFq9FYJB+rl1BbzhTE69nk9/k6D9lw4+3rN1j8cYOOz8JKjHhftEumsd
	Y6CH9S/8U0XXF/TyJsVqfuVvaugJxwg59LX6t3oIYdxGe5iZCku1RSNR1u2fi0g2G6+QULz0LNx
	R3DQzjn/rCdLmiPg0gWXoL85B34q7vKE=
X-Gm-Gg: AYBFou1XVN0hMmF71XVv4LpBWFdHbyLJZZyWJdIAH2tUdZrL29yCI8wyjeeZVdj9D9V
	BcGhMDld/GgSmnxioRLUy8K5zNA7R6H0nnh8T5sF4uY5hzvhjbzd7UAtOG/BxnDsU8r2CpXIwU7
	K/sEXaaHXzgXEuvKE7RHe3iPhZDxbi5uMNblN/SFCc87FdjfmOhUM+6nLwFI37mJYpfeUP9KVoS
	/zPhLrFju6Fgn1UHMvg/FlwGRRR8uIMyjdjLr0ZRgOLsJ2b/0RapbS7qga+CzeIIkqed36NUEbp
	KdhzvOIo8o6Qjkp16kX+Ft8GjfUkv/iZ3VI+Vf/pJU7HqLgf5oTDLu0Y20HlIGeKy3O7/fTAfiP
	EtApD+yeOnW/QmQ==
X-Received: by 2002:a05:7301:2603:b0:357:ee29:f26b with SMTP id
 5a478bee46e88-357ee29f829mr7662575eec.35.1791726805858; Sun, 11 Oct 2026
 06:53:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-4-clamor95@gmail.com>
 <5af976ef-6c6d-451f-891f-bc70dd2e8c00@gmail.com>
In-Reply-To: <5af976ef-6c6d-451f-891f-bc70dd2e8c00@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 11 Oct 2026 16:53:14 +0300
X-Gm-Features: AclHuK_cL2EWmtIMQIhuN84cy3C23mZ8qmT5nBamt5hX-SEzXZhLrLa4TJnduXo
Message-ID: <CAPVz0n3vJXrQrfKvykrCyiSSiET18qos=isWcfg0fp_tGMUK3g@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:2=
6 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > The AAT1270 is quite similar to the AAT1290, but it does not support th=
e
> > Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> > uses an earlier version of AS2C, namely Simple Serial Control, which la=
cks
> > address-sending capabilities.
> >
> > Differentiate the chips by using a description structure with a flag to
> > indicate if AS2C is supported, placing all AS2C-only features under a
> > conditional check.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >   drivers/leds/flash/leds-aat1290.c | 66 ++++++++++++++++++++++--------=
-
> >   1 file changed, 47 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/leds/flash/leds-aat1290.c b/drivers/leds/flash/led=
s-aat1290.c
> > index 49251cfd33509..773cdcc73a9e1 100644
> > --- a/drivers/leds/flash/leds-aat1290.c
> > +++ b/drivers/leds/flash/leds-aat1290.c
> > @@ -43,9 +43,6 @@
> >   #define AAT1290_FLASH_TM_NUM_LEVELS 16
> >   #define AAT1290_MM_CURRENT_SCALE_SIZE       15
> >
> > -#define AAT1290_NAME                 "aat1290"
> > -
> > -
> >   struct aat1290_led_config_data {
> >       /* maximum LED current in movie mode */
> >       u32 max_mm_current;
> > @@ -59,6 +56,13 @@ struct aat1290_led_config_data {
> >       enum led_brightness max_brightness;
> >   };
> >
> > +struct aat1290_led_chip_info {
> > +     /* led controller name */
> > +     const char *name;
> > +     /* Advanced Simple Serial Control support */
> > +     bool as2c;
> > +};
> > +
> >   struct aat1290_led {
> >       /* platform device data */
> >       struct platform_device *pdev;
> > @@ -74,6 +78,10 @@ struct aat1290_led {
> >       struct gpio_desc *gpio_fl_en;
> >       /* EN|SET pin  */
> >       struct gpio_desc *gpio_en_set;
> > +
> > +     /* led controller description */
> > +     const struct aat1290_led_chip_info *info;
> > +
> >       /* movie mode current scale */
> >       int *mm_current_scale;
> >       /* device mode */
> > @@ -101,15 +109,17 @@ static void aat1290_as2cwire_write(struct aat1290=
_led *led, int addr, int value)
> >
> >       udelay(AAT1290_FLEN_OFF_DELAY_TIME_US);
> >
> > -     /* write address */
> > -     for (i =3D 0; i < addr; ++i) {
> > -             udelay(AAT1290_EN_SET_TICK_TIME_US);
> > -             gpiod_direction_output(led->gpio_en_set, 0);
> > -             udelay(AAT1290_EN_SET_TICK_TIME_US);
> > -             gpiod_direction_output(led->gpio_en_set, 1);
> > -     }
> > +     if (led->info->as2c) {
> > +             /* write address */
> > +             for (i =3D 0; i < addr; ++i) {
> > +                     udelay(AAT1290_EN_SET_TICK_TIME_US);
> > +                     gpiod_direction_output(led->gpio_en_set, 0);
> > +                     udelay(AAT1290_EN_SET_TICK_TIME_US);
> > +                     gpiod_direction_output(led->gpio_en_set, 1);
> > +             }
> >
> > -     usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIME_MAX_US=
);
> > +             usleep_range(AAT1290_LATCH_TIME_MIN_US, AAT1290_LATCH_TIM=
E_MAX_US);
> > +     }
> >
> >       /* write data */
> >       for (i =3D 0; i < value; ++i) {
> > @@ -150,16 +160,18 @@ static int aat1290_led_brightness_set(struct led_=
classdev *led_cdev,
> >               led->movie_mode =3D false;
> >       } else {
> >               if (!led->movie_mode) {
> > -                     aat1290_as2cwire_write(led,
> > -                             AAT1290_MM_CURRENT_RATIO_ADDR,
> > -                             AAT1290_MM_TO_FL_1_92);
> > +                     if (led->info->as2c)
> > +                             aat1290_as2cwire_write(led,
> > +                                     AAT1290_MM_CURRENT_RATIO_ADDR,
> > +                                     AAT1290_MM_TO_FL_1_92);
>
> In AAT1270 the Maximum Movie to Flash Mode Current Ratio is constant
> and set to 1/7.3, whereas for AAT1290 we alter it to 1/1.92 here.
>
> This is taken into account while calculating max_mm_current in
> init_mm_current_scale(), where AAT1290_MAX_MM_CURRENT definition is
> used, which is based on AAT1290_MM_TO_FL_RATIO (1000 / 1920).
>
> Obviously it would have to be changed to 1000 / 7300 for AAT1270,
> for the calculations between brightness levels and microamperes for
> V4L2 Flash interface to work properly for this controller.
>
> >                       led->movie_mode =3D true;
> >               }
> >
> >               aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CURRENT_AD=
DR,
> >                               AAT1290_MAX_MM_CURR_PERCENT_0 - brightnes=
s);
> > -             aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CONFIG_ADD=
R,
> > -                             AAT1290_MOVIE_MODE_ON);
> > +             if (led->info->as2c)
> > +                     aat1290_as2cwire_write(led, AAT1290_MOVIE_MODE_CO=
NFIG_ADDR,
> > +                                            AAT1290_MOVIE_MODE_ON);
> >       }
> >
> >       mutex_unlock(&led->lock);
> > @@ -178,7 +190,8 @@ static int aat1290_led_flash_strobe_set(struct led_=
classdev_flash *fled_cdev,
> >       mutex_lock(&led->lock);
> >
> >       if (state) {
> > -             aat1290_set_flash_safety_timer(led, timeout->val);
> > +             if (led->info->as2c)
> > +                     aat1290_set_flash_safety_timer(led, timeout->val)=
;
>
> AAT1290 has the capability of setting flash safety timer timeout, not
> like AAT1270, for which this is controlled solely by the discrete
> elements, basing on the formula T =3D 21.5s/=C2=B5F =C2=B7 CT. This needs=
 to be
> reflected both in the DT bindings and in the
> aat1290_init_flash_timeout(), where the minimum value should be also
> fixed for AAT1270.
>

Thank you for both explanations. I will take then into account while
submitting v2.

>
> >               gpiod_direction_output(led->gpio_fl_en, 1);
> >       } else {
> >               gpiod_direction_output(led->gpio_fl_en, 0);
> > @@ -475,6 +488,10 @@ static int aat1290_led_probe(struct platform_devic=
e *pdev)
> >       fled_cdev->ops =3D &flash_ops;
> >       led_cdev =3D &fled_cdev->led_cdev;
> >
> > +     led->info =3D device_get_match_data(dev);
> > +     if (!led->info)
> > +             return -ENODEV;
> > +
> >       ret =3D aat1290_led_get_configuration(led, &led_cfg, &sub_node);
> >       if (ret < 0)
> >               return ret;
> > @@ -489,7 +506,7 @@ static int aat1290_led_probe(struct platform_device=
 *pdev)
> >       aat1290_init_flash_timeout(led, &led_cfg);
> >
> >       init_data.fwnode =3D of_fwnode_handle(sub_node);
> > -     init_data.devicename =3D AAT1290_NAME;
> > +     init_data.devicename =3D led->info->name;
> >
> >       /* Register LED Flash class device */
> >       ret =3D led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
> > @@ -528,8 +545,19 @@ static void aat1290_led_remove(struct platform_dev=
ice *pdev)
> >       mutex_destroy(&led->lock);
> >   }
> >
> > +static const struct aat1290_led_chip_info aat1290_info =3D {
> > +     .name =3D "aat1290",
> > +     .as2c =3D true,
> > +};
> > +
> > +static const struct aat1290_led_chip_info aat1270_info =3D {
> > +     .name =3D "aat1270",
> > +     .as2c =3D false,
> > +};
> > +
> >   static const struct of_device_id aat1290_led_dt_match[] =3D {
> > -     { .compatible =3D "skyworks,aat1290" },
> > +     { .compatible =3D "skyworks,aat1290", .data =3D &aat1290_info },
> > +     { .compatible =3D "skyworks,aat1270", .data =3D &aat1270_info },
> >       {},
> >   };
> >   MODULE_DEVICE_TABLE(of, aat1290_led_dt_match);
>
> --
> Best regards,
> Jacek Anaszewski
>
