Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207401;
	b=LP3vvYlnqqOt1gn/E6oylPEWxdreokjegcuZdK2tCIP6tpG/06WnsCOLkt24wBH99Dhn
	 hUubBT2DIbuWFGyzLPvOodP2d4P+iR+axFqxB3fsp+vYYV7yCSeWSDVcPxQ+afTZqK2CJ
	 mdBuDWdYNBq/6i0RB3K6/NcZpSj990/n/ApnqKH8t7We9elFLBFOefFcjVNC2/fKPBNvu
	 tM9e6RZ80O7mwbWmCnEHKGvsoMKdx6zw4ZmUbOVoSU8uNGi/oaq8iuWTkVEDEcWOCn5c9
	 OQdl7LjRcMixy0Puh5Yw4cJ1QVtgVWj9xPEsHU8F3wf5mLl6G81vPZa44AmkGaGHe1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207401;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=/JpHNIopQS3bT7Pb+e9AXJagd6f44ibcj9PBm0s68jQ=;
	b=DhWuziT5UtDyZoWXbdTB5YUYdmtjN3uF7WE7ca/BH3Lx7Qdt/gGnANd4KJGAqj8uNrUU
	 7rW5mfHTh6HGsmyGY0eRvI5cjCUC2IZPx9p6NA6FAraSwyAq2QJa6xZd9n8Q32Xr1Z2pi
	 +LYaKPh44LTHM8aFSV/TG8K1XxwNd1QD9S+/Eulaadrrjqdu4bthmrO9fzv5OCG+X6CyG
	 Z/w6ofScg8goZxIvGQLTmcyL4ZKx0As2l3IzkWqu55ZF/8nxEhG1crvX4+JcuRl2PgsSa
	 NEIYYaUfnnNQlUh9X4UVRoysEdgFHPoJViqDk88AWOzAnM9oDjPG7DyPCGKQFBzQq+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=cs4jzkJj;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45547607440B
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45547607440B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=cs4jzkJj
DKIM2-Signature:  i=1; m=1; t=1795207397;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:tks8ZdAPawxJ+bvMHUHfwNRXOnET
   JZAgyimP+X+InA1ltheg8OW6FjFCH0iRk8XHfqTJ3jFRrzACRmgrmPwyLHTtsYrrTVnAaHq/VNF
   kcooCOns1XzFsfy9e1nbZrNRX0OrhS5yGe/unwBDn0u9WZGvBvoO+BlSI0G94pZO5Wrh/qsLGKj
   xCamCCaUhPD37nBYa7nw7vqcb+L6H0FKOHFP393g9SxFj2isM2X8Fj7ZY2YgcqEeQN0KsEDZzg3
   F/mp+Zr26FhUok0KVR/A3I+9ScJKG4XfeYFWA4kcF7RV6f5YfFERSuYqP42kDO17oiSFP+F4Tv+
   eMK//Uwjb09kCA==;
Message-Instance:  m=1;
 h=sha256:
   p38gneHZxvH3QfJW/mgwuUssTUdl5wOgXKZJ8Imme5k=:
   SZ6/gs9Gmr6oxSfI1EOGFhxpNlXErdplg7z+xtp7f9k=,
  sha512:
   vBu601XfnNazTKCINQCZ2uHLoHmqxnMtFzeecQp8lp8mG+pWq8GiXAMYwSlGicnvWNDVYZlgEHKLns9aMN51ew==:
   SWrj8WjrdwoYg6Tjjw5cLfySRQNCNkn0W1KWEEGHbYrgSMs4HKUEnZSm240fI0GZTGpx1fB8W1IhOmdN7jvH2g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207389; x=1795812189; i=w_armin@gmx.de;
	bh=/JpHNIopQS3bT7Pb+e9AXJagd6f44ibcj9PBm0s68jQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cs4jzkJjnxXKaN0stW75/0LNl7fK+j9gDmopOdFJN3HSKElpf7RP0kPqRnE5flLA
	 2d8QkTIk7gw0RUpe9nNCC1GBFKtGdXwNBzqdLcViHgRf5z5y0BlBLQmZs1a7SQIXn
	 swYbg09/HaXnBeyFIOjp1A21zfpa93VPGEx++T1ZTsgHKqW+mVZZtWsxJQIYCnzU8
	 bMLQZnv3kkclmZdQLCdcmtVRrP1bho8SXP+2yTlJmhg07nWL5FqDsMwFEbpIf74rR
	 sMcBIr/MDAYSsIXNbTwGvZ49UUN8r1HjNlO74N6hq14MLg7TpNpJJHkPMmDQchLzf
	 Qq///X5uVVOSK5mFOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOREi-1xuQ9T0diQ-00IGxC; Fri, 20
 Nov 2026 21:43:09 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 10/10] leds: multicolor: Adjust maximum subled intensity during initialization
Date: Fri, 20 Nov 2026 21:35:22 +0100
Message-ID: <20261120204246.6645-11-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:tj0ZKz+SH9esUzBXk1OwiCsfzJgVj6uOWYXQ/Lq1jGi6IoWbg6P
 aJgwmzTAOY/td5SXfzDjH5XMdwCIcgu5ZaumSMMxZE20ciEqNeHVs3e0CtoPvI2OYNAXgqk
 LdOgoFCnKiPNMTt/fZGwGX9oFg2bHSec1/Mxls58l1CgRehaqo/3VmAF8FUL2S5KU287FS/
 LpNOyNeSOsAZ+t4ptzqaA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:haQVKTYwKow=;6l579D+PfVpNUt8pHFz+Np/ocnA
 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
 5Fle5r48UXOiLnKlKwvTrGKaCnMg==

The maximum brightness of a LED device is fixed after having called
led_classdev_init(), so performing the adjustment during runtime is
no longer necessary.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-multicolor.c | 40 ++++++++++++-----------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 0656ca2361b3..09c52bc1a55a 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -14,24 +14,6 @@
 #include <linux/uaccess.h>
 #include "leds.h"
=20
-static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
-{
-	unsigned int max_intensity;
-
-	/*
-	 * The maximum global brightness value might still be changed by
-	 * led_classdev_register_ext() using devicetree properties. This
-	 * prevents us from changing subled_info[X].max_intensity when
-	 * registering a multicolor LED class device, so we have to do
-	 * this during runtime.
-	 */
-	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
-	if (max_intensity)
-		return max_intensity;
-
-	return mcled_cdev->led_cdev.max_brightness;
-}
-
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness)
 {
@@ -53,12 +35,10 @@ static ssize_t multi_max_intensity_show(struct device =
*dev,
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
-	unsigned int max_intensity;
 	int len =3D 0;
=20
-	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
-		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
-		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		len +=3D sysfs_emit_at(buf, len, "%u", mcled_cdev->subled_info[i].max_i=
ntensity);
 		if (i < mcled_cdev->num_colors - 1)
 			len +=3D sprintf(buf + len, " ");
 	}
@@ -98,8 +78,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 		goto err_out;
 	}
=20
-	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
-		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
 		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_in=
tensity);
 	}
=20
@@ -187,6 +167,18 @@ int led_classdev_multicolor_register_ext(struct devic=
e *parent,
 	if (ret < 0)
 		return ret;
=20
+	/*
+	 * The maximum global brightness value might have been changed by
+	 * led_classdev_init() using devicetree properties. Because of this
+	 * we can only adjust subled_info[X].max_intensity after said function
+	 * was called.
+	 */
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++)
+	{
+		if (!mcled_cdev->subled_info[i].max_intensity)
+			mcled_cdev->subled_info[i].max_intensity =3D led_cdev->max_brightness;
+	}
+
 	led_cdev->dev->type =3D &led_multicolor_device_type;
=20
 	return led_classdev_add(led_cdev, init_data);
=2D-=20
2.56.1

