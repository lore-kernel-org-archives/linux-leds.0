Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F2541A921
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164085; cv=none; b=K7jHHVPhTkCGPBidmQaWuTl2kRKZItzCoDUNDdyhTNRJG3PzhwNZY2SN6wxQSDAbO0AOFc+FvFGbECfSnErd+ZULcX85FNwJQ5ULhl5RpqQKPL0Xa3pV3TUjlRQL3hxSj7Hejt5qsDouMnXIM4kEO1Vj1T2w612qUQQAbNtvoak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164085; c=relaxed/simple;
	bh=JFuRaEWkd6AEg/D4Kn7dMdgECcZCUibiqxgUujGCgDU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LNf7MwotkbDJiM4zJdmUsfZwc72Pbjez3z6ssK8F2rN3+wtlJQY+YshlTu1+bw5/7WGREitsF6/cV/4Lh3IOpPYNjnEJiYxeSHx4sycIMnzLTknYcuiCEbjiOyTrnEaAobPMUJrkEkbjP5ZnFRyEOpPXkGzZVBWojvBIE33QYys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBaYeDY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfJ11nvo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBaYeDY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfJ11nvo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDloYn4061373
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UupxP501b4XH76W2a8UPuy7EAmtwJieHdpU9wLp2hlI=; b=LBaYeDY/9yHxq3np
	TnwmEfASleIsK9z27xr47Fg6aojHptHc0y4UVmrx0WadFSLE6URxUdStPWGi7SI0
	2m1HjRJMvnZhWw1YhPTGeSIsYGmYj7u0HPOPb0GAMts6wgATtOZ5g9rWNWGBq6rh
	tfaZx0Bzv3WnNhDKkunY7sdBnlpF7iyfwFqjfkgS8VORq/cyQf3pJnlUBz+5AefJ
	1tQlBzn1T99dGi2MvmNbGQT1L6nTe618pWXTI/OFOYHmn859UofXZ8Ajbc4hUxK4
	g4sNwEgrtfyr2q2jbb1VmsrNL4HAzDp8qH/XmMucolOr17JMYTcTw+qh3BsQHnsA
	c58ADg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq19b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a8db414c7so42047181cf.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 07:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164082; x=1785768882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UupxP501b4XH76W2a8UPuy7EAmtwJieHdpU9wLp2hlI=;
        b=KfJ11nvoQbPDDkRF9USsAC9qTnSknuMm4f6mUwCkMMG+jrIiYk6UV9wpmqh1qNLxfz
         xQH/cWpdlqdhUse/7lXkfHqNnv3gaysDQ78W7usjx+wAWGy0GJXKaXiwLJrhvk5b1d7w
         FLt3iQlGb4W0F6TRXovFtLCJa6vlIIdlxCvTuipFVBUmvdbrtUY6JB8SwPBRUg+Iof9z
         OlCbeWDdGix2O3wXKuXPa1goH2klxRtXdndTNta0fLMbgP4BAoCvoPhBkVhiZpjLPpus
         Vc/SW9myyCj1zEp/xENKjbkhaAT1DG+6j8FkqIaJyP4d+pP6NpG26ODc0Xu29Sgl0Yyg
         V2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164082; x=1785768882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UupxP501b4XH76W2a8UPuy7EAmtwJieHdpU9wLp2hlI=;
        b=lqU8rR5Cj8KDBezCwam8tx4+wlbv1PYpfva2aGOHVqcO5ofeQ5//v+lRuWpGTrxrVx
         mssk4A0ryvaaVbCMCa3KN41BZcQglpGGrsqsvLiX9RgaGXrlfc6Y9jsPI6NJO59tZrTU
         ipQ4e3R7ZQBSTy/SRG4R1hFunBskS2ivlT/FSoQ2tZc6ImrHcxvZMmFk3LogI4uTS4C5
         KASp39Lazi9GLiAxYJiUZyJemXkexKckUAal2ZP35NIeOaVSLJz7B4hjitDTKiEk7f1j
         izdiIEZJq4HObCuii7Z6gAvPdTbxPWePI9nAdQcH0gkZhwuO6BoIao/Z7rk/d4aihVCU
         8LVA==
X-Gm-Message-State: AOJu0YwuI0Rx+66MSf+Z9NT1vVrCLZ6mYXTEe+SeDPaiu9iSqzZpYeX0
	ZWz4SvWdnl67A3uRPpb0xiFmoFzC2wBpmyUtBc4Lug2pg1dj5O1ZdHaDkmAkJgzW2h/eeIQoFTp
	72524rJbLHwtq+NkbLRwSh5xuREakCsEx9jWsGan/Ayq1cTh1aH+5OS9tjQQkCHMF
X-Gm-Gg: AR+sD10ns2MZHnx3S6YQQYV5Kb64Jg5rbjQNuJB+iW/6vu3n8+7QL+iNSeoED8COO65
	sm4WKht1MTSM4E1FsTy+D5lxQtTBXFYr8hbcMRHc5ekQRU90TzxHPOcw1p05VsDpiM1epcjHmaP
	RIUgKNE84BCKjbUbUKNlGGbhMxAkfQXY5EGJ2iTB7S0+rMTJqK3XuwJxO9y1oaAKUJgQP5Gq4Wg
	j9ftbPL4rtkCLCVJ4QEsrzN63dEqo35yb81n6ddCaEUhEDGEumIka+sT1CkkKouKZC8LTG6f8KM
	VBnYJFB0JRcFBzNCMIE63inmzxZyNAEY9f8HwQ+akKYxO7XteXjB8DQRmJyAwhrHcAXZuiXN5vw
	ajKtDypINEh1UPcTOZ4yYY4ntAJWQKM93aqZpM5b6mIUQqvlXM56rZ16ElrdrnDlHknecabBiDS
	3WZ0qoJiH22l4ebBOU0ME/fn7qM8t2767dbgXxPcssmZePMW/RAXij
X-Received: by 2002:a05:622a:1345:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-529a836bb20mr83120921cf.18.1785164081888;
        Mon, 27 Jul 2026 07:54:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1345:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-529a836bb20mr83120571cf.18.1785164081444;
        Mon, 27 Jul 2026 07:54:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:54:35 +0200
Subject: [PATCH v8 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-monza-leds-v8-3-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX8sp1vTxZgt5Z
 2+rdLDhazxhum3ezFBlElOSudZg0bWcanaksLrbzdsMKv/d/auWnIkgF9gZM8sHgtmddroAWUvn
 2z0wFX6S4I6GOVc3u+ZI3SVHPsJl5fI=
X-Proofpoint-ORIG-GUID: AKXLAy0cvWN0VGLfT3OlkI1gTR5a9ivR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX0ul3+Ga4MrEL
 15r5GPBRx7VN650kQZSyg7rdQVmPs1Rj/RzHvOuCu6+iSDdxK9YXE6mErgVuK6eOScvdS21R6zA
 VK9pV9+CWpXtqvyyCNMyAnSY3CXDRMZLZqqsiQQTN8MLJxCHLPQlIE5Jda21IPgtp5BpHR1Ps3x
 /KD7wVNqeD8NzjFzJyQ4GJwiMMEjeidXPpjgTnZ+nH/vrEkvnBzfainaCVezzUBqW8M9Y2WdGBP
 Mf3GX1O4wzsz7SXd09tiqbrkWPO/VZy5vuocVcQ20GnPzkwrEWcHQC5moNSagYOmQH8A1JNEd4D
 pNSI6cmaypg5ga02wIVG8qxz+oHcEziwaohiRAYCvte5pJgiOuOESqsVYuNlcckrvkv6zQb3uS7
 I7pkFJlqUF6O9cSIPGLuNd2szR1hEnvPbsdSyOZ0gKRdRW8wwf9gyoomyipl8ODbTr0Uu9wQTfh
 Lulu41tUn+9VRQbEGbg==
X-Proofpoint-GUID: AKXLAy0cvWN0VGLfT3OlkI1gTR5a9ivR
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a677132 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=aHOEH6Kt_s_Zyy5T-bIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

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

