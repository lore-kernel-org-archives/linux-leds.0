Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887728;
	b=N4tpNkjsMMeRdv5OKBVu9/2hdq01GRhLvAsVsDZ5yZ5ZUKPB2l21/n0AKG4E8kAbdgvp
	 78nilBNv5aLlv58Pv1HjIo6WI9yDid/F1UfaT1Dsosj5R8bXYUAM3Kk0XEfTZrEGKqEk7
	 Ag3WkP2CC4sRig5mdQK6vu6irxeE5y0mu5mhbF/qGHMvbP7gaKcDHGlYGfIuJxRTFIqXw
	 sNjKZKuir3FOUbixpIfbjp5/ilfA8vg5C4dy5US2wHNWW6gHgTZPKS+ZYEadCCB22qQNi
	 F0NOQP2hMviXhSPcZbB0B4OCePASr8BF7LPHHxGj+I8u3zUZlc/tX5dbQ69KPAvbZgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887728;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=iuLFuIw5Iem7k5S/fx3Ljd28tX075xbqBILluDGIpc0=;
	b=xdr2/D7HK1r2PbW8Q1HBQK4zKZWpb/ZgaIk8a3PO3RNUiolBAFMeAGhUpKJG1KcDJLJz
	 CvuKkGKzcfgvXrnyO1R+B37JSJYL2yVxuLohzbRNQBVoPCrjqYldlb+gMBQ3zhxxCrp4o
	 GIiQT8AFULtg6xLMEzDFHmEj0zBtN/1SCiM09u054Hl8UkLTMpkCsGrQJ0caBBgAKlJK3
	 UUWM/Hiwf+c1h2W8umJQkz8GSquZmAhOioPakWrtnusxAP+hsxUwNCcXti9jznAdMLsr5
	 yMuZNKvK6okBl89rrGtbvhwqfUSb3UcRFHpSzs/dAMlXMelF3IC3T08qF00JxbjfboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbTtLybB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FBF606A31B;
	Thu,  5 Nov 2026 14:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cbTtLybB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FAB1F000C1;
	Thu,  5 Nov 2026 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793887727;
	bh=iuLFuIw5Iem7k5S/fx3Ljd28tX075xbqBILluDGIpc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cbTtLybBelTsXD1tTnTKMAcyrEKzUTkMcpawV1ZkQtEZ4/yy6EMU/xBFH0435s2ov
	 LiwAKRR4h9bM7Tzjv+YdavLP2X1DhkEYXlDb81g/LjXAff5iV/LKFGqMUKETlpyKBt
	 ZxgNzh9vu/FEQWfWzwgLwVBu4v9j1yJn0AkrZdd9FoJcIXTewL7hzPT9I+ZAjwER6I
	 ZzUCp0i5/cA04qbCtpfjCf3YPOPajjSOfPAVkQe+siGtdgWEGLhrTQyFa+giXJGNRh
	 h3sEbxr9iUTzezYFOTtPGudXGbjFZzghJqQlAGHMf2jcq905VsLDXP7nKXsOinK3MP
	 btRywJw1TwiTQ==
Date: Thu, 5 Nov 2026 14:08:43 +0000
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v4] leds: Add driver for MAX8907 LED cell
Message-ID: <20261105140843.GK1650678@google.com>
References: <20261027115006.86032-1-clamor95@gmail.com>
 <179318844110.3606039.5801345229436270811@kernel.org>
 <CAPVz0n3tR8R5xe_F20kChnHHrWG40o7prwY6kCYXM-UtYPFKLQ@mail.gmail.com>
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
In-Reply-To: <CAPVz0n3tR8R5xe_F20kChnHHrWG40o7prwY6kCYXM-UtYPFKLQ@mail.gmail.com>

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
> 
> This is required to be able to reference led in the device tree. Since
> led node is folded into pmic's node, pmic's node is used to bind led.

Right, so you need device_set_node() called in led_classdev_register_ext()
so fwnode_led_get() can look up the LED via the parent PMIC phandle.

However, passing only 'init_data.fwnode = dev_fwnode(dev->parent)' into
led_compose_name() when the parent PMIC node has no 'label', 'function'
or 'color' properties causes it to fall through to:

    } else if (is_of_node(fwnode)) {
        n = snprintf(led_classdev_name, LED_MAX_NAME_SIZE, "%s",
                 to_of_node(fwnode)->name);

Which registers the LED in sysfs as '/sys/class/leds/pmic' (and fails
with -EINVAL if 'fwnode' is NULL on non-DT platforms).

To bind the parent fwnode while avoiding the node-name fallback, please
also populate 'devicename' and 'default_label' (similar to
drivers/leds/leds-tps6105x.c):

    init_data.fwnode = dev_fwnode(dev->parent);
    init_data.devicename = "max8907";
    init_data.default_label = ":wled"; /* or "white:backlight" */

-- 
Lee Jones
