From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 1/5] leds: leds-mc13783: Add MC34708 LED support
Date: Mon, 16 Dec 2013 11:51:28 -0800
Message-ID: <CAK5ve-JZoECYYwefKVRFgf6tXzr1hOtPtQatk2FcYyqNc7-npQ@mail.gmail.com>
References: <1387018850-6974-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:47190 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754989Ab3LPTvu convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 16 Dec 2013 14:51:50 -0500
Received: by mail-lb0-f181.google.com with SMTP id q8so1042226lbi.26
        for <linux-leds@vger.kernel.org>; Mon, 16 Dec 2013 11:51:49 -0800 (PST)
In-Reply-To: <1387018850-6974-1-git-send-email-shc_work@mail.ru>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Philippe Retornaz <philippe.retornaz@epfl.ch>

On Sat, Dec 14, 2013 at 3:00 AM, Alexander Shiyan <shc_work@mail.ru> wr=
ote:
> This patch adds support for two LEDs on MC34708 PMIC.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>  drivers/leds/Kconfig        |  2 +-
>  drivers/leds/leds-mc13783.c | 98 ++++++++++++++++++++++-------------=
----------
>  include/linux/mfd/mc13xxx.h |  6 +++
>  3 files changed, 55 insertions(+), 51 deletions(-)
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6e3ca59..9c719fd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -413,7 +413,7 @@ config LEDS_MC13783
>         depends on MFD_MC13XXX
>         help
>           This option enable support for on-chip LED drivers found
> -         on Freescale Semiconductor MC13783/MC13892 PMIC.
> +         on Freescale Semiconductor MC13783/MC13892/MC34708 PMIC.
>
>  config LEDS_NS2
>         tristate "LED support for Network Space v2 GPIO LEDs"
> diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.=
c
> index ca87a1b..e61bdb5 100644
> --- a/drivers/leds/leds-mc13783.c
> +++ b/drivers/leds/leds-mc13783.c
> @@ -1,5 +1,5 @@
>  /*
> - * LEDs driver for Freescale MC13783/MC13892
> + * LEDs driver for Freescale MC13783/MC13892/MC34708
>   *
>   * Copyright (C) 2010 Philippe R=E9tornaz
>   *
> @@ -23,23 +23,23 @@
>  #include <linux/workqueue.h>
>  #include <linux/mfd/mc13xxx.h>
>
> -#define MC13XXX_REG_LED_CONTROL(x)     (51 + (x))
> -
>  struct mc13xxx_led_devtype {
>         int     led_min;
>         int     led_max;
>         int     num_regs;
> +       u32     ledctrl_base;
>  };
>
>  struct mc13xxx_led {
>         struct led_classdev     cdev;
>         struct work_struct      work;
> -       struct mc13xxx          *master;
>         enum led_brightness     new_brightness;
>         int                     id;
> +       struct mc13xxx_leds     *leds;
>  };
>
>  struct mc13xxx_leds {
> +       struct mc13xxx                  *master;
>         struct mc13xxx_led_devtype      *devtype;
>         int                             num_leds;
>         struct mc13xxx_led              led[0];
> @@ -48,24 +48,15 @@ struct mc13xxx_leds {
>  static void mc13xxx_led_work(struct work_struct *work)
>  {
>         struct mc13xxx_led *led =3D container_of(work, struct mc13xxx=
_led, work);
> -       int reg, mask, value, bank, off, shift;
> +       struct mc13xxx_leds *leds =3D led->leds;
> +       unsigned int reg, mask, value, bank, off, shift;
>
>         switch (led->id) {
>         case MC13783_LED_MD:
> -               reg =3D MC13XXX_REG_LED_CONTROL(2);
> -               shift =3D 9;
> -               mask =3D 0x0f;
> -               value =3D led->new_brightness >> 4;
> -               break;
>         case MC13783_LED_AD:
> -               reg =3D MC13XXX_REG_LED_CONTROL(2);
> -               shift =3D 13;
> -               mask =3D 0x0f;
> -               value =3D led->new_brightness >> 4;
> -               break;
>         case MC13783_LED_KP:
> -               reg =3D MC13XXX_REG_LED_CONTROL(2);
> -               shift =3D 17;
> +               reg =3D 2;
> +               shift =3D 9 + (led->id - MC13783_LED_MD) * 4;
>                 mask =3D 0x0f;
>                 value =3D led->new_brightness >> 4;
>                 break;
> @@ -80,26 +71,16 @@ static void mc13xxx_led_work(struct work_struct *=
work)
>         case MC13783_LED_B3:
>                 off =3D led->id - MC13783_LED_R1;
>                 bank =3D off / 3;
> -               reg =3D MC13XXX_REG_LED_CONTROL(3) + bank;
> +               reg =3D 3 + bank;
>                 shift =3D (off - bank * 3) * 5 + 6;
>                 value =3D led->new_brightness >> 3;
>                 mask =3D 0x1f;
>                 break;
>         case MC13892_LED_MD:
> -               reg =3D MC13XXX_REG_LED_CONTROL(0);
> -               shift =3D 3;
> -               mask =3D 0x3f;
> -               value =3D led->new_brightness >> 2;
> -               break;
>         case MC13892_LED_AD:
> -               reg =3D MC13XXX_REG_LED_CONTROL(0);
> -               shift =3D 15;
> -               mask =3D 0x3f;
> -               value =3D led->new_brightness >> 2;
> -               break;
>         case MC13892_LED_KP:
> -               reg =3D MC13XXX_REG_LED_CONTROL(1);
> -               shift =3D 3;
> +               reg =3D (led->id - MC13892_LED_MD) / 2;
> +               shift =3D 3 + (led->id - MC13892_LED_MD) * 12;
>                 mask =3D 0x3f;
>                 value =3D led->new_brightness >> 2;
>                 break;
> @@ -108,16 +89,24 @@ static void mc13xxx_led_work(struct work_struct =
*work)
>         case MC13892_LED_B:
>                 off =3D led->id - MC13892_LED_R;
>                 bank =3D off / 2;
> -               reg =3D MC13XXX_REG_LED_CONTROL(2) + bank;
> +               reg =3D 2 + bank;
>                 shift =3D (off - bank * 2) * 12 + 3;
>                 value =3D led->new_brightness >> 2;
>                 mask =3D 0x3f;
>                 break;
> +       case MC34708_LED_R:
> +       case MC34708_LED_G:
> +               reg =3D 0;
> +               shift =3D 3 + (led->id - MC34708_LED_R) * 12;
> +               value =3D led->new_brightness >> 2;
> +               mask =3D 0x3f;
> +               break;
>         default:
>                 BUG();
>         }
>
> -       mc13xxx_reg_rmw(led->master, reg, mask << shift, value << shi=
ft);
> +       mc13xxx_reg_rmw(leds->master, leds->devtype->ledctrl_base + r=
eg,
> +                       mask << shift, value << shift);
>  }
>
>  static void mc13xxx_led_set(struct led_classdev *led_cdev,
> @@ -132,16 +121,17 @@ static void mc13xxx_led_set(struct led_classdev=
 *led_cdev,
>
>  static int __init mc13xxx_led_probe(struct platform_device *pdev)
>  {
> -       struct mc13xxx_leds_platform_data *pdata =3D dev_get_platdata=
(&pdev->dev);
> -       struct mc13xxx *mcdev =3D dev_get_drvdata(pdev->dev.parent);
> +       struct device *dev =3D &pdev->dev;
> +       struct mc13xxx_leds_platform_data *pdata =3D dev_get_platdata=
(dev);
> +       struct mc13xxx *mcdev =3D dev_get_drvdata(dev->parent);
>         struct mc13xxx_led_devtype *devtype =3D
>                 (struct mc13xxx_led_devtype *)pdev->id_entry->driver_=
data;
>         struct mc13xxx_leds *leds;
>         int i, id, num_leds, ret =3D -ENODATA;
> -       u32 reg, init_led =3D 0;
> +       u32 init_led =3D 0;
>
>         if (!pdata) {
> -               dev_err(&pdev->dev, "Missing platform data\n");
> +               dev_err(dev, "Missing platform data\n");
>                 return -ENODEV;
>         }
>
> @@ -149,23 +139,23 @@ static int __init mc13xxx_led_probe(struct plat=
form_device *pdev)
>
>         if ((num_leds < 1) ||
>             (num_leds > (devtype->led_max - devtype->led_min + 1))) {
> -               dev_err(&pdev->dev, "Invalid LED count %d\n", num_led=
s);
> +               dev_err(dev, "Invalid LED count %d\n", num_leds);
>                 return -EINVAL;
>         }
>
> -       leds =3D devm_kzalloc(&pdev->dev, num_leds * sizeof(struct mc=
13xxx_led) +
> +       leds =3D devm_kzalloc(dev, num_leds * sizeof(struct mc13xxx_l=
ed) +
>                             sizeof(struct mc13xxx_leds), GFP_KERNEL);
>         if (!leds)
>                 return -ENOMEM;
>
>         leds->devtype =3D devtype;
>         leds->num_leds =3D num_leds;
> +       leds->master =3D mcdev;
>         platform_set_drvdata(pdev, leds);
>
>         for (i =3D 0; i < devtype->num_regs; i++) {
> -               reg =3D pdata->led_control[i];
> -               WARN_ON(reg >=3D (1 << 24));
> -               ret =3D mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONT=
ROL(i), reg);
> +               ret =3D mc13xxx_reg_write(mcdev, leds->devtype->ledct=
rl_base + i,
> +                                       pdata->led_control[i]);
>                 if (ret)
>                         return ret;
>         }
> @@ -180,19 +170,18 @@ static int __init mc13xxx_led_probe(struct plat=
form_device *pdev)
>                 trig =3D pdata->led[i].default_trigger;
>
>                 if ((id > devtype->led_max) || (id < devtype->led_min=
)) {
> -                       dev_err(&pdev->dev, "Invalid ID %i\n", id);
> +                       dev_err(dev, "Invalid ID %i\n", id);
>                         break;
>                 }
>
>                 if (init_led & (1 << id)) {
> -                       dev_warn(&pdev->dev,
> -                                "LED %i already initialized\n", id);
> +                       dev_warn(dev, "LED %i already initialized\n",=
 id);
>                         break;
>                 }
>
>                 init_led |=3D 1 << id;
>                 leds->led[i].id =3D id;
> -               leds->led[i].master =3D mcdev;
> +               leds->led[i].leds =3D leds;
>                 leds->led[i].cdev.name =3D name;
>                 leds->led[i].cdev.default_trigger =3D trig;
>                 leds->led[i].cdev.brightness_set =3D mc13xxx_led_set;
> @@ -200,10 +189,9 @@ static int __init mc13xxx_led_probe(struct platf=
orm_device *pdev)
>
>                 INIT_WORK(&leds->led[i].work, mc13xxx_led_work);
>
> -               ret =3D led_classdev_register(pdev->dev.parent,
> -                                           &leds->led[i].cdev);
> +               ret =3D led_classdev_register(dev, &leds->led[i].cdev=
);

Is this correct changing? I think it should be
ret =3D led_classdev_register(dev->parent, &leds->led[i].cdev);

Besides this, this patch is good to me.

Thanks,
-Bryan

>                 if (ret) {
> -                       dev_err(&pdev->dev, "Failed to register LED %=
i\n", id);
> +                       dev_err(dev, "Failed to register LED %i\n", i=
d);
>                         break;
>                 }
>         }
> @@ -219,8 +207,8 @@ static int __init mc13xxx_led_probe(struct platfo=
rm_device *pdev)
>
>  static int mc13xxx_led_remove(struct platform_device *pdev)
>  {
> -       struct mc13xxx *mcdev =3D dev_get_drvdata(pdev->dev.parent);
>         struct mc13xxx_leds *leds =3D platform_get_drvdata(pdev);
> +       struct mc13xxx *mcdev =3D leds->master;
>         int i;
>
>         for (i =3D 0; i < leds->num_leds; i++) {
> @@ -229,7 +217,7 @@ static int mc13xxx_led_remove(struct platform_dev=
ice *pdev)
>         }
>
>         for (i =3D 0; i < leds->devtype->num_regs; i++)
> -               mc13xxx_reg_write(mcdev, MC13XXX_REG_LED_CONTROL(i), =
0);
> +               mc13xxx_reg_write(mcdev, leds->devtype->ledctrl_base =
+ i, 0);
>
>         return 0;
>  }
> @@ -238,17 +226,27 @@ static const struct mc13xxx_led_devtype mc13783=
_led_devtype =3D {
>         .led_min        =3D MC13783_LED_MD,
>         .led_max        =3D MC13783_LED_B3,
>         .num_regs       =3D 6,
> +       .ledctrl_base   =3D 51,
>  };
>
>  static const struct mc13xxx_led_devtype mc13892_led_devtype =3D {
>         .led_min        =3D MC13892_LED_MD,
>         .led_max        =3D MC13892_LED_B,
>         .num_regs       =3D 4,
> +       .ledctrl_base   =3D 51,
> +};
> +
> +static const struct mc13xxx_led_devtype mc34708_led_devtype =3D {
> +       .led_min        =3D MC34708_LED_R,
> +       .led_max        =3D MC34708_LED_G,
> +       .num_regs       =3D 1,
> +       .ledctrl_base   =3D 54,
>  };
>
>  static const struct platform_device_id mc13xxx_led_id_table[] =3D {
>         { "mc13783-led", (kernel_ulong_t)&mc13783_led_devtype, },
>         { "mc13892-led", (kernel_ulong_t)&mc13892_led_devtype, },
> +       { "mc34708-led", (kernel_ulong_t)&mc34708_led_devtype, },
>         { }
>  };
>  MODULE_DEVICE_TABLE(platform, mc13xxx_led_id_table);
> diff --git a/include/linux/mfd/mc13xxx.h b/include/linux/mfd/mc13xxx.=
h
> index ac22305..f1b13b3 100644
> --- a/include/linux/mfd/mc13xxx.h
> +++ b/include/linux/mfd/mc13xxx.h
> @@ -106,6 +106,9 @@ enum {
>         MC13892_LED_R,
>         MC13892_LED_G,
>         MC13892_LED_B,
> +       /* MC34708 LED IDs */
> +       MC34708_LED_R,
> +       MC34708_LED_G,
>  };
>
>  struct mc13xxx_led_platform_data {
> @@ -165,6 +168,9 @@ struct mc13xxx_leds_platform_data {
>  #define MC13892_LED_C2_CURRENT_G(x)    (((x) & 0x7) << 21)
>  /* MC13892 LED Control 3 */
>  #define MC13892_LED_C3_CURRENT_B(x)    (((x) & 0x7) << 9)
> +/* MC34708 LED Control 0 */
> +#define MC34708_LED_C0_CURRENT_R(x)    (((x) & 0x3) << 9)
> +#define MC34708_LED_C0_CURRENT_G(x)    (((x) & 0x3) << 21)
>         u32 led_control[MAX_LED_CONTROL_REGS];
>  };
>
> --
> 1.8.3.2
>
