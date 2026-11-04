Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793806701;
	b=tceokmAfL36drR69K9rXNlgX3AoJohg/nGjeOgq3gX5zsX/4ZB2PJfkjx6OkjDmapg1i
	 jeqV8P2GtR8k/Z+wt+dnHikCbOROGNfUnA9LdUNHyVBUJ35LJF3BfGYLbVR4Sjq/1AUJ/
	 pYYbpcj6QnJkFp9gGBpnPoxpVf+Ljl0wha0IQAF9CjdedNlBWKIx1+cXgFy1O6f8H+M34
	 aZfNGecZaVEUT6vGGTnVcJAV864o/yt1jTdp/0/ZblblbwDj73n789pCD1WWDFgPyMwAP
	 7zE1wU8zvMAOuG+h3DOR3A9Ep5l4I6Yod15aiArrfDlzWIGtR6OYzwR2FwmomNCyhbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
	b=PfTjqb3mscA7WmwdApoNRpsY0tvHWKf+1JMU1MGcPfd2R6cTAig1Qwb/HVr+sttNu2FM
	 AYeryEO8nGPoxhj5P00a4Ej9Xs5YRe5dht+oOQbbHtxzi6yynZHCuoxsxGaToxYRspK5k
	 uVVK+x5GLCJyLfWtfB6FvBgbXjmTnEa1ann6BlVU2PQcURjM0Uy/fq2KJohKN05+mT/Vq
	 +OYXgVxHJa542sB/jFHpVBwSGEHOghx3mKHBIWLsOlN0qrlXWqvrS8DEcwKahRxi/gqgY
	 twC+/+UvfIpKwjVo+vUx+ro5DLxC1ekGUHYXL0j7988LLkTQ99O7IJ0WbNDmt5kY3NQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OjvWKU/q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9A16082BC9
	for <linux-leds@vger.kernel.org>; Wed,  4 Nov 2026 15:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9A16082BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjvWKU/q
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36dbde64409so163011eec.0
        for <linux-leds@vger.kernel.org>; Wed, 04 Nov 2026 07:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793806700; cv=none;
        d=google.com; s=arc-20260327;
        b=o9mkUNZ72juo68aQvMQaekEl9x5q2oubF63gy1s8m5XEQNVLKBPBObegAWNfDI7UzN
         oE0KwHiplEF4osfjkGYvjH6b36OYtzwsf0GejJqtjCq8GNLVO2pHn0A83uuuDg3TJoZ8
         D+U9KVLpbWeRVztpExDqH1jH1OyDKthjVQhgmOMQEUxK+7Ne7IanQ6luiFLuTYvjA3rN
         Ckx6XgtKOI+l4HgVVBI1x7GPDZai7zy1SEZqOzt/KCOKS8wrJqgXYIMyOJkvkVa4NIcn
         1xmy0UJGKo7q6+JLOFzoXrg/Pi24Q8qlOJL2pYchLNqaHd/IAb8QrqPkbzroGjB5MCwt
         ZJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        fh=LiMb7X7aueCZOMuVrsTfmntqMHX52WhyuDSXR4ZXxaI=;
        b=a08TEaEi2o7FPl/i/u34pf+m9Mcwvjhas6sTy1TUbWJab4C05pBiix3yF48Edjbrnj
         J+dYmrdJsLTrUTm7+smHHXHHBOXxwFw2PLTPVasWhufUP0EgwPzH52tq8fsTvmtWeitA
         igcxQWCKdkdl9Yz51tcmj60mW31SNXPJV4rzz4vhNxV4FbxBJFny5wnccQg1tsvOws5r
         ij2Z0rwR5wQ6jzoCVSrtLj2gec19caAKTpLMAg+lDbZ+OqJMSwH3PSJzcHKZ+G/a4dSl
         QuTI8cxG/qzshNRl8VecwKPTXIfHIcDAuFJEw1KBIB/uPZ+ruKYQvcMdBb5/jdtYSdDV
         SbLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806700; x=1794411500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        b=OjvWKU/q4pxfp/mGXK1kYr39ARcY8peh0he9Efhr9VciXdbd37WvmP5kycL4AcmLkB
         3bi8aE2jzPn1cj6f4u6iuJtmrDmi9pa0Agw0UKqrMRVfw+4+rIE0k9MFoqJZHB8Lrd9a
         5psSEvcU+ob0hVZSYczU5F1itdSjBBc/EdY4J1/7oIi2nA74RBnFhuT6RYEku8d07aRE
         O1g61fB7MqwNG5Nj4kiisZEzyqzu7jc6h3vZNt3xhW615iWKs0Ml4KXyb85hsMaAcc4I
         WLRglTWC3/CrvKxnu7+is0wLwTLGyxit8w8lfps/DCTwpxfkqO6ZVZqMVPzsnyCDW99s
         DBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806700; x=1794411500;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2i3z2vj1Uxqy3IMqNO0xEBq/h1JKdF0l16nhTgr3rU=;
        b=Va3R8OY6HzDxtBFhcuhl8NJeEWJ/X9dqlYG29Phiu0ygEmiB7NwArw0kQC6GH/sH2k
         TM9OZ3TNPoCjddmJ/GHqHin5Iu78IXHmRfTUMrKGrfa7O7ZWYjcR+jZjMiTunzIPfPuE
         VN04V2mMLdgHkPX4HzJ4Gh8a1jEktC80Ii5oQHNLuyvSywiqTL7vZycjH+8J9+VsUvLC
         8E7++bDhIC+AL5tZEBoUt1eqm8l6tc4du6lIQPcyLv6ZGtZVBW87b5wx7ekm7xVmHkQv
         MoSJAHCobz0QsnaQ30gId8AKUmCjMZQ8hPsqUveyiTP12oni4H915vJqFLcdxWiSfi4x
         XjjA==
X-Forwarded-Encrypted: i=1; AKwUvBzbfjJ7UGo6COdymn1HCDfb+juRe7v3+n/dnhsMjycSUB0J6rFz0timgIjdcpihKVFQjXMVls7WNW/l@vger.kernel.org
X-Gm-Message-State: APuU4Z9SDF01EU+NWiqulYQ3zFd+OXJe2TO6t6/toBIL88PzH8x4Wdb3
	2dGMgnBu1JHq+WEeCdo7Bps9SSCaSQ56uooI9CdWfgqnBVARKBVRSs1/C8bn5ebVVBeWd7iAuQG
	GEDROgBWbQpn8UEjn5sYSykTGJxJ+BDmHjDGw
X-Gm-Gg: AYBFou0WNqmSa0XaZeN3o93fvrXI4aS/JR+tSBZ+iWd4SBM8VCQJgKuOzMl0THx6UQA
	bdj6niU9MKj4AUXVFJKtDU1va3VzKyXt+ETSTU5WeSRZtOQkw3LRhgFjiRAL63pruvs4CF+zgS1
	BCa2WNfU59MhTadL0pPOU5u4O+JspxKo+9ZATiyLjCh6liLOoqq8BmfsQsQNZkIPQ7mf0CpBsHi
	Kl9sRmPHWYED+yAUIkezvlziUMpvDPISrvaDzWLZ7/1BwVz3sXF4R2WYm2yIXx/09iH4DGR/uSU
	KornnH2dVolwdIMjAiH2IfoKbLo+YRdJgF26jiKDpAEzsOIjnidlVtAHQ8ulAeFeq7b93QrBrNs
	ah3WgU/CmKFFGa8Vg0aDW9cO1geYWjkhVc8Y/yyDasWa7/L3/NI38PzzGxLZvgL7zPV02hmYJrU
	W6LqUZLEdnuMePXLg=
X-Received: by 2002:a05:7301:715:b0:369:f41e:d2dd with SMTP id
 5a478bee46e88-36a4241b18amr24074791eec.31.1793806700155; Wed, 04 Nov 2026
 07:38:20 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027115006.86032-1-clamor95@gmail.com> <179318844110.3606039.5801345229436270811@kernel.org>
In-Reply-To: <179318844110.3606039.5801345229436270811@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 4 Nov 2026 17:38:07 +0200
X-Gm-Features: AclHuK9cSaRNIpy-1KTZ4JvVgFogvZS7HZFHVxjMuvwtP6PF9TF7v6QwxfJ1f4w
Message-ID: <CAPVz0n05rXtBJzPZo4k9=ns52n10rAKpW83gbwpQwZQW3i-u6Q@mail.gmail.com>
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 17:16=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> --- checkpatch.pl (1 issue) ---
> Line 38: WARNING: please write a help paragraph that fully describes the =
config symbol with at least 4 lines
> ----------------------------------
>
> On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:
>
> > Add a small driver to control the LED cell provided by the MAX8907 PMIC=
.
> > The LED does not require any specific configuration and is folded into =
the
> > PMIC's node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> > Changes in v2:
> > - rebased so patch is now applicable to linux/next
> >
> > Changes in v3:
> > - added check if led is off for get callback
> > - added dedicated MAX8907_REG_WLED_MODE_ON mask
> > - switched to devm_led_classdev_register_ext
> >
> > Changes in v4:
> > - platform_set_drvdata dropped
> > - init_data.devicename dropped
> > - added MODULE_ALIAS
> > ---
> >  drivers/leds/Kconfig        |  7 +++
> >  drivers/leds/Makefile       |  1 +
> >  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
> >  drivers/mfd/max8907.c       |  1 +
> >  include/linux/mfd/max8907.h |  2 +-
> >  5 files changed, 100 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/leds/leds-max8907.c
> >
> > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > index 788e689fe875c..3796c562919fe 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -813,6 +813,13 @@ config LEDS_MAX77705
> >       help
> >         LED driver for MAX77705 PMIC from Maxim Integrated.
> >
> > +config LEDS_MAX8907
> > +     tristate "LED support for MAX8907 PMIC"
> > +     depends on LEDS_CLASS && MFD_MAX8907
> > +     help
> > +       This option enables support for on-chip LED drivers on
> > +       MAXIM MAX8907 PMIC.
>
> As requested on v3, please expand this help text to at least 4 lines to s=
atisfy
> 'checkpatch.pl'.
>
> > +
> >  config LEDS_MAX8997
> >       tristate "LED support for MAX8997 PMIC"
> >       depends on LEDS_CLASS && MFD_MAX8997
> > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > index 3da746279bb81..24efda3fbaa44 100644
> > --- a/drivers/leds/Makefile
> > +++ b/drivers/leds/Makefile
> > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)          +=3D leds-ltc3220=
.o
> >  obj-$(CONFIG_LEDS_MAX5970)           +=3D leds-max5970.o
> >  obj-$(CONFIG_LEDS_MAX77650)          +=3D leds-max77650.o
> >  obj-$(CONFIG_LEDS_MAX77705)          +=3D leds-max77705.o
> > +obj-$(CONFIG_LEDS_MAX8907)           +=3D leds-max8907.o
> >  obj-$(CONFIG_LEDS_MAX8997)           +=3D leds-max8997.o
> >  obj-$(CONFIG_LEDS_MC13783)           +=3D leds-mc13783.o
> >  obj-$(CONFIG_LEDS_MENF21BMC)         +=3D leds-menf21bmc.o
> > diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
> > new file mode 100644
> > index 0000000000000..a5c445f75d1b1
> > --- /dev/null
> > +++ b/drivers/leds/leds-max8907.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <linux/err.h>
> > +#include <linux/leds.h>
> > +#include <linux/mfd/max8907.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/regmap.h>
> > +
> > +#define MAX8907_REG_WLED_MODE_ON     BIT(0)
> > +
> > +struct max8907_led_data {
> > +     struct max8907 *max8907;
>
> As asked on v3, what is 'max8907' used for?
>
> > +     struct regmap *regmap;
> > +     struct led_classdev cdev;
> > +};
> > +
> > +static enum led_brightness max8907_led_get_brightness(struct led_class=
dev *cdev)
> > +{
> > +     struct max8907_led_data *ddata =3D container_of(cdev, struct max8=
907_led_data, cdev);
> > +     unsigned int brightness_lvl;
> > +     int ret;
> > +
> > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &b=
rightness_lvl);
> > +     if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> > +             return LED_OFF;
> > +
> > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &bright=
ness_lvl);
> > +     if (ret)
> > +             return LED_OFF;
> > +
> > +     return brightness_lvl;
> > +}
> > +
> > +static int max8907_led_set_brightness(struct led_classdev *cdev,
> > +                                   enum led_brightness brightness)
> > +{
> > +     struct max8907_led_data *ddata =3D container_of(cdev, struct max8=
907_led_data, cdev);
> > +     int brightness_lvl, ret;
> > +
> > +     brightness_lvl =3D clamp(brightness, LED_OFF, LED_FULL);
> > +
> > +     if (brightness_lvl) {
> > +             ret =3D regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL=
, brightness_lvl);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CN=
TL,
> > +                               MAX8907_REG_WLED_MODE_ON,
> > +                               brightness_lvl ? MAX8907_REG_WLED_MODE_=
ON : 0);
> > +}
> > +
> > +static int max8907_led_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> > +     struct led_init_data init_data =3D { };
> > +     struct max8907_led_data *ddata;
> > +
> > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > +     if (!ddata)
> > +             return -ENOMEM;
> > +
> > +     ddata->max8907 =3D max8907;
> > +     ddata->regmap =3D max8907->regmap_gen;
> > +
> > +     init_data.fwnode =3D dev_fwnode(dev->parent);
>
> This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.
>
> Since there is no child node, why not set 'ddata->cdev.name' directly
> and use 'devm_led_classdev_register()'?
>
> > +
> > +     ddata->cdev.brightness =3D LED_OFF;
> > +     ddata->cdev.flags =3D LED_CORE_SUSPENDRESUME;
> > +     ddata->cdev.max_brightness =3D LED_FULL;
> > +
> > +     ddata->cdev.brightness_get =3D max8907_led_get_brightness;
> > +     ddata->cdev.brightness_set_blocking =3D max8907_led_set_brightnes=
s;
> > +
> > +     return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_da=
ta);
> > +}
> > +
> > +static struct platform_driver max8907_led_driver =3D {
> > +     .driver.name =3D "max8907-leds",
>
> Cute.  But please expand.
>
> > +     .probe =3D max8907_led_probe,
> > +};
> > +module_platform_driver(max8907_led_driver);
> > +
> > +MODULE_ALIAS("platform:max8907-leds");
> > +MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
>
> Your name is misspelt here.
>
> > +MODULE_DESCRIPTION("MAX8907 LED driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > index e282dd82ece69..826d7768fd8d0 100644
> > --- a/drivers/mfd/max8907.c
> > +++ b/drivers/mfd/max8907.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/slab.h>
> >
> >  static const struct mfd_cell max8907_cells[] =3D {
> > +     { .name =3D "max8907-leds", },
>
> Separate patch.
>

All valid, but way adding led requires a separate patch? Just to know.

The max8907.h change can be left with leds change? It changes reg name
used by led cell.

> >       { .name =3D "max8907-regulator", },
> >       { .name =3D "max8907-rtc", },
> >  };
> > diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> > index e222250f0cc1e..35b2ede54f856 100644
> > --- a/include/linux/mfd/max8907.h
> > +++ b/include/linux/mfd/max8907.h
> > @@ -112,7 +112,7 @@
> >  #define MAX8907_REG_CHG_IRQ2_MASK    0x81
> >  #define MAX8907_REG_CHG_STAT         0x82
> >  #define MAX8907_REG_WLED_MODE_CNTL   0x84
> > -#define MAX8907_REG_ILED_CNTL                0x84
> > +#define MAX8907_REG_WLED_CNTL                0x85
> >  #define MAX8907_REG_II1RR            0x8E
> >  #define MAX8907_REG_II2RR            0x8F
> >  #define MAX8907_REG_LDOCTL20         0x9C
> > --
> > 2.53.0
> >
> >
>
> --
> Lee Jones
