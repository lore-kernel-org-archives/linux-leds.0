Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209940;
	b=Rzf7OlXbFJkcerwbwf/1Z/8dR1ZGN/8kfVWoKFPzY/CAecpVQfvTf4KhhXM74MTTxPE6
	 g8HI5YRHcO7ZAph7deeKdLeyLCBWbRtO4g2fpaM1sXkCKcO7y+WC1UgK4pS6UqBKGzgkp
	 IcxuwdLQ0V+7lSMXtr4HD0Cyc16IAI/E7amLvvwTp5jzl5cOwTHkfZjaksiksTiI8nurY
	 GDDT4GiB4U/+cQH30UTC9v+PhbJdPinqlKGQ6o+cHhvbBLH9A+AxOyTqvq5V+zl0gQG5j
	 YZtrKo8g7yx9KhabWEZ1G4e4/7ywiFGXW5HCpurgiwM8vHeSsThTDR+bVzaZGlWMcuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209940;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ImiBtORCgr9VjxOX4rTfnqz8JE1K2nTyAZOsPgUQvJM=;
	b=BntRlEXQMXnHNjfELoPR+hf+8CY27zmcPrMlIhNh8NpkUuEh1CfopvmFG/X1gO08iLy/
	 ZiM0vINadbqRMJKdnmCuNgG+rYux8IWj52iltIgT87u4qWR046Zt7LBkUT0E4wB12CxPs
	 aM802lrv7fCDeyzn0RiGDzkZfOYldlCRi3+HqawcLrmVeC0dJ5OUcw3sYq+meNvJ7L2mG
	 PExx5ZJtmLYXr3Q5AR/2ta/qTOFMrhXhwYyIq+VgdKJo8dCaRARxhDztX91JBpy/b7m+6
	 ZJ6yqME93SB32cnW+k3Gc4usOn/KCP27kXzD/CvPRmdBtw+gNJ1JNVCXbAphbacNeNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jx0ZoZNZ;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F160A2631
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE2F160A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=jx0ZoZNZ
DKIM2-Signature:  i=1; m=1; t=1795209930;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:TEMBqNC9YwPGypsI97CyVQRwnA0k
   XB/a7nnCRLySZ7IWQ52C/6s7t/jZnz0vo8zziW9NLfAi2fXVuOgKaKMLGfPHE0T6nvDPUINl2c/
   WCz9O1r2CBUtNElIX9V8AfxCFxGWedo/PwqsrrLlDRjwR30s22ZlE9Vsu6b6SOyyPVksqk/kAOk
   orsscGSKzOcyUU0aXB2dHu2dvBUrk7I7B2UqPWtfCYfqmoDFdm8asrxzfkFbgcodIDsdDnPJBNF
   c+H4ogsu0KwsmguZZH8Kzopvr3ybawoy+FZaxFS94ffWoIK4eHvz9+4n45fJmHtrUr0eRJaoUKU
   LhJ4QFKYjmtCAw==;
Message-Instance:  m=1;
 h=sha256:
   HBEaeqXw+spsABbEpAtri+N4cYKUhWOdOUr7ElZ29N0=:
   sofMOaMwYi955RUv89mMRDswtMaX9EO3NFCh5fHT/BI=,
  sha512:
   gWfCAQP2Jbs9X2PAD8QU3T3IfiGiAXhJ+bIEooX0Kjlim78OkeVkGuIfA4vCfIfPELEvsUo2zCFbG6sAXnCTKg==:
   Asm6+NdZuBWmDrnBhrsfvV6SNpjxFgI8lCC2rFP1qx9VYu7nnOdeV2wtVDve3552JQfEgg+FDCzq6B0vJu3jMw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209894; x=1795814694; i=w_armin@gmx.de;
	bh=ImiBtORCgr9VjxOX4rTfnqz8JE1K2nTyAZOsPgUQvJM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jx0ZoZNZ3JV1SsAGU1i2OPQdgB91qnkzaUfqkZCH0sa9bIfJqtHuG6STiFQ2d4hu
	 T7KQp7yI1UtLmYmNt6AXhCBdIDUW0X7o/tRT6Lltmwc8JTXAZXU8cQcSH4TitBsr3
	 8X2EmtRwpIRMdDXo1idOK/4i7xqM9/00PbQOcpffDfodnCNkGphpe6dp0T1q0Mh6B
	 GZTUyhPGdK+7ew9tMLJhA5tXWvr+GEo+LQWxfl+vphE22MmR5gg4JKhtgVjTMjKtD
	 ETGTTaxSvjeOAqNa0MdTYkO0rJPB1MwTcbJP2TxvxYYSjymksIl5xnpK+5V0vb2Fs
	 ADrRP8Hv2dMrCnny2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY68T-1y2u5o3K5F-00XFOg; Fri, 20
 Nov 2026 22:24:54 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 09/11] leds: Support custom sysfs groups on multicolor and flash LEDs
Date: Fri, 20 Nov 2026 22:22:26 +0100
Message-ID: <20261120212431.152081-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120212431.152081-1-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MSlu6xrufcGa91ZQIwQcQciZYNFiqd+mhvMvlRviYFjpzQ2zGcB
 oCNJOjWOOEQba0kHGPsCv4iULKjFzmoOIDZ53TllVuoimr9++vZ+3/UJb+BoYg82CFrz3Lf
 yzjh5tDtZDjSKGCnszQ9CY8KYruSc1IdWJO/jYhbdlrfPANY21jV2BNnHQxju7pp+bIGbu2
 9uc/2nFUnvAFMKcNCmXaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A+UIKQFIwCg=;cmA4nqUVpvPns61MYkEPIiza0T7
 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
 EqY/vD1NH47vHudDkkg==

Drivers registering multicolor/flash LEDs currently cannot use
led_cdev->groups due to said field being overwritten by the
multicolor/flash LED registration functions. Fix this by assigning
each LED type a seperate device type ("multicolor" and "flash")
that carries the sysfs attributes instead.

Also assign a device type for standard LEDs ("standard") for symmetry.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-flash.c      | 107 +++++++++++++---------------
 drivers/leds/led-class-multicolor.c |  15 +++-
 drivers/leds/led-class.c            |   6 ++
 include/linux/led-class-flash.h     |   5 --
 4 files changed, 68 insertions(+), 65 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash=
.c
index 33cfc5d082c1..2e98f030cda6 100644
=2D-- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
+#include "leds.h"
=20
 #define has_flash_op(fled_cdev, op)				\
 	(fled_cdev && fled_cdev->ops->op)
@@ -207,42 +208,56 @@ static ssize_t flash_fault_show(struct device *dev, =
const struct device_attribut
 }
 static const DEVICE_ATTR_RO(flash_fault);
=20
-static const struct attribute *const led_flash_strobe_attrs[] =3D {
+static const struct attribute *const led_flash_attrs[] =3D {
 	&dev_attr_flash_strobe.attr,
-	NULL,
-};
-
-static const struct attribute *const led_flash_timeout_attrs[] =3D {
 	&dev_attr_flash_timeout.attr,
 	&dev_attr_max_flash_timeout.attr,
-	NULL,
-};
-
-static const struct attribute *const led_flash_brightness_attrs[] =3D {
 	&dev_attr_flash_brightness.attr,
 	&dev_attr_max_flash_brightness.attr,
-	NULL,
-};
-
-static const struct attribute *const led_flash_fault_attrs[] =3D {
 	&dev_attr_flash_fault.attr,
 	NULL,
 };
=20
-static const struct attribute_group led_flash_strobe_group =3D {
-	.attrs_const =3D led_flash_strobe_attrs,
-};
+static umode_t led_flash_is_visible(struct kobject *kobj, const struct at=
tribute *attr, int n)
+{
+	struct device *dev =3D kobj_to_dev(kobj);
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
+
+	if (attr =3D=3D &dev_attr_flash_strobe.attr)
+		return attr->mode;
+
+        if (attr =3D=3D &dev_attr_flash_timeout.attr && fled_cdev->ops->t=
imeout_set)
+                return attr->mode;
+
+	if (attr =3D=3D &dev_attr_max_flash_timeout.attr && fled_cdev->ops->time=
out_set)
+		return attr->mode;
+
+	if (attr =3D=3D &dev_attr_flash_brightness.attr && fled_cdev->ops->flash=
_brightness_set)
+		return attr->mode;
+
+	if (attr =3D=3D &dev_attr_max_flash_brightness.attr && fled_cdev->ops->f=
lash_brightness_set)
+		return attr->mode;
+
+	if (attr =3D=3D &dev_attr_flash_fault.attr && fled_cdev->ops->fault_get)
+		return attr->mode;
=20
-static const struct attribute_group led_flash_timeout_group =3D {
-	.attrs_const =3D led_flash_timeout_attrs,
+        return 0;
+}
+
+static const struct attribute_group led_flash_group =3D {
+	.is_visible_const =3D led_flash_is_visible,
+	.attrs_const =3D led_flash_attrs,
 };
=20
-static const struct attribute_group led_flash_brightness_group =3D {
-	.attrs_const =3D led_flash_brightness_attrs,
+static const struct attribute_group *led_flash_groups[] =3D {
+	&led_flash_group,
+	NULL,
 };
=20
-static const struct attribute_group led_flash_fault_group =3D {
-	.attrs_const =3D led_flash_fault_attrs,
+static const struct device_type led_flash_device_type =3D {
+	.name =3D "flash",
+	.groups =3D led_flash_groups,
 };
=20
 static void led_flash_resume(struct led_classdev *led_cdev)
@@ -254,30 +269,6 @@ static void led_flash_resume(struct led_classdev *led=
_cdev)
 	call_flash_op(fled_cdev, timeout_set, fled_cdev->timeout.val);
 }
=20
-static void led_flash_init_sysfs_groups(struct led_classdev_flash *fled_c=
dev)
-{
-	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
-	const struct led_flash_ops *ops =3D fled_cdev->ops;
-	const struct attribute_group **flash_groups =3D fled_cdev->sysfs_groups;
-
-	int num_sysfs_groups =3D 0;
-
-	flash_groups[num_sysfs_groups++] =3D &led_flash_strobe_group;
-
-	if (ops->flash_brightness_set)
-		flash_groups[num_sysfs_groups++] =3D &led_flash_brightness_group;
-
-	if (ops->timeout_set)
-		flash_groups[num_sysfs_groups++] =3D &led_flash_timeout_group;
-
-	if (ops->fault_get)
-		flash_groups[num_sysfs_groups++] =3D &led_flash_fault_group;
-
-	flash_groups[num_sysfs_groups] =3D NULL;
-
-	led_cdev->groups =3D flash_groups;
-}
-
 int led_classdev_flash_register_ext(struct device *parent,
 				    struct led_classdev_flash *fled_cdev,
 				    struct led_init_data *init_data)
@@ -291,26 +282,26 @@ int led_classdev_flash_register_ext(struct device *p=
arent,
=20
 	led_cdev =3D &fled_cdev->led_cdev;
=20
-	if (led_cdev->flags & LED_DEV_CAP_FLASH) {
-		if (!led_cdev->brightness_set_blocking)
-			return -EINVAL;
+	if (!(led_cdev->flags & LED_DEV_CAP_FLASH))
+		return led_classdev_register_ext(parent, led_cdev, init_data);
=20
-		ops =3D fled_cdev->ops;
-		if (!ops || !ops->strobe_set)
-			return -EINVAL;
+	if (!led_cdev->brightness_set_blocking)
+		return -EINVAL;
=20
-		led_cdev->flash_resume =3D led_flash_resume;
+	ops =3D fled_cdev->ops;
+	if (!ops || !ops->strobe_set)
+		return -EINVAL;
=20
-		/* Select the sysfs attributes to be created for the device */
-		led_flash_init_sysfs_groups(fled_cdev);
-	}
+	led_cdev->flash_resume =3D led_flash_resume;
=20
 	/* Register led class device */
-	ret =3D led_classdev_register_ext(parent, led_cdev, init_data);
+	ret =3D led_classdev_init(parent, led_cdev, init_data);
 	if (ret < 0)
 		return ret;
=20
-	return 0;
+	led_cdev->dev->type =3D &led_flash_device_type;
+
+	return led_classdev_add(led_cdev, init_data);
 }
 EXPORT_SYMBOL_GPL(led_classdev_flash_register_ext);
=20
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 57df0b2e785b..0656ca2361b3 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/uaccess.h>
+#include "leds.h"
=20
 static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
 {
@@ -159,11 +160,17 @@ static const struct attribute *const led_multicolor_=
attrs[] =3D {
 };
 ATTRIBUTE_GROUPS(led_multicolor);
=20
+static const struct device_type led_multicolor_device_type =3D {
+	.name =3D "multicolor",
+	.groups =3D led_multicolor_groups,
+};
+
 int led_classdev_multicolor_register_ext(struct device *parent,
 				     struct led_classdev_mc *mcled_cdev,
 				     struct led_init_data *init_data)
 {
 	struct led_classdev *led_cdev;
+	int ret;
=20
 	if (!mcled_cdev)
 		return -EINVAL;
@@ -176,9 +183,13 @@ int led_classdev_multicolor_register_ext(struct devic=
e *parent,
=20
 	led_cdev =3D &mcled_cdev->led_cdev;
 	led_cdev->flags |=3D LED_MULTI_COLOR;
-	mcled_cdev->led_cdev.groups =3D led_multicolor_groups;
+	ret =3D led_classdev_init(parent, led_cdev, init_data);
+	if (ret < 0)
+		return ret;
+
+	led_cdev->dev->type =3D &led_multicolor_device_type;
=20
-	return led_classdev_register_ext(parent, led_cdev, init_data);
+	return led_classdev_add(led_cdev, init_data);
 }
 EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
=20
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2f62141268ab..161b85db04f3 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -654,6 +654,10 @@ int led_classdev_add(struct led_classdev *led_cdev, s=
truct led_init_data *init_d
 }
 EXPORT_SYMBOL_GPL(led_classdev_add);
=20
+static const struct device_type led_device_type =3D {
+	.name =3D "standard",
+};
+
 /**
  * led_classdev_register_ext - register a new object of led_classdev clas=
s
  *                             with init data.
@@ -672,6 +676,8 @@ int led_classdev_register_ext(struct device *parent,
 	if (ret < 0)
 		return ret;
=20
+	led_cdev->dev->type =3D &led_device_type;
+
 	return led_classdev_add(led_cdev, init_data);
 }
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-fla=
sh.h
index 775a96217518..5204ef60dc4b 100644
=2D-- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -28,8 +28,6 @@ struct led_classdev_flash;
 #define LED_FAULT_LED_OVER_TEMPERATURE	(1 << 8)
 #define LED_NUM_FLASH_FAULTS		9
=20
-#define LED_FLASH_SYSFS_GROUPS_SIZE	5
-
 struct led_flash_ops {
 	/* set flash brightness */
 	int (*flash_brightness_set)(struct led_classdev_flash *fled_cdev,
@@ -79,9 +77,6 @@ struct led_classdev_flash {
=20
 	/* flash timeout value in microseconds along with its constraints */
 	struct led_flash_setting duration;
-
-	/* LED Flash class sysfs groups */
-	const struct attribute_group *sysfs_groups[LED_FLASH_SYSFS_GROUPS_SIZE];
 };
=20
 static inline struct led_classdev_flash *lcdev_to_flcdev(
=2D-=20
2.56.1

