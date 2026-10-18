Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3369F4C2270;
	Sun, 18 Oct 2026 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331643; cv=none; b=hAbxtGDsKD/OLp7dJd8hOwwYPgtQ8Ta7+Jv0563hxLyIo8isD1vTzTrPJZMwmlddEArhaOHNk78rSUQcYCHpgdNNA3sl+8N1ZE59QRF5aZPlvzt3mmEOxhG16HdcB2swvlEpM4b6C8+O+aeuJY22r6f9TiwZ1ryf4cyQMHODUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331643; c=relaxed/simple;
	bh=/EgPh2xlLUdF2jTbschipXZTirJKVwcCuqcH1ZMImg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BD20RkQfcyCOjM8QEV1DAJfEuChFMTISkG0aHLz1K6V6PmIa9Wor+0BmY1k7m1fgNGVmyDLVEiCOs9VNGOzVJ0ku1JvsfJ98HYxM2GFOHfs2TqvsAIRKD6mbMKL/uYKAr+flkfz/sbvXDUWmCGdXoN+KzYfuZoR2wu2D+n9D7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=JFKuaUmP; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="JFKuaUmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331636; x=1792936436; i=w_armin@gmx.de;
	bh=/5hA3yvNNGHDKVHq00OWPOMmBydQ4/QBqIGO6FdZYNQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JFKuaUmP3NLXle8AQdNPqHN7VQpRpVHOeeBhyYE42ohjoiiSwaSV3HGPP2OO2oOn
	 qNvleaH10Hn56jTj4EHryg8C2PzhZ4dklkccthLGnlZwFwCRIAbWsnYQufEGo14Nf
	 9hyXJJ8ZbtDvckbTrU5x9IprSxh7TFKYKuXP+qFEhitFeKgQ9e7D2mxeZHpUJPcD/
	 K6YzZadunLuN4ACE+WMAon0XzMo9tZmc/oQbF3oLCaajEesUCBzbaQ40wm7XEfQ0m
	 XqNh5Z3yC1+uOsGa6YXCfOeoCvhNUdz4o8yb5BV9B0ge/Nx1E5zoPTG7l14ltPuLa
	 7+/ED1/uPVyDi7leAA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1xTSsl47Xk-00956G; Sun, 18
 Oct 2026 15:53:56 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] leds: multicolor: Constify sysfs attributes
Date: Sun, 18 Oct 2026 15:46:21 +0200
Message-ID: <20261018135339.1109271-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:BqJCcValY+DNo7denxeIvuVkPvygy/lcHe9V5Rb81SPiQ6v5QAp
 o7h1qhAiHnpYIx4mm7yVm2JrJ6nrbO+JAReIywV1U3RIPlHW5BUXnr/IFmSndLKfbXV0I+v
 AwGE0svOZVSVZ6gideF+513EOWPzycKqIgcH8T5Ai1eYzHa7wKbgmvosmuQpnllVY6QdFRl
 a5yEaOlzH1s3lujkSWaMQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:e0SCR8NYl90=;jTf2LNUte8nbt8PvW09MH569Ry4
 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

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-multicolor.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 59d46f8a90d5..57df0b2e785b 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/uaccess.h>
=20
 static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
@@ -47,7 +48,7 @@ int led_mc_calc_color_components(struct led_classdev_mc =
*mcled_cdev,
 EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
=20
 static ssize_t multi_max_intensity_show(struct device *dev,
-					struct device_attribute *intensity_attr, char *buf)
+					const struct device_attribute *intensity_attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -64,11 +65,11 @@ static ssize_t multi_max_intensity_show(struct device =
*dev,
 	buf[len++] =3D '\n';
 	return len;
 }
-static DEVICE_ATTR_RO(multi_max_intensity);
+static const DEVICE_ATTR_RO(multi_max_intensity);
=20
 static ssize_t multi_intensity_store(struct device *dev,
-				struct device_attribute *intensity_attr,
-				const char *buf, size_t size)
+				     const struct device_attribute *intensity_attr, const char *buf,
+				     size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -110,8 +111,7 @@ static ssize_t multi_intensity_store(struct device *de=
v,
 }
=20
 static ssize_t multi_intensity_show(struct device *dev,
-			      struct device_attribute *intensity_attr,
-			      char *buf)
+				    const struct device_attribute *intensity_attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -128,11 +128,10 @@ static ssize_t multi_intensity_show(struct device *d=
ev,
 	buf[len++] =3D '\n';
 	return len;
 }
-static DEVICE_ATTR_RW(multi_intensity);
+static const DEVICE_ATTR_RW(multi_intensity);
=20
 static ssize_t multi_index_show(struct device *dev,
-			      struct device_attribute *multi_index_attr,
-			      char *buf)
+				const struct device_attribute *multi_index_attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -150,9 +149,9 @@ static ssize_t multi_index_show(struct device *dev,
 	buf[len++] =3D '\n';
 	return len;
 }
-static DEVICE_ATTR_RO(multi_index);
+static const DEVICE_ATTR_RO(multi_index);
=20
-static struct attribute *led_multicolor_attrs[] =3D {
+static const struct attribute *const led_multicolor_attrs[] =3D {
 	&dev_attr_multi_max_intensity.attr,
 	&dev_attr_multi_intensity.attr,
 	&dev_attr_multi_index.attr,
=2D-=20
2.56.0

