Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10E94A7CBC;
	Sun, 18 Oct 2026 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331643; cv=none; b=dG0GuJRKByivzireSBZQJKFVm/jhBtssKkn3HaIej0YjVjkb6Ue1LxJqWIHgtzbuXvQZCikFVeaWuvV4zxFq958raeXO1kytF/SfJ3X5AlVgbop9hpi7fmeBwVPOkvsGMXlcWl8cKPGjtDqeOkIXlo6OfblUvltWss2gT9MkSmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331643; c=relaxed/simple;
	bh=P2A+VgvFAnBMKCYlB3ZpMm1sgAeAk6y1oxEw4kZQhls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFvoFnpDBMSBPBG7mPjw4ZkwUyn9AA5poQ/JY2dJ6mjKnHSnwgOkqY+iXv17IKA/H5vwYsz+PaPrbYGCSGPb0QeyEXHc6WcjfchCy7H2PmwrUfDXkTWGpfarrpFYlprJsnD+1eZLoYCgkJfN82Oj1XjHFoWlCuobqklaQ3h1mqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bfocxc6z; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bfocxc6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331636; x=1792936436; i=w_armin@gmx.de;
	bh=guYy1cWOABx0jEtffhsGs4Hlq3tIDUPPpW0w+Z7EIZ4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bfocxc6zpAdMFwf+MEWevAJpGHF4IZ0MNtoKSuRjAFdfw+KT2sF2Ax6gOHiF53Ud
	 pywvGKGhE0ZqcOSAF6UqZS0ZN4fYRxssEoxEMozHHspqkdMLoSZ8KUYxSPSFkNTDu
	 lSMmhUWNGi7OvbbbbAXcTMiGO5zaPEqcgr5nEF2jlX3BwZb+HeDh2rBek/tpb3grX
	 ABzR+LyRlyzt2hIbyq6IxyRCEOnG3XA0vislJx49SvM7jGRhePxv5BeKayuahSCij
	 BaqRCQjUk8GJv6KUcSO0vqLhs+MK7BnRWcDuTHnXvX7setIZVVGhtw8rrsbWTRB5q
	 +a7psqqAon+2UcLCNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1wxkaH2XG9-00NDbS; Sun, 18
 Oct 2026 15:53:56 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] leds: flash: Constify sysfs attributes
Date: Sun, 18 Oct 2026 15:46:22 +0200
Message-ID: <20261018135339.1109271-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:ssjZB4ujAFjeZYfE+UDUQDHX5jewCcT+rfMgymBCpcQHJj+q3UK
 nXdnxUcgcL+zKSpwW35TuAklZB7UB85qX7KrpXb3lsBE9IjM1wMlx/tuO3zIc0nrPdVip02
 Y1Gaq4FHC/Rfgu2bTD69AKqjfk3ioSptLakcBca19dXhvBi1Olnp04oQyuV85RWI6ZVCPtw
 nVL0qi+mFeKcZQ1+ENqyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jRs1XugpTNg=;t7yTEI/ABlaiqT/6HnijZNi+oMv
 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

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-flash.c | 62 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash=
.c
index 181dfd49c6ad..953265fddb7d 100644
=2D-- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -12,6 +12,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
=20
 #define has_flash_op(fled_cdev, op)				\
 	(fled_cdev && fled_cdev->ops->op)
@@ -34,7 +35,8 @@ static const char * const led_flash_fault_names[] =3D {
 };
=20
 static ssize_t flash_brightness_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+				      const struct device_attribute *attr, const char *buf,
+				      size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -62,8 +64,8 @@ static ssize_t flash_brightness_store(struct device *dev=
,
 	return ret;
 }
=20
-static ssize_t flash_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_brightness_show(struct device *dev, const struct dev=
ice_attribute *attr,
+				     char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -73,20 +75,20 @@ static ssize_t flash_brightness_show(struct device *de=
v,
=20
 	return sprintf(buf, "%u\n", fled_cdev->brightness.val);
 }
-static DEVICE_ATTR_RW(flash_brightness);
+static const DEVICE_ATTR_RW(flash_brightness);
=20
-static ssize_t max_flash_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t max_flash_brightness_show(struct device *dev, const struct=
 device_attribute *attr,
+					 char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sprintf(buf, "%u\n", fled_cdev->brightness.max);
 }
-static DEVICE_ATTR_RO(max_flash_brightness);
+static const DEVICE_ATTR_RO(max_flash_brightness);
=20
-static ssize_t flash_strobe_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t flash_strobe_store(struct device *dev, const struct device=
_attribute *attr,
+				  const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -116,8 +118,7 @@ static ssize_t flash_strobe_store(struct device *dev,
 	return ret;
 }
=20
-static ssize_t flash_strobe_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_strobe_show(struct device *dev, const struct device_=
attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -131,10 +132,10 @@ static ssize_t flash_strobe_show(struct device *dev,
=20
 	return sprintf(buf, "%u\n", state);
 }
-static DEVICE_ATTR_RW(flash_strobe);
+static const DEVICE_ATTR_RW(flash_strobe);
=20
-static ssize_t flash_timeout_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t flash_timeout_store(struct device *dev, const struct devic=
e_attribute *attr,
+				   const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -162,28 +163,27 @@ static ssize_t flash_timeout_store(struct device *de=
v,
 	return ret;
 }
=20
-static ssize_t flash_timeout_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_timeout_show(struct device *dev, const struct device=
_attribute *attr,
+				  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sprintf(buf, "%u\n", fled_cdev->timeout.val);
 }
-static DEVICE_ATTR_RW(flash_timeout);
+static const DEVICE_ATTR_RW(flash_timeout);
=20
-static ssize_t max_flash_timeout_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t max_flash_timeout_show(struct device *dev, const struct de=
vice_attribute *attr,
+				      char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sprintf(buf, "%u\n", fled_cdev->timeout.max);
 }
-static DEVICE_ATTR_RO(max_flash_timeout);
+static const DEVICE_ATTR_RO(max_flash_timeout);
=20
-static ssize_t flash_fault_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_fault_show(struct device *dev, const struct device_a=
ttribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -205,44 +205,44 @@ static ssize_t flash_fault_show(struct device *dev,
 	ret +=3D sysfs_emit_at(buf, ret, "\n");
 	return ret;
 }
-static DEVICE_ATTR_RO(flash_fault);
+static const DEVICE_ATTR_RO(flash_fault);
=20
-static struct attribute *led_flash_strobe_attrs[] =3D {
+static const struct attribute *const led_flash_strobe_attrs[] =3D {
 	&dev_attr_flash_strobe.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_timeout_attrs[] =3D {
+static const struct attribute *const led_flash_timeout_attrs[] =3D {
 	&dev_attr_flash_timeout.attr,
 	&dev_attr_max_flash_timeout.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_brightness_attrs[] =3D {
+static const struct attribute *const led_flash_brightness_attrs[] =3D {
 	&dev_attr_flash_brightness.attr,
 	&dev_attr_max_flash_brightness.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_fault_attrs[] =3D {
+static const struct attribute *const led_flash_fault_attrs[] =3D {
 	&dev_attr_flash_fault.attr,
 	NULL,
 };
=20
 static const struct attribute_group led_flash_strobe_group =3D {
-	.attrs =3D led_flash_strobe_attrs,
+	.attrs_const =3D led_flash_strobe_attrs,
 };
=20
 static const struct attribute_group led_flash_timeout_group =3D {
-	.attrs =3D led_flash_timeout_attrs,
+	.attrs_const =3D led_flash_timeout_attrs,
 };
=20
 static const struct attribute_group led_flash_brightness_group =3D {
-	.attrs =3D led_flash_brightness_attrs,
+	.attrs_const =3D led_flash_brightness_attrs,
 };
=20
 static const struct attribute_group led_flash_fault_group =3D {
-	.attrs =3D led_flash_fault_attrs,
+	.attrs_const =3D led_flash_fault_attrs,
 };
=20
 static void led_flash_resume(struct led_classdev *led_cdev)
=2D-=20
2.56.0

