Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A381E4C8FF0;
	Sun, 18 Oct 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331649; cv=none; b=jdoNGF1HZBjcPYrPdmXPZlp3gnBa0uHYXHDGqhOVJSw2PFCIKwtxnoK4YFTtezslCP4D2HlDvFQ6qSPNZDh7O7TeGkym9YdfvZDu397b+FX+8Af4YqUu+b7XFaFHNrEvtGvpPcz2PHwCd8htttNuBOG9gXZ3730HjwiSPs13KMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331649; c=relaxed/simple;
	bh=yT7fzQ8G1q4g/Ekc844X0jCwWSHLH8hjOPnWIay+iUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLEcUO63KsGabgvThRmR19rj2FDgNhsVteA5gThn18BWQzefllO8s8XC2cZF6+ThiWZKlzMfVtP2g3M7/IfXIjjLcmQrnxFZOEFO7RTxfISfl18VB/lIAH5saTgYeWPf0frh1KZQ5e/IcBtq+4G47gn6cLc/v30LI3k7xpCaCh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mikew5a9; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mikew5a9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331637; x=1792936437; i=w_armin@gmx.de;
	bh=OiXw0Iv+iWoDexQ6pBl1/MRZbKDOSh8SdianSRDHpx0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mikew5a9z+jfxW8E2WLibJ9Lu7NO1c779mtPErTINcqRzMPEosqLE51SJqHbnKCy
	 MCz9o8i9WNv7KjQeGqwYDwtDUuZCu7GUOiySelOTlUW1Ee8qYoHtnKVexQyBkXgch
	 VW5F9gCA1B+RjoH7iqLH1IOoM2BpAaRq5jY+OksJypUREpsFVehJCa70jXUeWuG6O
	 vBX6tjUkvFJr8QJVzJ9HNoGAh4hx55jtZoPmpfo5j1wX4HK5G0NhNNbgG8HEPJkNq
	 DA+v+PetLxJMMTklsT7MKkFrLPZIW4Anifm3j94zBECV7wQDl7VTenKGMb5ydBZyy
	 ysF12jHBclQiXETaIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDkm-1wPFJV19Ng-011OqX; Sun, 18
 Oct 2026 15:53:57 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] leds: class: Create "brightness_hw_changed" attribute atomically
Date: Sun, 18 Oct 2026 15:46:23 +0200
Message-ID: <20261018135339.1109271-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:Eb0X5gA6kAv+nrwdpa1+hWgY5V/7pAGnov0jKoEEzyO04aEwLHG
 0eWWISH+skivGsTB48gc2kBv0haF4FBUBRXpYUZGHZRju1c3O59kE2DSHeXxtsNENyRF/Ez
 49889c4ZDBl/DxmNRvroNPpFXpD/DhM/MFK52kgGMJ7oyHP/U2Qt8cvin6ZKL4bXT6mStnm
 evAw8JUPlnXvdUwPASBQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OwJrkMq0JxY=;7JPzZUjMxFsKSg/N+fq5yTTzaUb
 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
 cK2EBmArmVLtp+LJUt9U=

Using device_create_file() might cause userspace applications
listening for uevents to inspect a new LED device before the kernel
has registered all sysfs attributes for it. This might cause those
applications to incorrectly assume that the new LED device does not
support the "brightness_hw_changed" attribute.

Fix this by letting the device core create the sysfs attribute before
the uevent is being send to userspace.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 85 +++++++++++++++-------------------------
 include/linux/leds.h     |  2 -
 2 files changed, 31 insertions(+), 56 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 3775ad13762f..d460f041ed86 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/sysfs.h>
 #include <linux/timer.h>
 #include <uapi/linux/uleds.h>
 #include <linux/of.h>
@@ -101,14 +102,6 @@ static const struct attribute_group led_group =3D {
 	.attrs_const =3D led_class_attrs,
 };
=20
-static const struct attribute_group *const led_groups[] =3D {
-	&led_group,
-#ifdef CONFIG_LEDS_TRIGGERS
-	&led_trigger_group,
-#endif
-	NULL,
-};
-
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 static ssize_t brightness_hw_changed_show(struct device *dev, const struc=
t device_attribute *attr,
 					  char *buf)
@@ -123,51 +116,48 @@ static ssize_t brightness_hw_changed_show(struct dev=
ice *dev, const struct devic
=20
 static const DEVICE_ATTR_RO(brightness_hw_changed);
=20
-static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
-{
-	struct device *dev =3D led_cdev->dev;
-	int ret;
+static const struct attribute *const led_brightness_hw_changed_attrs[] =
=3D {
+	&dev_attr_brightness_hw_changed.attr,
+	NULL,
+};
=20
-	ret =3D device_create_file(dev, &dev_attr_brightness_hw_changed);
-	if (ret) {
-		dev_err(dev, "Error creating brightness_hw_changed\n");
-		return ret;
-	}
+static umode_t led_brightness_hw_changed_is_visible(struct kobject *kobj,
+						    const struct attribute *attr, int n)
+{
+	struct device *dev =3D kobj_to_dev(kobj);
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
=20
-	led_cdev->brightness_hw_changed_kn =3D
-		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
-	if (!led_cdev->brightness_hw_changed_kn) {
-		dev_err(dev, "Error getting brightness_hw_changed kn\n");
-		device_remove_file(dev, &dev_attr_brightness_hw_changed);
-		return -ENXIO;
-	}
+	if (attr =3D=3D &dev_attr_brightness_hw_changed.attr &&
+	    led_cdev->flags & LED_BRIGHT_HW_CHANGED)
+		return attr->mode;
=20
 	return 0;
 }
=20
-static void led_remove_brightness_hw_changed(struct led_classdev *led_cde=
v)
-{
-	sysfs_put(led_cdev->brightness_hw_changed_kn);
-	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
-}
+static const struct attribute_group led_brightness_hw_changed_group =3D {
+	.is_visible_const =3D led_brightness_hw_changed_is_visible,
+	.attrs_const =3D led_brightness_hw_changed_attrs,
+};
+#endif	/* CONFIG_LEDS_BRIGHTNESS_HW_CHANGED */
=20
+static const struct attribute_group *const led_groups[] =3D {
+	&led_group,
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	&led_brightness_hw_changed_group,
+#endif
+#ifdef CONFIG_LEDS_TRIGGERS
+	&led_trigger_group,
+#endif
+	NULL,
+};
+
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_c=
dev, unsigned int brightness)
 {
-	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
-		return;
-
 	led_cdev->brightness_hw_changed =3D brightness;
-	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
+	sysfs_notify(&led_cdev->dev->kobj, NULL, "brightness_hw_changed");
 }
 EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
-#else
-static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
-{
-	return 0;
-}
-static void led_remove_brightness_hw_changed(struct led_classdev *led_cde=
v)
-{
-}
 #endif
=20
 /**
@@ -544,16 +534,6 @@ int led_classdev_register_ext(struct device *parent,
 	if (init_data && init_data->fwnode)
 		device_set_node(led_cdev->dev, init_data->fwnode);
=20
-	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED) {
-		ret =3D led_add_brightness_hw_changed(led_cdev);
-		if (ret) {
-			device_unregister(led_cdev->dev);
-			led_cdev->dev =3D NULL;
-			mutex_unlock(&led_cdev->led_access);
-			return ret;
-		}
-	}
-
 	led_cdev->work_flags =3D 0;
 #ifdef CONFIG_LEDS_TRIGGERS
 	init_rwsem(&led_cdev->trigger_lock);
@@ -626,9 +606,6 @@ void led_classdev_unregister(struct led_classdev *led_=
cdev)
=20
 	flush_work(&led_cdev->set_brightness_work);
=20
-	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
-		led_remove_brightness_hw_changed(led_cdev);
-
 	device_unregister(led_cdev->dev);
=20
 	down_write(&leds_list_lock);
diff --git a/include/linux/leds.h b/include/linux/leds.h
index beaf23993063..6f975078cc14 100644
=2D-- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -21,7 +21,6 @@ struct attribute_group;
 struct device_node;
 struct fwnode_handle;
 struct gpio_desc;
-struct kernfs_node;
 struct led_pattern;
 struct platform_device;
=20
@@ -237,7 +236,6 @@ struct led_classdev {
=20
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 	int			 brightness_hw_changed;
-	struct kernfs_node	*brightness_hw_changed_kn;
 #endif
=20
 #ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
=2D-=20
2.56.0

