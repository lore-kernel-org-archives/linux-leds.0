Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437010;
	b=PBrS9S1VVInZ3X6HghbmlOxQ4YrDgqeQHoQNNT+StEIVrcVb5EW5nMLANDt5AOBUzhjv
	 jWb1d55BZa5qga25/XjX35eltobvepgtA2p1keFYM1Gb52Vp6pzFNX0HoB8ehEJmE8BCU
	 CGKUVYlzfw4sxqiwzGA4Ywch1uKohIUHuK1GXv4UfC1ip0zOIcTPajDyxREdMqRjo3Un3
	 paLIaYNV1kWNBAjqLO9Sxr0QhO+TMIjVGnSBs9LiM3r1clydaFsFw+822Q77BRv+4QBY8
	 Enc0tqZ6e7s2woMZ4mfn12ZE8EzMh69aLhFbVcKwdnOuU5ZYV/a+cdeqWs3Gb4yucjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437010;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=CtGMmO0BB729UC5xD7u3gEqCBxOyYL2pLXOXwao4TWw=;
	b=OMt6PFc7I6w3SAZxL9XBOQUX+gsdz0lTEBnxoDScOMdxEas2ZUWvn6pY5APH42vdkXZm
	 OmbKSVBZbFolEjAEzhaFU5v8IE5Er2gEszXuB5DiuhI/V5IoXiRHGzLmIIhqMbXH+mZf5
	 THEylhu9sJrUDBy3ZVCrqOntJG7QhqYDEh7T8CeepSBeJb2mNXwZ/77RVV6NsNWv8x14e
	 ohAdqJO33w1g9fuO6IRWPXqXAQCiSy6mtj1djpFe7dktIju93wa69+g5cZu51ve7+m22S
	 xkFFZezoj2Is5JZQOO1/lqWnXjMT18o3xkjRLUWg6xYpu8Q1Nqt9ga2FEWH7jsSWeYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEMkLRpc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25CD606A32E;
	Mon, 23 Nov 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MEMkLRpc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F7F1F000E6;
	Mon, 23 Nov 2026 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437010;
	bh=CtGMmO0BB729UC5xD7u3gEqCBxOyYL2pLXOXwao4TWw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MEMkLRpcgS5HYNVDunpWDCODhmum65I0y/wB1J9Xi0CK62//7d6wm/zhUBNHhMz33
	 AwS5idiGE2Fjr3J4egYXx5FpfN6uRVch+YvOtYVtKdUGeGKJqziOMvCYS8NEwuKrEd
	 dKtpR2naEZH6A+UceJiQUiPcDdboZ4MZsnxHWxPDa5AP2GXhh/sU48FGa4yRhlLVD3
	 HcpyYzbECWlim8n6MeG2xbifWEozf4+a8W+eYupQrzSvD2ycFGyxKwUd3rk8E8lHrT
	 +umvosowMVV5o8t2Qrnt0NQvr35bZtQNghMpgk9Rh13rAPCJEOtEuKm3Ti4wIzZpnz
	 J36hQa23kWtmg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 13:29:55 +0100
Subject: [PATCH 3/3] gpio: remove the legacy NSC GPIO API
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
Message-Id: <20261123-b4-nsc-gpio-v1-3-b2d97eba2662@kernel.org>
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

Both controllers now expose the standard GPIO character-device ABI,
and the net48xx and WRAP LED drivers use GPIO descriptors. Remove the
per-pin character devices and their shared file operations.

We assume there are no remaining users of the old NSC GPIO userspace
ABI.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/char/Kconfig        |  10 ---
 drivers/char/Makefile       |   1 -
 drivers/char/nsc_gpio.c     | 126 -----------------------------------
 drivers/gpio/Kconfig        |   2 -
 drivers/gpio/gpio-pc8736x.c | 114 +------------------------------
 drivers/gpio/gpio-scx200.c  | 159 +-------------------------------------------
 include/linux/nsc_gpio.h    |  41 ------------
 7 files changed, 3 insertions(+), 450 deletions(-)

diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 09cc9b271e93..073ac08d08d2 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -223,16 +223,6 @@ config SONYPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called sonypi.
 
-config NSC_GPIO
-	tristate "NatSemi Base GPIO Support"
-	depends on X86_32
-	# selected by SCx200_GPIO and PC8736x_GPIO
-	# what about 2 selectors differing: m != y
-	help
-	  Common support used (and needed) by scx200_gpio and
-	  pc8736x_gpio drivers.  If those drivers are built as
-	  modules, this one will be too, named nsc_gpio
-
 config DEVMEM
 	bool "/dev/mem virtual device support"
 	default y
diff --git a/drivers/char/Makefile b/drivers/char/Makefile
index b743732c525c..e388a7cbad84 100644
--- a/drivers/char/Makefile
+++ b/drivers/char/Makefile
@@ -26,7 +26,6 @@ obj-$(CONFIG_HW_RANDOM)		+= hw_random/
 obj-$(CONFIG_PPDEV)		+= ppdev.o
 obj-$(CONFIG_NWBUTTON)		+= nwbutton.o
 obj-$(CONFIG_NWFLASH)		+= nwflash.o
-obj-$(CONFIG_NSC_GPIO)		+= nsc_gpio.o
 obj-$(CONFIG_TELCLOCK)		+= tlclk.o
 
 obj-y				+= agp/
diff --git a/drivers/char/nsc_gpio.c b/drivers/char/nsc_gpio.c
deleted file mode 100644
index 2c9b12b85435..000000000000
--- a/drivers/char/nsc_gpio.c
+++ /dev/null
@@ -1,126 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* linux/drivers/char/nsc_gpio.c
-
-   National Semiconductor common GPIO device-file/VFS methods.
-   Allows a user space process to control the GPIO pins.
-
-   Copyright (c) 2001,2002 Christer Weinigel <wingel@nano-system.com>
-   Copyright (c) 2005      Jim Cromie <jim.cromie@gmail.com>
-*/
-
-#include <linux/fs.h>
-#include <linux/module.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/nsc_gpio.h>
-#include <linux/platform_device.h>
-#include <linux/uaccess.h>
-#include <asm/io.h>
-
-#define NAME "nsc_gpio"
-
-void nsc_gpio_dump(struct nsc_gpio_ops *amp, unsigned index)
-{
-	/* retrieve current config w/o changing it */
-	u32 config = amp->gpio_config(index, ~0, 0);
-
-	/* user requested via 'v' command, so its INFO */
-	dev_info(amp->dev, "io%02u: 0x%04x %s %s %s %s %s %s %s\tio:%d/%d\n",
-		 index, config,
-		 (config & 1) ? "OE" : "TS",      /* output-enabled/tristate */
-		 (config & 2) ? "PP" : "OD",      /* push pull / open drain */
-		 (config & 4) ? "PUE" : "PUD",    /* pull up enabled/disabled */
-		 (config & 8) ? "LOCKED" : "",    /* locked / unlocked */
-		 (config & 16) ? "LEVEL" : "EDGE",/* level/edge input */
-		 (config & 32) ? "HI" : "LO",     /* trigger on rise/fall edge */
-		 (config & 64) ? "DEBOUNCE" : "", /* debounce */
-
-		 amp->gpio_get(index), amp->gpio_current(index));
-}
-
-ssize_t nsc_gpio_write(struct file *file, const char __user *data,
-		       size_t len, loff_t *ppos)
-{
-	unsigned m = iminor(file_inode(file));
-	struct nsc_gpio_ops *amp = file->private_data;
-	struct device *dev = amp->dev;
-	size_t i;
-	int err = 0;
-
-	for (i = 0; i < len; ++i) {
-		char c;
-		if (get_user(c, data + i))
-			return -EFAULT;
-		switch (c) {
-		case '0':
-			amp->gpio_set(m, 0);
-			break;
-		case '1':
-			amp->gpio_set(m, 1);
-			break;
-		case 'O':
-			dev_dbg(dev, "GPIO%d output enabled\n", m);
-			amp->gpio_config(m, ~1, 1);
-			break;
-		case 'o':
-			dev_dbg(dev, "GPIO%d output disabled\n", m);
-			amp->gpio_config(m, ~1, 0);
-			break;
-		case 'T':
-			dev_dbg(dev, "GPIO%d output is push pull\n", m);
-			amp->gpio_config(m, ~2, 2);
-			break;
-		case 't':
-			dev_dbg(dev, "GPIO%d output is open drain\n", m);
-			amp->gpio_config(m, ~2, 0);
-			break;
-		case 'P':
-			dev_dbg(dev, "GPIO%d pull up enabled\n", m);
-			amp->gpio_config(m, ~4, 4);
-			break;
-		case 'p':
-			dev_dbg(dev, "GPIO%d pull up disabled\n", m);
-			amp->gpio_config(m, ~4, 0);
-			break;
-		case 'v':
-			/* View Current pin settings */
-			amp->gpio_dump(amp, m);
-			break;
-		case '\n':
-			/* end of settings string, do nothing */
-			break;
-		default:
-			dev_err(dev, "io%2d bad setting: chr<0x%2x>\n",
-				m, (int)c);
-			err++;
-		}
-	}
-	if (err)
-		return -EINVAL;	/* full string handled, report error */
-
-	return len;
-}
-
-ssize_t nsc_gpio_read(struct file *file, char __user * buf,
-		      size_t len, loff_t * ppos)
-{
-	unsigned m = iminor(file_inode(file));
-	int value;
-	struct nsc_gpio_ops *amp = file->private_data;
-
-	value = amp->gpio_get(m);
-	if (put_user(value ? '1' : '0', buf))
-		return -EFAULT;
-
-	return 1;
-}
-
-/* common file-ops routines for both scx200_gpio and pc87360_gpio */
-EXPORT_SYMBOL(nsc_gpio_write);
-EXPORT_SYMBOL(nsc_gpio_read);
-EXPORT_SYMBOL(nsc_gpio_dump);
-
-MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
-MODULE_DESCRIPTION("NatSemi GPIO Common Methods");
-MODULE_LICENSE("GPL");
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b78d0cf0781b..7b1ed87747f0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1098,7 +1098,6 @@ config PC8736x_GPIO
 	depends on X86_32
 	default SCx200_GPIO
 	select ISA_BUS_API
-	select NSC_GPIO
 	help
 	  Support the GPIO controller in the National Semiconductor
 	  PC87365 and PC87366 Super I/O chips. The GPIO logical device
@@ -1109,7 +1108,6 @@ config PC8736x_GPIO
 config SCx200_GPIO
 	tristate "NatSemi SCx200 GPIO support"
 	depends on SCx200 && HAS_IOPORT
-	select NSC_GPIO
 	help
 	  Support the GPIO controller on National Semiconductor SCx200 and
 	  SC1100 processors. The first bank is exposed to GPIO consumers
diff --git a/drivers/gpio/gpio-pc8736x.c b/drivers/gpio/gpio-pc8736x.c
index 5c18903b1add..507100a45ada 100644
--- a/drivers/gpio/gpio-pc8736x.c
+++ b/drivers/gpio/gpio-pc8736x.c
@@ -8,20 +8,16 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/cdev.h>
 #include <linux/cleanup.h>
-#include <linux/fs.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/isa.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/nsc_gpio.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
 #define DRVNAME			"gpio-pc8736x"
-#define LEGACY_NAME		"pc8736x_gpio"
 
 #define SIO_BASE1		0x2e
 #define SIO_BASE2		0x4e
@@ -39,7 +35,6 @@
 
 #define PC8736X_GPIO_RANGE	16
 #define PC8736X_NGPIO		29
-#define LEGACY_NGPIO		32
 #define PC8736X_GPIO_PORT_OUT		0
 #define PC8736X_GPIO_PORT_IN		1
 #define PC8736X_GPIO_OUTPUT_ENABLE	BIT(0)
@@ -203,103 +198,10 @@ static int pc8736x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 	return pc8736x_gpio_update_config(gpio, old_config, mask, value);
 }
 
-static int major;
-module_param(major, int, 0);
-MODULE_PARM_DESC(major, "Major device number for the legacy interface");
-
-static struct pc8736x_gpio *pc8736x_legacy_gpio;
-static struct cdev pc8736x_gpio_cdev;
-static dev_t pc8736x_devt;
-static u8 pc8736x_legacy_shadow[ARRAY_SIZE(port_offset)];
-
-static u32 pc8736x_legacy_config(unsigned int offset, u32 mask, u32 value)
-{
-	struct pc8736x_gpio *gpio = pc8736x_legacy_gpio;
-	u8 config;
-
-	guard(mutex)(&gpio->lock);
-	config = pc8736x_select_pin(gpio, offset);
-	pc8736x_gpio_update_config(gpio, config, ~mask, value);
-	return config;
-}
-
-static int pc8736x_legacy_get(unsigned int offset)
-{
-	struct pc8736x_gpio *gpio = pc8736x_legacy_gpio;
-
-	return pc8736x_gpio_get(&gpio->gc, offset);
-}
-
-static void pc8736x_legacy_set(unsigned int offset, int value)
-{
-	struct pc8736x_gpio *gpio = pc8736x_legacy_gpio;
-	unsigned int port = offset / 8;
-
-	guard(mutex)(&gpio->lock);
-	pc8736x_gpio_write(gpio, offset, value);
-	pc8736x_legacy_shadow[port] =
-		inb_p(gpio->base + port_offset[port] + PC8736X_GPIO_PORT_IN);
-}
-
-static int pc8736x_legacy_current(unsigned int offset)
-{
-	return !!(READ_ONCE(pc8736x_legacy_shadow[offset / 8]) & BIT(offset % 8));
-}
-
-static struct nsc_gpio_ops pc8736x_legacy_ops = {
-	.gpio_config = pc8736x_legacy_config,
-	.gpio_dump = nsc_gpio_dump,
-	.gpio_get = pc8736x_legacy_get,
-	.gpio_set = pc8736x_legacy_set,
-	.gpio_current = pc8736x_legacy_current,
-};
-
-static int pc8736x_legacy_open(struct inode *inode, struct file *file)
-{
-	file->private_data = &pc8736x_legacy_ops;
-	return nonseekable_open(inode, file);
-}
-
-static const struct file_operations pc8736x_legacy_fops = {
-	.owner = THIS_MODULE,
-	.open = pc8736x_legacy_open,
-	.read = nsc_gpio_read,
-	.write = nsc_gpio_write,
-};
-
-static int pc8736x_legacy_register(struct pc8736x_gpio *gpio)
-{
-	int ret, port;
-
-	for (port = 0; port < ARRAY_SIZE(port_offset); port++)
-		pc8736x_legacy_shadow[port] =
-			inb_p(gpio->base + port_offset[port] + PC8736X_GPIO_PORT_OUT);
-
-	if (major) {
-		pc8736x_devt = MKDEV(major, 0);
-		ret = register_chrdev_region(pc8736x_devt, LEGACY_NGPIO, LEGACY_NAME);
-	} else {
-		ret = alloc_chrdev_region(&pc8736x_devt, 0, LEGACY_NGPIO, LEGACY_NAME);
-	}
-	if (ret)
-		return ret;
-
-	pc8736x_legacy_gpio = gpio;
-	pc8736x_legacy_ops.dev = gpio->gc.parent;
-	cdev_init(&pc8736x_gpio_cdev, &pc8736x_legacy_fops);
-	pc8736x_gpio_cdev.owner = THIS_MODULE;
-	ret = cdev_add(&pc8736x_gpio_cdev, pc8736x_devt, LEGACY_NGPIO);
-	if (ret)
-		unregister_chrdev_region(pc8736x_devt, LEGACY_NGPIO);
-
-	return ret;
-}
-
 static int pc8736x_gpio_probe(struct device *dev, unsigned int id)
 {
 	struct pc8736x_gpio *gpio;
 	unsigned int sio, base;
-	int ret;
 
 	if (pc8736x_present(SIO_BASE1))
 		sio = SIO_BASE1;
@@ -345,32 +247,18 @@ static int pc8736x_gpio_probe(struct device *dev, unsigned int id)
 		.set_config = pc8736x_gpio_set_config,
 	};
 
-	ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
-	if (ret)
-		return ret;
-
-	return pc8736x_legacy_register(gpio);
-}
-
-static void pc8736x_gpio_remove(struct device *dev, unsigned int id)
-{
-	cdev_del(&pc8736x_gpio_cdev);
-	unregister_chrdev_region(pc8736x_devt, LEGACY_NGPIO);
+	return devm_gpiochip_add_data(dev, &gpio->gc, gpio);
 }
 
 static struct isa_driver pc8736x_gpio_driver = {
 	.driver = {
 		.name = DRVNAME,
 		.owner = THIS_MODULE,
-		/* An open legacy GPIO file pins the module, but not the chip. */
-		.suppress_bind_attrs = true,
 	},
 	.probe = pc8736x_gpio_probe,
-	.remove = pc8736x_gpio_remove,
 };
 module_isa_driver(pc8736x_gpio_driver, 1);
 
 MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
 MODULE_DESCRIPTION("NatSemi/Winbond PC87365/PC87366 GPIO driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS(LEGACY_NAME);
diff --git a/drivers/gpio/gpio-scx200.c b/drivers/gpio/gpio-scx200.c
index 5c0e86474481..0174cc7c0e97 100644
--- a/drivers/gpio/gpio-scx200.c
+++ b/drivers/gpio/gpio-scx200.c
@@ -6,15 +6,11 @@
  */
 
 #include <linux/bitmap.h>
-#include <linux/cdev.h>
 #include <linux/cleanup.h>
-#include <linux/fs.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/nsc_gpio.h>
 #include <linux/pci.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
@@ -23,7 +19,6 @@
 #include <linux/spinlock.h>
 
 #define DRVNAME			"gpio-scx200"
-#define LEGACY_NAME		"scx200_gpio"
 #define SCX200_NGPIO		32
 
 #define SCX200_DATA_OUT		0x00
@@ -185,137 +180,6 @@ static int scx200_gpio_init_valid_mask(struct gpio_chip *gc,
 	return 0;
 }
 
-static int major;
-module_param(major, int, 0);
-MODULE_PARM_DESC(major, "Major device number for the legacy interface");
-
-static struct cdev scx200_legacy_cdev;
-static dev_t scx200_legacy_devt;
-
-/* Protects the legacy frontend against provider detach during file I/O. */
-static DEFINE_MUTEX(scx200_legacy_lock);
-static struct scx200_gpio *scx200_legacy_gpio;
-
-static u32 scx200_legacy_config(unsigned int offset, u32 mask, u32 value)
-{
-	struct scx200_gpio *gpio = scx200_legacy_gpio;
-	u32 config;
-
-	guard(raw_spinlock_irqsave)(&gpio->lock);
-	config = scx200_gpio_read_config(gpio, offset);
-	scx200_gpio_update_config(gpio, config, ~mask, value);
-	return config;
-}
-
-static int scx200_legacy_get(unsigned int offset)
-{
-	return scx200_gpio_get(&scx200_legacy_gpio->gc, offset);
-}
-
-static void scx200_legacy_set(unsigned int offset, int value)
-{
-	scx200_gpio_set(&scx200_legacy_gpio->gc, offset, value);
-}
-
-static int scx200_legacy_current(unsigned int offset)
-{
-	return !!(inl(scx200_legacy_gpio->base + SCX200_DATA_OUT) & BIT(offset));
-}
-
-static struct nsc_gpio_ops scx200_legacy_ops = {
-	.gpio_config = scx200_legacy_config,
-	.gpio_dump = nsc_gpio_dump,
-	.gpio_get = scx200_legacy_get,
-	.gpio_set = scx200_legacy_set,
-	.gpio_current = scx200_legacy_current,
-};
-
-static int scx200_legacy_open(struct inode *inode, struct file *file)
-{
-	guard(mutex)(&scx200_legacy_lock);
-	if (!scx200_legacy_gpio)
-		return -ENODEV;
-
-	file->private_data = &scx200_legacy_ops;
-	return nonseekable_open(inode, file);
-}
-
-static ssize_t scx200_legacy_read(struct file *file, char __user *buf,
-				  size_t len, loff_t *ppos)
-{
-	guard(mutex)(&scx200_legacy_lock);
-	if (!scx200_legacy_gpio)
-		return -ENODEV;
-
-	return nsc_gpio_read(file, buf, len, ppos);
-}
-
-static ssize_t scx200_legacy_write(struct file *file, const char __user *buf,
-				   size_t len, loff_t *ppos)
-{
-	guard(mutex)(&scx200_legacy_lock);
-	if (!scx200_legacy_gpio)
-		return -ENODEV;
-
-	return nsc_gpio_write(file, buf, len, ppos);
-}
-
-static const struct file_operations scx200_legacy_fops = {
-	.owner = THIS_MODULE,
-	.open = scx200_legacy_open,
-	.read = scx200_legacy_read,
-	.write = scx200_legacy_write,
-};
-
-static void scx200_legacy_detach(void *data)
-{
-	guard(mutex)(&scx200_legacy_lock);
-	if (scx200_legacy_gpio == data) {
-		scx200_legacy_gpio = NULL;
-		scx200_legacy_ops.dev = NULL;
-	}
-}
-
-static int scx200_legacy_attach(struct scx200_gpio *gpio)
-{
-	struct device *dev = gpio->gc.parent;
-	dev_t devid;
-	int ret;
-
-	ret = devm_add_action(dev, scx200_legacy_detach, gpio);
-	if (ret)
-		return ret;
-
-	guard(mutex)(&scx200_legacy_lock);
-	if (scx200_legacy_gpio)
-		return -EBUSY;
-
-	if (!scx200_legacy_devt) {
-		if (major) {
-			devid = MKDEV(major, 0);
-			ret = register_chrdev_region(devid, SCX200_NGPIO, LEGACY_NAME);
-		} else {
-			ret = alloc_chrdev_region(&devid, 0, SCX200_NGPIO, LEGACY_NAME);
-		}
-		if (ret)
-			return ret;
-
-		cdev_init(&scx200_legacy_cdev, &scx200_legacy_fops);
-		scx200_legacy_cdev.owner = THIS_MODULE;
-		ret = cdev_add(&scx200_legacy_cdev, devid, SCX200_NGPIO);
-		if (ret) {
-			unregister_chrdev_region(devid, SCX200_NGPIO);
-			return ret;
-		}
-
-		scx200_legacy_devt = devid;
-	}
-
-	scx200_legacy_gpio = gpio;
-	scx200_legacy_ops.dev = dev;
-	return 0;
-}
-
 static void scx200_gpio_remove_swnode(void *data)
 {
 	device_remove_software_node(data);
@@ -365,11 +229,7 @@ static int scx200_gpio_probe(struct platform_device *pdev)
 		.init_valid_mask = scx200_gpio_init_valid_mask,
 	};
 
-	ret = devm_gpiochip_add_data(dev, &gpio->gc, gpio);
-	if (ret)
-		return ret;
-
-	return scx200_legacy_attach(gpio);
+	return devm_gpiochip_add_data(dev, &gpio->gc, gpio);
 }
 
 static struct platform_driver scx200_gpio_driver = {
@@ -377,24 +237,9 @@ static struct platform_driver scx200_gpio_driver = {
 	.probe = scx200_gpio_probe,
 };
 
-static int __init scx200_gpio_init(void)
-{
-	return platform_driver_register(&scx200_gpio_driver);
-}
-module_init(scx200_gpio_init);
-
-static void __exit scx200_gpio_exit(void)
-{
-	platform_driver_unregister(&scx200_gpio_driver);
-	if (scx200_legacy_devt) {
-		cdev_del(&scx200_legacy_cdev);
-		unregister_chrdev_region(scx200_legacy_devt, SCX200_NGPIO);
-	}
-}
-module_exit(scx200_gpio_exit);
+module_platform_driver(scx200_gpio_driver);
 
 MODULE_AUTHOR("Christer Weinigel <wingel@nano-system.com>");
 MODULE_DESCRIPTION("NatSemi/AMD SCx200 GPIO driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRVNAME);
-MODULE_ALIAS(LEGACY_NAME);
diff --git a/include/linux/nsc_gpio.h b/include/linux/nsc_gpio.h
deleted file mode 100644
index d7a04a6e3783..000000000000
--- a/include/linux/nsc_gpio.h
+++ /dev/null
@@ -1,41 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/**
-   nsc_gpio.c
-
-   National Semiconductor GPIO common access methods.
-
-   struct nsc_gpio_ops abstracts the low-level access
-   operations for the GPIO units on 2 NSC chip families; the GEODE
-   integrated CPU, and the PC-8736[03456] integrated PC-peripheral
-   chips.
-
-   The GPIO units on these chips have the same pin architecture, but
-   the access methods differ.  Thus, scx200_gpio and pc8736x_gpio
-   implement their own versions of these routines; and use the common
-   file-operations routines implemented in nsc_gpio module.
-
-   Copyright (c) 2005 Jim Cromie <jim.cromie@gmail.com>
-
-   NB: this work was tested on the Geode SC-1100 and PC-87366 chips.
-   NSC sold the GEODE line to AMD, and the PC-8736x line to Winbond.
-*/
-
-struct nsc_gpio_ops {
-	struct module*	owner;
-	u32	(*gpio_config)	(unsigned iminor, u32 mask, u32 bits);
-	void	(*gpio_dump)	(struct nsc_gpio_ops *amp, unsigned iminor);
-	int	(*gpio_get)	(unsigned iminor);
-	void	(*gpio_set)	(unsigned iminor, int state);
-	void	(*gpio_change)	(unsigned iminor);
-	int	(*gpio_current)	(unsigned iminor);
-	struct device*	dev;	/* for dev_dbg() support, set in init  */
-};
-
-extern ssize_t nsc_gpio_write(struct file *file, const char __user *data,
-			      size_t len, loff_t *ppos);
-
-extern ssize_t nsc_gpio_read(struct file *file, char __user *buf,
-			     size_t len, loff_t *ppos);
-
-extern void nsc_gpio_dump(struct nsc_gpio_ops *amp, unsigned index);
-

-- 
2.56.1

