Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437007;
	b=iGXM+eNyK+T0zUpHdiAyYpz69ExLCN4xBJ45VG8jEVsf11IHPCS3PrNjfIWIXBd/jQjA
	 Wp8yDfJ1ipJZg+2RaVWJ2uCS441VnbaOVrG8OjJGHfTFh3LjJGxmrM7GC6DgmS8BM5vQO
	 E6zUuxpbmQvXbZZ91/HF1y+M0xbN6doFRVBEXly2Uo5jBvtx4xRse3elNlT6VDqdrjNYf
	 yTII64MAArp4hySC5ykcHyoHGGttmetELytRtLRtvE+nApFG33kEFKBGQfAPJcu9QugX9
	 rPPKjp7jeEoFnfx2Zf3bnrZufDrDGxTYVbj+8dzH2eRnzC2zkHwofNM/9MOphDjYRDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437007;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=V/oHjKpn3qHWBO+qtOWzyMzICRQioH4KSXKgjfivEK0=;
	b=mwyz2fFYKcCBTCnJpJd2D4XEcQ+YIrvtnqRXj5xhQqnIN6FYRemZEc5uLdwQ4ciUXQQn
	 VyCYJZmUVb7F7jW3Q27VDeZ63PhZB74ZbPFyBfGi1h5YgNqieJXBLy2n81JA1MSiww8cF
	 dDAYg7V9qL/sUQLWm+3xXxEi524jyzhehflSoFbC0nyh7GrRZUWZzoMaV6NojkKTOGa6P
	 bPgMQQZxuwITBAI146faXjncjeUlviKsmz1+dmiQoigz5VKoWe+8SoCIhivy4U30aOsfZ
	 WDjGK80UZA3k1sA6OfS/5b7P3P2bJI5ifOxD3Sgsa+m0oAgzYT/lM9vDro4pztGW5Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSMHHaly;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DE3606A31F;
	Mon, 23 Nov 2026 12:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSMHHaly
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF1D1F000D0;
	Mon, 23 Nov 2026 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437006;
	bh=V/oHjKpn3qHWBO+qtOWzyMzICRQioH4KSXKgjfivEK0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BSMHHalyTcUjoZ5Gcg8HJ+QBS9nSbkBHlv5zEh5eg+rcpOEp1kb8XCF54xzrtYEjG
	 fedFIUy1y/g9bhn30cgOZfypk9J0HN/qbj2FsyCjZm+uOFgLMbu3VNubNuHSb1VL6E
	 SOB8D/z742kEyH/maJHJEI7U8igXw18ZAnocryBfVCvGInDxv+bYYTA4nEviCgC/k8
	 G4oPd/biJYwH48NHjDNEeiahYv5+LhzalzjG+cL65VsVdfE8WZCvOSWH6tERbzBuh7
	 8AE6mtpkwzK+zdKkXX34zwgpmp80RjFP42VTXpocS+filZ0j2w8qR73+BP00t5Wbl5
	 rL7ubVeDA0vYA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 13:29:54 +0100
Subject: [PATCH 2/3] gpio: convert SCx200 to gpiolib and use descriptors
 for board LEDs
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
Message-Id: <20261123-b4-nsc-gpio-v1-2-b2d97eba2662@kernel.org>
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

Create a platform device for the GPIO I/O ports of the SCx200 PCI
bridge. Keep the configuration block in the PCI driver for the timer,
watchdog and flash drivers.

Expose the first GPIO bank. Exclude the package-reserved pins on the
SC1100 and SCx200 variants. Serialize updates to the output latch and
indexed configuration registers.

Keep the legacy character device
working through the same register operations for now.

Attach a software node to the GPIO provider. Reference that node from
the net48xx and WRAP LED devices and switch both LED drivers to GPIO
descriptors.

Link: https://datasheets.chipdb.org/upload/National/SC1100.pdf
Link: https://cdn.semikey.com/upload/pdfs/8f/b4/8fb489d21840a8793e4f3fe15cf5b5c2.pdf
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 MAINTAINERS                          |   4 +-
 arch/x86/platform/scx200/scx200_32.c |  90 +++-----
 drivers/char/Kconfig                 |  10 -
 drivers/char/Makefile                |   1 -
 drivers/char/scx200_gpio.c           | 138 ------------
 drivers/gpio/Kconfig                 |  11 +
 drivers/gpio/Makefile                |   1 +
 drivers/gpio/gpio-scx200.c           | 400 +++++++++++++++++++++++++++++++++++
 drivers/leds/leds-net48xx.c          |  85 +++++---
 drivers/leds/leds-wrap.c             | 143 +++++++------
 include/linux/scx200.h               |   1 +
 include/linux/scx200_gpio.h          |  89 --------
 12 files changed, 575 insertions(+), 398 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9a047fd0a6a3..01e5a74a9d8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25256,8 +25256,8 @@ F:	include/linux/scx200.h
 SCx200 GPIO DRIVER
 M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
-F:	drivers/char/scx200_gpio.c
-F:	include/linux/scx200_gpio.h
+F:	drivers/gpio/gpio-scx200.c
+F:	include/linux/scx200.h
 
 SCx200 HRT CLOCKSOURCE DRIVER
 M:	Jim Cromie <jim.cromie@gmail.com>
diff --git a/arch/x86/platform/scx200/scx200_32.c b/arch/x86/platform/scx200/scx200_32.c
index 80662b72035d..b60ec11b4398 100644
--- a/arch/x86/platform/scx200/scx200_32.c
+++ b/arch/x86/platform/scx200/scx200_32.c
@@ -9,11 +9,10 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include <linux/scx200.h>
-#include <linux/scx200_gpio.h>
 
 /* Verify that the configuration block really is there */
 #define scx200_cb_probe(base) (inw((base) + SCx200_CBA) == (base))
@@ -22,9 +21,6 @@ MODULE_AUTHOR("Christer Weinigel <wingel@nano-system.com>");
 MODULE_DESCRIPTION("NatSemi SCx200 Driver");
 MODULE_LICENSE("GPL");
 
-unsigned scx200_gpio_base = 0;
-unsigned long scx200_gpio_shadow[2];
-
 unsigned scx200_cb_base = 0;
 
 static struct pci_device_id scx200_tbl[] = {
@@ -44,15 +40,31 @@ static struct pci_driver scx200_pci_driver = {
 	.probe = scx200_probe,
 };
 
-static DEFINE_MUTEX(scx200_gpio_config_lock);
+static void scx200_unregister_gpio(void *data)
+{
+	platform_device_unregister(data);
+}
 
-static void scx200_init_shadow(void)
+static int scx200_register_gpio(struct pci_dev *pdev)
 {
-	int bank;
+	struct resource res = DEFINE_RES_IO(pci_resource_start(pdev, 0),
+					     SCx200_GPIO_SIZE);
+	struct platform_device *gpio;
+
+	if (!IS_ENABLED(CONFIG_SCx200_GPIO))
+		return 0;
 
-	/* read the current values driven on the GPIO signals */
-	for (bank = 0; bank < 2; ++bank)
-		scx200_gpio_shadow[bank] = inl(scx200_gpio_base + 0x10 * bank);
+	if (!(pci_resource_flags(pdev, 0) & IORESOURCE_IO) || !res.start ||
+	    pci_resource_len(pdev, 0) < SCx200_GPIO_SIZE)
+		return -ENODEV;
+
+	gpio = platform_device_register_resndata(&pdev->dev, "gpio-scx200",
+						 PLATFORM_DEVID_NONE, &res, 1,
+						 NULL, 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+
+	return devm_add_action_or_reset(&pdev->dev, scx200_unregister_gpio, gpio);
 }
 
 static int scx200_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
@@ -60,55 +72,25 @@ static int scx200_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	unsigned base;
 
 	if (pdev->device == PCI_DEVICE_ID_NS_SCx200_BRIDGE ||
-	    pdev->device == PCI_DEVICE_ID_NS_SC1100_BRIDGE) {
-		base = pci_resource_start(pdev, 0);
-		pr_info("GPIO base 0x%x\n", base);
-
-		if (!request_region(base, SCx200_GPIO_SIZE,
-				    "NatSemi SCx200 GPIO")) {
-			pr_err("can't allocate I/O for GPIOs\n");
-			return -EBUSY;
-		}
-
-		scx200_gpio_base = base;
-		scx200_init_shadow();
+	    pdev->device == PCI_DEVICE_ID_NS_SC1100_BRIDGE)
+		return scx200_register_gpio(pdev);
 
+	/* Find the base of the configuration block. */
+	if (scx200_cb_probe(SCx200_CB_BASE_FIXED)) {
+		scx200_cb_base = SCx200_CB_BASE_FIXED;
 	} else {
-		/* find the base of the Configuration Block */
-		if (scx200_cb_probe(SCx200_CB_BASE_FIXED)) {
-			scx200_cb_base = SCx200_CB_BASE_FIXED;
-		} else {
-			pci_read_config_dword(pdev, SCx200_CBA_SCRATCH, &base);
-			if (scx200_cb_probe(base)) {
-				scx200_cb_base = base;
-			} else {
-				pr_warn("Configuration Block not found\n");
-				return -ENODEV;
-			}
+		pci_read_config_dword(pdev, SCx200_CBA_SCRATCH, &base);
+		if (!scx200_cb_probe(base)) {
+			pr_warn("Configuration Block not found\n");
+			return -ENODEV;
 		}
-		pr_info("Configuration Block base 0x%x\n", scx200_cb_base);
+		scx200_cb_base = base;
 	}
+	pr_info("Configuration Block base 0x%x\n", scx200_cb_base);
 
 	return 0;
 }
 
-u32 scx200_gpio_configure(unsigned index, u32 mask, u32 bits)
-{
-	u32 config, new_config;
-
-	mutex_lock(&scx200_gpio_config_lock);
-
-	outl(index, scx200_gpio_base + 0x20);
-	config = inl(scx200_gpio_base + 0x24);
-
-	new_config = (config & mask) | bits;
-	outl(new_config, scx200_gpio_base + 0x24);
-
-	mutex_unlock(&scx200_gpio_config_lock);
-
-	return config;
-}
-
 static int __init scx200_init(void)
 {
 	pr_info("NatSemi SCx200 Driver\n");
@@ -118,13 +100,9 @@ static int __init scx200_init(void)
 static void __exit scx200_cleanup(void)
 {
 	pci_unregister_driver(&scx200_pci_driver);
-	release_region(scx200_gpio_base, SCx200_GPIO_SIZE);
 }
 
 module_init(scx200_init);
 module_exit(scx200_cleanup);
 
-EXPORT_SYMBOL(scx200_gpio_base);
-EXPORT_SYMBOL(scx200_gpio_shadow);
-EXPORT_SYMBOL(scx200_gpio_configure);
 EXPORT_SYMBOL(scx200_cb_base);
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 91683c54d509..09cc9b271e93 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -223,16 +223,6 @@ config SONYPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called sonypi.
 
-config SCx200_GPIO
-	tristate "NatSemi SCx200 GPIO Support"
-	depends on SCx200
-	select NSC_GPIO
-	help
-	  Give userspace access to the GPIO pins on the National
-	  Semiconductor SCx200 processors.
-
-	  If compiled as a module, it will be called scx200_gpio.
-
 config NSC_GPIO
 	tristate "NatSemi Base GPIO Support"
 	depends on X86_32
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index 09ae0a6fba87..b743732c525c 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_HW_RANDOM)		+= hw_random/
 obj-$(CONFIG_PPDEV)		+= ppdev.o
 obj-$(CONFIG_NWBUTTON)		+= nwbutton.o
 obj-$(CONFIG_NWFLASH)		+= nwflash.o
-obj-$(CONFIG_SCx200_GPIO)	+= scx200_gpio.o
 obj-$(CONFIG_NSC_GPIO)		+= nsc_gpio.o
 obj-$(CONFIG_TELCLOCK)		+= tlclk.o
 
diff --git a/drivers/char/scx200_gpio.c b/drivers/char/scx200_gpio.c
deleted file mode 100644
index 3ec17832e9c9..000000000000
--- a/drivers/char/scx200_gpio.c
+++ /dev/null
@@ -1,138 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* linux/drivers/char/scx200_gpio.c
-
-   National Semiconductor SCx200 GPIO driver.  Allows a user space
-   process to play with the GPIO pins.
-
-   Copyright (c) 2001,2002 Christer Weinigel <wingel@nano-system.com> */
-
-#include <linux/device.h>
-#include <linux/fs.h>
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/uaccess.h>
-#include <asm/io.h>
-
-#include <linux/types.h>
-#include <linux/cdev.h>
-
-#include <linux/scx200_gpio.h>
-#include <linux/nsc_gpio.h>
-
-#define DRVNAME "scx200_gpio"
-
-static struct platform_device *pdev;
-
-MODULE_AUTHOR("Christer Weinigel <wingel@nano-system.com>");
-MODULE_DESCRIPTION("NatSemi/AMD SCx200 GPIO Pin Driver");
-MODULE_LICENSE("GPL");
-
-static int major = 0;		/* default to dynamic major */
-module_param(major, int, 0);
-MODULE_PARM_DESC(major, "Major device number");
-
-#define MAX_PINS 32		/* 64 later, when known ok */
-
-struct nsc_gpio_ops scx200_gpio_ops = {
-	.owner		= THIS_MODULE,
-	.gpio_config	= scx200_gpio_configure,
-	.gpio_dump	= nsc_gpio_dump,
-	.gpio_get	= scx200_gpio_get,
-	.gpio_set	= scx200_gpio_set,
-	.gpio_change	= scx200_gpio_change,
-	.gpio_current	= scx200_gpio_current
-};
-EXPORT_SYMBOL_GPL(scx200_gpio_ops);
-
-static int scx200_gpio_open(struct inode *inode, struct file *file)
-{
-	unsigned m = iminor(inode);
-	file->private_data = &scx200_gpio_ops;
-
-	if (m >= MAX_PINS)
-		return -EINVAL;
-	return nonseekable_open(inode, file);
-}
-
-static int scx200_gpio_release(struct inode *inode, struct file *file)
-{
-	return 0;
-}
-
-static const struct file_operations scx200_gpio_fileops = {
-	.owner   = THIS_MODULE,
-	.write   = nsc_gpio_write,
-	.read    = nsc_gpio_read,
-	.open    = scx200_gpio_open,
-	.release = scx200_gpio_release,
-};
-
-static struct cdev scx200_gpio_cdev;  /* use 1 cdev for all pins */
-
-static int __init scx200_gpio_init(void)
-{
-	int rc;
-	dev_t devid;
-
-	if (!scx200_gpio_present()) {
-		printk(KERN_ERR DRVNAME ": no SCx200 gpio present\n");
-		return -ENODEV;
-	}
-
-	/* support dev_dbg() with pdev->dev */
-	pdev = platform_device_alloc(DRVNAME, 0);
-	if (!pdev)
-		return -ENOMEM;
-
-	rc = platform_device_add(pdev);
-	if (rc)
-		goto undo_malloc;
-
-	/* nsc_gpio uses dev_dbg(), so needs this */
-	scx200_gpio_ops.dev = &pdev->dev;
-
-	if (major) {
-		devid = MKDEV(major, 0);
-		rc = register_chrdev_region(devid, MAX_PINS, "scx200_gpio");
-	} else {
-		rc = alloc_chrdev_region(&devid, 0, MAX_PINS, "scx200_gpio");
-		major = MAJOR(devid);
-	}
-	if (rc < 0) {
-		dev_err(&pdev->dev, "SCx200 chrdev_region err: %d\n", rc);
-		goto undo_platform_device_add;
-	}
-
-	cdev_init(&scx200_gpio_cdev, &scx200_gpio_fileops);
-	rc = cdev_add(&scx200_gpio_cdev, devid, MAX_PINS);
-	if (rc) {
-		dev_err(&pdev->dev, "cdev_add err: %d\n", rc);
-		goto undo_chrdev_region;
-	}
-
-	return 0; /* succeed */
-
-undo_chrdev_region:
-	unregister_chrdev_region(devid, MAX_PINS);
-undo_platform_device_add:
-	platform_device_del(pdev);
-undo_malloc:
-	platform_device_put(pdev);
-
-	return rc;
-}
-
-static void __exit scx200_gpio_cleanup(void)
-{
-	cdev_del(&scx200_gpio_cdev);
-	/* cdev_put(&scx200_gpio_cdev); */
-
-	unregister_chrdev_region(MKDEV(major, 0), MAX_PINS);
-	platform_device_unregister(pdev);
-}
-
-module_init(scx200_gpio_init);
-module_exit(scx200_gpio_cleanup);
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 808acc5b7f5c..b78d0cf0781b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1106,6 +1106,17 @@ config PC8736x_GPIO
 
 	  This driver can also be built as a module called gpio-pc8736x.
 
+config SCx200_GPIO
+	tristate "NatSemi SCx200 GPIO support"
+	depends on SCx200 && HAS_IOPORT
+	select NSC_GPIO
+	help
+	  Support the GPIO controller on National Semiconductor SCx200 and
+	  SC1100 processors. The first bank is exposed to GPIO consumers
+	  such as the Soekris and PC Engines board LED drivers.
+
+	  This driver can also be built as a module called gpio-scx200.
+
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
 	depends on (X86 || COMPILE_TEST) && ACPI
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 05e8442a6d67..68f8f5fa49e1 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -171,6 +171,7 @@ obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SHARED_PROXY)		+= gpio-shared-proxy.o
+obj-$(CONFIG_SCx200_GPIO)		+= gpio-scx200.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
 obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
diff --git a/drivers/gpio/gpio-scx200.c b/drivers/gpio/gpio-scx200.c
new file mode 100644
index 000000000000..5c0e86474481
--- /dev/null
+++ b/drivers/gpio/gpio-scx200.c
@@ -0,0 +1,400 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * National Semiconductor SCx200 GPIO driver.
+ *
+ * Copyright (c) 2001,2002 Christer Weinigel <wingel@nano-system.com>
+ */
+
+#include <linux/bitmap.h>
+#include <linux/cdev.h>
+#include <linux/cleanup.h>
+#include <linux/fs.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nsc_gpio.h>
+#include <linux/pci.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/scx200.h>
+#include <linux/spinlock.h>
+
+#define DRVNAME			"gpio-scx200"
+#define LEGACY_NAME		"scx200_gpio"
+#define SCX200_NGPIO		32
+
+#define SCX200_DATA_OUT		0x00
+#define SCX200_DATA_IN		0x04
+#define SCX200_CONFIG_SELECT	0x20
+#define SCX200_CONFIG_ACCESS	0x24
+
+#define SCX200_GPIO_OUTPUT_ENABLE	BIT(0)
+#define SCX200_GPIO_PUSH_PULL		BIT(1)
+#define SCX200_GPIO_PULL_UP		BIT(2)
+#define SCX200_GPIO_LOCK		BIT(3)
+
+struct scx200_gpio {
+	struct gpio_chip gc;
+	raw_spinlock_t lock; /* Serializes the config index and output updates. */
+	unsigned long base;
+};
+
+const struct software_node scx200_gpio_swnode = {
+	.name = DRVNAME,
+};
+EXPORT_SYMBOL_NS_GPL(scx200_gpio_swnode, "SCX200_GPIO");
+
+static u32 scx200_gpio_read_config(struct scx200_gpio *gpio, unsigned int offset)
+{
+	outl(offset, gpio->base + SCX200_CONFIG_SELECT);
+	return inl(gpio->base + SCX200_CONFIG_ACCESS);
+}
+
+static int scx200_gpio_update_config(struct scx200_gpio *gpio, u32 config,
+				     u32 mask, u32 value)
+{
+	u32 new_config = (config & ~mask) | value;
+
+	if (new_config == config)
+		return 0;
+	if (config & SCX200_GPIO_LOCK)
+		return -EPERM;
+
+	outl(new_config, gpio->base + SCX200_CONFIG_ACCESS);
+	return 0;
+}
+
+static int scx200_gpio_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct scx200_gpio *gpio = gpiochip_get_data(gc);
+
+	return !!(inl(gpio->base + SCX200_DATA_IN) & BIT(offset));
+}
+
+static int scx200_gpio_write(struct scx200_gpio *gpio, unsigned int offset,
+			     int value)
+{
+	unsigned long port = gpio->base + SCX200_DATA_OUT;
+	u32 mask = BIT(offset);
+	u32 data = inl(port);
+	u32 new_data = (data & ~mask) | (value ? mask : 0);
+
+	if (new_data != data)
+		outl(new_data, port);
+
+	/* The hardware ignores writes to a locked line. */
+	return (inl(port) & mask) == (new_data & mask) ? 0 : -EPERM;
+}
+
+static int scx200_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct scx200_gpio *gpio = gpiochip_get_data(gc);
+
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+	return scx200_gpio_write(gpio, offset, value);
+}
+
+static int scx200_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct scx200_gpio *gpio = gpiochip_get_data(gc);
+
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+	return scx200_gpio_read_config(gpio, offset) & SCX200_GPIO_OUTPUT_ENABLE ?
+		GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int scx200_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct scx200_gpio *gpio = gpiochip_get_data(gc);
+	u32 config;
+
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+	config = scx200_gpio_read_config(gpio, offset);
+	return scx200_gpio_update_config(gpio, config,
+					  SCX200_GPIO_OUTPUT_ENABLE, 0);
+}
+
+static int scx200_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int offset, int value)
+{
+	struct scx200_gpio *gpio = gpiochip_get_data(gc);
+	u32 config;
+	int ret;
+
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+	config = scx200_gpio_read_config(gpio, offset);
+	if ((config & SCX200_GPIO_LOCK) && !(config & SCX200_GPIO_OUTPUT_ENABLE))
+		return -EPERM;
+
+	ret = scx200_gpio_write(gpio, offset, value);
+	if (ret)
+		return ret;
+
+	return scx200_gpio_update_config(gpio, config, SCX200_GPIO_OUTPUT_ENABLE,
+					  SCX200_GPIO_OUTPUT_ENABLE);
+}
+
+static int scx200_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
+				  unsigned long config)
+{
+	struct scx200_gpio *gpio = gpiochip_get_data(gc);
+	u32 mask, value, old_config;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		mask = SCX200_GPIO_PUSH_PULL;
+		value = 0;
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		mask = SCX200_GPIO_PUSH_PULL;
+		value = SCX200_GPIO_PUSH_PULL;
+		break;
+	case PIN_CONFIG_BIAS_DISABLE:
+		mask = SCX200_GPIO_PULL_UP;
+		value = 0;
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		mask = SCX200_GPIO_PULL_UP;
+		value = SCX200_GPIO_PULL_UP;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+	old_config = scx200_gpio_read_config(gpio, offset);
+	return scx200_gpio_update_config(gpio, old_config, mask, value);
+}
+
+static int scx200_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	struct pci_dev *bridge = to_pci_dev(gc->parent->parent);
+
+	/* The SC1100 bonds out GPIOs 2 and 3 as well. */
+	if (bridge->device == PCI_DEVICE_ID_NS_SC1100_BRIDGE)
+		bitmap_clear(valid_mask, 4, 2);
+	else
+		bitmap_clear(valid_mask, 2, 4);
+
+	bitmap_clear(valid_mask, 21, ngpios - 21);
+	return 0;
+}
+
+static int major;
+module_param(major, int, 0);
+MODULE_PARM_DESC(major, "Major device number for the legacy interface");
+
+static struct cdev scx200_legacy_cdev;
+static dev_t scx200_legacy_devt;
+
+/* Protects the legacy frontend against provider detach during file I/O. */
+static DEFINE_MUTEX(scx200_legacy_lock);
+static struct scx200_gpio *scx200_legacy_gpio;
+
+static u32 scx200_legacy_config(unsigned int offset, u32 mask, u32 value)
+{
+	struct scx200_gpio *gpio = scx200_legacy_gpio;
+	u32 config;
+
+	guard(raw_spinlock_irqsave)(&gpio->lock);
+	config = scx200_gpio_read_config(gpio, offset);
+	scx200_gpio_update_config(gpio, config, ~mask, value);
+	return config;
+}
+
+static int scx200_legacy_get(unsigned int offset)
+{
+	return scx200_gpio_get(&scx200_legacy_gpio->gc, offset);
+}
+
+static void scx200_legacy_set(unsigned int offset, int value)
+{
+	scx200_gpio_set(&scx200_legacy_gpio->gc, offset, value);
+}
+
+static int scx200_legacy_current(unsigned int offset)
+{
+	return !!(inl(scx200_legacy_gpio->base + SCX200_DATA_OUT) & BIT(offset));
+}
+
+static struct nsc_gpio_ops scx200_legacy_ops = {
+	.gpio_config = scx200_legacy_config,
+	.gpio_dump = nsc_gpio_dump,
+	.gpio_get = scx200_legacy_get,
+	.gpio_set = scx200_legacy_set,
+	.gpio_current = scx200_legacy_current,
+};
+
+static int scx200_legacy_open(struct inode *inode, struct file *file)
+{
+	guard(mutex)(&scx200_legacy_lock);
+	if (!scx200_legacy_gpio)
+		return -ENODEV;
+
+	file->private_data = &scx200_legacy_ops;
+	return nonseekable_open(inode, file);
+}
+
+static ssize_t scx200_legacy_read(struct file *file, char __user *buf,
+				  size_t len, loff_t *ppos)
+{
+	guard(mutex)(&scx200_legacy_lock);
+	if (!scx200_legacy_gpio)
+		return -ENODEV;
+
+	return nsc_gpio_read(file, buf, len, ppos);
+}
+
+static ssize_t scx200_legacy_write(struct file *file, const char __user *buf,
+				   size_t len, loff_t *ppos)
+{
+	guard(mutex)(&scx200_legacy_lock);
+	if (!scx200_legacy_gpio)
+		return -ENODEV;
+
+	return nsc_gpio_write(file, buf, len, ppos);
+}
+
+static const struct file_operations scx200_legacy_fops = {
+	.owner = THIS_MODULE,
+	.open = scx200_legacy_open,
+	.read = scx200_legacy_read,
+	.write = scx200_legacy_write,
+};
+
+static void scx200_legacy_detach(void *data)
+{
+	guard(mutex)(&scx200_legacy_lock);
+	if (scx200_legacy_gpio == data) {
+		scx200_legacy_gpio = NULL;
+		scx200_legacy_ops.dev = NULL;
+	}
+}
+
+static int scx200_legacy_attach(struct scx200_gpio *gpio)
+{
+	struct device *dev = gpio->gc.parent;
+	dev_t devid;
+	int ret;
+
+	ret = devm_add_action(dev, scx200_legacy_detach, gpio);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&scx200_legacy_lock);
+	if (scx200_legacy_gpio)
+		return -EBUSY;
+
+	if (!scx200_legacy_devt) {
+		if (major) {
+			devid = MKDEV(major, 0);
+			ret = register_chrdev_region(devid, SCX200_NGPIO, LEGACY_NAME);
+		} else {
+			ret = alloc_chrdev_region(&devid, 0, SCX200_NGPIO, LEGACY_NAME);
+		}
+		if (ret)
+			return ret;
+
+		cdev_init(&scx200_legacy_cdev, &scx200_legacy_fops);
+		scx200_legacy_cdev.owner = THIS_MODULE;
+		ret = cdev_add(&scx200_legacy_cdev, devid, SCX200_NGPIO);
+		if (ret) {
+			unregister_chrdev_region(devid, SCX200_NGPIO);
+			return ret;
+		}
+
+		scx200_legacy_devt = devid;
+	}
+
+	scx200_legacy_gpio = gpio;
+	scx200_legacy_ops.dev = dev;
+	return 0;
+}
+
+static void scx200_gpio_remove_swnode(void *data)
+{
+	device_remove_software_node(data);
+}
+
+static int scx200_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct scx200_gpio *gpio;
+	struct resource *res;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!res)
+		return -ENODEV;
+
+	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return -ENOMEM;
+
+	if (!devm_request_region(dev, res->start, resource_size(res), DRVNAME))
+		return -EBUSY;
+
+	ret = device_add_software_node(dev, &scx200_gpio_swnode);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, scx200_gpio_remove_swnode, dev);
+	if (ret)
+		return ret;
+
+	gpio->base = res->start;
+	raw_spin_lock_init(&gpio->lock);
+	gpio->gc = (struct gpio_chip) {
+		.label = DRVNAME,
+		.parent = dev,
+		.fwnode = software_node_fwnode(&scx200_gpio_swnode),
+		.owner = THIS_MODULE,
+		.base = -1,
+		.ngpio = SCX200_NGPIO,
+		.get = scx200_gpio_get,
+		.set = scx200_gpio_set,
+		.get_direction = scx200_gpio_get_direction,
+		.direction_input = scx200_gpio_direction_input,
+		.direction_output = scx200_gpio_direction_output,
+		.set_config = scx200_gpio_set_config,
+		.init_valid_mask = scx200_gpio_init_valid_mask,
+	};
+
+	ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
+	if (ret)
+		return ret;
+
+	return scx200_legacy_attach(gpio);
+}
+
+static struct platform_driver scx200_gpio_driver = {
+	.driver.name = DRVNAME,
+	.probe = scx200_gpio_probe,
+};
+
+static int __init scx200_gpio_init(void)
+{
+	return platform_driver_register(&scx200_gpio_driver);
+}
+module_init(scx200_gpio_init);
+
+static void __exit scx200_gpio_exit(void)
+{
+	platform_driver_unregister(&scx200_gpio_driver);
+	if (scx200_legacy_devt) {
+		cdev_del(&scx200_legacy_cdev);
+		unregister_chrdev_region(scx200_legacy_devt, SCX200_NGPIO);
+	}
+}
+module_exit(scx200_gpio_exit);
+
+MODULE_AUTHOR("Christer Weinigel <wingel@nano-system.com>");
+MODULE_DESCRIPTION("NatSemi/AMD SCx200 GPIO driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRVNAME);
+MODULE_ALIAS(LEGACY_NAME);
diff --git a/drivers/leds/leds-net48xx.c b/drivers/leds/leds-net48xx.c
index a93468c13772..bb09e597a66e 100644
--- a/drivers/leds/leds-net48xx.c
+++ b/drivers/leds/leds-net48xx.c
@@ -7,68 +7,89 @@
  * Based on leds-ams-delta.c
  */
 
-#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/init.h>
-#include <linux/platform_device.h>
 #include <linux/leds.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/nsc_gpio.h>
-#include <linux/scx200_gpio.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/scx200.h>
 
 #define DRVNAME "net48xx-led"
-#define NET48XX_ERROR_LED_GPIO	20
+
+struct net48xx_led {
+	struct led_classdev cdev;
+	struct gpio_desc *gpio;
+};
 
 static struct platform_device *pdev;
 
 static void net48xx_error_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+				  enum led_brightness value)
 {
-	scx200_gpio_ops.gpio_set(NET48XX_ERROR_LED_GPIO, value ? 1 : 0);
+	struct net48xx_led *led = container_of(led_cdev, struct net48xx_led, cdev);
+
+	gpiod_set_value(led->gpio, value != LED_OFF);
 }
 
-static struct led_classdev net48xx_error_led = {
-	.name		= "net48xx::error",
-	.brightness_set	= net48xx_error_led_set,
-	.flags		= LED_CORE_SUSPENDRESUME,
+static const struct property_entry net48xx_led_props[] = {
+	PROPERTY_ENTRY_GPIO("gpios", &scx200_gpio_swnode, 20, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node net48xx_led_node = {
+	.name = DRVNAME,
+	.properties = net48xx_led_props,
 };
 
 static int net48xx_led_probe(struct platform_device *pdev)
 {
-	return devm_led_classdev_register(&pdev->dev, &net48xx_error_led);
+	struct device *dev = &pdev->dev;
+	struct net48xx_led *led;
+
+	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
+	if (!led)
+		return -ENOMEM;
+
+	led->gpio = devm_gpiod_get(dev, NULL, GPIOD_ASIS);
+	if (IS_ERR(led->gpio))
+		return dev_err_probe(dev, PTR_ERR(led->gpio), "Failed to get error LED GPIO\n");
+
+	led->cdev.name = "net48xx::error";
+	led->cdev.brightness_set = net48xx_error_led_set;
+	led->cdev.flags = LED_CORE_SUSPENDRESUME;
+
+	return devm_led_classdev_register(dev, &led->cdev);
 }
 
 static struct platform_driver net48xx_led_driver = {
-	.probe		= net48xx_led_probe,
-	.driver		= {
-		.name		= DRVNAME,
-	},
+	.probe = net48xx_led_probe,
+	.driver.name = DRVNAME,
 };
 
 static int __init net48xx_led_init(void)
 {
+	const struct platform_device_info info = {
+		.name = DRVNAME,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &net48xx_led_node,
+	};
 	int ret;
 
-	/* small hack, but scx200_gpio doesn't set .dev if the probe fails */
-	if (!scx200_gpio_ops.dev) {
-		ret = -ENODEV;
-		goto out;
-	}
-
 	ret = platform_driver_register(&net48xx_led_driver);
-	if (ret < 0)
-		goto out;
+	if (ret)
+		return ret;
 
-	pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
+	pdev = platform_device_register_full(&info);
 	if (IS_ERR(pdev)) {
-		ret = PTR_ERR(pdev);
 		platform_driver_unregister(&net48xx_led_driver);
-		goto out;
+		return PTR_ERR(pdev);
 	}
 
-out:
-	return ret;
+	return 0;
 }
 
 static void __exit net48xx_led_exit(void)
@@ -83,4 +104,4 @@ module_exit(net48xx_led_exit);
 MODULE_AUTHOR("Chris Boot <bootc@bootc.net>");
 MODULE_DESCRIPTION("Soekris net48xx LED driver");
 MODULE_LICENSE("GPL");
-
+MODULE_IMPORT_NS("SCX200_GPIO");
diff --git a/drivers/leds/leds-wrap.c b/drivers/leds/leds-wrap.c
index 794697e16068..91ebb1ac3578 100644
--- a/drivers/leds/leds-wrap.c
+++ b/drivers/leds/leds-wrap.c
@@ -7,112 +7,115 @@
  * Based on leds-net48xx.c
  */
 
-#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/init.h>
-#include <linux/platform_device.h>
 #include <linux/leds.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/scx200_gpio.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/scx200.h>
 
 #define DRVNAME "wrap-led"
-#define WRAP_POWER_LED_GPIO	2
-#define WRAP_ERROR_LED_GPIO	3
-#define WRAP_EXTRA_LED_GPIO	18
+
+struct wrap_led {
+	struct led_classdev cdev;
+	struct gpio_desc *gpio;
+};
 
 static struct platform_device *pdev;
 
-static void wrap_power_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
+static void wrap_led_set(struct led_classdev *led_cdev,
+			 enum led_brightness value)
 {
-	if (value)
-		scx200_gpio_set_low(WRAP_POWER_LED_GPIO);
-	else
-		scx200_gpio_set_high(WRAP_POWER_LED_GPIO);
-}
+	struct wrap_led *led = container_of(led_cdev, struct wrap_led, cdev);
 
-static void wrap_error_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
-{
-	if (value)
-		scx200_gpio_set_low(WRAP_ERROR_LED_GPIO);
-	else
-		scx200_gpio_set_high(WRAP_ERROR_LED_GPIO);
+	gpiod_set_value(led->gpio, value != LED_OFF);
 }
 
-static void wrap_extra_led_set(struct led_classdev *led_cdev,
-		enum led_brightness value)
-{
-	if (value)
-		scx200_gpio_set_low(WRAP_EXTRA_LED_GPIO);
-	else
-		scx200_gpio_set_high(WRAP_EXTRA_LED_GPIO);
-}
+static const struct software_node_ref_args wrap_led_gpios[] = {
+	SOFTWARE_NODE_REFERENCE(&scx200_gpio_swnode, 2, GPIO_ACTIVE_LOW),
+	SOFTWARE_NODE_REFERENCE(&scx200_gpio_swnode, 3, GPIO_ACTIVE_LOW),
+	SOFTWARE_NODE_REFERENCE(&scx200_gpio_swnode, 18, GPIO_ACTIVE_LOW),
+};
 
-static struct led_classdev wrap_power_led = {
-	.name			= "wrap::power",
-	.brightness_set		= wrap_power_led_set,
-	.default_trigger	= "default-on",
-	.flags			= LED_CORE_SUSPENDRESUME,
+static const struct property_entry wrap_led_props[] = {
+	PROPERTY_ENTRY_REF_ARRAY("gpios", wrap_led_gpios),
+	{ }
 };
 
-static struct led_classdev wrap_error_led = {
-	.name		= "wrap::error",
-	.brightness_set	= wrap_error_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+static const struct software_node wrap_led_node = {
+	.name = DRVNAME,
+	.properties = wrap_led_props,
 };
 
-static struct led_classdev wrap_extra_led = {
-	.name           = "wrap::extra",
-	.brightness_set = wrap_extra_led_set,
-	.flags			= LED_CORE_SUSPENDRESUME,
+static const struct {
+	const char *name;
+	const char *default_trigger;
+} wrap_leds[] = {
+	{ "wrap::power", "default-on" },
+	{ "wrap::error" },
+	{ "wrap::extra" },
 };
 
 static int wrap_led_probe(struct platform_device *pdev)
 {
-	int ret;
-
-	ret = devm_led_classdev_register(&pdev->dev, &wrap_power_led);
-	if (ret < 0)
-		return ret;
-
-	ret = devm_led_classdev_register(&pdev->dev, &wrap_error_led);
-	if (ret < 0)
-		return ret;
+	struct device *dev = &pdev->dev;
+	struct wrap_led *leds;
+	int ret, i;
+
+	leds = devm_kcalloc(dev, ARRAY_SIZE(wrap_leds), sizeof(*leds), GFP_KERNEL);
+	if (!leds)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(wrap_leds); i++) {
+		struct wrap_led *led = &leds[i];
+
+		led->gpio = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
+		if (IS_ERR(led->gpio))
+			return dev_err_probe(dev, PTR_ERR(led->gpio),
+					     "Failed to get %s GPIO\n", wrap_leds[i].name);
+
+		led->cdev.name = wrap_leds[i].name;
+		led->cdev.default_trigger = wrap_leds[i].default_trigger;
+		led->cdev.brightness_set = wrap_led_set;
+		led->cdev.flags = LED_CORE_SUSPENDRESUME;
+
+		ret = devm_led_classdev_register(dev, &led->cdev);
+		if (ret)
+			return ret;
+	}
 
-	return  devm_led_classdev_register(&pdev->dev, &wrap_extra_led);
+	return 0;
 }
 
 static struct platform_driver wrap_led_driver = {
-	.probe		= wrap_led_probe,
-	.driver		= {
-		.name		= DRVNAME,
-	},
+	.probe = wrap_led_probe,
+	.driver.name = DRVNAME,
 };
 
 static int __init wrap_led_init(void)
 {
+	const struct platform_device_info info = {
+		.name = DRVNAME,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &wrap_led_node,
+	};
 	int ret;
 
-	if (!scx200_gpio_present()) {
-		ret = -ENODEV;
-		goto out;
-	}
-
 	ret = platform_driver_register(&wrap_led_driver);
-	if (ret < 0)
-		goto out;
+	if (ret)
+		return ret;
 
-	pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
+	pdev = platform_device_register_full(&info);
 	if (IS_ERR(pdev)) {
-		ret = PTR_ERR(pdev);
 		platform_driver_unregister(&wrap_led_driver);
-		goto out;
+		return PTR_ERR(pdev);
 	}
 
-out:
-	return ret;
+	return 0;
 }
 
 static void __exit wrap_led_exit(void)
@@ -127,4 +130,4 @@ module_exit(wrap_led_exit);
 MODULE_AUTHOR("Kristian Kielhofner <kris@krisk.org>");
 MODULE_DESCRIPTION("PCEngines WRAP LED driver");
 MODULE_LICENSE("GPL");
-
+MODULE_IMPORT_NS("SCX200_GPIO");
diff --git a/include/linux/scx200.h b/include/linux/scx200.h
index 652ec1a45f7c..8587b7784c57 100644
--- a/include/linux/scx200.h
+++ b/include/linux/scx200.h
@@ -9,6 +9,7 @@
 /* Interesting stuff for the National Semiconductor SCx200 CPU */
 
 extern unsigned scx200_cb_base;
+extern const struct software_node scx200_gpio_swnode;
 
 #define scx200_cb_present() (scx200_cb_base!=0)
 
diff --git a/include/linux/scx200_gpio.h b/include/linux/scx200_gpio.h
deleted file mode 100644
index 6386ddbb6b70..000000000000
--- a/include/linux/scx200_gpio.h
+++ /dev/null
@@ -1,89 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-u32 scx200_gpio_configure(unsigned index, u32 set, u32 clear);
-
-extern unsigned scx200_gpio_base;
-extern unsigned long scx200_gpio_shadow[2];
-extern struct nsc_gpio_ops scx200_gpio_ops;
-
-#define scx200_gpio_present() (scx200_gpio_base!=0)
-
-/* Definitions to make sure I do the same thing in all functions */
-#define __SCx200_GPIO_BANK unsigned bank = index>>5
-#define __SCx200_GPIO_IOADDR unsigned short ioaddr = scx200_gpio_base+0x10*bank
-#define __SCx200_GPIO_SHADOW unsigned long *shadow = scx200_gpio_shadow+bank
-#define __SCx200_GPIO_INDEX index &= 31
-
-#define __SCx200_GPIO_OUT __asm__ __volatile__("outsl":"=mS" (shadow):"d" (ioaddr), "0" (shadow))
-
-/* returns the value of the GPIO pin */
-
-static inline int scx200_gpio_get(unsigned index) {
-	__SCx200_GPIO_BANK;
-	__SCx200_GPIO_IOADDR + 0x04;
-	__SCx200_GPIO_INDEX;
-		
-	return (inl(ioaddr) & (1<<index)) ? 1 : 0;
-}
-
-/* return the value driven on the GPIO signal (the value that will be
-   driven if the GPIO is configured as an output, it might not be the
-   state of the GPIO right now if the GPIO is configured as an input) */
-
-static inline int scx200_gpio_current(unsigned index) {
-        __SCx200_GPIO_BANK;
-	__SCx200_GPIO_INDEX;
-		
-	return (scx200_gpio_shadow[bank] & (1<<index)) ? 1 : 0;
-}
-
-/* drive the GPIO signal high */
-
-static inline void scx200_gpio_set_high(unsigned index) {
-	__SCx200_GPIO_BANK;
-	__SCx200_GPIO_IOADDR;
-	__SCx200_GPIO_SHADOW;
-	__SCx200_GPIO_INDEX;
-	set_bit(index, shadow);	/* __set_bit()? */
-	__SCx200_GPIO_OUT;
-}
-
-/* drive the GPIO signal low */
-
-static inline void scx200_gpio_set_low(unsigned index) {
-	__SCx200_GPIO_BANK;
-	__SCx200_GPIO_IOADDR;
-	__SCx200_GPIO_SHADOW;
-	__SCx200_GPIO_INDEX;
-	clear_bit(index, shadow); /* __clear_bit()? */
-	__SCx200_GPIO_OUT;
-}
-
-/* drive the GPIO signal to state */
-
-static inline void scx200_gpio_set(unsigned index, int state) {
-	__SCx200_GPIO_BANK;
-	__SCx200_GPIO_IOADDR;
-	__SCx200_GPIO_SHADOW;
-	__SCx200_GPIO_INDEX;
-	if (state)
-		set_bit(index, shadow);
-	else
-		clear_bit(index, shadow);
-	__SCx200_GPIO_OUT;
-}
-
-/* toggle the GPIO signal */
-static inline void scx200_gpio_change(unsigned index) {
-	__SCx200_GPIO_BANK;
-	__SCx200_GPIO_IOADDR;
-	__SCx200_GPIO_SHADOW;
-	__SCx200_GPIO_INDEX;
-	change_bit(index, shadow);
-	__SCx200_GPIO_OUT;
-}
-
-#undef __SCx200_GPIO_BANK
-#undef __SCx200_GPIO_IOADDR
-#undef __SCx200_GPIO_SHADOW
-#undef __SCx200_GPIO_INDEX
-#undef __SCx200_GPIO_OUT

-- 
2.56.1

