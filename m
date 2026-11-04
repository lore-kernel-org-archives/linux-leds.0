Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808160;
	b=rsUz+ocE1bHSqc7SMtAgEc9b61KdFhvU14iW7s4xDY0H30GPrmCspcuwCZ437DnEszmH
	 rRr27WG3oOnF+Gx2AKSzUoEhvea5loHnz8fSOIB+6MAIycp4PwI8l7WeFXdDRyqrcxnFw
	 Jw0/yAuPBA21aM3M1lI2ilUkPD0ncJ4+3fH2n7+1rXqASbP/TZsvrf+loXe/+dZSCvZ0o
	 z9t5qUOE7X1ENoUT4mTzH83hYn9a5WoV7ntu+D8IbQgrFJz/kUs7GAO6NHUY/rKHoE2Yo
	 hcHUalmw+g8NEJbyWjRWWTIiyxfzfIHyWgDYSPD1MnD2n86RyUpLGaQsEkxGcND+9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808160;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ycwbKwDj/fxHGNkqL7CNY4kveDzFmdd4NptkEEAAK/Q=;
	b=sEjvWRuxeRXDtqC3walvSfg4Bey48bPb0ePL5NApr1oxrxWUBWvc67kq8qcL6PfDWeU/
	 sT4f2K9yqW9RPy3akbFB8T1neJGQmYPcbsQgABWd54/Zy7Ee0O620Du3M0og8f/bA2CbD
	 vsUeq4cN5dBcGOm3ruSgwdrdyMiYu7ns+voMEI5YhfVqbHYATG/SuZLW0bLnHCJZWaGqC
	 4ZqY5lT0Mb3RX2fEv5FkU435QQNEi6FAs6xnlHqRed+gO4FJ1Lte88IIuUXcs8hW8mpL4
	 LPtFUBV3/Z0XYu0gwCqpLV+7ygJvxF6UuFRWiwxYnU3pMz3JQ0XCN9ReLzPe/ZdGxug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkNbG23w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F241606A326;
	Wed,  4 Nov 2026 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kkNbG23w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14E61F000C1;
	Wed,  4 Nov 2026 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808159;
	bh=ycwbKwDj/fxHGNkqL7CNY4kveDzFmdd4NptkEEAAK/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kkNbG23w+udGdBwh3QGFn880qmKgQQXDcx1nIZLBX0P0+0WmCRo0q4Oat8EGC8qS9
	 6VqaVsj2+H33buXlJ3jYwPJvRyGsUMVUKaMO3el5kS5gHbx/lBtT81bZfqFyhEUokc
	 9Q+uc1JXhQzH/6hbNT/SwhmU90JQr/osAsIF4qmsl00FV6kfyASEqq1y7j+M/DXn8T
	 vSbvrL0ev4xw2UW2Pvuq6QZONl3BzEOiRjwfvfS1XvOkoiqqjUFPMDjejZRfypkM7H
	 6jkgvMb+IH87h7FOyTxUmPjg6f5OAIL9dC/mgdgyDTviNsoXF+nMdpWPvc1zFflNt0
	 CRPrJthTW0fvg==
Date: Wed, 4 Nov 2026 16:02:36 +0000
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
Message-ID: <20261104160236.GC1650678@google.com>
References: <20261027115006.86032-1-clamor95@gmail.com>
 <179318844110.3606039.5801345229436270811@kernel.org>
 <CAPVz0n05rXtBJzPZo4k9=ns52n10rAKpW83gbwpQwZQW3i-u6Q@mail.gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n05rXtBJzPZo4k9=ns52n10rAKpW83gbwpQwZQW3i-u6Q@mail.gmail.com>

On Wed, 04 Nov 2026, Svyatoslav Ryhel wrote:

> ср, 4 лист. 2026 р. о 17:16 Lee Jones <lee@kernel.org> пише:
> >
> > --- checkpatch.pl (1 issue) ---
> > Line 38: WARNING: please write a help paragraph that fully describes the config symbol with at least 4 lines
> > ----------------------------------
> >
> > On Tue, 27 Oct 2026, Svyatoslav Ryhel wrote:
> >
> > > Add a small driver to control the LED cell provided by the MAX8907 PMIC.
> > > The LED does not require any specific configuration and is folded into the
> > > PMIC's node.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > > Changes in v2:
> > > - rebased so patch is now applicable to linux/next
> > >
> > > Changes in v3:
> > > - added check if led is off for get callback
> > > - added dedicated MAX8907_REG_WLED_MODE_ON mask
> > > - switched to devm_led_classdev_register_ext
> > >
> > > Changes in v4:
> > > - platform_set_drvdata dropped
> > > - init_data.devicename dropped
> > > - added MODULE_ALIAS
> > > ---
> > >  drivers/leds/Kconfig        |  7 +++
> > >  drivers/leds/Makefile       |  1 +
> > >  drivers/leds/leds-max8907.c | 90 +++++++++++++++++++++++++++++++++++++
> > >  drivers/mfd/max8907.c       |  1 +
> > >  include/linux/mfd/max8907.h |  2 +-
> > >  5 files changed, 100 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/leds/leds-max8907.c
> > >
> > > diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> > > index 788e689fe875c..3796c562919fe 100644
> > > --- a/drivers/leds/Kconfig
> > > +++ b/drivers/leds/Kconfig
> > > @@ -813,6 +813,13 @@ config LEDS_MAX77705
> > >       help
> > >         LED driver for MAX77705 PMIC from Maxim Integrated.
> > >
> > > +config LEDS_MAX8907
> > > +     tristate "LED support for MAX8907 PMIC"
> > > +     depends on LEDS_CLASS && MFD_MAX8907
> > > +     help
> > > +       This option enables support for on-chip LED drivers on
> > > +       MAXIM MAX8907 PMIC.
> >
> > As requested on v3, please expand this help text to at least 4 lines to satisfy
> > 'checkpatch.pl'.
> >
> > > +
> > >  config LEDS_MAX8997
> > >       tristate "LED support for MAX8997 PMIC"
> > >       depends on LEDS_CLASS && MFD_MAX8997
> > > diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> > > index 3da746279bb81..24efda3fbaa44 100644
> > > --- a/drivers/leds/Makefile
> > > +++ b/drivers/leds/Makefile
> > > @@ -67,6 +67,7 @@ obj-$(CONFIG_LEDS_LTC3220)          += leds-ltc3220.o
> > >  obj-$(CONFIG_LEDS_MAX5970)           += leds-max5970.o
> > >  obj-$(CONFIG_LEDS_MAX77650)          += leds-max77650.o
> > >  obj-$(CONFIG_LEDS_MAX77705)          += leds-max77705.o
> > > +obj-$(CONFIG_LEDS_MAX8907)           += leds-max8907.o
> > >  obj-$(CONFIG_LEDS_MAX8997)           += leds-max8997.o
> > >  obj-$(CONFIG_LEDS_MC13783)           += leds-mc13783.o
> > >  obj-$(CONFIG_LEDS_MENF21BMC)         += leds-menf21bmc.o
> > > diff --git a/drivers/leds/leds-max8907.c b/drivers/leds/leds-max8907.c
> > > new file mode 100644
> > > index 0000000000000..a5c445f75d1b1
> > > --- /dev/null
> > > +++ b/drivers/leds/leds-max8907.c
> > > @@ -0,0 +1,90 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +#include <linux/err.h>
> > > +#include <linux/leds.h>
> > > +#include <linux/mfd/max8907.h>
> > > +#include <linux/module.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#define MAX8907_REG_WLED_MODE_ON     BIT(0)
> > > +
> > > +struct max8907_led_data {
> > > +     struct max8907 *max8907;
> >
> > As asked on v3, what is 'max8907' used for?
> >
> > > +     struct regmap *regmap;
> > > +     struct led_classdev cdev;
> > > +};
> > > +
> > > +static enum led_brightness max8907_led_get_brightness(struct led_classdev *cdev)
> > > +{
> > > +     struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
> > > +     unsigned int brightness_lvl;
> > > +     int ret;
> > > +
> > > +     ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL, &brightness_lvl);
> > > +     if (ret || !(brightness_lvl & MAX8907_REG_WLED_MODE_ON))
> > > +             return LED_OFF;
> > > +
> > > +     ret = regmap_read(ddata->regmap, MAX8907_REG_WLED_CNTL, &brightness_lvl);
> > > +     if (ret)
> > > +             return LED_OFF;
> > > +
> > > +     return brightness_lvl;
> > > +}
> > > +
> > > +static int max8907_led_set_brightness(struct led_classdev *cdev,
> > > +                                   enum led_brightness brightness)
> > > +{
> > > +     struct max8907_led_data *ddata = container_of(cdev, struct max8907_led_data, cdev);
> > > +     int brightness_lvl, ret;
> > > +
> > > +     brightness_lvl = clamp(brightness, LED_OFF, LED_FULL);
> > > +
> > > +     if (brightness_lvl) {
> > > +             ret = regmap_write(ddata->regmap, MAX8907_REG_WLED_CNTL, brightness_lvl);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     return regmap_update_bits(ddata->regmap, MAX8907_REG_WLED_MODE_CNTL,
> > > +                               MAX8907_REG_WLED_MODE_ON,
> > > +                               brightness_lvl ? MAX8907_REG_WLED_MODE_ON : 0);
> > > +}
> > > +
> > > +static int max8907_led_probe(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev = &pdev->dev;
> > > +     struct max8907 *max8907 = dev_get_drvdata(dev->parent);
> > > +     struct led_init_data init_data = { };
> > > +     struct max8907_led_data *ddata;
> > > +
> > > +     ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> > > +     if (!ddata)
> > > +             return -ENOMEM;
> > > +
> > > +     ddata->max8907 = max8907;
> > > +     ddata->regmap = max8907->regmap_gen;
> > > +
> > > +     init_data.fwnode = dev_fwnode(dev->parent);
> >
> > This will evaluate to 'pmic'.  The sysfs attribute will be incorrect.
> >
> > Since there is no child node, why not set 'ddata->cdev.name' directly
> > and use 'devm_led_classdev_register()'?
> >
> > > +
> > > +     ddata->cdev.brightness = LED_OFF;
> > > +     ddata->cdev.flags = LED_CORE_SUSPENDRESUME;
> > > +     ddata->cdev.max_brightness = LED_FULL;
> > > +
> > > +     ddata->cdev.brightness_get = max8907_led_get_brightness;
> > > +     ddata->cdev.brightness_set_blocking = max8907_led_set_brightness;
> > > +
> > > +     return devm_led_classdev_register_ext(dev, &ddata->cdev, &init_data);
> > > +}
> > > +
> > > +static struct platform_driver max8907_led_driver = {
> > > +     .driver.name = "max8907-leds",
> >
> > Cute.  But please expand.
> >
> > > +     .probe = max8907_led_probe,
> > > +};
> > > +module_platform_driver(max8907_led_driver);
> > > +
> > > +MODULE_ALIAS("platform:max8907-leds");
> > > +MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
> >
> > Your name is misspelt here.
> >
> > > +MODULE_DESCRIPTION("MAX8907 LED driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > > index e282dd82ece69..826d7768fd8d0 100644
> > > --- a/drivers/mfd/max8907.c
> > > +++ b/drivers/mfd/max8907.c
> > > @@ -20,6 +20,7 @@
> > >  #include <linux/slab.h>
> > >
> > >  static const struct mfd_cell max8907_cells[] = {
> > > +     { .name = "max8907-leds", },
> >
> > Separate patch.
> >
> 
> All valid, but way adding led requires a separate patch? Just to know.

Build-deps only.

> The max8907.h change can be left with leds change? It changes reg name
> used by led cell.

Yes.  That's a build-dep.

> > >       { .name = "max8907-regulator", },
> > >       { .name = "max8907-rtc", },
> > >  };
> > > diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> > > index e222250f0cc1e..35b2ede54f856 100644
> > > --- a/include/linux/mfd/max8907.h
> > > +++ b/include/linux/mfd/max8907.h
> > > @@ -112,7 +112,7 @@
> > >  #define MAX8907_REG_CHG_IRQ2_MASK    0x81
> > >  #define MAX8907_REG_CHG_STAT         0x82
> > >  #define MAX8907_REG_WLED_MODE_CNTL   0x84
> > > -#define MAX8907_REG_ILED_CNTL                0x84
> > > +#define MAX8907_REG_WLED_CNTL                0x85
> > >  #define MAX8907_REG_II1RR            0x8E
> > >  #define MAX8907_REG_II2RR            0x8F
> > >  #define MAX8907_REG_LDOCTL20         0x9C
> > > --
> > > 2.53.0
> > >
> > >
> >
> > --
> > Lee Jones

-- 
Lee Jones
