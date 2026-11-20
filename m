Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209906;
	b=K1LQ4f3INX5tjtT9gMII5W6RqvcNPt0jA7V35rhrKe30Qv4SEGDqK63BdcvV3apcMxKG
	 L7YDMQ3zTHxS8PWMMC3p9h40yF/GLUdU2332ZFfe6mi33GnRrWq+ToHr9kQxIEsQoSYD/
	 PiWiTY22Do7ZO2kW/3DIqueYRVLxek15FgTCKLkdu6INxeAXoI8I0zK3mmFyHwdc64aqF
	 wOQzI3OoK6Kb2qMMGlxn0QYwaerWxXocx5yRzs+rL75uCmVMgV0QRQHCvq9tjhZNgbNKm
	 NNiRWteTUQdISlV4/ikYS4b42QCQxHntwPxtsnpp6ZtNlyIB9DXNbWFa2GwsoaQ8wvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209906;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=/JpHNIopQS3bT7Pb+e9AXJagd6f44ibcj9PBm0s68jQ=;
	b=5Wg1WaW6J8hqXiiaURZIvmxO8TpsH0y5/0u5dwNHiagVzBhiccKhLVMN5WL9LmiQ76Br
	 jHoWIHzrLQ3V9SKLF87Iihl4jQZGlfBTjg5pRVvPZzTcsAnpIfVhLEqR7mNvcyAa0ph7O
	 Vm1zkOgSh6U1GWdVwq8XlBkihmdWTcubY8P3dQ3XCOu9S0mQX1hJKV2KahbdRBIQzFAZv
	 /Rq5/6+C+leM014NW8DBnEXn/jmMp5vNybaUUETLP6rRcMWVJFPSJLCMseJSQzuyeCovH
	 GzEIb7mS51ZwRCYOGsMYXTvjsGd9J39PPHlPr+tuJqLf5QINy3wjzwWHE/DikFkafyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MxFBBD+R;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2409F60A2617
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2409F60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=MxFBBD+R
DKIM2-Signature:  i=1; m=1; t=1795209903;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:J0hMcRxLATJ80HDOLwmYdA/5AA81
   7Lk7ZEhEM/phxTX6JrYftFx6lZVnP1QJG14SYPbXNHlUxhQR1otsLhCN18Z3+8GeuPnsfhX2dnR
   CZE5kIYa6I10L9fU0NPavRjjadHUkBCv0vpMSqlN+CWNpbL3WFhG6I7wuPjrPoEghZCb5FfbUQK
   YJqaMOX+0HZznfZrJHhYjynHgz7Yz4ocs5Np4NGJrNegSHhe3ip4XrD9NfyOYU4GEteSGSuZEL4
   DrZsk4PJZ6oaE5GhUilxI93epRpuzhSs/L4QESoiLAvEYGzESpFFqwgY648Yb2z6OP3BEi+/NRb
   LQWMFca4LVOd+g==;
Message-Instance:  m=1;
 h=sha256:
   OQIyvhKJ6zo4mqoH37bmHUpbHRbJhlYEnYxkoCMRMBg=:
   SZ6/gs9Gmr6oxSfI1EOGFhxpNlXErdplg7z+xtp7f9k=,
  sha512:
   T4MUxTGz6oy3F4xeYsp92tQN2DPa7PgjpIcom5fxqYc27iI7yiLiYV4HDxjQ1wV60V5sp3k3Tov7zQ/VASjcaw==:
   SWrj8WjrdwoYg6Tjjw5cLfySRQNCNkn0W1KWEEGHbYrgSMs4HKUEnZSm240fI0GZTGpx1fB8W1IhOmdN7jvH2g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209898; x=1795814698; i=w_armin@gmx.de;
	bh=/JpHNIopQS3bT7Pb+e9AXJagd6f44ibcj9PBm0s68jQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MxFBBD+Rj6BkSO2INaw834DpFuxDcLMfyxyC/s9iq1XdrMQ7OY47zy+WglYBGlRI
	 Kzi/xr06K/+uJvFTaAeIDRe/yqB/bkyO9sNWUWPYjr6DEVksflVLLwK3zT2jLDij/
	 czsUOHQKCjSj9YvwJKCINYBGdFx+w9MNcRjDdpdUjfF5gZ/l+g/AQGKFArmZQQTZd
	 LY7qLJ9eHz8aIoPDhtmIL96MVk7UsPFC46ZCrZV5AWGGNgaZKa62q2hpdjX2eJaTp
	 cCHxmrV3LBQjzQzv8wMoC0tK5VAI8j4xuKxg7qR3K3heRl9QSn395Elu+hnf/PYY3
	 cP2wJS2l3TcDX86YKw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5GE1-1yVODU2rLB-00xZcu; Fri, 20
 Nov 2026 22:24:57 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 11/11] leds: multicolor: Adjust maximum subled intensity during initialization
Date: Fri, 20 Nov 2026 22:22:28 +0100
Message-ID: <20261120212431.152081-12-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:S/hP04TqM6cWC5sVo06LeaKrBNm8iAJYty0Y2OfUcr2gyaVsbTA
 WeSh3g8C7UtY22yqh3iAkFjpVxzhSag4JOmIqlHrerfbp6BrrthiD9QQ3pSS8UKNMNqoDRQ
 BN4Hq3TQ/TS5/3tkJVULH3AgZagKwE0EKC6pD98Z/lv7rFk0f5nOKRkHp8zKUiyU1Lj1IaS
 XUzCOgHNv4g+UN7iA9XZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5epJUBnvRds=;ehBZinYzE+xCY6NNYO9Nizyuw0f
 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
 wx5+YJhSw==

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

