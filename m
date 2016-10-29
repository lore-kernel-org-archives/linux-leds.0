From: Steven Haigh <netwiz@crc.id.au>
Subject: [PATCH] Add LED support for the PC Engines APU2.
Date: Sun, 30 Oct 2016 00:20:50 +1100
Message-ID: <ff9d2a19-c31b-5304-e155-d59b1f97045d@crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QskEhtI8O9a7XL1GPvO87wmlDEtLrbaIi"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.crc.id.au ([203.56.246.92]:37928 "EHLO mail.crc.id.au"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751702AbcJ2N0g (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 29 Oct 2016 09:26:36 -0400
Received: from dhcp-10-1-1-170.lan.crc.id.au (2407-e400-b000-201-1cd8-4a98-e637-6d27-cpe.spintel.net.au [IPv6:2407:e400:b000:201:1cd8:4a98:e637:6d27])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by mail.crc.id.au (Postfix) with ESMTPSA id B32223A00F6
        for <linux-leds@vger.kernel.org>; Sun, 30 Oct 2016 00:20:57 +1100 (AEDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QskEhtI8O9a7XL1GPvO87wmlDEtLrbaIi
Content-Type: multipart/mixed; boundary="lnjiESIdLH3OH0qd9u7e9T98Fq68dnUs9";
 protected-headers="v1"
From: Steven Haigh <netwiz@crc.id.au>
To: linux-leds@vger.kernel.org
Message-ID: <ff9d2a19-c31b-5304-e155-d59b1f97045d@crc.id.au>
Subject: [PATCH] Add LED support for the PC Engines APU2.

--lnjiESIdLH3OH0qd9u7e9T98Fq68dnUs9
Content-Type: multipart/mixed;
 boundary="------------4498E9FC2C3BA93A5B953880"

This is a multi-part message in MIME format.
--------------4498E9FC2C3BA93A5B953880
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch attached.

Please include me in the reply as I'm not part of this list.

--=20
Steven Haigh

Email: netwiz@crc.id.au
Web: https://www.crc.id.au
Phone: (03) 9001 6090 - 0412 935 897

--------------4498E9FC2C3BA93A5B953880
Content-Type: text/x-patch;
 name="4.4.27-apu-leds.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="4.4.27-apu-leds.patch"

diff -Nur linux-4.4.27.orig/drivers/leds/Kconfig linux-4.4.27/drivers/led=
s/Kconfig
--- linux-4.4.27.orig/drivers/leds/Kconfig	2016-10-22 21:27:13.000000000 =
+1100
+++ linux-4.4.27/drivers/leds/Kconfig	2016-10-30 00:12:13.879529690 +1100=

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
diff -Nur linux-4.4.27.orig/drivers/leds/leds-apu2.c linux-4.4.27/drivers=
/leds/leds-apu2.c
--- linux-4.4.27.orig/drivers/leds/leds-apu2.c	1970-01-01 10:00:00.000000=
000 +1000
+++ linux-4.4.27/drivers/leds/leds-apu2.c	2016-10-30 00:09:58.252529690 +=
1100
@@ -0,0 +1,371 @@
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
+
+ #include <linux/leds.h>
+ #include <linux/input.h>
+ #include <linux/gpio_keys.h>
+
+ #define DEVNAME                 "gpio-apu2"
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
+ static DEFINE_SPINLOCK ( gpio_lock);
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
+ MODULE_DEVICE_TABLE ( pci, gpio_apu2_pci_tbl);
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
+	/* Match the device name/model */
+	if (!dmi_match(DMI_BOARD_VENDOR, "PC Engines") || !dmi_match(DMI_BOARD_=
NAME, "APU2")) {
+		pr_err ("%s: APU2 board not detected! Found: %s %s\n", DEVNAME, DMI_BO=
ARD_VENDOR, DMI_BOARD_NAME);
+		return -EACCES;
+	}
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
+
+ 	pr_info ("%s: load APU2/LED GPIO driver module\n", DEVNAME);
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
diff -Nur linux-4.4.27.orig/drivers/leds/Makefile linux-4.4.27/drivers/le=
ds/Makefile
--- linux-4.4.27.orig/drivers/leds/Makefile	2016-10-22 21:27:13.000000000=
 +1100
+++ linux-4.4.27/drivers/leds/Makefile	2016-10-30 00:11:04.031529690 +110=
0
@@ -8,6 +8,7 @@
 # LED Platform Drivers
 obj-$(CONFIG_LEDS_88PM860X)		+=3D leds-88pm860x.o
 obj-$(CONFIG_LEDS_AAT1290)		+=3D leds-aat1290.o
+obj-$(CONFIG_LEDS_APU2)			+=3D leds-apu2.o
 obj-$(CONFIG_LEDS_BCM6328)		+=3D leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+=3D leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+=3D leds-bd2802.o

--------------4498E9FC2C3BA93A5B953880--

--lnjiESIdLH3OH0qd9u7e9T98Fq68dnUs9--

--QskEhtI8O9a7XL1GPvO87wmlDEtLrbaIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYFKI5AAoJEEGvNdV6fTHcFBkQALsJruv0/oPx2h+owP07fcii
hsQI3Q35wJYQYcFKBUb72/zHNMnEFIZllVvlEvuH2iHnMwdLwb+Fh+k9UQcLV7tG
Y/2aa5qBw2O4C7pdcfTVl52rKYs6CSX+S7SMALEojMvZyHburWj9b16Xz13kwL5m
7DOVxE3soXyVM2ZnXemCrSMUjwqScIWxbIowAvDeUTF7Qf5mKYvLqtNTXtqrH6uU
YL8vJzq5Ug2ZCRO0ywiiI6qxWpOTodoDA0zCDQAA07uNFH63dXcdyrugCkeFmofZ
kbia0zVo+8bc2xEHZhHBl+Of9nVNnqz+OYfUhVtiBhp/EGOiAkuaq3geRms88L0I
hrxcBvl+peexKWtMiIaiTkGtgc6PGPzzWUzIjA1QOW9HrLs1yu93Nzp/XhnifVtN
iVEf6gvyjcaMIPj8Poc7GJuupyF/tKTzPeJ2gcN4NN4k1E11kZ/QvJA29MddxNhE
VB8J8Y06po+AWWT+vQoQJLUdy2LizdpKZ4FiFXJT1a7G2FmPKfPWkA3av83HXosD
QZcfGrP2NiLmWPsQQT6iY+MLxeHRWEcr8pIOV3s4a6VxGnmN8lYT1pBlVo8INlxT
dVNpb8fcWognxZVno5Td0kZQ7Ds97V8k8voiH7iDJIbXOAAOjOfNEe5Z+1ytIq5B
7BDDqE0IXcEHnEmyBthD
=JuS6
-----END PGP SIGNATURE-----

--QskEhtI8O9a7XL1GPvO87wmlDEtLrbaIi--
