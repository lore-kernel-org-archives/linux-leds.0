Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207403;
	b=L6NbpneI21Z302pSnwazKTnZuE13bVu4wEJ5EcYYoBnQ9vnJdLADMBOIjl69PaF04YrU
	 XS4c9wd+l2nAvMNlhJmy5HcPa87JwTn6/G2Qd4V0ONpJZI0i/OA6RsPRHf8jnsulkX9tY
	 LzZsDrkPfpAVclGFTmH2DduDJTDOp25LUNEEyoVNqjbZrsuY7Q8kCU0nk0J/McG3r82iX
	 s08/ptK+Ib8qU6OHmBM5Ak4Ps7T9RyzmmprebVuWoDI2XMsehEhVrEYmj7Hc50bKNWo7b
	 +GYyVg6ie6REwGtrcH4WndX8V/C8SUTKtgM6aSY0O5SGw1K49LiafBc7tJ+mChibBtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207403;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Orog7m6TOQKEyMMEMq5a9QTXkEyeDSNBXEAS54S/OTY=;
	b=obhwwam7RZSDUVk24O1xnmNatIOFp8h594CivHTmJ44GvufwPUHmDdKM2I8X7/nbpdLw
	 HRHqzyWU9A9I43jQ2PcOwzmEoW7vQVpMukMI+BfACDTghze/zlJqo79L8LP4mnJ8aAzTt
	 G8xQ9tm/dvBofn6sIaoN466rPZh9hEFbf0lkvdqg8PqHBCF5soDtj2q5jeT00vW+pGkLn
	 Nc5IEd2APBRWX4sYIFXldhEsebNIVYSjaF9KPiL8ECp/57aL/gLQpoTf8RMpia2NtDUUe
	 /tzG7Bk++uyIRRbUqx63OetzaRVjGSKc8TQRX7h8jIWS6o4y28pJ2ASoNV+bkUhlKpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Eh46xNzg;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA79607730C
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA79607730C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Eh46xNzg
DKIM2-Signature:  i=1; m=1; t=1795207399;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:nWAhFStgi2344KBLmRLHA3dG/ylI
   Eq1cgd+KYqRAHhxza4W9sMoQylk3gv23+Am6kQCfMcorFAwdghK0+XLwCPq+sDjoTC5aLsGdIPN
   yZNDjhgmQKHtgva233CWmC6IdWJu4nkgilQWeDecXYEt1AzRvcLKjunGcReENV/3HwUxYS/3mLM
   TNXdiNlG57QL6XxC6RiqCX2iw6B/qEcU1b4a6lIY9ygdk0s7RZUrmwPg7oPsffI8919ke5iIMXi
   ZP2OsOK9brN5aVWR8cRWB3yl390sRl0RjsTWZhTQjwPGiElnBKTTUCJ6hhYPDuEWJlACyIBQI+1
   ZgJv+NPhyLy6KQ==;
Message-Instance:  m=1;
 h=sha256:
   EU1Eyv2PCjpx+vYDEUeD72+zgEnn/lb+rl3hTp3WQOs=:
   xTGGlCO+n2+p7F2sKqld0/McoACE7MVGxt86pyq1e40=,
  sha512:
   f55zqdBHrocd+EGXdlnkDiVRJZjdPHZnvVkthkM78etIeHh1wpS0ALWocVVeZvrm/HDfY4Pnn3xECjg8M5HCHQ==:
   hAWRNxHdYmLbJtQbTGVt048yHT14aJhqXvHSDWYwIjeRt929cunANWu5Gxk4FKpUS+MyvpuVMn7vExvjrLQEJw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207382; x=1795812182; i=w_armin@gmx.de;
	bh=Orog7m6TOQKEyMMEMq5a9QTXkEyeDSNBXEAS54S/OTY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Eh46xNzgiYk6N9LWB0TweyLND0b0BlDcz/nBLzc1eU0Lt6iOhxLvrydkCdNTRRvf
	 SjkvPMykVVhQFL6riAUrcOhpvGVkLqtweSCIcJvL3SeWDAM2GeHIsy7H73jOQvFwL
	 DOYpFLWiw/p+QpTnj/K6lLB0BmnarmpITe5rRdJrw8IXdh2b7Xhu9lBzf+vvSLQ7i
	 MTRq6O1aQskkjgcf1EY6zvLs47ERUKHUp0+f4yn3+lko9JQTJ/f53FX7rpw8ncEz1
	 6uLcqb6G/vWPDyrk3tFuuvgoO2WdA3XkMz0b2efrm+ye53XD4TA1y1i4y22Kr/OBR
	 APli2Tp8tnyWuIJD9g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1yQihO0MlQ-00v4BD; Fri, 20
 Nov 2026 21:43:02 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 03/10] leds: flash: Constify sysfs attributes
Date: Fri, 20 Nov 2026 21:35:15 +0100
Message-ID: <20261120204246.6645-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:X/Ks92Xk5A0eJQeLfcgyrIXBqDu2Djwf6SbFoQhKQZQSXW1d1FC
 svwJr/pySFbnHNhx2CINTrzuGlfbveKJbeB9hsNpgwFoBEKd7Sw2KbnIwhlJkBpdUYHxp+M
 26637GdJwDNL2lAkvyVrg4QAr6V1QTIAO9xgGIZGjsVVn4uqCMkJya+zgCcWTlFbq/4uurr
 n81v/thQuGEysdE/qhBfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:bxD+vXg3q2g=;NctgoRE6zLcvEuyxf/lRNlk9kTb
 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
 rILGqCPlmXMVYL5

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-flash.c | 62 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash=
.c
index b641788c5a28..33cfc5d082c1 100644
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
 	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.val);
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
 	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.max);
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
 	return sysfs_emit(buf, "%u\n", state);
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
 	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.val);
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
 	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.max);
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
2.56.1

