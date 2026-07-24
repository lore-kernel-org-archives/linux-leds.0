Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C263B3893
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879308; cv=none; b=Hvds15ANSvYLxMv4pFW0tY7dZgb1SV4uQYju3F80GQTJ0ApZ1vafqK5Ck3DHwhBIb9g7QrteupLPbje1zr58c+olxhfvPom2G/4PPrMy6+U5qW0YpyuagZwqH3gAXZXGjiHt2Sif5iKV4KpDMBwI1rorXM1c2hND0L/+zxNQvaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879308; c=relaxed/simple;
	bh=JFuRaEWkd6AEg/D4Kn7dMdgECcZCUibiqxgUujGCgDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z2MY+n6Khmv2jef0KpcJ9thRziY9K9Bev9l2MJ9OG0YR1Q2WcSc0ufzhcZwU47Dpiba+yhm4g0PeUDBK8j9Wb4YT1bvWRrR9tZbIoy4FiRNNM/7J5tHJFV2DyqZ1ZRhK/3fH0LNFo9xqfmV3HrPgS1ON1NpZY2rfJIC8FRjFSRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Efpka0wX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqtlr2mv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Efpka0wX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqtlr2mv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lbT81869755
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UupxP501b4XH76W2a8UPuy7EAmtwJieHdpU9wLp2hlI=; b=Efpka0wX/4rUi6Pl
	sf9xqIoa7OjX0GvS1D9+vxPMQTBzxoriB96WjQ1wZI4cErPX7GdQ8ZnLAsORSoxX
	509dTSCt5erfIZ4OKRfqClfx2rBH/qDlTIzDUxQdgvBvZ33S5bBYk8+gqSaRYoQ0
	HgX10ZRCpKjMkgtb91c0QrRX6rcJlsfRCry+SS1VbwC7JYJ3HQmoYgFZ/WRcb6O0
	qNl0zzUWFe6WyB8+kLGA8t7QlukJty9d9ucSzLdh03mpE3XaAT3nrSmeJ6RQMa99
	fDi9mZg3pb3+1Le5Tleq+93iJ5SEXczzLCl5KEOuORL/JIY7kctbmJV4cbIs383Q
	nP1tLA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw8r32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8b0a08d2so1852671cf.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 00:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879303; x=1785484103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UupxP501b4XH76W2a8UPuy7EAmtwJieHdpU9wLp2hlI=;
        b=iqtlr2mvdBREnmWRa0uAmKADGcL9i1lHM6wdduRxkSWO8Q7F7de6HOiut4qOANfCDB
         mLpOIXJzwncRUq+bcCRxOp+9KfsTlJt3u/GMTSQ62PGDRxtdWYGp9iTK8+WDxQ/cPkTm
         zG1g87aYppy80esYtg3jDutvFEt6rIxjYWNOXnDx/kT1fTO7xJY43uoevRRm5kvSH85H
         +santwUPOIWVV4WT3j1m9XfJvteWs9gfh2SD1YyV6TFR6gkWMxopz9y2NtdFu9FSApKl
         ++Sb4V+wqLmA6zw4r3ERhSjsiD+IHzMBQiHNQ3K3zaGRvNM942p5unl5F8/9WgduSQQH
         CrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879303; x=1785484103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UupxP501b4XH76W2a8UPuy7EAmtwJieHdpU9wLp2hlI=;
        b=jZf58vzN+3Ll5cwlC/foFEbf6B/36OZ7ac0HzlKzOVJ6z2YTPPHol2DeLynogxEnfN
         s1jFNgBmGQaqNEEifOf9EulRrJpBQvQWp01dSadjIHYHPLX2himYx9R4kNMNwG20u4/k
         by5TFxFMxeA4c1qXkMWAjoak4t3gydjtEmudJStFSU+898VDe/xpZIToJsEiql0BhSxP
         bXF3NJO8qxuYSPS+TQzHW+00k33B8hhTPFgvJ9Ab62gl650f59RPpxz1uZGUZsjkYq0h
         5I+0q9vadXGrQg5aU+AaIZzP+/4wAo419QO/mJ1sLhYcwLIxHJ1KMSpIwodYhJxZppUy
         nnlg==
X-Gm-Message-State: AOJu0Yx4LhcBBAqXWyANBsYpZi2+75FxL5VV7+MJqDrqnyUWTZTM95Pb
	9FcavfIKF8ychg3cRLTMrYmNYh9Sn+gV6dDm8vNFHlFy5Go30fmrtBLO7DF1sCZ/JnSs17nKENl
	pLZYz/LTWAVf9w1pS5Fj06gaX6qcrc07V/3nyM+EWP88CYYf7Ir1cU3SJclGnGl4EDjG4ITit/7
	c=
X-Gm-Gg: AR+sD12D1AyKH4TNdKRBKj5aXskCPyEve+2/jjzrT4XcH4sJlX4WBx5uACbVz+zY1/6
	+iGXKdWM1FnJq725kRlLp2eabnxbBNDHCYWwaWEH9a+H1OtXufzBxonWToyEu9TyM9YyhU30Mut
	WwZNTIfKznq+g25M0gL7lf8hbS/145HDhn0T8i4Ju7FYBnz9HXZbZFhjvZYip7D0Dxyru7nFUd3
	CyZct6EKBSz6DSx+wzK6bYYNxEJuq8FbmfY2IsVIxp1bfGbDxeLCMSLq29FTiQreuvX4h/XWy/C
	PaUNrhwBdi3YsHaykQ3nQqmlbUTSUMMSJ7tO6xZlj3WP6N9Ylc/rm7607oAUm/gTiQ2l+0Iv9Mm
	HlrtDqwAdtty8r1+pcKJm7kS8EUnQaLDeoq+DlK+ZQnnphF/gEEWmDbYiCPvO13vZVf+AUpElO2
	HPQkRNglCUisY7IDHLEXylsHKw/90S6VyzPFtfKH4Y10q4eOg6GA==
X-Received: by 2002:ac8:5a02:0:b0:51c:1590:8e28 with SMTP id d75a77b69052e-5283de1c72cmr62766671cf.25.1784879303389;
        Fri, 24 Jul 2026 00:48:23 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:51c:1590:8e28 with SMTP id d75a77b69052e-5283de1c72cmr62766431cf.25.1784879302828;
        Fri, 24 Jul 2026 00:48:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:22 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:17 +0200
Subject: [PATCH v7 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-3-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
In-Reply-To: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX6KGRA/5yPUt2
 rtEThigjGmK/jFrZfGBolixLdnfeDqedDRCWZzDCOaq25e23V30f5wDzUSIWOw8sBo2dbT5FcPQ
 K6ZHrWY/rF9HNLUKZm4HWCV6FYiYfoNaXhDBqMK75YwGFJKCpcaiz2lZDLty6A2VN/D0rZnPDBP
 rjn5JfyXLMzAKQTHxh/FUWiZZzdGERbbGLoB4p94E0OxwNu+eq82T5aWeZool2ClLeTMaoCPk94
 riQ89DxneXha3CE6HN9bIfEAn1CD74GX5bFvX1xGSc/ONLlU7H7cNFypaIKKtF/Elqe74u5owQ3
 gv+Im5PY8hFjkTo4jzqSGJysL+8QT+e8WXIW9PYCibRaX6YfJHR6BOeRshafpbyQPv24cf+dGxB
 VkltRvQIgMw5wt9l5OxtMaohD3NH+9f9VNTu8U1b+mKietF8BA32f7LFvzhFRr4COk7DqeCym7m
 W4TnodClsZ/414REJpw==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6318c8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=aHOEH6Kt_s_Zyy5T-bIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: cW6yokoXBHFU1tN1eyPhNTFb-Ypr2Dnl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX1A6OH6PI6eCp
 dca6zluiqwmVNKERcBaJJSzinlMYIAu+l8uA1IbxA78aXOENzxY6BS9jWrkyGSRL88LrKMC2NSj
 rVXN8ANaqOR3LiGSu6oPyKBxk/3ZOJQ=
X-Proofpoint-GUID: cW6yokoXBHFU1tN1eyPhNTFb-Ypr2Dnl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 189 ++++++++++++++++++++++++++++++++++----------
 2 files changed, 148 insertions(+), 42 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67f9480cf23056e27e2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -596,6 +596,7 @@ config LEDS_PCA963X
 	tristate "LED support for PCA963x I2C chip"
 	depends on LEDS_CLASS
 	depends on I2C
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This option enables support for LEDs connected to the PCA963x
 	  LED driver chip accessed via the I2C bus. Supported
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..605cf7497e4c3ff97dc606ad2105f40df68950b5 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -27,6 +27,7 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -101,8 +102,11 @@ struct pca963x;
 struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subleds[4];
 	int led_num; /* 0 .. 15 potentially */
 	bool blinking;
+	bool is_mc;
 	u8 gdc;
 	u8 gfrq;
 };
@@ -115,7 +119,7 @@ struct pca963x {
 	struct pca963x_led leds[];
 };
 
-static int pca963x_brightness(struct pca963x_led *led,
+static int pca963x_brightness(struct pca963x_led *led, unsigned int led_num,
 			      enum led_brightness brightness)
 {
 	struct i2c_client *client = led->chip->client;
@@ -124,8 +128,8 @@ static int pca963x_brightness(struct pca963x_led *led,
 	int shift;
 	int ret;
 
-	ledout_addr = chipdef->ledout_base + (led->led_num / 4);
-	shift = 2 * (led->led_num % 4);
+	ledout_addr = chipdef->ledout_base + (led_num / 4);
+	shift = 2 * (led_num % 4);
 	mask = 0x3 << shift;
 	ledout = i2c_smbus_read_byte_data(client, ledout_addr);
 
@@ -135,7 +139,7 @@ static int pca963x_brightness(struct pca963x_led *led,
 			val = (ledout & ~mask) | (PCA963X_LED_GRP_PWM << shift);
 			ret = i2c_smbus_write_byte_data(client,
 						PCA963X_PWM_BASE +
-						led->led_num,
+						led_num,
 						LED_FULL);
 		} else {
 			val = (ledout & ~mask) | (PCA963X_LED_ON << shift);
@@ -150,7 +154,7 @@ static int pca963x_brightness(struct pca963x_led *led,
 	default:
 		ret = i2c_smbus_write_byte_data(client,
 						PCA963X_PWM_BASE +
-						led->led_num,
+						led_num,
 						brightness);
 		if (ret < 0)
 			return ret;
@@ -199,20 +203,24 @@ static void pca963x_blink(struct pca963x_led *led)
 	led->blinking = true;
 }
 
-static int pca963x_power_state(struct pca963x_led *led)
+static void pca963x_track_power_state(struct pca963x_led *led, unsigned int led_num,
+				      enum led_brightness brightness)
 {
-	struct i2c_client *client = led->chip->client;
 	unsigned long *leds_on = &led->chip->leds_on;
-	unsigned long cached_leds = *leds_on;
 
-	if (led->led_cdev.brightness)
-		set_bit(led->led_num, leds_on);
+	if (brightness)
+		set_bit(led_num, leds_on);
 	else
-		clear_bit(led->led_num, leds_on);
+		clear_bit(led_num, leds_on);
+}
 
-	if (!(*leds_on) != !cached_leds)
+static int pca963x_sync_power_state(struct pca963x_led *led, unsigned long cached_leds)
+{
+	struct i2c_client *client = led->chip->client;
+
+	if (!led->chip->leds_on != !cached_leds)
 		return i2c_smbus_write_byte_data(client, PCA963X_MODE1,
-						 *leds_on ? 0 : BIT(4));
+						 led->chip->leds_on ? 0 : BIT(4));
 
 	return 0;
 }
@@ -221,22 +229,60 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness value)
 {
 	struct pca963x_led *led;
+	unsigned long cached_leds;
 	int ret;
 
 	led = container_of(led_cdev, struct pca963x_led, led_cdev);
 
 	mutex_lock(&led->chip->mutex);
 
-	ret = pca963x_brightness(led, value);
-	if (ret < 0)
+	cached_leds = led->chip->leds_on;
+	ret = pca963x_brightness(led, led->led_num, value);
+	if (ret)
 		goto unlock;
-	ret = pca963x_power_state(led);
+
+	pca963x_track_power_state(led, led->led_num, value);
+	ret = pca963x_sync_power_state(led, cached_leds);
 
 unlock:
 	mutex_unlock(&led->chip->mutex);
 	return ret;
 }
 
+static int pca963x_led_mc_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
+	unsigned long cached_leds;
+	int ret = 0, sync_ret;
+
+	led_mc_calc_color_components(mc_cdev, value);
+
+	guard(mutex)(&led->chip->mutex);
+
+	cached_leds = led->chip->leds_on;
+	for (unsigned int i = 0; i < mc_cdev->num_colors; i++) {
+		unsigned int channel = mc_cdev->subled_info[i].channel;
+
+		ret = pca963x_brightness(led, channel,
+					 mc_cdev->subled_info[i].brightness);
+		if (ret)
+			break;
+
+		pca963x_track_power_state(led, channel,
+					  mc_cdev->subled_info[i].brightness);
+	}
+
+	/*
+	 * Some channels may already have been updated before the error, so
+	 * still sync the global on/off state to reflect what actually changed.
+	 */
+	sync_ret = pca963x_sync_power_state(led, cached_leds);
+
+	return ret ? : sync_ret;
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +346,81 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static int pca963x_parse_mc_subleds(struct device *dev, struct pca963x_led *led,
+				    struct fwnode_handle *fwnode,
+				    const struct pca963x_chipdef *chipdef)
+{
+	unsigned int num_colors = 0;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, sub) {
+		u32 color, subreg;
+
+		if (num_colors >= ARRAY_SIZE(led->subleds))
+			return dev_err_probe(dev, -EINVAL, "Too many LEDs for node %pfw\n", fwnode);
+
+		ret = fwnode_property_read_u32(sub, "reg", &subreg);
+		if (ret)
+			return dev_err_probe(dev, ret, "Missing 'reg' for sub-LED %pfw\n", sub);
+		if (subreg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL, "Invalid 'reg' for sub-LED %pfw\n", sub);
+
+		ret = fwnode_property_read_u32(sub, "color", &color);
+		if (ret)
+			return dev_err_probe(dev, ret, "Missing 'color' for sub-LED %pfw\n", sub);
+
+		led->subleds[num_colors].channel = subreg;
+		led->subleds[num_colors].color_index = color;
+		led->subleds[num_colors].intensity = LED_FULL;
+		num_colors++;
+	}
+
+	led->mc_cdev.subled_info = led->subleds;
+	led->mc_cdev.num_colors = num_colors;
+	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
+	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
+
+	return 0;
+}
+
+static int pca963x_register_led(struct device *dev, struct pca963x_led *led,
+				u32 reg, struct fwnode_handle *fwnode,
+				const struct pca963x_chipdef *chipdef,
+				bool hw_blink)
+{
+	struct i2c_client *client = led->chip->client;
+	struct led_init_data init_data = {};
+	char label[32];
+	int ret;
+
+	led->led_num = reg;
+
+	/* A node with sub-children groups several channels into a multicolor LED. */
+	led->is_mc = fwnode_get_child_node_count(fwnode) > 0;
+
+	if (led->is_mc) {
+		ret = pca963x_parse_mc_subleds(dev, led, fwnode, chipdef);
+		if (ret)
+			return ret;
+	} else {
+		led->led_cdev.brightness_set_blocking = pca963x_led_set;
+		if (hw_blink)
+			led->led_cdev.blink_set = pca963x_blink_set;
+	}
+
+	init_data.fwnode = fwnode;
+	/* Keep the legacy device name to preserve existing sysfs LED names. */
+	init_data.devicename = "pca963x";
+	snprintf(label, sizeof(label), "%d:%.2x:%u", client->adapter->nr, client->addr, reg);
+	init_data.default_label = label;
+
+	if (led->is_mc)
+		return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev,
+								 &init_data);
+
+	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+}
+
 static int pca963x_register_leds(struct i2c_client *client,
 				 struct pca963x *chip)
 {
@@ -338,37 +459,21 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node_scoped(dev, child) {
-		struct led_init_data init_data = {};
-		char default_label[32];
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg >= chipdef->n_leds) {
-			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
-				child);
-			return -EINVAL;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Missing 'reg' property for node %pfw\n", child);
+		if (reg >= chipdef->n_leds)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid 'reg' property for node %pfw\n", child);
 
-		led->led_num = reg;
 		led->chip = chip;
-		led->led_cdev.brightness_set_blocking = pca963x_led_set;
-		if (hw_blink)
-			led->led_cdev.blink_set = pca963x_blink_set;
 		led->blinking = false;
 
-		init_data.fwnode = child;
-		/* for backwards compatibility */
-		init_data.devicename = "pca963x";
-		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
-			 client->adapter->nr, client->addr, reg);
-		init_data.default_label = default_label;
-
-		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
-						     &init_data);
-		if (ret) {
-			dev_err(dev, "Failed to register LED for node %pfw\n",
-				child);
-			return ret;
-		}
+		ret = pca963x_register_led(dev, led, reg, child, chipdef, hw_blink);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to register LED for node %pfw\n",
+					     child);
 
 		++led;
 	}

-- 
2.34.1

