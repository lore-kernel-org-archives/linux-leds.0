Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209918;
	b=whB2iDC2csAb4JSe/ZfRu3BPbQPvxMZpchxcbrIO3wW/k0A4o2VzkjaPKZo7/XUMkW0R
	 urmydgzcEvD2zedqeLXd49V059UqAXM/2LLCQ/8ya2nAvv+4H7qsTXNWtKCQAB3t4pssN
	 nxj3RpmTnqQ/Lhrakfu4jUkL+bqIjzGJjI7H1L6alMKugVBeRQSpLz85gjxM5UF/eUcxN
	 6zfMz5pfJYIsudoEgYnyTt/soGUcIlpdPX98KOH4AAtPt8lZXyP+XNeedGCICXrcoyfS5
	 2yin7zFiLZlbMjJx2duMKurwrTU1Ngbit2iWLBEbJDtVC6GdXADsPxK6u7Z0ufj7S1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209918;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=k1nBndbW22YMkJHHZm3xtGIO8r40wOlreGeONqq6zf0=;
	b=QPosEk3+OV5XYD+91I8Uirg3gN1jumSICZNOzz1Lssya74WlPy91IBVHN9wPKy4DSRAV
	 8ws5qLHjrHIvGZHRlLRvrrXybpF6G5LhtnArk/vAn3YM9OuwC4Ll8e1dQaUJaOeUWYpFH
	 lOVLVEllleKDl8G4j9f+TmDTD378djXNrvAMaEmzI4hA71OKJuxLMkliwnOHdqM9l/5s+
	 00fSrGsfIV/wd010pddBY5PjrdZ0e8dcTgkNwOGasP/iWg8yG/jRmSwWG8vXbv5oKUOan
	 d5t0cZRRxdCEQFtEsbXMSDGruVA7HLHXchDySjWJyhp0H4Mq2pF02LVLUR/+vaZiAUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Jsbvs94F;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8094606A334
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8094606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Jsbvs94F
DKIM2-Signature:  i=1; m=1; t=1795209914;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Jl6eduGBv4W7J5MO91CyzTWNPYj3
   f8gwkBs+fEy18pM3bdDfDjxS3DOlFk5w+OIhZU7zM40cAD/Mt5tn1kPELoee7EFvaMwo8uCrsn9
   zV5U7STv94h7BBN7any9TJ6RWZ27JH/DJgVPVSZN4wG99vEbWfI03q5dd9ZOyJe+CuqinbPBxab
   v7jqtxuan503OUPimZTjNlNXxLWvMT2Wvx1j0c96wKc8od95cjFxf8TUboWDoTyDlgwnmG9ppiy
   /ZfA2fecppdak5ikfJTtCyx4T5EeQ68FDymDrBj8xGPpuo4er5wNS6bElsVx8Q23r2jTSM0S1pc
   mHWL+kt5lAXe6A==;
Message-Instance:  m=1;
 h=sha256:
   /XKK45WWHOOmAdiUqQgDuGnMhRXdEV/DDa+UG6ze2Sk=:
   Px2KMsSlsWTZC/+TZKCuKADgqT++Mq1wOkGwN8yWYwg=,
  sha512:
   5vQL0SETAK2etSDWqRj2wKcN4IoswBTWUpt8e+xQcm4iv2ENfLldLSbrn5rNL3VqMyJCn7yO7FeiHeKj8y4kLg==:
   U7KYTEzgSDS8VbegSYkXABcHIHxCX57cSWOZgIOz10GnkY0d7YCr/WzAUw0Ef/H4AokQtc8i4DbGOUPUEFOQVQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209880; x=1795814680; i=w_armin@gmx.de;
	bh=k1nBndbW22YMkJHHZm3xtGIO8r40wOlreGeONqq6zf0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Jsbvs94FiIfGusBHFhArx5fP9mq97CWyNY6M7DWNzlQwzDSE/Y6IaZof//yNwTkm
	 A0mBcVKRbfpVVk9sY8sdiFy2JFlwlzhL7XLDj+7KG1OqB71cmWShkPDGoQb2i2Zkg
	 Nw+S3eKcC0Di/Wi6j9vMM4dPnpMNvtI7id8Ass44TvtnZgZnWs43SrQIZNjcaLWOd
	 Vqzyx91CcQq5OTrKbjD+LJSiy2o592FJ9DSOj0qyLzxVF6r/mWge9sriZd2q+V2xb
	 EgTsEXPsIeRw11W4Ovi5+sxrXInv2rFddyv3yoZqEMBuLV1WECnWtpdll1G9efUHf
	 jbWc/2GSC5rqboMYcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wpt-1yWTcs2Plp-00wWgM; Fri, 20
 Nov 2026 22:24:39 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 02/11] leds: multicolor: Constify sysfs attributes
Date: Fri, 20 Nov 2026 22:22:19 +0100
Message-ID: <20261120212431.152081-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:cPzgk3x1UOP5Xqo8D5Xj+9qxq0p7d6a5aoJGp+Db3PMN4ZXkndb
 hnelIiXGJWxbNQ/rzhWbqovlZh+ijDPmkgbvqw2KhN3G5P8wdhaUIPLNhUVK8o0rYtSd929
 sCabLOH5jBqgxT5m1uvcAQQl17tTWCtkgt0c1C2CjgDKO16twAzJR/YI//5tbygIcB2xUoT
 2tfdPmozy9gsV7qVNCRlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VxhUrSQEjZw=;OzkQWBbUsKqcy/5b+/bGGD+v6jK
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
2.56.1

