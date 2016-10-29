From: Steven Haigh <netwiz@crc.id.au>
Subject: [PATCH v2] Add LED / GPIO support for the PC Engines APU2.
Date: Sun, 30 Oct 2016 03:38:01 +1100
Message-ID: <e8fbcb33-bf50-9118-8943-c3f3d0833da3@crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jSffcxKLc0FBvpfhs8rKwA7hkxL25TtLA"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.crc.id.au ([203.56.246.92]:38206 "EHLO mail.crc.id.au"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752974AbcJ2QiJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 Oct 2016 12:38:09 -0400
Received: from dhcp-10-1-1-170.lan.crc.id.au (dhcp-10-1-1-171.lan.crc.id.au [10.1.1.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by mail.crc.id.au (Postfix) with ESMTPSA id 804A43A00F6
        for <linux-leds@vger.kernel.org>; Sun, 30 Oct 2016 03:38:02 +1100 (AEDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jSffcxKLc0FBvpfhs8rKwA7hkxL25TtLA
Content-Type: multipart/mixed; boundary="AUvGjWl51768sx7K2FTbqCcJScNvT22ku";
 protected-headers="v1"
From: Steven Haigh <netwiz@crc.id.au>
To: linux-leds@vger.kernel.org
Message-ID: <e8fbcb33-bf50-9118-8943-c3f3d0833da3@crc.id.au>
Subject: [PATCH v2] Add LED / GPIO support for the PC Engines APU2.

--AUvGjWl51768sx7K2FTbqCcJScNvT22ku
Content-Type: multipart/mixed;
 boundary="------------FA0A3E13320B5D02F256E04C"

This is a multi-part message in MIME format.
--------------FA0A3E13320B5D02F256E04C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patches attached.

Changes:
* Updated leds_apu driver. Included an older version in my previous email=
=2E
* Added required nct5104d GPIO driver support.

These are all against 4.4.28 right now - but should probably apply
cleanly to any future builds with minimal (or nil) changes.

Please include me in the reply as I'm not part of this list.

--=20
Steven Haigh

Email: netwiz@crc.id.au
Web: https://www.crc.id.au
Phone: (03) 9001 6090 - 0412 935 897


--------------FA0A3E13320B5D02F256E04C
Content-Type: text/x-patch;
 name="4.4-apu2-leds.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="4.4-apu2-leds.patch"

diff -Nur linux-4.4.28.orig/drivers/leds/Kconfig linux-4.4.28/drivers/led=
s/Kconfig
--- linux-4.4.28.orig/drivers/leds/Kconfig	2016-10-28 18:53:25.000000000 =
+1100
+++ linux-4.4.28/drivers/leds/Kconfig	2016-10-30 03:33:24.720529690 +1100=

@@ -49,6 +49,15 @@
 	help
 	 This option enables support for the LEDs on the AAT1290.
=20
+config LEDS_APU2
+	tristate "LED Support for the PCEngines APU2 board"
+	depends on LEDS_CLASS
+	depends on GPIOLIB
+	help
+	  This option enables support for the CPU GPIO pins on the PCEngines
+	  APU2 board, as well as adds system support for the reset button and
+	  front panel LEDs.
+
 config LEDS_BCM6328
 	tristate "LED Support for Broadcom BCM6328"
 	depends on LEDS_CLASS
diff -Nur linux-4.4.28.orig/drivers/leds/leds-apu2.c linux-4.4.28/drivers=
/leds/leds-apu2.c
--- linux-4.4.28.orig/drivers/leds/leds-apu2.c	1970-01-01 10:00:00.000000=
000 +1000
+++ linux-4.4.28/drivers/leds/leds-apu2.c	2016-10-30 03:33:43.005529690 +=
1100
@@ -0,0 +1,374 @@
+/*
+ *  APU2 LED/GPIO Driver
+ *  Copyright (c) 2016 Christian Lamparter <chunkeey (at) googlemail.com=
>
+ *
+ *  Based on gpio-apu2.c - AMD FCH GPIO support for PC-Engines APU-2 boa=
rd
+ *
+ *  Copyright (c) 2015  Carsten Spiess <fli4l at carsten-spiess.de>
+ *
+ *  This program is free software; you can redistribute it and/or modify=

+ *  it under the terms of the GNU General Public License as published by=

+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+ #include <linux/module.h>
+ #include <linux/types.h>
+ #include <linux/miscdevice.h>
+ #include <linux/gpio.h>
+ #include <linux/init.h>
+ #include <linux/pci.h>
+ #include <linux/ioport.h>
+ #include <linux/platform_device.h>
+ #include <linux/uaccess.h>
+ #include <linux/io.h>
+ #include <linux/version.h>
+ #include <linux/dmi.h>
+ #include <linux/string.h>
+
+ #include <linux/leds.h>
+ #include <linux/input.h>
+ #include <linux/gpio_keys.h>
+
+ #define DEVNAME                 "leds-apu2"
+
+ #define FCH_ACPI_MMIO_BASE      0xFED80000
+ #define FCH_GPIO_BASE           (FCH_ACPI_MMIO_BASE + 0x1500)
+ #define FCH_GPIO_SIZE           0x300
+
+ #define APU_NUM_GPIO            4
+
+ #define GPIO_BIT_DIR            23
+ #define GPIO_BIT_WRITE          22
+ #define GPIO_BIT_READ           16
+
+ /* internal variables */
+ static struct pci_dev *gpio_apu2_pci;
+ static DEFINE_SPINLOCK (gpio_lock);
+
+ /* the watchdog platform device */
+ static struct platform_device *gpio_apu2_platform_device;
+ static struct platform_device *leddev;
+ static struct platform_device *keydev;
+
+ static const struct pci_device_id gpio_apu2_pci_tbl[] =3D{
+ 	{PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_HUDSON2_SMBUS, PCI_ANY_ID, PCI_A=
NY_ID},
+ 	{ 0, } /* End of list */
+ };
+ MODULE_DEVICE_TABLE (pci, gpio_apu2_pci_tbl);
+
+ /* EGPIO89=3DGPIO32, AGPIO68=3DGPIO57, AGPIO69=3DGPIO58, AGPIO70=3DGPIO=
59 */
+ static u8 gpio_offset[APU_NUM_GPIO] =3D {89, 68, 69, 70};
+
+ static void __iomem *gpio_addr[APU_NUM_GPIO] =3D {NULL, NULL, NULL, NUL=
L};
+
+ static int gpio_apu2_get_dir (struct gpio_chip *chip, unsigned offset)
+ {
+ 	u32 val;
+
+ 	val =3D ~ioread32 (gpio_addr[offset]);
+
+ 	return (val >> GPIO_BIT_DIR) & 1;
+ }
+
+ static int gpio_apu2_dir_in (struct gpio_chip *gc, unsigned offset)
+ {
+ 	u32 val;
+
+ 	spin_lock_bh (&gpio_lock);
+
+ 	val =3D ioread32 (gpio_addr[offset]);
+ 	val &=3D ~BIT(GPIO_BIT_DIR);
+ 	iowrite32 (val, gpio_addr[offset]);
+
+ 	spin_unlock_bh (&gpio_lock);
+
+ 	return 0;
+ }
+
+ static int gpio_apu2_dir_out (struct gpio_chip *chip, unsigned offset,
+ 		int value)
+ {
+ 	u32 val;
+
+ 	spin_lock_bh (&gpio_lock);
+
+ 	val =3D ioread32 (gpio_addr[offset]);
+ 	val |=3D BIT(GPIO_BIT_DIR);
+ 	iowrite32 (val, gpio_addr[offset]);
+
+ 	spin_unlock_bh (&gpio_lock);
+
+ 	return 0;
+ }
+
+ static int gpio_apu2_get_data (struct gpio_chip *chip, unsigned offset)=

+ {
+ 	u32 val;
+
+ 	val =3D ioread32 (gpio_addr[offset]);
+
+ 	return (val >> GPIO_BIT_READ) & 1;
+ }
+
+ static void gpio_apu2_set_data (struct gpio_chip *chip, unsigned offset=
, int value)
+ {
+ 	u32 val;
+
+ 	spin_lock_bh (&gpio_lock);
+
+ 	val =3D ioread32 (gpio_addr[offset]);
+
+ 	if (value)
+ 		val |=3D BIT(GPIO_BIT_WRITE);
+ 	else
+ 		val &=3D ~BIT(GPIO_BIT_WRITE);
+
+ 	iowrite32 (val, gpio_addr[offset]);
+
+ 	spin_unlock_bh (&gpio_lock);
+ }
+
+ static struct gpio_chip gpio_apu2_chip =3D {
+ 	.label =3D DEVNAME,
+ 	.owner =3D THIS_MODULE,
+ 	.base =3D -1,
+ 	.ngpio =3D APU_NUM_GPIO,
+ 	.get_direction =3D gpio_apu2_get_dir,
+ 	.direction_input =3D gpio_apu2_dir_in,
+ 	.direction_output =3D gpio_apu2_dir_out,
+ 	.get =3D gpio_apu2_get_data,
+ 	.set =3D gpio_apu2_set_data,
+ };
+
+ /*
+  *
+  */
+ static int gpio_apu2_probe (struct platform_device *dev)
+ {
+ 	int ret =3D 0;
+ 	int i;
+ 	struct pci_dev *pci_dev =3D NULL;
+
+ 	/* Match the PCI device */
+ 	for_each_pci_dev (pci_dev) {
+ 		if (pci_match_id (gpio_apu2_pci_tbl, pci_dev) !=3D NULL) {
+ 			gpio_apu2_pci =3D pci_dev;
+ 			break;
+ 		}
+ 	}
+
+ 	if (!gpio_apu2_pci)
+ 		return -ENODEV;
+
+ 	pr_info ("%s: PCI Revision ID: 0x%x\n", DEVNAME, gpio_apu2_pci->revisi=
on);
+
+ 	/* Determine type of southbridge chipset */
+ 	if (gpio_apu2_pci->revision < 0x40) {
+ 		return -EACCES;
+ 	}
+
+ 	/* Request memory region for GPIO's */
+ 	if (!devm_request_mem_region (&dev->dev, FCH_GPIO_BASE,
+ 		FCH_GPIO_SIZE, DEVNAME)){
+ 		pr_err ("%s: request GPIO mem region failed\n", DEVNAME);
+ 		return -ENXIO;
+ 	}
+
+ 	/* Map IO's for GPIO's */
+ 	for (i =3D 0; i < APU_NUM_GPIO; i++) {
+ 		gpio_addr[i] =3D devm_ioremap (&dev->dev,
+ 			FCH_GPIO_BASE + (gpio_offset[i] * sizeof (u32)), sizeof (u32));
+ 		if (!gpio_addr[i]) {
+ 			pr_err ("%s: map GPIO%d address failed\n", DEVNAME, gpio_offset[i]);=

+ 			return -ENXIO;
+ 		}
+ 	}
+
+ 	gpio_apu2_chip.dev =3D &dev->dev;
+ 	ret =3D gpiochip_add (&gpio_apu2_chip);
+ 	if (ret) {
+ 		pr_err ("%s: adding gpiochip failed\n", DEVNAME);
+ 	}
+
+ 	return ret;
+ }
+
+ static int gpio_apu2_remove (struct platform_device *dev)
+ {
+ #if LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0)
+ 	int ret;
+ 	ret =3D gpiochip_remove (&gpio_apu2_chip);
+ #else /* LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0) */
+ 	gpiochip_remove (&gpio_apu2_chip);
+ #endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0) */
+ 	return 0;
+ }
+
+ static struct platform_driver gpio_apu2_driver =3D {
+ 	.probe =3D gpio_apu2_probe,
+ 	.remove =3D gpio_apu2_remove,
+ 	.driver =3D {
+ 		.owner =3D THIS_MODULE,
+ 		.name =3D DEVNAME
+ 	}
+ };
+
+ static struct gpio_led apu2_leds_gpio[] =3D {
+         {
+                 .name           =3D "apu2:green:power",
+                 .gpio           =3D 509,
+                 .active_low     =3D 1,
+         },
+         {
+                 .name           =3D "apu2:green:led2",
+                 .gpio           =3D 510,
+                 .active_low     =3D 1,
+         },
+         {
+                 .name           =3D "apu2:green:led3",
+                 .gpio           =3D 511,
+                 .active_low     =3D 1,
+         },
+ };
+
+ static struct gpio_keys_button apu2_gpio_keys[] =3D {
+ 	{
+ 		.desc           =3D "Reset button",
+ 		.type           =3D EV_KEY,
+ 		.code           =3D KEY_RESTART,
+ 		.debounce_interval =3D 60,
+ 		.gpio           =3D 508,
+ 		.active_low     =3D 1,
+ 	},
+ };
+
+ static void register_gpio_keys_polled(int id, unsigned poll_interval,
+ 				      unsigned nbuttons,
+ 				      struct gpio_keys_button *buttons)
+ {
+ 	struct gpio_keys_platform_data pdata =3D { };
+ 	int err;
+
+ 	keydev =3D platform_device_alloc("gpio-keys-polled", id);
+ 	if (!keydev) {
+ 		printk(KERN_ERR "Failed to allocate gpio-keys platform device\n");
+ 		return;
+ 	}
+
+ 	pdata.poll_interval =3D poll_interval;
+ 	pdata.nbuttons =3D nbuttons;
+ 	pdata.buttons =3D buttons;
+
+ 	err =3D platform_device_add_data(keydev, &pdata, sizeof(pdata));
+ 	if (err) {
+ 		dev_err(&keydev->dev, "failed to add platform data to key driver (%d)=
", err);
+ 		goto err_put_pdev;
+ 	}
+
+ 	err =3D platform_device_add(keydev);
+ 	if (err) {
+ 		dev_err(&keydev->dev, "failed to register key platform device (%d)", =
err);
+ 		goto err_put_pdev;
+ 	}
+
+ 	return;
+
+ err_put_pdev:
+ 	platform_device_put(keydev);
+ 	keydev =3D NULL;
+ }
+
+ static void register_leds_gpio(int id, unsigned num_leds, struct gpio_l=
ed *leds)
+ {
+ 	struct gpio_led_platform_data pdata =3D { };
+ 	int err;
+
+ 	leddev =3D platform_device_alloc("leds-gpio", id);
+ 	if (!leddev) {
+ 		printk(KERN_ERR "Failed to allocate leds-gpio platform device\n");
+ 		return;
+ 	}
+
+ 	pdata.num_leds =3D num_leds;
+ 	pdata.leds =3D leds;
+
+ 	err =3D platform_device_add_data(leddev, &pdata, sizeof(pdata));
+ 	if (err) {
+ 		dev_err(&leddev->dev, "failed to add platform data to key driver (%d)=
", err);
+ 		goto err_put_pdev;
+ 	}
+
+ 	err =3D platform_device_add(leddev);
+ 	if (err) {
+ 		dev_err(&leddev->dev, "failed to register key platform device (%d)", =
err);
+ 		goto err_put_pdev;
+ 	}
+
+ 	return;
+
+ err_put_pdev:
+ 	platform_device_put(leddev);
+ 	leddev =3D NULL;
+ }
+
+ static int __init gpio_apu2_init (void)
+ {
+ 	int err;
+	const char *board_vendor =3D dmi_get_system_info(DMI_BOARD_VENDOR);
+	const char *board_name =3D dmi_get_system_info(DMI_BOARD_NAME);
+
+ 	/* Match the device name/model */
+	if (!board_name || !board_vendor || strcasecmp(board_vendor, "PC Engine=
s") || strcasecmp(board_name, "apu2")) {
+		err =3D -ENODEV;
+		goto exit;
+	}
+
+	pr_info ("%s: load APU2/LED GPIO driver module\n", DEVNAME);
+
+ 	err =3D platform_driver_register (&gpio_apu2_driver);
+ 	if (err)
+ 		goto exit;
+
+ 	gpio_apu2_platform_device =3D platform_device_register_simple (DEVNAME=
, -1, NULL, 0);
+ 	if (IS_ERR(gpio_apu2_platform_device)) {
+ 		err =3D PTR_ERR(gpio_apu2_platform_device);
+ 		goto exit_driver;
+ 	}
+
+ 	pr_info ("%s: APU2 GPIO/LED driver module loaded\n", DEVNAME);
+
+ 	register_leds_gpio(-1, ARRAY_SIZE(apu2_leds_gpio), apu2_leds_gpio);
+ 	register_gpio_keys_polled(-1, 20, ARRAY_SIZE(apu2_gpio_keys), apu2_gpi=
o_keys);
+ 	return 0;
+
+ exit_driver:
+ 	platform_driver_unregister (&gpio_apu2_driver);
+ exit:
+ 	return err;
+ }
+
+ static void __exit gpio_apu2_exit (void)
+ {
+ 	platform_device_unregister (gpio_apu2_platform_device);
+ 	platform_device_unregister (leddev);
+ 	platform_device_unregister (keydev);
+ 	platform_driver_unregister (&gpio_apu2_driver);
+ 	pr_info ("%s: APU2 GPIO/LED driver module unloaded\n", DEVNAME);
+ }
+
+ MODULE_AUTHOR ("Carsten Spiess <fli4l at carsten-spiess.de>");
+ MODULE_DESCRIPTION("GPIO driver for AMD FCH on PC-Engines APU-2");
+ MODULE_LICENSE("GPL");
+
+ module_init (gpio_apu2_init);
+ module_exit (gpio_apu2_exit);
diff -Nur linux-4.4.28.orig/drivers/leds/Makefile linux-4.4.28/drivers/le=
ds/Makefile
--- linux-4.4.28.orig/drivers/leds/Makefile	2016-10-28 18:53:25.000000000=
 +1100
+++ linux-4.4.28/drivers/leds/Makefile	2016-10-30 03:33:24.721529690 +110=
0
@@ -8,6 +8,7 @@
 # LED Platform Drivers
 obj-$(CONFIG_LEDS_88PM860X)		+=3D leds-88pm860x.o
 obj-$(CONFIG_LEDS_AAT1290)		+=3D leds-aat1290.o
+obj-$(CONFIG_LEDS_APU2)			+=3D leds-apu2.o
 obj-$(CONFIG_LEDS_BCM6328)		+=3D leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+=3D leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+=3D leds-bd2802.o

--------------FA0A3E13320B5D02F256E04C
Content-Type: text/x-patch;
 name="add_nct5104_gpio_driver.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="add_nct5104_gpio_driver.patch"

diff -Nur linux-4.4.28.orig/drivers/gpio/gpio-nct5104d.c linux-4.4.28/dri=
vers/gpio/gpio-nct5104d.c
--- linux-4.4.28.orig/drivers/gpio/gpio-nct5104d.c	1970-01-01 10:00:00.00=
0000000 +1000
+++ linux-4.4.28/drivers/gpio/gpio-nct5104d.c	2016-10-30 02:36:24.3095296=
90 +1100
@@ -0,0 +1,461 @@
+/*
+ * GPIO driver for NCT5104D
+ *
+ * Author: Tasanakorn Phaipool <tasanakorn@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/gpio.h>
+#include <linux/version.h>
+#include <linux/dmi.h>
+#include <linux/string.h>
+
+#define DRVNAME "gpio-nct5104d"
+
+/*
+ * Super-I/O registers
+ */
+#define SIO_LDSEL		0x07	/* Logical device select */
+#define SIO_CHIPID		0x20	/* Chaip ID (2 bytes) */
+#define SIO_GPIO_ENABLE	0x30	/* GPIO enable */
+#define SIO_GPIO1_MODE		0xE0	/* GPIO1 Mode OpenDrain/Push-Pull */
+#define SIO_GPIO2_MODE		0xE1	/* GPIO2 Mode OpenDrain/Push-Pull */
+
+#define SIO_LD_GPIO		0x07	/* GPIO logical device */
+#define SIO_LD_GPIO_MODE	0x0F	/* GPIO mode control device */
+#define SIO_UNLOCK_KEY		0x87	/* Key to enable Super-I/O */
+#define SIO_LOCK_KEY		0xAA	/* Key to disable Super-I/O */
+
+#define SIO_NCT5104D_ID					0x1061	/* Chip ID */
+#define SIO_PCENGINES_APU_NCT5104D_ID	0xc452	/* Chip ID */
+
+enum chips { nct5104d };
+
+static const char * const nct5104d_names[] =3D {
+	"nct5104d"
+};
+
+struct nct5104d_sio {
+	int addr;
+	enum chips type;
+};
+
+struct nct5104d_gpio_bank {
+	struct gpio_chip chip;
+	unsigned int regbase;
+	struct nct5104d_gpio_data *data;
+};
+
+struct nct5104d_gpio_data {
+	struct nct5104d_sio *sio;
+	int nr_bank;
+	struct nct5104d_gpio_bank *bank;
+};
+
+/*
+ * Super-I/O functions.
+ */
+
+static inline int superio_inb(int base, int reg)
+{
+	outb(reg, base);
+	return inb(base + 1);
+}
+
+static int superio_inw(int base, int reg)
+{
+	int val;
+
+	outb(reg++, base);
+	val =3D inb(base + 1) << 8;
+	outb(reg, base);
+	val |=3D inb(base + 1);
+
+	return val;
+}
+
+static inline void superio_outb(int base, int reg, int val)
+{
+	outb(reg, base);
+	outb(val, base + 1);
+}
+
+static inline int superio_enter(int base)
+{
+	/* Don't step on other drivers' I/O space by accident. */
+	if (!request_muxed_region(base, 2, DRVNAME)) {
+		pr_err(DRVNAME "I/O address 0x%04x already in use\n", base);
+		return -EBUSY;
+	}
+
+	/* According to the datasheet the key must be send twice. */
+	outb(SIO_UNLOCK_KEY, base);
+	outb(SIO_UNLOCK_KEY, base);
+
+	return 0;
+}
+
+static inline void superio_select(int base, int ld)
+{
+	outb(SIO_LDSEL, base);
+	outb(ld, base + 1);
+}
+
+static inline void superio_exit(int base)
+{
+	outb(SIO_LOCK_KEY, base);
+	release_region(base, 2);
+}
+
+/*
+ * GPIO chip.
+ */
+
+static int nct5104d_gpio_direction_in(struct gpio_chip *chip, unsigned o=
ffset);
+static int nct5104d_gpio_get(struct gpio_chip *chip, unsigned offset);
+static int nct5104d_gpio_direction_out(struct gpio_chip *chip,
+				     unsigned offset, int value);
+static void nct5104d_gpio_set(struct gpio_chip *chip, unsigned offset, i=
nt value);
+
+#define NCT5104D_GPIO_BANK(_base, _ngpio, _regbase)			\
+	{								\
+		.chip =3D {						\
+			.label            =3D DRVNAME,			\
+			.owner            =3D THIS_MODULE,		\
+			.direction_input  =3D nct5104d_gpio_direction_in,	\
+			.get              =3D nct5104d_gpio_get,		\
+			.direction_output =3D nct5104d_gpio_direction_out,	\
+			.set              =3D nct5104d_gpio_set,		\
+			.base             =3D _base,			\
+			.ngpio            =3D _ngpio,			\
+			.can_sleep        =3D true,			\
+		},							\
+		.regbase =3D _regbase,					\
+	}
+
+#define gpio_dir(base) (base + 0)
+#define gpio_data(base) (base + 1)
+
+static struct nct5104d_gpio_bank nct5104d_gpio_bank[] =3D {
+	NCT5104D_GPIO_BANK(0 , 8, 0xE0),
+	NCT5104D_GPIO_BANK(10, 8, 0xE4)
+};
+
+static int nct5104d_gpio_direction_in(struct gpio_chip *chip, unsigned o=
ffset)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank =3D
+		container_of(chip, struct nct5104d_gpio_bank, chip);
+	struct nct5104d_sio *sio =3D bank->data->sio;
+	u8 dir;
+
+	err =3D superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	dir =3D superio_inb(sio->addr, gpio_dir(bank->regbase));
+	dir |=3D (1 << offset);
+	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
+
+	superio_exit(sio->addr);
+
+	return 0;
+}
+
+static int nct5104d_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank =3D
+		container_of(chip, struct nct5104d_gpio_bank, chip);
+	struct nct5104d_sio *sio =3D bank->data->sio;
+	u8 data;
+
+	err =3D superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	data =3D superio_inb(sio->addr, gpio_data(bank->regbase));
+
+	superio_exit(sio->addr);
+
+	return !!(data & 1 << offset);
+}
+
+static int nct5104d_gpio_direction_out(struct gpio_chip *chip,
+				     unsigned offset, int value)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank =3D
+		container_of(chip, struct nct5104d_gpio_bank, chip);
+	struct nct5104d_sio *sio =3D bank->data->sio;
+	u8 dir, data_out;
+
+	err =3D superio_enter(sio->addr);
+	if (err)
+		return err;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	data_out =3D superio_inb(sio->addr, gpio_data(bank->regbase));
+	if (value)
+		data_out |=3D (1 << offset);
+	else
+		data_out &=3D ~(1 << offset);
+	superio_outb(sio->addr, gpio_data(bank->regbase), data_out);
+
+	dir =3D superio_inb(sio->addr, gpio_dir(bank->regbase));
+	dir &=3D ~(1 << offset);
+	superio_outb(sio->addr, gpio_dir(bank->regbase), dir);
+
+	superio_exit(sio->addr);
+
+	return 0;
+}
+
+static void nct5104d_gpio_set(struct gpio_chip *chip, unsigned offset, i=
nt value)
+{
+	int err;
+	struct nct5104d_gpio_bank *bank =3D
+		container_of(chip, struct nct5104d_gpio_bank, chip);
+	struct nct5104d_sio *sio =3D bank->data->sio;
+	u8 data_out;
+
+	err =3D superio_enter(sio->addr);
+	if (err)
+		return;
+	superio_select(sio->addr, SIO_LD_GPIO);
+
+	data_out =3D superio_inb(sio->addr, gpio_data(bank->regbase));
+	if (value)
+		data_out |=3D (1 << offset);
+	else
+		data_out &=3D ~(1 << offset);
+	superio_outb(sio->addr, gpio_data(bank->regbase), data_out);
+
+	superio_exit(sio->addr);
+}
+
+/*
+ * Platform device and driver.
+ */
+
+static int nct5104d_gpio_probe(struct platform_device *pdev)
+{
+	int err;
+	int i;
+	struct nct5104d_sio *sio =3D pdev->dev.platform_data;
+	struct nct5104d_gpio_data *data;
+
+	data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	switch (sio->type) {
+	case nct5104d:
+		data->nr_bank =3D ARRAY_SIZE(nct5104d_gpio_bank);
+		data->bank =3D nct5104d_gpio_bank;
+		break;
+	default:
+		return -ENODEV;
+	}
+	data->sio =3D sio;
+
+	platform_set_drvdata(pdev, data);
+
+	/* For each GPIO bank, register a GPIO chip. */
+	for (i =3D 0; i < data->nr_bank; i++) {
+		struct nct5104d_gpio_bank *bank =3D &data->bank[i];
+
+		bank->chip.dev =3D &pdev->dev;
+		bank->data =3D data;
+
+		err =3D gpiochip_add(&bank->chip);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to register gpiochip %d: %d\n",
+				i, err);
+			goto err_gpiochip;
+		}
+	}
+
+	return 0;
+
+err_gpiochip:
+	for (i =3D i - 1; i >=3D 0; i--) {
+		struct nct5104d_gpio_bank *bank =3D &data->bank[i];
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0)
+		int rm_err =3D gpiochip_remove(&bank->chip);
+		if (rm_err < 0)
+			dev_err(&pdev->dev,
+				"Failed to remove gpiochip %d: %d\n",
+				i, rm_err);
+#else /* LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0) */
+		gpiochip_remove (&bank->chip);
+#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0) */
+	}
+
+	return err;
+}
+
+static int nct5104d_gpio_remove(struct platform_device *pdev)
+{
+	int i;
+	struct nct5104d_gpio_data *data =3D platform_get_drvdata(pdev);
+
+	for (i =3D 0; i < data->nr_bank; i++) {
+		struct nct5104d_gpio_bank *bank =3D &data->bank[i];
+
+#if LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0)
+		int err =3D gpiochip_remove(&bank->chip);
+		if (err) {
+			dev_err(&pdev->dev,
+				"Failed to remove GPIO gpiochip %d: %d\n",
+				i, err);
+			return err;
+		}
+#else /* LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0) */
+		gpiochip_remove (&bank->chip);
+#endif /* LINUX_VERSION_CODE < KERNEL_VERSION(3,18,0) */
+	}
+
+	return 0;
+}
+
+static int __init nct5104d_find(int addr, struct nct5104d_sio *sio)
+{
+	int err;
+	u16 devid;
+	u8 gpio_cfg;
+
+	err =3D superio_enter(addr);
+	if (err)
+		return err;
+
+	err =3D -ENODEV;
+
+	devid =3D superio_inw(addr, SIO_CHIPID);
+	switch (devid) {
+	case SIO_NCT5104D_ID:
+	case SIO_PCENGINES_APU_NCT5104D_ID:
+		sio->type =3D nct5104d;
+		/* enable GPIO0 and GPIO1 */
+		superio_select(addr, SIO_LD_GPIO);
+		gpio_cfg =3D superio_inb(addr, SIO_GPIO_ENABLE);
+		gpio_cfg |=3D 0x03;
+		superio_outb(addr, SIO_GPIO_ENABLE, gpio_cfg);
+		break;
+	default:
+		pr_info(DRVNAME ": Unsupported device 0x%04x\n", devid);
+		goto err;
+	}
+	sio->addr =3D addr;
+	err =3D 0;
+
+	pr_info(DRVNAME ": Found %s at %#x chip id 0x%04x\n",
+		nct5104d_names[sio->type],
+		(unsigned int) addr,
+		(int) superio_inw(addr, SIO_CHIPID));
+
+        superio_select(sio->addr, SIO_LD_GPIO_MODE);
+        superio_outb(sio->addr, SIO_GPIO1_MODE, 0x0);
+        superio_outb(sio->addr, SIO_GPIO2_MODE, 0x0);
+
+err:
+	superio_exit(addr);
+	return err;
+}
+
+static struct platform_device *nct5104d_gpio_pdev;
+
+static int __init
+nct5104d_gpio_device_add(const struct nct5104d_sio *sio)
+{
+	int err;
+
+	nct5104d_gpio_pdev =3D platform_device_alloc(DRVNAME, -1);
+	if (!nct5104d_gpio_pdev)
+		pr_err(DRVNAME ": Error platform_device_alloc\n");
+	if (!nct5104d_gpio_pdev)
+		return -ENOMEM;
+
+	err =3D platform_device_add_data(nct5104d_gpio_pdev,
+				       sio, sizeof(*sio));
+	if (err) {
+		pr_err(DRVNAME "Platform data allocation failed\n");
+		goto err;
+	}
+
+	err =3D platform_device_add(nct5104d_gpio_pdev);
+	if (err) {
+		pr_err(DRVNAME "Device addition failed\n");
+		goto err;
+	}
+	pr_info(DRVNAME ": Device added\n");
+	return 0;
+
+err:
+	platform_device_put(nct5104d_gpio_pdev);
+
+	return err;
+}
+
+/*
+ */
+
+static struct platform_driver nct5104d_gpio_driver =3D {
+	.driver =3D {
+		.owner	=3D THIS_MODULE,
+		.name	=3D DRVNAME,
+	},
+	.probe		=3D nct5104d_gpio_probe,
+	.remove		=3D nct5104d_gpio_remove,
+};
+
+static int __init nct5104d_gpio_init(void)
+{
+	int err;
+	struct nct5104d_sio sio;
+	const char *board_vendor =3D dmi_get_system_info(DMI_BOARD_VENDOR);
+	const char *board_name =3D dmi_get_system_info(DMI_BOARD_NAME);
+
+ 	/* Make sure we only run on PC Engine APU boards */
+	if (!board_name || !board_vendor || strcasecmp(board_vendor, "PC Engine=
s") || strncasecmp(board_name, "apu", 3)) {
+		return -ENODEV;
+	}
+
+	if (nct5104d_find(0x2e, &sio) &&
+	    nct5104d_find(0x4e, &sio))
+		return -ENODEV;
+
+	err =3D platform_driver_register(&nct5104d_gpio_driver);
+	if (!err) {
+		pr_info(DRVNAME ": platform_driver_register\n");
+		err =3D nct5104d_gpio_device_add(&sio);
+		if (err)
+			platform_driver_unregister(&nct5104d_gpio_driver);
+	}
+
+	return err;
+}
+subsys_initcall(nct5104d_gpio_init);
+
+static void __exit nct5104d_gpio_exit(void)
+{
+	platform_device_unregister(nct5104d_gpio_pdev);
+	platform_driver_unregister(&nct5104d_gpio_driver);
+}
+module_exit(nct5104d_gpio_exit);
+
+MODULE_DESCRIPTION("GPIO driver for Super-I/O chips NCT5104D");
+MODULE_AUTHOR("Tasanakorn Phaipool <tasanakorn@gmail.com>");
+MODULE_LICENSE("GPL");
diff -Nur linux-4.4.28.orig/drivers/gpio/Kconfig linux-4.4.28/drivers/gpi=
o/Kconfig
--- linux-4.4.28.orig/drivers/gpio/Kconfig	2016-10-28 18:53:25.000000000 =
+1100
+++ linux-4.4.28/drivers/gpio/Kconfig	2016-10-30 02:38:42.263529690 +1100=

@@ -307,6 +307,14 @@
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
=20
++config GPIO_NCT5104D
+	tristate "NCT5104D GPIO support"
+	depends on X86 # unconditional access to IO space.
+	select GPIO_GENERIC
+	help
+	  Say yes here to support GPIO functionality of NCT5104D super I/O chip=
 on
+	  PC Engine APU boards.
+
 config GPIO_OCTEON
 	tristate "Cavium OCTEON GPIO"
 	depends on GPIOLIB && CAVIUM_OCTEON_SOC
diff -Nur linux-4.4.28.orig/drivers/gpio/Makefile linux-4.4.28/drivers/gp=
io/Makefile
--- linux-4.4.28.orig/drivers/gpio/Makefile	2016-10-28 18:53:25.000000000=
 +1100
+++ linux-4.4.28/drivers/gpio/Makefile	2016-10-30 02:37:47.248529690 +110=
0
@@ -69,6 +69,7 @@
 obj-$(CONFIG_GPIO_MVEBU)        +=3D gpio-mvebu.o
 obj-$(CONFIG_GPIO_MXC)		+=3D gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)		+=3D gpio-mxs.o
+obj-$(CONFIG_GPIO_NCT5104D)	+=3D gpio-nct5104d.o
 obj-$(CONFIG_GPIO_OCTEON)	+=3D gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)		+=3D gpio-omap.o
 obj-$(CONFIG_GPIO_PCA953X)	+=3D gpio-pca953x.o

--------------FA0A3E13320B5D02F256E04C--

--AUvGjWl51768sx7K2FTbqCcJScNvT22ku--

--jSffcxKLc0FBvpfhs8rKwA7hkxL25TtLA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYFNBpAAoJEEGvNdV6fTHcnR0QAJons2a59aYYZ1XSPKEzQ9Ob
LGHamRKQhYNpEQuE5hzZCF+eMD+ZmdNnZC06AFd7e00JzTMmbWNv8fWkBb55Nfpd
jQHiN4gEj4Zg21IBStIRBxn9t1xO550otyYgq3JwXklHhIh1LmTUMEo/x7JLCadf
Z2Wa9xQLdr3YhI02MF27hdk/y+kjGWNzgBYMGu6xP7ustLl6gWLx9GxSeKntIQ/4
Iz1Yhdxk4+M7lfsNoWALJQ0CcAjjIFYRPlhGhIq4H6YEzX0Snza8O1iWjXipMqIl
+zlOo/bukkhQEvPWitRcZLTc8uucZkK70L96b5PsP9cAC1pZ8TxUt5hK9tfLStaW
c/pHvAGTRmKwwR4bDWZgSV0+Lr9fglgs90T3Q+ulN8szaDNoayQrgYv5uePQ8CsF
YMZUo9Nh9cWnWQVqdBTSuywWgFsjtH6OyEYdZUXtWhhoRqgp93mWn1FK4jvOj6MX
bled0GnnnDgm3UGLCvE1jUwJ7U4fGjwg8fVZ0MGzayNb4b+OVEJ98JXHZ202WxpA
fWVMdotuNzt17r4re79tBebHE43mu2M5CSpI8MWg2WAJw8DClhdx1oyGiItBbX0z
8jB7ViBL5b/i+7VvNAvuHfLg0PkKKU3J2NS3nwGH+nATGXmG2+mAUxbYHWtVSDYD
tCet3m0mx7Bj3trA1Q97
=dMZh
-----END PGP SIGNATURE-----

--jSffcxKLc0FBvpfhs8rKwA7hkxL25TtLA--
