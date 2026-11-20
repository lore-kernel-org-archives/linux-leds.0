Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207389;
	b=v8vs0vIwVdGUPL/YbmGwIMj2+c+nVNzDufroi9ur1hMULC+qeqgDYobwgBX3nxE6gCvl
	 hhZ76Um14MsFXJSfaE0CQee9rDnVZM42Fr3KMrlyV6A7wz1IBEYRl4wsUXNMuxXkS1Ru8
	 xMeANf1hB89ZKn3QG4IuBwjh/XJgSX2dGrMUcvUNcbxsAYROBsUiwuoM2MbUvVd+OedsU
	 yQ8qoZs0YJ5KL/G/R61ireRBjTbyaJPUbe3PiBXUcyIUruf4eRq/9iFYZzrIAFun8xLBd
	 vzJkl+SnDETSZOByspJ2DgYsmu9apOIsp3ZNRUA+AXrVXRCv+Dacgfatem7xSyRv16w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207389;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=k1nBndbW22YMkJHHZm3xtGIO8r40wOlreGeONqq6zf0=;
	b=cEaV2WqbzqSlMdc3ejEwyh1mVd7l/Q84NRSNzzmleVEtD8cn+wGdMBTEX7cJZWVEh0T4
	 F0dmnjKF5u6YMrCTbDJvRNnVhhyO2bIEc4LzdNUuFgNCQTrE9pgr87rRdwRhv74P4RA3w
	 V9EmyDbkiJHEyJq+qVfDR0lvD7EnY4Dq4TjnG4L8GOy9LAHckp+BpL5p1ks3RGb9LsVei
	 9VyZMYfjbWBbqMeyzWlZSCezHJgPvU1qBZGSvvIz0j7NupE453uH2rDsbmvSJRh1PiCwA
	 lwh9zs2TkIvoq46zN1qMiP1CudFKCtO9ZtNSk2NhdxCvnrJ7G19t81F9SmRkPPnB77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=k7UNI1kr;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01645607730C
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01645607730C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=k7UNI1kr
DKIM2-Signature:  i=1; m=1; t=1795207387;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:WhtWz1TzsHIuBdjuwf+7+lW5WGHY
   GVe8PqVAkAOSVeT+y++tHYzEKSjzcB56VjEYZnjc39PaINCmYNydqOKNJ2p9bRLSspbQknGpCDl
   XwneKbvT69jUEoZLnWNoI4UI7ydZzKyedod8YQo2+z+pzGHsc2aDBGwGfQNskH2+ZJ4blsmDHfg
   tNEY7gcp9CWATuFohoONPLSoGpQ7oISiPDLCrh2y4ZAzEbBIHF1ys/Et55/3guMULi24jDym8ui
   BSPBqTNamVaUcEAs3vAWaqqWxIlDDQ2qKn5csQseQEW/1hROwIfNU1mU0W2rsCAdpvLJ5zVbUMF
   RN1rKu6tTnbcvw==;
Message-Instance:  m=1;
 h=sha256:
   xR3AElkhbrgGzIi3O8OKB6UpJFp8lxYXOp+Jvxtshss=:
   Px2KMsSlsWTZC/+TZKCuKADgqT++Mq1wOkGwN8yWYwg=,
  sha512:
   eVE3zEQe+t4Y9zJpNNKtkgus95bPx5g/wR9a8uASOzPUGPL+oUnPLse5QIQrErCpAqBZ+UXk4/OHClWqVaE6NQ==:
   U7KYTEzgSDS8VbegSYkXABcHIHxCX57cSWOZgIOz10GnkY0d7YCr/WzAUw0Ef/H4AokQtc8i4DbGOUPUEFOQVQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207381; x=1795812181; i=w_armin@gmx.de;
	bh=k1nBndbW22YMkJHHZm3xtGIO8r40wOlreGeONqq6zf0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=k7UNI1kr0xdOAx7WPdetezdUc+ibM9s9EfjwXmu6OTd8xXtcZXWWSPgkbVY+Sb6k
	 R6H15SUpFKr3/PbWQwQwtQGb/+hUsvPW8IJVgyPCVAOWQtpadCQojVbeMliK5hslg
	 zIEUPZ0UQVs8f1uklDsfKg5Z5HjwAh6QrujiUuJSgOulOF31Ey1ZE+BmXIFoN3rdw
	 5qf1mj5fzzCDoOByWYUHcjhibNRqsSBgwK8uPsMX20RyxMsUzSMyiCGH5kvjZIWq8
	 cgDTlAyNPqFKPjjToNmHNX/kJw/Zo7/RtR+mkcSEfXEBDepcGZYuMM4pbQMb+8OWx
	 gp9WI+QGrAMfY0+82Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7QxL-1ybyBM0hcT-010679; Fri, 20
 Nov 2026 21:43:01 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 02/10] leds: multicolor: Constify sysfs attributes
Date: Fri, 20 Nov 2026 21:35:14 +0100
Message-ID: <20261120204246.6645-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:5tuCyI5BydwC1kUSXaS2ga88517A/HZ0r09Fv918zFOmV0CNtXH
 g6uvsK9E6zeSfdc8yT6Y0rAKARx0L9/5ZVj7D/zOPgHglnKEHEhv2jBxLt1n9jJMJQ1jXzl
 8Q4DAcgciiSNBzTDaO1O8YZi+OifVNo0HXHn4QEk2cC6OVWAXWZD4wBPoJhH/NHpEKRYsYz
 3qKtjbGWsSPD5FC82CigA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UNUgrqFzVeI=;WCQwy71wAwXXDvw4riglphHnVCY
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

