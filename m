Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A244C6F04;
	Sun, 18 Oct 2026 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331644; cv=none; b=HtdtTA5SSvr5bm4RTQM1BLZ5tK2oY6hKB4eroLsFEsKRzw8k1A5Tn571WmniM8bzWXp8/Rur6rQ4yECVKPaCkW2Xj9gZkEOH35SarP61NB6jtSxeMYDeIU1MfGmO2hMGLhrmxAC+q05DXxj/ijlgUapiM+f7dxUGksfy7R0MY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331644; c=relaxed/simple;
	bh=ejC4jHBsl+rXtHrTiDIoDqcKp+t8m2g6hezr3nDp6AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUupIa5rz0bmQMeYfazxy2JxrGZguQFvyVRyFrZcctgLDEfv5KpQmV7BMUBSODco8w/RNkueTK7VmJMz/8ie/V8Y26+uoaRCPmJjMfLh8t4vRA7YfoTwqdCIy0s4ZEixvm5tEefBqAuJnLTcOLyckTDtZbnOj0abn8RpydY/7e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=iVty1LcZ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="iVty1LcZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331640; x=1792936440; i=w_armin@gmx.de;
	bh=PYsMbo9k7xvpYBvYcZ43NTsuh6usBY0tKH+OI7ynyTE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=iVty1LcZleP/UVy+xQRsrjV7AbAjLrFGh0tB2r/Spf9UVdJ28ZutfhtKos4feWWW
	 T4nJTQENhKeHLYldycCVZUxzx0cA4nfiJu4bo/LMzodot0sYwMoTeRvL6SRmG/F/u
	 oAUYxVMewBtmuBmJKw8LODiIo1m67fYgWJY8vUl+6V9peGDseRZ4+92TppMguluN+
	 l1X1rBc3vrmyq3OM3QWHga+DwxSSKvMdylXegjjV6Ii4/hYBNpVZDF9iBSJ+ZWRBw
	 SJa/fmF62al8+4eEo9ef3viYcKB5NkCxSej73cHcPH3uTrqSkrk6k4vDhSUmcBKC1
	 D90VbVXvLThRslGrgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mqb1c-1wnYYB3pjM-00p2Wv; Sun, 18
 Oct 2026 15:54:00 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] leds: class: Split led_classdev_register_ext()
Date: Sun, 18 Oct 2026 15:46:27 +0200
Message-ID: <20261018135339.1109271-9-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:A7ypMJ7tOANQmqOUV4NMoXlGvzxx2h6mGrNfEBzcVjQJSF13kBn
 fZRT7CQw+SJsOyVQkvvhANvlZrxUYyfwXvASH4j7JK8jml0cGSPShjUastF9TssSpKlrUFf
 XQJFr3lQyRf6QcGAMyGRTCW1gvSvO4MS968ZUkb8f54ig4cvJbGvisFwn1FCLRJTKH742w0
 +dX5GLw9NAVrH23SlXOFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LgwCgZA+yZk=;lLrQK+OMm6T/h34BzdwgJM23Lev
 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

Split led_classdev_register_ext() into two seperate internal functions
to prepare for future changes around LED class device initialization.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 105 +++++++++++++++++++++++++++++++--------
 drivers/leds/leds.h      |   3 ++
 2 files changed, 88 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 77a0fce03952..ace417a2388e 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -228,9 +228,15 @@ static struct led_classdev *led_module_get(struct dev=
ice *led_dev)
 	return led_cdev;
 }
=20
+static void led_classdev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 static const struct class leds_class =3D {
 	.name =3D "leds",
 	.dev_groups =3D led_groups,
+	.dev_release =3D led_classdev_release,
 	.pm =3D &leds_class_dev_pm_ops,
 };
=20
@@ -465,16 +471,21 @@ static int led_classdev_next_name(const char *init_n=
ame, char *name,
 }
=20
 /**
- * led_classdev_register_ext - register a new object of led_classdev clas=
s
- *			       with init data.
- *
- * @parent: parent of LED device
+ * led_classdev_init - Initialize a new LED class device.
+ * @parent: parent of LED device.
  * @led_cdev: the led_classdev structure for this device.
- * @init_data: LED class device initialization data
+ * @init_data: LED class device initialization data.
+ *
+ * Initializes a new LED class device, but does not register with the
+ * subsystem yet. Useful for performing additional initialization before
+ * adding the LED class device to the subsystem using led_classdev_add().
+ * After calling this function put_device() needs to be called on the dev
+ * field inside the LED class device in order to dispose it.
+ *
+ * Return: Zero on success or a negative error code on failure.
  */
-int led_classdev_register_ext(struct device *parent,
-			      struct led_classdev *led_cdev,
-			      struct led_init_data *init_data)
+int led_classdev_init(struct device *parent, struct led_classdev *led_cde=
v,
+		      struct led_init_data *init_data)
 {
 	char composed_name[LED_MAX_NAME_SIZE];
 	char final_name[LED_MAX_NAME_SIZE];
@@ -539,23 +550,54 @@ int led_classdev_register_ext(struct device *parent,
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness =3D LED_FULL;
=20
-	mutex_lock(&led_cdev->led_access);
-	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0, led_=
cdev,
-						  led_cdev->groups, "%s", final_name);
-	if (IS_ERR(led_cdev->dev)) {
-		mutex_unlock(&led_cdev->led_access);
-		return PTR_ERR(led_cdev->dev);
+	led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
+	if (!led_cdev->dev)
+		return -ENOMEM;
+
+	device_initialize(led_cdev->dev);
+	led_cdev->dev->class =3D &leds_class;
+	led_cdev->dev->parent =3D parent;
+	led_cdev->dev->groups =3D led_cdev->groups;
+	dev_set_drvdata(led_cdev->dev, led_cdev);
+	ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
+	if (ret < 0)
+	{
+		put_device(led_cdev->dev);
+		return ret;
 	}
=20
 	if (init_data && init_data->fwnode)
 		device_set_node(led_cdev->dev, init_data->fwnode);
=20
-	led_update_brightness(led_cdev);
-
 	led_cdev->wq =3D leds_wq;
=20
 	led_init_core(led_cdev);
=20
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_classdev_init);
+
+/**
+ * led_classdev_add - Add a new LED class device to the subsystem.
+ * @led_cdev: the led_classdev structure for this device.
+ *
+ * Adds a new LED class device to the subsystem, allowing userspace appli=
cations
+ * and/or kernel consumers to access it.
+ *
+ * Returns: Zero on success or a negative error code on failure.
+ */
+int led_classdev_add(struct led_classdev *led_cdev)
+{
+	int ret;
+
+	guard(mutex)(&led_cdev->led_access);
+
+	ret =3D device_add(led_cdev->dev);
+	if (ret < 0)
+		return ret;
+
+	led_update_brightness(led_cdev);
+
 	/* add to the list of leds */
 	down_write(&leds_list_lock);
 	list_add_tail(&led_cdev->node, &leds_list);
@@ -565,13 +607,36 @@ int led_classdev_register_ext(struct device *parent,
 	led_trigger_set_default(led_cdev);
 #endif
=20
-	mutex_unlock(&led_cdev->led_access);
-
-	dev_dbg(parent, "Registered led device: %s\n",
-			led_cdev->name);
+	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cdev->=
name);
=20
 	return 0;
 }
+EXPORT_SYMBOL_GPL(led_classdev_add);
+
+/**
+ * led_classdev_register_ext - register a new object of led_classdev clas=
s
+ *                             with init data.
+ *
+ * @parent: parent of LED device.
+ * @led_cdev: the led_classdev structure for this device.
+ * @init_data: LED class device initialization data.
+ */
+int led_classdev_register_ext(struct device *parent,
+                              struct led_classdev *led_cdev,
+                              struct led_init_data *init_data)
+{
+	int ret;
+
+	ret =3D led_classdev_init(parent, led_cdev, init_data);
+	if (ret < 0)
+		return ret;
+
+	ret =3D led_classdev_add(led_cdev);
+	if (ret < 0)
+		put_device(led_cdev->dev);
+
+	return ret;
+}
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
=20
 /**
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 6d00e6f44126..2d977c5a3520 100644
=2D-- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -18,6 +18,9 @@ static inline int led_get_brightness(struct led_classdev=
 *led_cdev)
 }
=20
 void led_init_core(struct led_classdev *led_cdev);
+int led_classdev_init(struct device *parent, struct led_classdev *led_cde=
v,
+		      struct led_init_data *init_data);
+int led_classdev_add(struct led_classdev *led_cdev);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int =
value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned i=
nt value);
=2D-=20
2.56.0

