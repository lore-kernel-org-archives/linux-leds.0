Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5733DD85E
	for <linux-leds@vger.kernel.org>; Thu, 17 Sep 2026 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670565; cv=pass; b=SAzIkzrEtJ/y5JlNO1ZB2Qtp+s68nsEKqoI5DUh1tU6hTRo0qvd3/aY8ghq1O1BXjDZTGYsx3u1omtTHiBPZH7N712Ea9qzoVfDAOuFwzMM0qFYbmeohIhwcoVopJfJmSzsHQF8rF4g7hAcIvHvG+6cH3FZBsam6AcVNnOsdHgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670565; c=relaxed/simple;
	bh=JMRf0ZTJM3GUQwwMh1njEwOOgT5a1lOr41rF94IK2YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OlV8CtXm6M1N4kJLrqRBz+sVL2mS8nkolV/yKrM5oge9btQYi2ePq6C1Gl3EALzDGE0iFZM5yPhsR8pFJA7PVtD0LOoh5TCNTfrcAl04+fLBeZUt5iAVGWwEwWHNJV8ZNw4tDAk4WSGr4nzSdOJuzz/5oGswQSptgHGu5FEItoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGaQdMHv; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGaQdMHv"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so174091566b.3
        for <linux-leds@vger.kernel.org>; Thu, 17 Sep 2026 11:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789670561; cv=none;
        d=google.com; s=arc-20260327;
        b=EHm616X0DnmCZ5zIJjTLM76Z57QQRhilfK/EWb9mj5ZimrxKiCX8DPPoaenSMtQHbL
         thcDt/YqX3G/IicAoZZEl1DpBIIyeL6RRb3nK+eDtRLs1OY7yIbTrnqrHoF8jBvdgopV
         g7czacxSCq2r0vCKuI+NtXepkGwXv9HWBTxCXxd/9V6h5tMNI76r2PUCH6HviUZyqY97
         7syLr2ewHZpZzQlpOh09Gtn2f3MHeQxz3d5wMWnpUaQGAyJK0oMUYBJDCQPV8sSddNGc
         2WDEXcQ+PDZ74dESsoLXRBYfZAEsgJ0Xc3XFv4fmCppUyPXtg1/7tM7h3FjnhSBDNQyv
         vvGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EZ6CCyMW5EpJ0WIYEPAsJIHUnaMhFxTlSShKINu851o=;
        fh=jnNkqSCrfCQPLOq6sceSvoM5+JvuqjgY6Ot4HaOok+E=;
        b=BAz5nhQZxYmUAmgErich/78r95YSKGiPZqsOye17fxI24UIR/2DYS+M/RUv1m2rJlA
         xDr1dDy9TbD4TWt3/03aAlXOo/me0ND82/NFsm7IS09mvY18Ux2/kfc8yaUqx47VuTwH
         F10+Wr8q2WginA0WevYwD4TOokoeFOfZ8jUb+RkOFaBLB+gA1dd0DON0pFrC8bq4bOCz
         NNf4/3/u3U7/nZpPkif7L9kP/lOlsnbMY6bExKAhMDyorN0aKIuUb4CfGI2C5cxjAQCA
         6kD3YIj6b6DEkqIMBrrUkty/JeSdIL1J5G+p/FaMwGjy3z/pmYts0y+y1Pe4F1DiozOF
         3uxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789670561; x=1790275361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EZ6CCyMW5EpJ0WIYEPAsJIHUnaMhFxTlSShKINu851o=;
        b=jGaQdMHvePpwVEL/SY2vyCtTWDHBCuUuDigvl2gbG24961qETj9l4y1AQdedSiW+nt
         WUGA4tWJR/maAZt3X7V7wakrv4t3rRtq/JKDPRRcbWE/ty/NaaOsK7WTTFBvva0oVfAU
         RL85EIgdu1Rib4q9PR72oF4NtXM3zfJfgd0VMZLcbuYBfggAdORxbEy5lM3EN39HWE5t
         lPuEBcTsOxaciLrxzeXVggcWL0W8V4gLODsx6MPeQz+MEhybQbjEq7HFRLth4ePY+CAJ
         6ab4yKrSj65mmi8XNJl9Hfo9r0K8rbwVI98dyDER6WpiBATcfSNLauBTGWhPkJde5NZU
         HAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789670561; x=1790275361;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZ6CCyMW5EpJ0WIYEPAsJIHUnaMhFxTlSShKINu851o=;
        b=ssg5oyG45To0VL8Oon/SBd56MKZs6RPFNAeECAHsikIgZfw+vStIfXC4+CRVBA6zQH
         l7xRuEf5xRzkG1SVLYP20WJnXLF+PAbLaIl/1xo+fYXfibESZwSS+sjIK5zKTGD2czs1
         /WjOWTxewJYuDyrDjHxNwj9lvMkFn5cAB59vFEaTiELMtkdVA/+jfqK034CzxJuLlxhs
         h8tFQwsUctDtjWrVCcMuqNzJnAlHbnSaHP14Ls+56jD+RB0yXPo2tC2XJOR4vo/7oKcW
         nUBxv/ntuJFk0rR0460WIk8bRamkZWlyvKdZ0Qp2Dzk+IGYwlMVumkc46ZikmY9pRexb
         4k+g==
X-Gm-Message-State: AFuF++kzPVdJe2wytKavJYrIYVocbAp4n6aUJeU4xvTJOnRik8fIfQQp
	B92meRZ/GuaaJbK1GHcwS5UwbFuwKxUnTDq2lUhAjKDxdiIG3H/hsyGyifJCF2zQE5GockyPPkB
	7fIRglKc2HrGdHLLyaY3uw4A20vvLHY0=
X-Gm-Gg: AYBFou2GI6NuyzgslMTEkXbwNpFbVUbTQYlaAv1MU2Y6Qc5V5x+f9z+jkz6i+4GkSa6
	snX/W9FIQ1v3DFOP4lkQm5cEyGg2UnSW64Db+HnS13/CuC1XfZRQygNoQ1+hKxXMFy8tu2c743I
	UrtUq/JEm5kC7PrGOiNu6yzspWDxXWQzKZgNDWszalviiTj404/N4Y7zwGb4IP7mn4sxApgTA32
	7Wsrt8dROSHFBGMozJMkG2jyyXlzM7xaL6Dl8KVrSfsH+2tKDUduknMDplsD/V+Jn0qhKAGPJzL
	Jv3b7w3kIcvdaKFGgV+WiuFzXcGPAEDyK4N3E6Qz7vFWcDqeoypsR1GpOIotuqXwmXrxIpedjCn
	gemWTePLwTgwrI7e+CvR+WEi4EO2qF999mYsYszu5APYTGXoi92O/8OpY+fjC8EpbDMl3cCCXPS
	n3fTYZgc/zIVc6jMztZA6vAU7Mki7uJH8lfhmpmZKtvQ7fQjI1ec2Tuei+Yk/ka0Bxfg==
X-Received: by 2002:a17:907:3f1f:b0:c29:4b08:79b with SMTP id
 a640c23a62f3a-c2a15aeb805mr6407966b.31.1789670561159; Thu, 17 Sep 2026
 11:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908053221.29955-1-rosenp@gmail.com> <20260917143317.GL1605367@google.com>
In-Reply-To: <20260917143317.GL1605367@google.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 11:42:29 -0700
X-Gm-Features: AcwNN1VdUMunZA95aUUB2bdwrU2wJ67coCUss_6mZjTPbdcz2kh_oa0d5aXAZ7Q
Message-ID: <CAKxU2N915XivREOOApAKRwNqvMN814Y_k7wJtOXKMKcUwGMJtw@mail.gmail.com>
Subject: Re: [PATCH] leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:33=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 07 Sep 2026, Rosen Penev wrote:
>
> > Convert LED and channel parsing in lpg_add_led() and
> > lpg_parse_channel() from DT-specific helpers to the fwnode API.
> > The probe loop now uses device_for_each_child_node_scoped(),
> > dropping explicit node lifetime handling.
> >
> > Behaviour is unchanged for device tree: fwnode_get_child_node_count()
> > and both child iteration helpers skip unavailable children on OF,
> > and the fwnode handle is passed straight to LED registration.
> >
> > cdev->default_trigger is only assigned when
> > fwnode_property_read_string() succeeds, so an absent
> > linux,default-trigger property no longer yields an uninitialized
> > pointer.
> >
> > Assisted-by: opencode:deepseek-v4-flash-free
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/leds/rgb/leds-qcom-lpg.c | 36 ++++++++++++++++++--------------
> >  1 file changed, 20 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-q=
com-lpg.c
> > index d7d6518de30f..dcc8e6f14c8b 100644
> > --- a/drivers/leds/rgb/leds-qcom-lpg.c
> > +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/nvmem-consumer.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/pwm.h>
> >  #include <linux/regmap.h>
> >  #include <linux/slab.h>
> > @@ -1342,7 +1343,7 @@ static int lpg_add_pwm(struct lpg *lpg)
> >       return ret;
> >  }
> >
> > -static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
> > +static int lpg_parse_channel(struct lpg *lpg, struct fwnode_handle *fw=
,
> >                            struct lpg_channel **channel)
> >  {
> >       struct lpg_channel *chan;
> > @@ -1350,17 +1351,18 @@ static int lpg_parse_channel(struct lpg *lpg, s=
truct device_node *np,
> >       u32 reg;
> >       int ret;
> >
> > -     ret =3D of_property_read_u32(np, "reg", &reg);
> > +     ret =3D fwnode_property_read_u32(fw, "reg", &reg);
> >       if (ret || !reg || reg > lpg->num_channels)
> > -             return dev_err_probe(lpg->dev, -EINVAL, "invalid \"reg\" =
of %pOFn\n", np);
> > +             return dev_err_probe(lpg->dev, -EINVAL,
> > +                                  "invalid \"reg\" of %s\n", fwnode_ge=
t_name(fw));
> >
> >       chan =3D &lpg->channels[reg - 1];
> >       chan->in_use =3D true;
> >
> > -     ret =3D of_property_read_u32(np, "color", &color);
> > +     ret =3D fwnode_property_read_u32(fw, "color", &color);
> >       if (ret < 0 && ret !=3D -EINVAL)
> >               return dev_err_probe(lpg->dev, ret,
> > -                                  "failed to parse \"color\" of %pOF\n=
", np);
> > +                                  "failed to parse \"color\" of %s\n",=
 fwnode_get_name(fw));
> >
> >       chan->color =3D color;
> >
> > @@ -1369,25 +1371,26 @@ static int lpg_parse_channel(struct lpg *lpg, s=
truct device_node *np,
> >       return 0;
> >  }
> >
> > -static int lpg_add_led(struct lpg *lpg, struct device_node *np)
> > +static int lpg_add_led(struct lpg *lpg, struct fwnode_handle *fw)
> >  {
> >       struct led_init_data init_data =3D {};
> >       struct led_classdev *cdev;
> >       struct mc_subled *info;
> >       struct lpg_led *led;
> > +     const char *trigger;
> >       const char *state;
> >       int num_channels;
> >       u32 color =3D 0;
> >       int ret;
> >       int i;
> >
> > -     ret =3D of_property_read_u32(np, "color", &color);
> > +     ret =3D fwnode_property_read_u32(fw, "color", &color);
> >       if (ret < 0 && ret !=3D -EINVAL)
> >               return dev_err_probe(lpg->dev, ret,
> > -                           "failed to parse \"color\" of %pOF\n", np);
> > +                           "failed to parse \"color\" of %s\n", fwnode=
_get_name(fw));
> >
> >       if (color =3D=3D LED_COLOR_ID_RGB || color =3D=3D LED_COLOR_ID_MU=
LTI)
> > -             num_channels =3D of_get_available_child_count(np);
> > +             num_channels =3D fwnode_get_child_node_count(fw);
>
> Are you sure 'fwnode_get_child_node_count()' skips unavailable children? =
 It
> counts all children, whereas 'of_get_available_child_count()' only counte=
d
> available ones.  If there are disabled child nodes, 'led->mcdev.num_color=
s' will
> be larger than the number of populated subleds, leading to uninitialised =
memory
> access in the LED core.  Should we be using 'i' for 'num_colors' instead,=
 or
> counting available nodes properly?

fwnode_get_child_node_count() uses of_get_next_available_child()
through of_fwnode_get_next_child_node().

I could do

 -               led->mcdev.num_colors =3D num_channels;
 +               led->mcdev.num_colors =3D i;

which is just churn anyway.
>
> >       else
> >               num_channels =3D 1;
> >
> > @@ -1403,7 +1406,7 @@ static int lpg_add_led(struct lpg *lpg, struct de=
vice_node *np)
> >               if (!info)
> >                       return -ENOMEM;
> >               i =3D 0;
> > -             for_each_available_child_of_node_scoped(np, child) {
> > +             fwnode_for_each_available_child_node_scoped(fw, child) {
> >                       ret =3D lpg_parse_channel(lpg, child, &led->chann=
els[i]);
> >                       if (ret < 0)
> >                               return ret;
> > @@ -1426,7 +1429,7 @@ static int lpg_add_led(struct lpg *lpg, struct de=
vice_node *np)
> >                       cdev->pattern_clear =3D lpg_pattern_mc_clear;
> >               }
> >       } else {
> > -             ret =3D lpg_parse_channel(lpg, np, &led->channels[0]);
> > +             ret =3D lpg_parse_channel(lpg, fw, &led->channels[0]);
> >               if (ret < 0)
> >                       return ret;
> >
> > @@ -1441,14 +1444,15 @@ static int lpg_add_led(struct lpg *lpg, struct =
device_node *np)
> >               }
> >       }
> >
> > -     cdev->default_trigger =3D of_get_property(np, "linux,default-trig=
ger", NULL);
> > +     if (!fwnode_property_read_string(fw, "linux,default-trigger", &tr=
igger))
> > +             cdev->default_trigger =3D trigger;
> >
> >       if (lpg->lpg_chan_sdam)
> >               cdev->max_brightness =3D PPG_MAX_LED_BRIGHTNESS;
> >       else
> >               cdev->max_brightness =3D LPG_RESOLUTION_9BIT - 1;
> >
> > -     if (!of_property_read_string(np, "default-state", &state) &&
> > +     if (!fwnode_property_read_string(fw, "default-state", &state) &&
> >           !strcmp(state, "on"))
> >               cdev->brightness =3D cdev->max_brightness;
> >       else
> > @@ -1456,7 +1460,7 @@ static int lpg_add_led(struct lpg *lpg, struct de=
vice_node *np)
> >
> >       cdev->brightness_set_blocking(cdev, cdev->brightness);
> >
> > -     init_data.fwnode =3D of_fwnode_handle(np);
> > +     init_data.fwnode =3D fw;
> >
> >       if (color =3D=3D LED_COLOR_ID_RGB || color =3D=3D LED_COLOR_ID_MU=
LTI)
> >               ret =3D devm_led_classdev_multicolor_register_ext(lpg->de=
v, &led->mcdev, &init_data);
> > @@ -1638,8 +1642,8 @@ static int lpg_probe(struct platform_device *pdev=
)
> >       if (ret < 0)
> >               return ret;
> >
> > -     for_each_available_child_of_node_scoped(pdev->dev.of_node, np) {
> > -             ret =3D lpg_add_led(lpg, np);
> > +     device_for_each_child_node_scoped(&pdev->dev, child) {
> > +             ret =3D lpg_add_led(lpg, child);
> >               if (ret)
> >                       return ret;
> >       }
> > --
> > 2.55.0
> >
>
> --
> Lee Jones
