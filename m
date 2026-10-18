Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35764C6535;
	Sun, 18 Oct 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331649; cv=none; b=PWjFinEy63yPc5yUMC/kk77m4h7nNV3KPv4zutStVOesQepnbOcGdoG3ecIiv5qIHy8pQgzamThcPDfVT4CnZDOW2orWnqqVjgEuWAzlq1GS+6PjJMlKKZcsNybBP6EEqlLnVRbQAf2h+8TSiI+MA0erb+h+fbsOFBn+g0UmAMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331649; c=relaxed/simple;
	bh=ueI5E09/e+I3Q6tmFxYTRZPJxQdaw6F9+MbJzYIdUiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6a0lYBDuRlGWCvsiYHrolRLEpjKYNIuxisbDvI2ZrPKB+U+sD/pMBB0vLllNsWXVxPmIwVtDy+UVYr7dPB/ymzCV82pTqDfUtP7UcHhB8oG+6BpwiV5I71XzOkehBDwg4rlvGLQjngWti49quz2LWYqw0Fc1zTLtk/d6WT/uZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OjFnlW/L; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OjFnlW/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331640; x=1792936440; i=w_armin@gmx.de;
	bh=MEhk+zU8HWoZEDt9lixGtDZPBeCzX7lv344RkSQy1iM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OjFnlW/LKhCwMMlqUOT7cTEfc7qgSXI0yuARp50HnnBFe7HVGANRH0AVf2pSi+xn
	 e7852n0gbOwsa7Ho1qEC5NViui+4PRtdyCS5j/5POQnYY9eEDlTxoFI4v98rxc8CY
	 af6QS+fj+/ebo4+WsGvsl5jzD1zSF579utFPT87PQxiaokl8UqJW8y8CxSNvrj+P8
	 MAXYCIAGdWa2RjgP95FX9mtX6z3F4Jp5GgIEpXQijZ+BShbhmQrBC6ffmQyfgpc4H
	 UTosROE9u1N9k8cGaFl4CTCvddDx0NhApPn7hdSY4i+X0L7gg92eaFB4QC3kn81UN
	 v03CyMGFnge8bIPKAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1wjeY62IU6-00puv3; Sun, 18
 Oct 2026 15:54:00 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] leds: Support custom sysfs groups on multicolor and flash LEDs
Date: Sun, 18 Oct 2026 15:46:28 +0200
Message-ID: <20261018135339.1109271-10-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018135339.1109271-1-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qdeHOE3NLjSTGt12xAiZqMjJ+kn0/l4aCIUIJivSvG8U57h+lpM
 I7b/UUvqUASOK6X1ae6T9WUoakp9ZZVRuNbkMI6VW6/py3lE+sH8Uns/b4JN9bCwMCFtK84
 W7Ugzaap1AQ0QGN94HX1oR77c9/Z+c/KWm+en45Ge25D1T90n+AGYMWVP7YOBXLIPXn3So2
 gcIMkkRqnfYMXw7LLLYpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YNv2EKJBaNQ=;f8TJWpgirWetgfuO/ORtUC+cuRK
 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
 loZZcd0CqqXrYU3aCGu3lmZ6xl665s8c

Drivers registering multicolor/flash LEDs currently cannot use
led_cdev->groups due to said field being overwritten by the
multicolor/flash LED registration functions. Fix this by assigning
each LED type a seperate device type ("multicolor" and "flash")
that carries the sysfs attributes instead.

Also assign a device type for standard LEDs ("standard") for symmetry.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-flash.c      | 108 ++++++++++++++--------------
 drivers/leds/led-class-multicolor.c |  18 ++++-
 drivers/leds/led-class.c            |   5 ++
 include/linux/led-class-flash.h     |   5 --
 4 files changed, 73 insertions(+), 63 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash=
.c
index 953265fddb7d..e023511cea1c 100644
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
=20
-static const struct attribute_group led_flash_timeout_group =3D {
-	.attrs_const =3D led_flash_timeout_attrs,
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
+
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
@@ -254,28 +269,6 @@ static void led_flash_resume(struct led_classdev *led=
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
-	led_cdev->groups =3D flash_groups;
-}
-
 int led_classdev_flash_register_ext(struct device *parent,
 				    struct led_classdev_flash *fled_cdev,
 				    struct led_init_data *init_data)
@@ -289,26 +282,29 @@ int led_classdev_flash_register_ext(struct device *p=
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
+	ret =3D led_classdev_add(led_cdev);
+	if (ret < 0)
+		put_device(led_cdev->dev);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(led_classdev_flash_register_ext);
=20
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 57df0b2e785b..9b8c37f7bdf4 100644
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
@@ -176,9 +183,16 @@ int led_classdev_multicolor_register_ext(struct devic=
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
+	ret =3D led_classdev_add(led_cdev);
+	if (ret < 0)
+		put_device(led_cdev->dev);
=20
-	return led_classdev_register_ext(parent, led_cdev, init_data);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
=20
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ace417a2388e..49b321b3d863 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -613,6 +613,10 @@ int led_classdev_add(struct led_classdev *led_cdev)
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
@@ -631,6 +635,7 @@ int led_classdev_register_ext(struct device *parent,
 	if (ret < 0)
 		return ret;
=20
+	led_cdev->dev->type =3D &led_device_type;
 	ret =3D led_classdev_add(led_cdev);
 	if (ret < 0)
 		put_device(led_cdev->dev);
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
2.56.0

