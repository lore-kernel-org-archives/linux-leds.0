Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207443;
	b=h0WUt0wbUdGSxGzg7R5rs/Y/d2EVlA7KDRCJsz+KxzCgv/XhO1GFigv+lN153RfHLSe1
	 LgwqLCguUeGtGqYqq37NbnFxseH0a7Sc6R5MxP6A9UVphMciG8EgCM+JzeNhBjizrVUFQ
	 x/g/LYCvm84+MF/XaZv5/lK97f2ZAryiqgEXdMONo749sSpxCsFcM2zuYex/PLxxHfPkM
	 grZWgCYgh4mtjtBOvEzhPf/SE1SCRqm59k00kBNtLbEhRWD92HdkAvXP0Vpb4CLe4PixB
	 EvbH2pJLGCP3AXXTwANpSogXR6jC4jkaxnA6xTAACbQTrkEnfYoIL3Z1baxb97KFAtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207443;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=ImiBtORCgr9VjxOX4rTfnqz8JE1K2nTyAZOsPgUQvJM=;
	b=uDjWb81z1bGrXtcpZKlHTbfM8M58GjbB7UAhj3yJXlmTmRo+sq8chlt2rHfY1o09S7Tl
	 HIzpntnPCbMpX8Qtv2FbNWTXHp5NR+LxAU23dmhV9wjVkgMl/TTH/15oxlM4yj8Ds+N/s
	 rf+XKuBPzLBADG3oDQCX8SB5Qcu+kNPDLqWDzfDHRUcneNZ0AfDShiNYSNxsJtMpexGGn
	 nXViJxhT5lReufgA0rRpi5P0XmQRqHkSI6XHGJX+p+OpGZcLdZDOJO+Zk4EzLgMOO6Abd
	 OatorTEdF2e+uPhrWyVUqvEcJ4IKx/nqLWMVkwBlDFSUT1RcrGe4QplqQLnBcDm7+fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=eXfutChT;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2F1606B73D
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A2F1606B73D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=eXfutChT
DKIM2-Signature:  i=1; m=1; t=1795207440;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:BN9CAs1BA7b/Fl5pNY9OrjLIiIDu
   Zb4lAcoaTVyYVvugUttudWuSf5UtOGfEQSlYMPDmLb2SXCRP729s0IYI/MmtSwLDzdMSJZ5+W9g
   JTF0rROSXD3HOu7McILjMpvoe2cYC/DJDVh1R+eqBP/bX8plrK6kItAW6ylOQXgl8BUN58xT0EY
   lLdx+1ltfEcq5M7R/GJifP2NV/MjBO227iYgkON4OqfPprb3ey/PJsLQB3oV2FjEeJYWRXxph5b
   q2FjCSIVnGT+R/Bqy95b91sncKrL3Ir3s/sjHcrbuONVnMPgOMY77ouMk2VluBhebTiSoJweBej
   KVb9dkxXSZ3jHQ==;
Message-Instance:  m=1;
 h=sha256:
   x9dsttXNzEIefi1M9pDt62np0eTk8/yamxxGau8ndqM=:
   sofMOaMwYi955RUv89mMRDswtMaX9EO3NFCh5fHT/BI=,
  sha512:
   hzKyHPeyx9zHTWyJsQ2hAoRqv4tUW3pHVji/J0LLcVHGfXMMUShaNrexoLv1ssxNB2jhI0hFSQUoTHyBwYsdWw==:
   Asm6+NdZuBWmDrnBhrsfvV6SNpjxFgI8lCC2rFP1qx9VYu7nnOdeV2wtVDve3552JQfEgg+FDCzq6B0vJu3jMw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207388; x=1795812188; i=w_armin@gmx.de;
	bh=ImiBtORCgr9VjxOX4rTfnqz8JE1K2nTyAZOsPgUQvJM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eXfutChT5NKTumAB+UHynZuaPoBRR8LanNQyN0NOh9SQsWcHjN82oZtg6ZK3IPW7
	 NUMPwA0aBeHtUOWag+FF9d2Mi20wwFxeuEn+3rPtGGY62mO2Uuy7t+QTSx4HoZGgC
	 zL/gLCABsBPIS5oIwhKrUDhKUi13ahM0OjpGK5wF0xCsbvDlJlgro/kd5mTwuz72E
	 n2N/XXDoSbzXwxdkRZYd0GW25p98sg6EkEOJ9fSMJ5jjAP180FY84vuN3j8wy2Kd7
	 v0CUGc8/GZN8Ipt+EKi3eqXD3PF4Ez3kQyODPOEjbVTSbFcjplLvLV4EYTMkkPyWC
	 lW/gt3U8rSJ2muQDLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryXH-1yI5sn0zNl-00m5iC; Fri, 20
 Nov 2026 21:43:08 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 09/10] leds: Support custom sysfs groups on multicolor and flash LEDs
Date: Fri, 20 Nov 2026 21:35:21 +0100
Message-ID: <20261120204246.6645-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120204246.6645-1-W_Armin@gmx.de>
References: <20261120204246.6645-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:dvTdwJ4aK6sr+/rC2GcOypegE33k2BCfJo0vQQOFr2jq0is0KGg
 f5Vn00bDpihGWsVdHpADFN8jzN8B0HBfMlVQVglQZERga4a2mM7h2yhoiQR03AU1st66IFf
 wrNOAmZbsbhdyydDZ7fPpQnKwT57BfP5zKEWNSPJ9bPROA28jOZ1rZRIh1DzlXug5/ALsnQ
 r3ccUBURr5C1WRVQ6UJlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l6QmJe4YALE=;p6F2Xq6T4qMy6gGwkLgoXd6BG9r
 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
 Jgbnk1v/dNGG+ysVv15K5PGw3EiAG8=

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

