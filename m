Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437003;
	b=nTHkb0I5tan2ISRUhID/77CPfGrG7R+/cTdyOdpqh+NWV4NzAx9+qj/DPJZ1a8oDmvR9
	 QeHHrL7K09cb3gx8u3SjvKtR/H7VlAagj9N2JWUgf+yKnZ8uu4gk9P1kl993zN2K0KWRa
	 hJZRdES4qXhSwnMTX1Nj97gaLr1pRW+as5EdLqjtQwlvW05FYgrFNjOrARNY5yJu0GHE8
	 OFLAAvN4cn3lS1xsxuvm5HnHK0pOz7hDG84vK/3KtFXyphY4GTGZgwbSlqjDRvxbRhR+M
	 zpu07F244CYMHDqhkKmUIfuZRMK6mbFzV4iJJt8uTmfanm4YzwtLSuILgFwJelDDlDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437003;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=6PtnzMrmRMSsF6KyK3c6JKwcpm9qrdkIJ5TuGRGKY98=;
	b=m9NotTvPYy3qvqnyhLUWuXbNquXLRSPCn+8Uw1AEr1sMJ980IJeBBo07pLkbbaGURxsl
	 2Yje+qyWCkUEQtXpDEOGqoIh8Sqa3bwvTLQhbfiSopojiSF8v4FnCoyh2B54/vlr0+T+s
	 OGkViSatMKGl2AcA4pvNWVYNa3HYxdxB6fIVJyBKyCHSJ2uIqxEuTChLr8vdXsiKFWvwh
	 zQAOvk9sk0+pE+M2J3zbvTimr6xGVPnNHqF5+b1/YNdp32fVh6hKP3gPiNsKaT5J1bdnY
	 dWSVl6TeCKb+GI1UorHVbZlG1M2Jy6yuVQzZKPe+2O9A3ftC2fZ3eVkHUr+2N36JoHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8vrEoKX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E325606A330;
	Mon, 23 Nov 2026 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8vrEoKX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32F11F000ED;
	Mon, 23 Nov 2026 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437003;
	bh=6PtnzMrmRMSsF6KyK3c6JKwcpm9qrdkIJ5TuGRGKY98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=h8vrEoKXdBZi3fWPA66bRgj8tcLDgj0ltFvA8QP1hDgUupmuRPQOk9n3acpTUendh
	 rPFA1YFoJ87cS52n96VVsohu19K7Cp81TUbn9pdKinKfYQSvs8LpQWSC4PUc6St925
	 kmwWFl4cU5DydKWqvZh2gBc0FODGU4dpOMXfQPPnpMX4MktmotB6NdXkYPQgv1bVDe
	 zYOH+02jw36VnQhRx44M8JsHLqPbXQvcJYlOpwHmzXekOWwhwadh4BrQFULF/ZJDJc
	 B6rYvpjXncRT8cnxDcGjOVnJXNGQU7Kyze0hP9JvG3sCA4y0iguExUdxJsWuFZ/95t
	 m5nK4oKbFtHWA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 13:29:53 +0100
Subject: [PATCH 1/3] gpio: convert PC8736x to gpiolib
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-b4-nsc-gpio-v1-1-b2d97eba2662@kernel.org>
References: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
In-Reply-To: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Christer Weinigel <christer@weinigel.se>, Jim Cromie <jim.cromie@gmail.com>, 
 x86@kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
X-Mailer: b4 0.16.0

Move the PC8736x over to gpiolib.

Keep the legacy character device during the conversion. Both interfaces
use the same register access and locking.

Link: https://dtsheet.com/doc/85223/nsc-pc87365
Link: https://datasheet4u.com/pdf/36121/PC87366.pdf
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 MAINTAINERS                 |   2 +-
 drivers/char/Kconfig        |  13 --
 drivers/char/Makefile       |   1 -
 drivers/char/pc8736x_gpio.c | 352 -----------------------------------------
 drivers/gpio/Kconfig        |  13 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-pc8736x.c | 376 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 391 insertions(+), 367 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..9a047fd0a6a3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21262,7 +21262,7 @@ F:	drivers/hwmon/pc87360.c
 PC8736x GPIO DRIVER
 M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
-F:	drivers/char/pc8736x_gpio.c
+F:	drivers/gpio/gpio-pc8736x.c
 
 PC87427 HARDWARE MONITORING DRIVER
 M:	Jean Delvare <jdelvare@suse.com>
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 9865227af167..91683c54d509 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -233,19 +233,6 @@ config SCx200_GPIO
 
 	  If compiled as a module, it will be called scx200_gpio.
 
-config PC8736x_GPIO
-	tristate "NatSemi PC8736x GPIO Support"
-	depends on X86_32 && !UML
-	default SCx200_GPIO	# mostly N
-	select NSC_GPIO		# needed for support routines
-	help
-	  Give userspace access to the GPIO pins on the National
-	  Semiconductor PC-8736x (x=[03456]) SuperIO chip.  The chip
-	  has multiple functional units, inc several managed by
-	  hwmon/pc87360 driver.  Tested with PC-87366
-
-	  If compiled as a module, it will be called pc8736x_gpio.
-
 config NSC_GPIO
 	tristate "NatSemi Base GPIO Support"
 	depends on X86_32
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index bb3bf66937b3..09ae0a6fba87 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -27,7 +27,6 @@ obj-$(CONFIG_PPDEV)		+= ppdev.o
 obj-$(CONFIG_NWBUTTON)		+= nwbutton.o
 obj-$(CONFIG_NWFLASH)		+= nwflash.o
 obj-$(CONFIG_SCx200_GPIO)	+= scx200_gpio.o
-obj-$(CONFIG_PC8736x_GPIO)	+= pc8736x_gpio.o
 obj-$(CONFIG_NSC_GPIO)		+= nsc_gpio.o
 obj-$(CONFIG_TELCLOCK)		+= tlclk.o
 
diff --git a/drivers/char/pc8736x_gpio.c b/drivers/char/pc8736x_gpio.c
deleted file mode 100644
index 5f4696813cea..000000000000
--- a/drivers/char/pc8736x_gpio.c
+++ /dev/null
@@ -1,352 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* linux/drivers/char/pc8736x_gpio.c
-
-   National Semiconductor PC8736x GPIO driver.  Allows a user space
-   process to play with the GPIO pins.
-
-   Copyright (c) 2005,2006 Jim Cromie <jim.cromie@gmail.com>
-
-   adapted from linux/drivers/char/scx200_gpio.c
-   Copyright (c) 2001,2002 Christer Weinigel <wingel@nano-system.com>,
-*/
-
-#include <linux/fs.h>
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/cdev.h>
-#include <linux/io.h>
-#include <linux/ioport.h>
-#include <linux/mutex.h>
-#include <linux/nsc_gpio.h>
-#include <linux/platform_device.h>
-#include <linux/uaccess.h>
-
-#define DEVNAME "pc8736x_gpio"
-
-MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
-MODULE_DESCRIPTION("NatSemi/Winbond PC-8736x GPIO Pin Driver");
-MODULE_LICENSE("GPL");
-
-static int major;		/* default to dynamic major */
-module_param(major, int, 0);
-MODULE_PARM_DESC(major, "Major device number");
-
-static DEFINE_MUTEX(pc8736x_gpio_config_lock);
-static unsigned pc8736x_gpio_base;
-static u8 pc8736x_gpio_shadow[4];
-
-#define SIO_BASE1       0x2E	/* 1st command-reg to check */
-#define SIO_BASE2       0x4E	/* alt command-reg to check */
-
-#define SIO_SID		0x20	/* SuperI/O ID Register */
-#define SIO_SID_PC87365	0xe5	/* Expected value in ID Register for PC87365 */
-#define SIO_SID_PC87366	0xe9	/* Expected value in ID Register for PC87366 */
-
-#define SIO_CF1		0x21	/* chip config, bit0 is chip enable */
-
-#define PC8736X_GPIO_RANGE	16 /* ioaddr range */
-#define PC8736X_GPIO_CT		32 /* minors matching 4 8 bit ports */
-
-#define SIO_UNIT_SEL	0x7	/* unit select reg */
-#define SIO_UNIT_ACT	0x30	/* unit enable */
-#define SIO_GPIO_UNIT	0x7	/* unit number of GPIO */
-#define SIO_VLM_UNIT	0x0D
-#define SIO_TMS_UNIT	0x0E
-
-/* config-space addrs to read/write each unit's runtime addr */
-#define SIO_BASE_HADDR		0x60
-#define SIO_BASE_LADDR		0x61
-
-/* GPIO config-space pin-control addresses */
-#define SIO_GPIO_PIN_SELECT	0xF0
-#define SIO_GPIO_PIN_CONFIG     0xF1
-#define SIO_GPIO_PIN_EVENT      0xF2
-
-static unsigned char superio_cmd = 0;
-static unsigned char selected_device = 0xFF;	/* bogus start val */
-
-/* GPIO port runtime access, functionality */
-static int port_offset[] = { 0, 4, 8, 10 };	/* non-uniform offsets ! */
-/* static int event_capable[] = { 1, 1, 0, 0 };   ports 2,3 are hobbled */
-
-#define PORT_OUT	0
-#define PORT_IN		1
-#define PORT_EVT_EN	2
-#define PORT_EVT_STST	3
-
-static struct platform_device *pdev;  /* use in dev_*() */
-
-static inline void superio_outb(int addr, int val)
-{
-	outb_p(addr, superio_cmd);
-	outb_p(val, superio_cmd + 1);
-}
-
-static inline int superio_inb(int addr)
-{
-	outb_p(addr, superio_cmd);
-	return inb_p(superio_cmd + 1);
-}
-
-static int pc8736x_superio_present(void)
-{
-	int id;
-
-	/* try the 2 possible values, read a hardware reg to verify */
-	superio_cmd = SIO_BASE1;
-	id = superio_inb(SIO_SID);
-	if (id == SIO_SID_PC87365 || id == SIO_SID_PC87366)
-		return superio_cmd;
-
-	superio_cmd = SIO_BASE2;
-	id = superio_inb(SIO_SID);
-	if (id == SIO_SID_PC87365 || id == SIO_SID_PC87366)
-		return superio_cmd;
-
-	return 0;
-}
-
-static void device_select(unsigned devldn)
-{
-	superio_outb(SIO_UNIT_SEL, devldn);
-	selected_device = devldn;
-}
-
-static void select_pin(unsigned iminor)
-{
-	/* select GPIO port/pin from device minor number */
-	device_select(SIO_GPIO_UNIT);
-	superio_outb(SIO_GPIO_PIN_SELECT,
-		     ((iminor << 1) & 0xF0) | (iminor & 0x7));
-}
-
-static inline u32 pc8736x_gpio_configure_fn(unsigned index, u32 mask, u32 bits,
-					    u32 func_slct)
-{
-	u32 config, new_config;
-
-	mutex_lock(&pc8736x_gpio_config_lock);
-
-	device_select(SIO_GPIO_UNIT);
-	select_pin(index);
-
-	/* read current config value */
-	config = superio_inb(func_slct);
-
-	/* set new config */
-	new_config = (config & mask) | bits;
-	superio_outb(func_slct, new_config);
-
-	mutex_unlock(&pc8736x_gpio_config_lock);
-
-	return config;
-}
-
-static u32 pc8736x_gpio_configure(unsigned index, u32 mask, u32 bits)
-{
-	return pc8736x_gpio_configure_fn(index, mask, bits,
-					 SIO_GPIO_PIN_CONFIG);
-}
-
-static int pc8736x_gpio_get(unsigned minor)
-{
-	int port, bit, val;
-
-	port = minor >> 3;
-	bit = minor & 7;
-	val = inb_p(pc8736x_gpio_base + port_offset[port] + PORT_IN);
-	val >>= bit;
-	val &= 1;
-
-	dev_dbg(&pdev->dev, "_gpio_get(%d from %x bit %d) == val %d\n",
-		minor, pc8736x_gpio_base + port_offset[port] + PORT_IN, bit,
-		val);
-
-	return val;
-}
-
-static void pc8736x_gpio_set(unsigned minor, int val)
-{
-	int port, bit, curval;
-
-	minor &= 0x1f;
-	port = minor >> 3;
-	bit = minor & 7;
-	curval = inb_p(pc8736x_gpio_base + port_offset[port] + PORT_OUT);
-
-	dev_dbg(&pdev->dev, "addr:%x cur:%x bit-pos:%d cur-bit:%x + new:%d -> bit-new:%d\n",
-		pc8736x_gpio_base + port_offset[port] + PORT_OUT,
-		curval, bit, (curval & ~(1 << bit)), val, (val << bit));
-
-	val = (curval & ~(1 << bit)) | (val << bit);
-
-	dev_dbg(&pdev->dev, "gpio_set(minor:%d port:%d bit:%d)"
-		" %2x -> %2x\n", minor, port, bit, curval, val);
-
-	outb_p(val, pc8736x_gpio_base + port_offset[port] + PORT_OUT);
-
-	curval = inb_p(pc8736x_gpio_base + port_offset[port] + PORT_OUT);
-	val = inb_p(pc8736x_gpio_base + port_offset[port] + PORT_IN);
-
-	dev_dbg(&pdev->dev, "wrote %x, read: %x\n", curval, val);
-	pc8736x_gpio_shadow[port] = val;
-}
-
-static int pc8736x_gpio_current(unsigned minor)
-{
-	int port, bit;
-	minor &= 0x1f;
-	port = minor >> 3;
-	bit = minor & 7;
-	return ((pc8736x_gpio_shadow[port] >> bit) & 0x01);
-}
-
-static void pc8736x_gpio_change(unsigned index)
-{
-	pc8736x_gpio_set(index, !pc8736x_gpio_current(index));
-}
-
-static struct nsc_gpio_ops pc8736x_gpio_ops = {
-	.owner		= THIS_MODULE,
-	.gpio_config	= pc8736x_gpio_configure,
-	.gpio_dump	= nsc_gpio_dump,
-	.gpio_get	= pc8736x_gpio_get,
-	.gpio_set	= pc8736x_gpio_set,
-	.gpio_change	= pc8736x_gpio_change,
-	.gpio_current	= pc8736x_gpio_current
-};
-
-static int pc8736x_gpio_open(struct inode *inode, struct file *file)
-{
-	unsigned m = iminor(inode);
-	file->private_data = &pc8736x_gpio_ops;
-
-	dev_dbg(&pdev->dev, "open %d\n", m);
-
-	if (m >= PC8736X_GPIO_CT)
-		return -EINVAL;
-	return nonseekable_open(inode, file);
-}
-
-static const struct file_operations pc8736x_gpio_fileops = {
-	.owner	= THIS_MODULE,
-	.open	= pc8736x_gpio_open,
-	.write	= nsc_gpio_write,
-	.read	= nsc_gpio_read,
-};
-
-static void __init pc8736x_init_shadow(void)
-{
-	int port;
-
-	/* read the current values driven on the GPIO signals */
-	for (port = 0; port < 4; ++port)
-		pc8736x_gpio_shadow[port]
-		    = inb_p(pc8736x_gpio_base + port_offset[port]
-			    + PORT_OUT);
-
-}
-
-static struct cdev pc8736x_gpio_cdev;
-
-static int __init pc8736x_gpio_init(void)
-{
-	int rc;
-	dev_t devid;
-
-	pdev = platform_device_alloc(DEVNAME, 0);
-	if (!pdev)
-		return -ENOMEM;
-
-	rc = platform_device_add(pdev);
-	if (rc) {
-		rc = -ENODEV;
-		goto undo_platform_dev_alloc;
-	}
-	dev_info(&pdev->dev, "NatSemi pc8736x GPIO Driver Initializing\n");
-
-	if (!pc8736x_superio_present()) {
-		rc = -ENODEV;
-		dev_err(&pdev->dev, "no device found\n");
-		goto undo_platform_dev_add;
-	}
-	pc8736x_gpio_ops.dev = &pdev->dev;
-
-	/* Verify that chip and it's GPIO unit are both enabled.
-	   My BIOS does this, so I take minimum action here
-	 */
-	rc = superio_inb(SIO_CF1);
-	if (!(rc & 0x01)) {
-		rc = -ENODEV;
-		dev_err(&pdev->dev, "device not enabled\n");
-		goto undo_platform_dev_add;
-	}
-	device_select(SIO_GPIO_UNIT);
-	if (!superio_inb(SIO_UNIT_ACT)) {
-		rc = -ENODEV;
-		dev_err(&pdev->dev, "GPIO unit not enabled\n");
-		goto undo_platform_dev_add;
-	}
-
-	/* read the GPIO unit base addr that chip responds to */
-	pc8736x_gpio_base = (superio_inb(SIO_BASE_HADDR) << 8
-			     | superio_inb(SIO_BASE_LADDR));
-
-	if (!request_region(pc8736x_gpio_base, PC8736X_GPIO_RANGE, DEVNAME)) {
-		rc = -ENODEV;
-		dev_err(&pdev->dev, "GPIO ioport %x busy\n",
-			pc8736x_gpio_base);
-		goto undo_platform_dev_add;
-	}
-	dev_info(&pdev->dev, "GPIO ioport %x reserved\n", pc8736x_gpio_base);
-
-	if (major) {
-		devid = MKDEV(major, 0);
-		rc = register_chrdev_region(devid, PC8736X_GPIO_CT, DEVNAME);
-	} else {
-		rc = alloc_chrdev_region(&devid, 0, PC8736X_GPIO_CT, DEVNAME);
-		major = MAJOR(devid);
-	}
-
-	if (rc < 0) {
-		dev_err(&pdev->dev, "register-chrdev failed: %d\n", rc);
-		goto undo_request_region;
-	}
-	if (!major) {
-		major = rc;
-		dev_dbg(&pdev->dev, "got dynamic major %d\n", major);
-	}
-
-	pc8736x_init_shadow();
-
-	/* ignore minor errs, and succeed */
-	cdev_init(&pc8736x_gpio_cdev, &pc8736x_gpio_fileops);
-	cdev_add(&pc8736x_gpio_cdev, devid, PC8736X_GPIO_CT);
-
-	return 0;
-
-undo_request_region:
-	release_region(pc8736x_gpio_base, PC8736X_GPIO_RANGE);
-undo_platform_dev_add:
-	platform_device_del(pdev);
-undo_platform_dev_alloc:
-	platform_device_put(pdev);
-
-	return rc;
-}
-
-static void __exit pc8736x_gpio_cleanup(void)
-{
-	dev_dbg(&pdev->dev, "cleanup\n");
-
-	cdev_del(&pc8736x_gpio_cdev);
-	unregister_chrdev_region(MKDEV(major,0), PC8736X_GPIO_CT);
-	release_region(pc8736x_gpio_base, PC8736X_GPIO_RANGE);
-
-	platform_device_unregister(pdev);
-}
-
-module_init(pc8736x_gpio_init);
-module_exit(pc8736x_gpio_cleanup);
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d8..808acc5b7f5c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1093,6 +1093,19 @@ config GPIO_IT87
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio_it87.
 
+config PC8736x_GPIO
+	tristate "NatSemi PC87365/PC87366 GPIO support"
+	depends on X86_32
+	default SCx200_GPIO
+	select ISA_BUS_API
+	select NSC_GPIO
+	help
+	  Support the GPIO controller in the National Semiconductor
+	  PC87365 and PC87366 Super I/O chips. The GPIO logical device
+	  must already be enabled by the firmware.
+
+	  This driver can also be built as a module called gpio-pc8736x.
+
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
 	depends on (X86 || COMPILE_TEST) && ACPI
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 88f748846e60..05e8442a6d67 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
 obj-$(CONFIG_GPIO_PALMAS)		+= gpio-palmas.o
+obj-$(CONFIG_PC8736x_GPIO)		+= gpio-pc8736x.o
 obj-$(CONFIG_GPIO_PCA953X)		+= gpio-pca953x.o
 obj-$(CONFIG_GPIO_PCA9570)		+= gpio-pca9570.o
 obj-$(CONFIG_GPIO_PCF857X)		+= gpio-pcf857x.o
diff --git a/drivers/gpio/gpio-pc8736x.c b/drivers/gpio/gpio-pc8736x.c
new file mode 100644
index 000000000000..5c18903b1add
--- /dev/null
+++ b/drivers/gpio/gpio-pc8736x.c
@@ -0,0 +1,376 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * National Semiconductor PC87365/PC87366 GPIO driver.
+ *
+ * Copyright (c) 2005,2006 Jim Cromie <jim.cromie@gmail.com>
+ * Adapted from the SCx200 GPIO driver.
+ * Copyright (c) 2001,2002 Christer Weinigel <wingel@nano-system.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/cdev.h>
+#include <linux/cleanup.h>
+#include <linux/fs.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/isa.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nsc_gpio.h>
+#include <linux/pinctrl/pinconf-generic.h>
+
+#define DRVNAME			"gpio-pc8736x"
+#define LEGACY_NAME		"pc8736x_gpio"
+
+#define SIO_BASE1		0x2e
+#define SIO_BASE2		0x4e
+#define SIO_SID			0x20
+#define SIO_SID_PC87365		0xe5
+#define SIO_SID_PC87366		0xe9
+#define SIO_CF1			0x21
+#define SIO_UNIT_SEL		0x07
+#define SIO_UNIT_ACT		0x30
+#define SIO_GPIO_UNIT		0x07
+#define SIO_BASE_HADDR		0x60
+#define SIO_BASE_LADDR		0x61
+#define SIO_GPIO_PIN_SELECT	0xf0
+#define SIO_GPIO_PIN_CONFIG	0xf1
+
+#define PC8736X_GPIO_RANGE	16
+#define PC8736X_NGPIO		29
+#define LEGACY_NGPIO		32
+#define PC8736X_GPIO_PORT_OUT		0
+#define PC8736X_GPIO_PORT_IN		1
+#define PC8736X_GPIO_OUTPUT_ENABLE	BIT(0)
+#define PC8736X_GPIO_PUSH_PULL		BIT(1)
+#define PC8736X_GPIO_PULL_UP		BIT(2)
+#define PC8736X_GPIO_LOCK		BIT(3)
+
+struct pc8736x_gpio {
+	struct gpio_chip gc;
+	struct mutex lock; /* Serializes pin selection and output updates. */
+	unsigned int base;
+	unsigned int sio;
+};
+
+static const unsigned int port_offset[] = { 0, 4, 8, 10 };
+
+static void superio_write(unsigned int sio, u8 reg, u8 value)
+{
+	outb_p(reg, sio);
+	outb_p(value, sio + 1);
+}
+
+static u8 superio_read(unsigned int sio, u8 reg)
+{
+	outb_p(reg, sio);
+	return inb_p(sio + 1);
+}
+
+static bool pc8736x_present(unsigned int sio)
+{
+	u8 id = superio_read(sio, SIO_SID);
+
+	return id == SIO_SID_PC87365 || id == SIO_SID_PC87366;
+}
+
+static u8 pc8736x_select_pin(struct pc8736x_gpio *gpio, unsigned int offset)
+{
+	superio_write(gpio->sio, SIO_UNIT_SEL, SIO_GPIO_UNIT);
+	superio_write(gpio->sio, SIO_GPIO_PIN_SELECT,
+		      (offset / 8 << 4) | (offset % 8));
+	return superio_read(gpio->sio, SIO_GPIO_PIN_CONFIG);
+}
+
+static int pc8736x_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pc8736x_gpio *gpio = gpiochip_get_data(gc);
+	unsigned int port = gpio->base + port_offset[offset / 8];
+
+	return !!(inb_p(port + PC8736X_GPIO_PORT_IN) & BIT(offset % 8));
+}
+
+static int pc8736x_gpio_write(struct pc8736x_gpio *gpio, unsigned int offset,
+			      int value)
+{
+	unsigned int port = gpio->base + port_offset[offset / 8] +
+			    PC8736X_GPIO_PORT_OUT;
+	u8 mask = BIT(offset % 8);
+	u8 data = inb_p(port);
+	u8 new_data = (data & ~mask) | (value ? mask : 0);
+
+	if (new_data == data)
+		return 0;
+
+	outb_p(new_data, port);
+
+	/* The hardware ignores writes to a locked line. */
+	return (inb_p(port) & mask) == (new_data & mask) ? 0 : -EPERM;
+}
+
+static int pc8736x_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct pc8736x_gpio *gpio = gpiochip_get_data(gc);
+
+	guard(mutex)(&gpio->lock);
+	return pc8736x_gpio_write(gpio, offset, value);
+}
+
+static int pc8736x_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pc8736x_gpio *gpio = gpiochip_get_data(gc);
+
+	guard(mutex)(&gpio->lock);
+	return pc8736x_select_pin(gpio, offset) & PC8736X_GPIO_OUTPUT_ENABLE ?
+		GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int pc8736x_gpio_update_config(struct pc8736x_gpio *gpio, u8 config,
+				      u8 mask, u8 value)
+{
+	u8 new_config = (config & ~mask) | value;
+
+	if (new_config == config)
+		return 0;
+	if (config & PC8736X_GPIO_LOCK)
+		return -EPERM;
+
+	superio_write(gpio->sio, SIO_GPIO_PIN_CONFIG, new_config);
+	return 0;
+}
+
+static int pc8736x_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct pc8736x_gpio *gpio = gpiochip_get_data(gc);
+	u8 config;
+
+	guard(mutex)(&gpio->lock);
+	config = pc8736x_select_pin(gpio, offset);
+	return pc8736x_gpio_update_config(gpio, config,
+					  PC8736X_GPIO_OUTPUT_ENABLE, 0);
+}
+
+static int pc8736x_gpio_direction_output(struct gpio_chip *gc,
+					 unsigned int offset, int value)
+{
+	struct pc8736x_gpio *gpio = gpiochip_get_data(gc);
+	u8 config;
+	int ret;
+
+	guard(mutex)(&gpio->lock);
+	config = pc8736x_select_pin(gpio, offset);
+	if ((config & PC8736X_GPIO_LOCK) && !(config & PC8736X_GPIO_OUTPUT_ENABLE))
+		return -EPERM;
+
+	ret = pc8736x_gpio_write(gpio, offset, value);
+	if (ret)
+		return ret;
+
+	return pc8736x_gpio_update_config(gpio, config, PC8736X_GPIO_OUTPUT_ENABLE,
+					  PC8736X_GPIO_OUTPUT_ENABLE);
+}
+
+static int pc8736x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				   unsigned long config)
+{
+	struct pc8736x_gpio *gpio = gpiochip_get_data(gc);
+	u8 mask, value, old_config;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		mask = PC8736X_GPIO_PUSH_PULL;
+		value = 0;
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		mask = PC8736X_GPIO_PUSH_PULL;
+		value = PC8736X_GPIO_PUSH_PULL;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		mask = PC8736X_GPIO_PULL_UP;
+		value = 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		mask = PC8736X_GPIO_PULL_UP;
+		value = PC8736X_GPIO_PULL_UP;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	guard(mutex)(&gpio->lock);
+	old_config = pc8736x_select_pin(gpio, offset);
+	return pc8736x_gpio_update_config(gpio, old_config, mask, value);
+}
+
+static int major;
+module_param(major, int, 0);
+MODULE_PARM_DESC(major, "Major device number for the legacy interface");
+
+static struct pc8736x_gpio *pc8736x_legacy_gpio;
+static struct cdev pc8736x_gpio_cdev;
+static dev_t pc8736x_devt;
+static u8 pc8736x_legacy_shadow[ARRAY_SIZE(port_offset)];
+
+static u32 pc8736x_legacy_config(unsigned int offset, u32 mask, u32 value)
+{
+	struct pc8736x_gpio *gpio = pc8736x_legacy_gpio;
+	u8 config;
+
+	guard(mutex)(&gpio->lock);
+	config = pc8736x_select_pin(gpio, offset);
+	pc8736x_gpio_update_config(gpio, config, ~mask, value);
+	return config;
+}
+
+static int pc8736x_legacy_get(unsigned int offset)
+{
+	struct pc8736x_gpio *gpio = pc8736x_legacy_gpio;
+
+	return pc8736x_gpio_get(&gpio->gc, offset);
+}
+
+static void pc8736x_legacy_set(unsigned int offset, int value)
+{
+	struct pc8736x_gpio *gpio = pc8736x_legacy_gpio;
+	unsigned int port = offset / 8;
+
+	guard(mutex)(&gpio->lock);
+	pc8736x_gpio_write(gpio, offset, value);
+	pc8736x_legacy_shadow[port] =
+		inb_p(gpio->base + port_offset[port] + PC8736X_GPIO_PORT_IN);
+}
+
+static int pc8736x_legacy_current(unsigned int offset)
+{
+	return !!(READ_ONCE(pc8736x_legacy_shadow[offset / 8]) & BIT(offset % 8));
+}
+
+static struct nsc_gpio_ops pc8736x_legacy_ops = {
+	.gpio_config = pc8736x_legacy_config,
+	.gpio_dump = nsc_gpio_dump,
+	.gpio_get = pc8736x_legacy_get,
+	.gpio_set = pc8736x_legacy_set,
+	.gpio_current = pc8736x_legacy_current,
+};
+
+static int pc8736x_legacy_open(struct inode *inode, struct file *file)
+{
+	file->private_data = &pc8736x_legacy_ops;
+	return nonseekable_open(inode, file);
+}
+
+static const struct file_operations pc8736x_legacy_fops = {
+	.owner = THIS_MODULE,
+	.open = pc8736x_legacy_open,
+	.read = nsc_gpio_read,
+	.write = nsc_gpio_write,
+};
+
+static int pc8736x_legacy_register(struct pc8736x_gpio *gpio)
+{
+	int ret, port;
+
+	for (port = 0; port < ARRAY_SIZE(port_offset); port++)
+		pc8736x_legacy_shadow[port] =
+			inb_p(gpio->base + port_offset[port] + PC8736X_GPIO_PORT_OUT);
+
+	if (major) {
+		pc8736x_devt = MKDEV(major, 0);
+		ret = register_chrdev_region(pc8736x_devt, LEGACY_NGPIO, LEGACY_NAME);
+	} else {
+		ret = alloc_chrdev_region(&pc8736x_devt, 0, LEGACY_NGPIO, LEGACY_NAME);
+	}
+	if (ret)
+		return ret;
+
+	pc8736x_legacy_gpio = gpio;
+	pc8736x_legacy_ops.dev = gpio->gc.parent;
+	cdev_init(&pc8736x_gpio_cdev, &pc8736x_legacy_fops);
+	pc8736x_gpio_cdev.owner = THIS_MODULE;
+	ret = cdev_add(&pc8736x_gpio_cdev, pc8736x_devt, LEGACY_NGPIO);
+	if (ret)
+		unregister_chrdev_region(pc8736x_devt, LEGACY_NGPIO);
+
+	return ret;
+}
+
+static int pc8736x_gpio_probe(struct device *dev, unsigned int id)
+{
+	struct pc8736x_gpio *gpio;
+	unsigned int sio, base;
+	int ret;
+
+	if (pc8736x_present(SIO_BASE1))
+		sio = SIO_BASE1;
+	else if (pc8736x_present(SIO_BASE2))
+		sio = SIO_BASE2;
+	else
+		return -ENODEV;
+
+	if (!(superio_read(sio, SIO_CF1) & BIT(0)))
+		return -ENODEV;
+
+	superio_write(sio, SIO_UNIT_SEL, SIO_GPIO_UNIT);
+	if (!(superio_read(sio, SIO_UNIT_ACT) & BIT(0)))
+		return -ENODEV;
+
+	base = superio_read(sio, SIO_BASE_HADDR) << 8 |
+	       superio_read(sio, SIO_BASE_LADDR);
+	if (!base)
+		return -ENODEV;
+
+	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	if (!devm_request_region(dev, base, PC8736X_GPIO_RANGE, DRVNAME))
+		return -EBUSY;
+
+	gpio->base = base;
+	gpio->sio = sio;
+	mutex_init(&gpio->lock);
+	gpio->gc = (struct gpio_chip) {
+		.label = DRVNAME,
+		.parent = dev,
+		.owner = THIS_MODULE,
+		.base = -1,
+		.ngpio = PC8736X_NGPIO,
+		.can_sleep = true,
+		.get = pc8736x_gpio_get,
+		.set = pc8736x_gpio_set,
+		.get_direction = pc8736x_gpio_get_direction,
+		.direction_input = pc8736x_gpio_direction_input,
+		.direction_output = pc8736x_gpio_direction_output,
+		.set_config = pc8736x_gpio_set_config,
+	};
+
+	ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+	if (ret)
+		return ret;
+
+	return pc8736x_legacy_register(gpio);
+}
+
+static void pc8736x_gpio_remove(struct device *dev, unsigned int id)
+{
+	cdev_del(&pc8736x_gpio_cdev);
+	unregister_chrdev_region(pc8736x_devt, LEGACY_NGPIO);
+}
+
+static struct isa_driver pc8736x_gpio_driver = {
+	.driver = {
+		.name = DRVNAME,
+		.owner = THIS_MODULE,
+		/* An open legacy GPIO file pins the module, but not the chip. */
+		.suppress_bind_attrs = true,
+	},
+	.probe = pc8736x_gpio_probe,
+	.remove = pc8736x_gpio_remove,
+};
+module_isa_driver(pc8736x_gpio_driver, 1);
+
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_DESCRIPTION("NatSemi/Winbond PC87365/PC87366 GPIO driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS(LEGACY_NAME);

-- 
2.56.1

