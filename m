Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888938;
	b=aCDE6HzLfP6BFvKFLeSDtm2FqNb3DPqTDGPCX4TyqANLAUpHP9Ppu0MPs6nmRCsdUtk/
	 62U2hS/B4nWptxfSR4+3GA6Iwc9BGYnRYQyBWhrI3funJgNH5Pptbjd0kDbdlAl5/bMT9
	 gwJHHosi78Se+z7+iYGZ4+g2y2nuAOji+8aoYOJeCNzXg0qW7nE0Rg1/r0MuKHB78HQXc
	 CCd91b/Bhoh62dxNiarPnFTBX2wEFz4LTMOGmAAPaED/YLVJijMtFEtB9FImgQOxzdnvd
	 WpIq7mfds2jkaPIPSiRraKOEvm4aAFHj2xnKxVLTviXUYNzwvcC+WcdbtkmprDG2Xew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
	b=W0KaROxEKnBG5fGeV7AeXOGS6ahG7s2tMjNbOMbSPc0vC6d8MdAgXovaudjHM/G64a+9
	 yLBiDdAMK/LjetK8TygnQ743Gkd0YCrp7ZH+fE+BhcJuMNk0nWkZqlTUgbsQomsWUv7qP
	 Xb5v/3DQAYV/NMrSzWCxXBSwypzpV6zhm/UTiHwLX+RktilxDYhI7hwZO2yWI/n0xdfLA
	 8CEMdmGvbZVC7YTLa6mhXWMxj1Epe7iTsHXNIjVIMMm0URlyCbGt4PSJekMocPxZOAM7I
	 I+g2nyvhNSqI1bpYOj1juJkCQNf45HR0CG2wnUj9xTHvf5aLhmJqjizQHqdT0HIM0Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="QhC9a/3D";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FEA606A329
	for <linux-leds@vger.kernel.org>; Thu,  5 Nov 2026 14:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FEA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhC9a/3D
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c411e139259so217578466b.2
        for <linux-leds@vger.kernel.org>; Thu, 05 Nov 2026 06:28:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888936; cv=none;
        d=google.com; s=arc-20260327;
        b=HfmW/srEP/3JVom8AeXMovnyO+c34gzXq+x/clG2imWePovrUlPoqPca7g4R9IWTrd
         h4cahps1uNYdGleJDFmLVW/3ebQWOqZn8JhgsTrCHo7fUDI9O7fYBJKSRwMGIuj9UUlc
         vdUYF35dwZK3eZCTwEcuzpAQVj11eQR0zoKAJ5gdPMVdHOnBw02x8MtlEXz4V29q7ADq
         zYz76v7PdnDz/V1Dp1Byqh3Bs4gEbPChlP2hXBt9rUWDdk3G73QjOp76u+Rw3bwLCPw/
         Jf+TE011ZnDnX7HnpSHlEI5yDandXAce8PwWvjOxK7X1oqAlxEBbpxnfFF2KEJ0Mqzwx
         VWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        fh=XcC4+iIBpQggOYT0WYvCki3150c9WxqV/pY/7UmJpMM=;
        b=cka1GVHiqfNwIOEgl1Yp4U32hxsF2UURtvp/TLynrS3fEqE8RhjpZUX+BYEyGf0C0R
         r34p+P1VWMqGIqkRUmELtGdCQI4DDBnnZ5OTq0Hfw2KrXRv0gTG9hcDT3oWDkf6aZ1mO
         cUdEnbn3kw03WT+e07CifOpuP15faWjlZXrMqvBTjt7qRvqsncX1we2AsVSQCgvnJCgh
         Jw1Oo6tgPv+Ci4ctqa6jUFwDlcJn+LCbOwhzkiig2LnY1wKvqVdjP6arDnMqnsAjJr5m
         0jRX53q/T/YmvYTQEIt5en05P3ZSbOFYJezkIB9E7FzVqynQ+abXhhTEO38VluK52IXq
         gtWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793888936; x=1794493736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        b=QhC9a/3DtrgIoHIToyBwin+94OJwgACUNd/QUrZaPTI7NA9KSLe948sblTu4B+wrHz
         XDQ61kxk3bQTRZqNXy33zXhYW2Uw2A1f/uYKuDcz/bGRGypiyTeC+u7ARkngV6pJbfIo
         bZLaj3QXAzuJaXm24rHkKAwSTTONWmwEoNrUASjLUSqfCYw9fS75sHcth+kLMcadnbN+
         FyELI/3d6cLkJ2XtZ4E2SfFj9eVzDtT0UEGPIUT5FvDevJ1BE7Dv6iGuaoIdhD1f6EQ8
         xUDorTwy/IfpHTsAkjTh6z0qoeYD1Zt53JFF1uZZD/Ib5WJEN9tjo7NdmZ2t8doDW5RK
         edxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888936; x=1794493736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jM7yD+UvZhCvYafkuTtfLIsJ/x+7XGZ5ALQNkyFmFdc=;
        b=M2rCbC3IjAwIv0kTNuo4QxbdwzmT70z8MCjDT3sN42Xz93C2LjlWf6q/owlBfQIp7T
         2nEAfGaxs4Q1CT/MJwwJJ2ZmtaZAUhmRxAt52Zt7+ctsmm262XGfPz12ecHNBGw5r314
         5gxEi9C3GYTmKCv/ZGrrDF743jvFL4b814hta+8mZyIjIcPO21eApjhEWyl2kdTLwzBu
         /wlYYTLEZpaYEWwxU0EGUT9k4yTLGLtLF/DHigqQMsHnTjUTTWi1DyIa9M7c5emNjOZF
         ZpyPyCLLHsUgk1NApqmNRecHyj60w98qWXk4FgvuVQDG7KIE19F0PxcaR32tH1xn86Zq
         ngIw==
X-Forwarded-Encrypted: i=1; AKwUvBxMqTSS0URpFb4eGtyriF395zmvIgLuwKSzswGxpkPitjsE1AH0cdfAHNLbzKOlr0de3TQv8pQ7/zGJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/OiQUrU2wEwRW5OfQfReus2TPVnxF0XlZhN57V2cTSor0LsXJ7
	VyW4aiy5gPQ719je1++1R6Frkrsxp7KcEEsuQndiBjj7ppwbF7TFVsseHeZlEzyPE6RlGdigwA1
	SCWnOa/vUg/e6fOyExJ2MQ2HphqFXBt4=
X-Gm-Gg: AYBFou08GvnxbqmTtptLcDveW90W7AaNjf2CCXqGHJnUmrP+0F/b7CfT+jYS+PeA7gf
	K4Tf8kQpDA3IYG7tkdgtD/ocFqjwG14s8W6fEPIsDeZOrJFbFMb2GCNKLVFnC5vXYax+aFMacBV
	0Gc0dwNWL2nMp1v7LnpocQ2ba0wh1qsTLPmlnCS0NE1qS/h3VInvINsxPAoRKkdR3bT2MJgWWmt
	i1Nb6mpgfHNl37rBZh2JkUbMq6n2UEFP9rMPtgIwZG3MQG0ApQBJTqk4e44LlNnzXFKwR4/7992
	85gGpr6oSAOOxVhdJ654N5JYs85RrM4MCYpaE59PrgnqWUy+0gpv4NTikoGXwDD4BZLS5+7PSCU
	LV2mXYzn9dXzO045u20O8fSqAC93qMXFiqIpbXYOahN93gz4kckX5DeNNJlhi/FHtc9SYnamSJd
	o/QPfUqCxj9bJ+pLna6beZYL3Yi50UFtYQxhKw1ElVlJC7P9oofH0=
X-Received: by 2002:a17:906:b10f:b0:c4c:f85f:aa2b with SMTP id
 a640c23a62f3a-c4cf85fb079mr528297866b.24.1793888935580; Thu, 05 Nov 2026
 06:28:55 -0800 (PST)
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
 <CAPVz0n3tR8R5xe_F20kChnHHrWG40o7prwY6kCYXM-UtYPFKLQ@mail.gmail.com> <20261105140843.GK1650678@google.com>
In-Reply-To: <20261105140843.GK1650678@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 5 Nov 2026 16:28:42 +0200
X-Gm-Features: AclHuK-5D29V0k3q5Pq6uMwZ9kKLHCkv3_XM79rEU9L5CC_QQ2cj_fenaRjE_co
Message-ID: <CAPVz0n0dqrJa5ih8pcgRpxG3e3rBrBr2AkAoNY=dwq8LJcj77w@mail.gmail.com>
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 5 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:08=
 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 04 Nov 2026, Svyatoslav Ryhel wrote:
>
> > =D1=81=D1=80, 4 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
7:16 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > --- checkpatch.pl (1 issue) ---
> > > Line 38: WARNING: please write a help paragraph that fully describes =
the config symbol with at least 4 lines
> > > ----------------------------------
> > >
> > > On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:
> > >
> > > > Add a small driver to control the LED cell provided by the MAX8907 =
PMIC.
> > > > The LED does not require any specific configuration and is folded i=
nto the
> > > > PMIC's node.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - rebased so patch is now applicable to linux/next
> > > >
> > > > Changes in v3:
> > > > - added check if led is off for get callback
> > > > - added dedicated MAX8907_REG_WLED_MODE_ON mask
> > > > - switched to devm_led_classdev_register_ext
> > > >
> > > > Changes in v4:
> > > > - platform_set_drvdata dropped
> > > > - init_data.devicename dropped
> > > > - added MODULE_ALIAS
> > > > ---
> > > >  drivers/leds/Kconfig        |  7 +++
> > > >  drivers/leds/Makefile       |  1 +
> > > >  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++=
++++
> > > >  drivers/mfd/max8907.c       |  1 +
> > > >  include/linux/mfd/max8907.h |  2 +-
> > > >  5 files changed, 100 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/leds/leds-max8907.c
> > > >
> > > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > > index 788e689fe875c..3796c562919fe 100644
> > > > --- a/drivers/leds/Kconfig
> > > > +++ b/drivers/leds/Kconfig
> > > > @@ -813,6 +813,13 @@ config LEDS_MAX77705
> > > >       help
> > > >         LED driver for MAX77705 PMIC from Maxim Integrated.
> > > >
> > > > +config LEDS_MAX8907
> > > > +     tristate "LED support for MAX8907 PMIC"
> > > > +     depends on LEDS_CLASS && MFD_MAX8907
> > > > +     help
> > > > +       This option enables support for on-chip LED drivers on
> > > > +       MAXIM MAX8907 PMIC.
> > >
> > > As requested on v3, please expand this help text to at least 4 lines =
to satisfy
> > > 'checkpatch.pl'.
> > >
> > > > +
> > > >  config LEDS_MAX8997
> > > >       tristate "LED support for MAX8997 PMIC"
> > > >       depends on LEDS_CLASS && MFD_MAX8997
> > > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > > index 3da746279bb81..24efda3fbaa44 100644
> > > > --- a/drivers/leds/Makefile
> > > > +++ b/drivers/leds/Makefile
> > > > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)          +=3D leds-ltc=
3220.o
> > > >  obj-$(CONFIG_LEDS_MAX5970)           +=3D leds-max5970.o
> > > >  obj-$(CONFIG_LEDS_MAX77650)          +=3D leds-max77650.o
> > > >  obj-$(CONFIG_LEDS_MAX77705)          +=3D leds-max77705.o
> > > > +obj-$(CONFIG_LEDS_MAX8907)           +=3D leds-max8907.o
> > > >  obj-$(CONFIG_LEDS_MAX8997)           +=3D leds-max8997.o
> > > >  obj-$(CONFIG_LEDS_MC13783)           +=3D leds-mc13783.o
> > > >  obj-$(CONFIG_LEDS_MENF21BMC)         +=3D leds-menf21bmc.o
> > > > diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max890=
7.c
> > > > new file mode 100644
> > > > index 0000000000000..a5c445f75d1b1
> > > > --- /dev/null
> > > > +++ b/drivers/leds/leds-max8907.c
> > > > @@ -0,0 +1,90 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-only
> > > > +
> > > > +#include <linux/err.h>
> > > > +#include <linux/leds.h>
> > > > +#include <linux/mfd/max8907.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/property.h>
> > > > +#include <linux/regmap.h>
> > > > +
> > > > +#define MAX8907_REG_WLED_MODE_ON     BIT(0)
> > > > +
> > > > +struct max8907_led_data {
> > > > +     struct max8907 *max8907;
> > >
> > > As asked on v3, what is 'max8907' used for?
> > >
> > > > +     struct regmap *regmap;
> > > > +     struct led_classdev cdev;
> > > > +};
> > > > +
> > > > +static enum led_brightness max8907_led_get_brightness(struct led_c=
lassdev *cdev)
> > > > +{
> > > > +     struct max8907_led_data *ddata =3D container_of(cdev, struct =
max8907_led_data, cdev);
> > > > +     unsigned int brightness_lvl;
> > > > +     int ret;
> > > > +
> > > > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL=
, &brightness_lvl);
> > > > +     if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> > > > +             return LED_OFF;
> > > > +
> > > > +     ret =3D regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &br=
ightness_lvl);
> > > > +     if (ret)
> > > > +             return LED_OFF;
> > > > +
> > > > +     return brightness_lvl;
> > > > +}
> > > > +
> > > > +static int max8907_led_set_brightness(struct led_classdev *cdev,
> > > > +                                   enum led_brightness brightness)
> > > > +{
> > > > +     struct max8907_led_data *ddata =3D container_of(cdev, struct =
max8907_led_data, cdev);
> > > > +     int brightness_lvl, ret;
> > > > +
> > > > +     brightness_lvl =3D clamp(brightness, LED_OFF, LED_FULL);
> > > > +
> > > > +     if (brightness_lvl) {
> > > > +             ret =3D regmap_write(ddata->regmap, MAX8907_REG_WLED_=
CNTL, brightness_lvl);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > > +     return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MOD=
E_CNTL,
> > > > +                               MAX8907_REG_WLED_MODE_ON,
> > > > +                               brightness_lvl ? MAX8907_REG_WLED_M=
ODE_ON : 0);
> > > > +}
> > > > +
> > > > +static int max8907_led_probe(struct platform_device *pdev)
> > > > +{
> > > > +     struct device *dev =3D &pdev->dev;
> > > > +     struct max8907 *max8907 =3D dev_get_drvdata(dev->parent);
> > > > +     struct led_init_data init_data =3D { };
> > > > +     struct max8907_led_data *ddata;
> > > > +
> > > > +     ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > > > +     if (!ddata)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     ddata->max8907 =3D max8907;
> > > > +     ddata->regmap =3D max8907->regmap_gen;
> > > > +
> > > > +     init_data.fwnode =3D dev_fwnode(dev->parent);
> > >
> > > This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.
> > >
> > > Since there is no child node, why not set 'ddata->cdev.name' directly
> > > and use 'devm_led_classdev_register()'?
> > >
> >
> > This is required to be able to reference led in the device tree. Since
> > led node is folded into pmic's node, pmic's node is used to bind led.
>
> Right, so you need device_set_node() called in led_classdev_register_ext(=
)
> so fwnode_led_get() can look up the LED via the parent PMIC phandle.
>
> However, passing only 'init_data.fwnode =3D dev_fwnode(dev->parent)' into
> led_compose_name() when the parent PMIC node has no 'label', 'function'
> or 'color' properties causes it to fall through to:
>
>     } else if (is_of_node(fwnode)) {
>         n =3D snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
>                  to_of_node(fwnode)->name);
>
> Which registers the LED in sysfs as '/sys/class/leds/pmic' (and fails
> with -EINVAL if 'fwnode' is NULL on non-DT platforms).
>
> To bind the parent fwnode while avoiding the node-name fallback, please
> also populate 'devicename' and 'default_label' (similar to
> drivers/leds/leds-tps6105x.c):
>
>     init_data.fwnode =3D dev_fwnode(dev->parent);
>     init_data.devicename =3D "max8907";
>     init_data.default_label =3D ":wled"; /* or "white:backlight" */
>

Thank you for your suggestion. I was tinkering a bit and got to
conclusion that adding dedicated LED node will be beneficial.

My idea is to add led node without compatible (since it is redundant,
pmic has only a single led anyway).

Driver will check for this node and return -ENODEV if node is not present.

Then I will use devm_led_classdev_register_ext but will pass led node
and then most of your concerns should be addressed. What do you think
about this?

As a prerequisite, this change would require
https://lore.kernel.org/lkml/20261027114634.79706-1-clamor95@gmail.com/

I have answered your concerns regarding Sashiko finding.

> --
> Lee Jones
