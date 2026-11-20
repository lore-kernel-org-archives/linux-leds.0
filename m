Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207397;
	b=m5LAjfwuLg+/iZPt7dptupFGQ2v8TpdGPRdkPNgxs7Oe1v7ePSxB5b8E8Lr6EytkkXT8
	 IfX84zY9kt7Hor25tR4iGjbSBBhxkVkmw45I+SvzSp+yqaAABlqSw6nKuqTyk04Kknq0B
	 0Qr+3Q40wFlS4XgsKhmvT7ecMDqqYhlRnK7W1JtZAiQyjIPMFeJSIl3SbxRIHI0P8owWy
	 USBV9/fFBvdqVrW1QbGNcp9dcp/UEEu48Bvqam8FiXEhoFlS8It0DDPtrfoOaVpIhKurX
	 gaq2Zkjy9NUBQE5O0yGEXwF/J6LNgtJ4njCUuGsyRfg4Lnzt7pToEs8eTqZ5VHKKhcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207397;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=h96/Am5WUJFQAQO/Li9zAJ5u2fQj6qfTyWfOh/1pkms=;
	b=eEcmvTe2BbnTwWdWNVbCngWykTJV6GWt6lE+ulYr/dPiuD9BIZvIgIMcHrBmatlcPZkT
	 LvIEUAAOeNg2wIsKPZ99X6BC4TqPh4YWHaoSA/XzraZArbgh1Pr0rpXzt/ItMLd4xmeD+
	 srggYuBSFL33FxT5Z3F7UscaYnAKI5+1gmHtqv+oupqCUVvmUZP4cPMW4HzPXj+OBfCCf
	 ciTNQX3Mh+9WjP4QhqlP7/Izd4DFznHVCVQ+YIitzZkeYZimvsortUtD9J/nBlK/X1kk9
	 mE8MFf6OsraE7IEDJKnBwwfkRUIza2mXHtXCt3Qc5fz2mPqalIDBG4saxoRPjx5PCmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WKJZK64g;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655FE606A6CE
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655FE606A6CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WKJZK64g
DKIM2-Signature:  i=1; m=1; t=1795207391;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:iOzQQ5g2FpNyboqvi2iqSTeIBj9p
   o/m40CTZVA+12MO/HOh8q15FECDJ/7xd/aKs1+3c22/dSIMKzjg8tty9uzp4H0pM43pfFea1qbF
   cgqlOBhlMrIxmAMR2YonouB6T3Z0fZpGJ/lVJWNCbc/sqyZgxODtTZuq2CB/DSxOzIw5i/0D5XO
   kr9j2CsUpiKuygtu9iMLGu5Y+UwhvQz0cU7oY8sIKidzDzUy/YxsfbNkW7wWFgSgh3tZ8yX4gK8
   ZqjcytRkEuEuIJxgMyPbYwPzsVna/1NsBuk024Co9b1JZcklMRwAUGTqP9D9Q//7y/77gNhUFy5
   TXIP1YOyabfHnA==;
Message-Instance:  m=1;
 h=sha256:
   aqrvSOhjChWWEbSDrE/oYgsqW61lW6vfJl19hkbC4uU=:
   pIvk64Ha1Fbepj1z0Co5015PNmoK+39D1Mj47Jd2n1c=,
  sha512:
   4EqE0BPrRTy/snf22FR4WkXjJ2lmIJbTUJT2atFm7pC8/edwImgRnYRt+gKP+nH3+IxwFymtwWw11KjdYb+Ybw==:
   30DUflmo8gFt8XnXfDvpJA4/txxVoKdo6rQSqPCSb2FlcVdlVX43AFBKWZqNjaKZa0uh4n8TeQvVvyojUuqiVg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207383; x=1795812183; i=w_armin@gmx.de;
	bh=h96/Am5WUJFQAQO/Li9zAJ5u2fQj6qfTyWfOh/1pkms=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WKJZK64gK67aT61zwoyVNh+W7E1JHW6g67zcwVQnNa8Tb11MJH1uajRlWox3cYnh
	 DJmX1JIHIelAZelhRgZJUs4oqAyDzcoY1ZrRtdjNq1f0n46vK+F9GkhQL6iQTu2P0
	 MUJM81zA1bsk/CH3cNvlQdQp6tg3jrpZeTO5552HIbSlllB/Iq8xG2wAX+Uq+Qrb4
	 88Lm7wsjDdQOIh5iisC4NnTkAMs6L6nvBtCucTWEllRRz8AECLTAtDHYo/HJxaSa5
	 6xJRo4r2mEXdgWCeFmRXFp7ZZAQQoO5xQnBL3oslRhrA0fOKG8JFHT5sfnFS5X5yh
	 hyxazMSrHkVQTAJTNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtwUw-1yOXud0TUK-00xI6B; Fri, 20
 Nov 2026 21:43:03 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 04/10] leds: class: Create "brightness_hw_changed" attribute atomically
Date: Fri, 20 Nov 2026 21:35:16 +0100
Message-ID: <20261120204246.6645-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:06c4oXkXjBnOnQO9OnwHai9ZJG73SROgSHepuKqakrwSPSKUm3g
 8XBr1VgKPDTMFJw6RPU5H/cInpkcsBXrHV3kOFtffq67h5kNizmNCJU0Py4ofrWgpGdKlJh
 qZRGNDRAkGLn6l94feeWFEniOI0gjf8nX/j3/JDRaPwEYw3RUp3wkw25KLgN2W1FcYm1ytH
 S7wPgYNxdMH7hJ6NMs9NQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QmVTWnrFaEA=;9wv9KaKTNknkEXJFdQU3AIkWHKv
 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

Using device_create_file() might cause userspace applications
listening for uevents to inspect a new LED device before the kernel
has registered all sysfs attributes for it. This might cause those
applications to incorrectly assume that the new LED device does not
support the "brightness_hw_changed" attribute.

Fix this by letting the device core create the sysfs attribute before
the uevent is being send to userspace.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 58 ++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 135905dba47e..00532437cc45 100644
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
@@ -123,22 +116,48 @@ static ssize_t brightness_hw_changed_show(struct dev=
ice *dev, const struct devic
=20
 static const DEVICE_ATTR_RO(brightness_hw_changed);
=20
-static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
+static const struct attribute *const led_brightness_hw_changed_attrs[] =
=3D {
+	&dev_attr_brightness_hw_changed.attr,
+	NULL,
+};
+
+static umode_t led_brightness_hw_changed_is_visible(struct kobject *kobj,
+						    const struct attribute *attr, int n)
 {
-	struct device *dev =3D led_cdev->dev;
-	int ret;
+	struct device *dev =3D kobj_to_dev(kobj);
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
=20
-	ret =3D device_create_file(dev, &dev_attr_brightness_hw_changed);
-	if (ret) {
-		dev_err(dev, "Error creating brightness_hw_changed\n");
-		return ret;
-	}
+	if (attr =3D=3D &dev_attr_brightness_hw_changed.attr &&
+	    led_cdev->flags & LED_BRIGHT_HW_CHANGED)
+		return attr->mode;
+
+	return 0;
+}
=20
+static const struct attribute_group led_brightness_hw_changed_group =3D {
+	.is_visible_const =3D led_brightness_hw_changed_is_visible,
+	.attrs_const =3D led_brightness_hw_changed_attrs,
+};
+#endif	/* CONFIG_LEDS_BRIGHTNESS_HW_CHANGED */
+
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
+static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
+{
 	led_cdev->brightness_hw_changed_kn =3D
-		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
+		sysfs_get_dirent(led_cdev->dev->kobj.sd, "brightness_hw_changed");
 	if (!led_cdev->brightness_hw_changed_kn) {
-		dev_err(dev, "Error getting brightness_hw_changed kn\n");
-		device_remove_file(dev, &dev_attr_brightness_hw_changed);
+		dev_err(led_cdev->dev, "Error getting brightness_hw_changed kn\n");
 		return -ENXIO;
 	}
=20
@@ -148,7 +167,6 @@ static int led_add_brightness_hw_changed(struct led_cl=
assdev *led_cdev)
 static void led_remove_brightness_hw_changed(struct led_classdev *led_cde=
v)
 {
 	sysfs_put(led_cdev->brightness_hw_changed_kn);
-	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
 }
=20
 void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_c=
dev, unsigned int brightness)
=2D-=20
2.56.1

