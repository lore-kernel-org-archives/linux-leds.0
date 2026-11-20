Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209938;
	b=SDKUybulNRQ3qKhlB0ap4/l+5YF5res5lp2unI7YDR8eEwRSx1zCsx47SuSBV4kscVSf
	 tGBPdLxULj7TYFJXFIrpRI9+AUwRQWX69mi6gfvuf2fR3sLQ83hP8mISUpN2t57LkRIye
	 5PtwPeIcRZJDy81LYUqIy0J0mbDpND7owy/HI+GBA8JEa7EFh1l3o3FspXmmda4a5cpSF
	 apzjTYSoyUieU/QFS+AzSiDAVLn9/UpGCBLYxbCmmnvgkXxeWhIMLKPm0YYWw2YsTbg7H
	 IBHcCwm/c+DxirIFGd8ujxBwveuikZbJajqN2QKn0+KmhNWBXdMmkjlOS1Nt+Gp3yKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209938;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=h96/Am5WUJFQAQO/Li9zAJ5u2fQj6qfTyWfOh/1pkms=;
	b=sqanw1yR1Gdr4FAWB5GEJavUhENUvXLFQQgeFUaHus3/gy6TrP+zN+mzhF3FtQORxAw8
	 eih7wiwLdYEvtrApAoalssJMTMgGZ6izXGRUnanuMGJBSqGeYODm3dIbA0ZoGkyLK748j
	 0iwnbDBVLKKi4/tPUF0BpRpz78N4lJ7u2fNm876vNhXUQTmAtPf8xzLWsnLxNijqyEXMf
	 Ef4OtJDN0jWXkZ5PDIbrVZ1RGCgDTU8B/DS+0B3VpQtDCrPpKKn34JNMHYJyIvIZ3SV+n
	 DetzZeVcHfKLXpynxXKEpRHRsMHdpLk9ULc343MJianrGPOS7gT6r7dxlebUzG9TUuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ngCQqhdj;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67681606A682
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67681606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=ngCQqhdj
DKIM2-Signature:  i=1; m=1; t=1795209925;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:JKwZrYWysKElvwkRQuVj5G2nb1iJ
   cbyglC3wwWz9IIHmIACm0coB6r+lH7N4i/EafB2qBWknnA1ULwriY1t574xf/UDBlVA9ZVcsOzG
   V3Rv6RYCQhEfP5z0O2gdXbbcl8fdjWvosTCiuLj3ob5+RG+RsL3rUEshDb2cV3SLLRWgpP1Z+ig
   MsBmPjX699u/CHPEmUztddb4a+iMkrtcMPuJiau6/F3utqMkJq5GE+dG7oKxJ2Sjw8HRkQKaWDq
   lASQdhZx4dyuG803sH6kZS525WkJYcgw62r68y/IrY2iv13C2x3PJQ3Mxn72IiwVwdCMMaVF8JX
   J0iZ0vlVH7kLAw==;
Message-Instance:  m=1;
 h=sha256:
   Wjr2Cv8ioKldjJM/2BV+JR6r8qqT3U8ZOfvOmRJur1c=:
   pIvk64Ha1Fbepj1z0Co5015PNmoK+39D1Mj47Jd2n1c=,
  sha512:
   rKc5aVSN1289pX85AGKijn8PsCRj4weeET2S01CLac6nu/azBUKBqlKT0q0BJIyhL+TvW2UUDb5+W4fdHLrHag==:
   30DUflmo8gFt8XnXfDvpJA4/txxVoKdo6rQSqPCSb2FlcVdlVX43AFBKWZqNjaKZa0uh4n8TeQvVvyojUuqiVg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209883; x=1795814683; i=w_armin@gmx.de;
	bh=h96/Am5WUJFQAQO/Li9zAJ5u2fQj6qfTyWfOh/1pkms=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ngCQqhdjy3/W7KASx9YCX90pLpdTiAHIJV9QYDmjP2u/AYydKcVSCKKtQqOFNIul
	 R0bjaMJ/RVUHB6jXGXLXV2aGw6QN52EnCe8uWi3w+QVfws++fSiQgmv39Rh8eGP+E
	 6NBqICs13+QczWyFPR3RlVbImVTPwZyjiM1+58nFFTMGnlmkiSloaMepNF9Z+mAb9
	 qktTBBDaiEvl42xeKsKCVKBuBasGM7zjxtLLAFyUiUh6vuf/GU2URNbU2zLUnGEA7
	 ktefdmEV9vmeblZ+cooc5SdG13HbqKCfNwE7ClMncd7VyZxpPIyQsBlMkVZx4iAM8
	 mmE0PFLuoBGd1sbNXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpap-1yGSdo2JpP-00ko6B; Fri, 20
 Nov 2026 22:24:43 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 04/11] leds: class: Create "brightness_hw_changed" attribute atomically
Date: Fri, 20 Nov 2026 22:22:21 +0100
Message-ID: <20261120212431.152081-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:iiFmob/MUCbxHSI2HLXEz/87X43L1E4/pPX7Y1XLLEs/UqBKQq9
 0riWzgLTwLwAxEk5qri5gpRJqYxoSvQj0KE2Ir6vqxyyEoRaXHeACLPZG1DwFGZDB1hRYv8
 pkegmJu3SPikHjE+2jjgiUNWdc/6QuMDFYEaoVy1qeY2MaMRzj084N/GhEY0qnW3TJSvlHL
 tpwssfzWCjfzTh4mc0P3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:rvy59sj8hCY=;bndZbuEh1HYLbc7Lyu0p59b+F9g
 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
 44IhVW9Rw==

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

