Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907955;
	b=JeXB5+nIgCX0Zd2je1Gr3LTbCqoNkgNIcfXxwThuE2WvHL5TYLlB7VJEWHD5AiJp5Yob
	 /02eHBEC6Azi5nHU08bbm2mPMkeZA2ZI8Hp4AMCbvvzzgaSwtCjnS4VQNMfvr0IENAX9D
	 1FtjN6Z5RtfwVVsQ/nMW0tklB3ZVE6ZpODBw/+JNWTcH/+qWKgKvdadxQRWyxrIYd6MOP
	 uhN4Csbvq7PdgGvsgzcDY8R/ECJuEgk8vIl7nvsdfepnO8XpuD6OQuxdu5eBQEYprXYG9
	 X6cL7xP49tnIYF/+eivZNWg2Mrib9sz2dixsLobZepzx1QrKvRdn6a14ieeoNG0liZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cc80q/RzF/ETFh5pkOz0wmAhdzFC7lsx7z3lQMnJJcw=;
	b=At6kTFgbNCl1nMrOBXG4utzh8E+G9hqphj/6HvzVTIFCqoYgkIB9bnUEmgc1PcVlxd7q
	 TCtRowxwGCSlZCeQMlnV+x2UgWn4idcFZVe2kcB9+dWS4x67xLcgOW/f3nuFJ0tRpUgo6
	 A+yvVYvmCU5ACbidxv0LUt4Wc7lJa2Y0CMQOuAnpQrJjMAgoSEeUT2V+uBZafxR920Y6y
	 SxtF3EidDZN0KvVIeZikHixa4LzKnt40j313/1TGzBH/o6lWaH+H71xm9y/BSoWncF//J
	 MP/zaTyhtvb2YDDZnW4D3f4M7ZsV5upqdS/RvM5QXfcLXQ54LjzT85aUo2iKKYrAU9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cRJ6VzDY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hBF7gtL8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A082606A8AD
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A082606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cRJ6VzDY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hBF7gtL8
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH90pqA1801438
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cc80q/RzF/ETFh5pkOz0wmAhdzFC7lsx7z3lQMnJJcw=; b=cRJ6VzDYd1nU/Cty
	BlsRP6bBPEyPS777crs1kWdFDN7uPvBo4+fDBdBJVa5Q+gb876srRtPRLiXbllpj
	gTWpCf7S5AetrY7ER5OjrUV4KNIblrePI624D7Kf8vaE0YmdOk7aCNMG/frdz+bk
	YCtOBcWQJoNORikPiaztM78LRlGCtGaMBEBHoe2ovB0Zr+nvWKErlKOzMzD2oJST
	yc6m/Yycy6kvSHJiEOEX78CCzCxVD6IYrz8Z0wGXLSe1GthHKk2mjOvSrAP8f+LA
	/Ml/QstWuj50CD40BeaiW52xYjlMxTcyKerXlxgdDuPXBCsiYo9EeVBS3VBJFEyG
	RFDHfw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y44hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:34 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46617932071so2206463fac.0
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 01:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907953; x=1795512753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc80q/RzF/ETFh5pkOz0wmAhdzFC7lsx7z3lQMnJJcw=;
        b=hBF7gtL88uiL+yt2ZZqKkJZc2Mn+AlydW/6E9GxKskeL6P40LVinJZp2lphePWWbTS
         TU1V4iOhvxa17KgNSoZilMITV1Mui9SCoe1gtcX4ADguxSnkGbrbJWLyDsWsMTNPCzA6
         YalbDw1bZSjJYvX3VAGFeNNDi9FhTTVeuuSatteRWuonzndiZ5omoTl1ySU5z4HgD39x
         83PjCPzqymhJBR1ecNcynd8u5brQ9xcuf313yCFcgWxy993ce8D+7sL7mlgYP8CKqou3
         aWkPxeU059f3YBsyUhqny7hicy/xRToqEiJOYSaLVe6n76MaY8IXGo7HhGh9yzaDO8a5
         telg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907953; x=1795512753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cc80q/RzF/ETFh5pkOz0wmAhdzFC7lsx7z3lQMnJJcw=;
        b=P5mI4E3pyhg1Jx4hWOFNwr7TKNAd/fWmJ0GRW3qXI9T5YyMg8SLixTqUL3PjCmTgYG
         eqC6PECI19uf9j5I9/vaIwmK6nQ0wMmEVJTkzd4JQJiyTPt6wTtU5FU3hxTbN2PyfTw9
         hsvgZfB5MDUEsGhENHE3h16x3vQSm1yEzxOpaA7SNAmHVBkzTr0nGJi7KOsRc7ssycXn
         CoABaUJ7nQsmPJRly4Q95FOplgUyl7nhmspFNQ7itN738ZmIoQ5rHAbVEAJUYcewS91n
         pBWIjA9TcDpdWkNN46oJz4QKaOhX3oTI2zUD1BPxsOI2R7cRRb9EzTpbEqKqRvHkb0Mb
         ALVA==
X-Forwarded-Encrypted: i=1; AL+hErHeFFknNU3/XlnmDSdpmb5lrRd3i84smMY19G6GvuLoUYCGFPkG+p+NiqaVs3OsCxyp/pWBqav8V/Kt@vger.kernel.org
X-Gm-Message-State: APuU4Z9OeXFA8ZcedrTY2n2N0+bjeepmbQaQEvwZyAk5pMEZnLSMErid
	mkwhaO1O9Yd4K0yrnp5DQCnHrnnyBPJFHMylZwuMsFNwGDWlEumYNvhM7Oxl5LhE2Ml3T7b5YJO
	4hgQWYo7N712qxrUNeRpIS1/XGoCeTi4PyPV4eNZdh72QkL0soxqi/whilqoPvq77
X-Gm-Gg: AYBFou3lT9I4OhHHU1QJrWCqMgHAC+j0Ck+0xXqVyzAAg1htrUVgz9qjCFHq6RoFNmU
	H1KRQS2TzsAr9KZv4Mtj7hCClf2GRuYx8eqp6PeamFNCXUOhFk29wHFczRpZD9GLUbdUwL/Z86Q
	opQSM/GfW4fwQV5IRpdkeUyqlitzIqOSp2sw2VcvTuXQz50tq3OvgsIIvWmG4QB66swvl4zzL9X
	rfzm27rxl6SGHcSg9TorVNkzwKxXbulNjy0k9qCg9isfdOhNF7RR22G8EAteAFtLFC9JVp1lNN5
	D0+jpOE5yNFXljMqiOLKIkhAUb5t8u6d9jMQfo5K8dad8QY2PeKmUiCn9AqcPgs17vqIkkotkwr
	sNWrlCej6ZVCaLp0z1bmWB7/U7d86B3LX31+G7xHv/hYnap/w8SswRIGhRrUSfD77jxYy/zfjpd
	AzyuGAu3rfIftTFJbtlBLVwGi6
X-Received: by 2002:a05:6870:3182:b0:49e:402e:68c5 with SMTP id 586e51a60fabf-4afdf7e990amr11695548fac.59.1794907953177;
        Tue, 17 Nov 2026 01:32:33 -0800 (PST)
X-Received: by 2002:a05:6870:3182:b0:49e:402e:68c5 with SMTP id 586e51a60fabf-4afdf7e990amr11695523fac.59.1794907952643;
        Tue, 17 Nov 2026 01:32:32 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2206dc0sm8678928fac.5.2026.11.17.01.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:32:32 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 01:31:34 -0800
Subject: [PATCH 2/4] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-2-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907947; l=14639;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=4Uqwrsakou1EZv5CZauuHKA0KC8aFQg8XaB7s89EwPo=;
 b=FFzVxZc9hgBeRKYIH1waqelRLOfxGuJH6TTzw4uOOhtD3aqjqPuetV1AksG9sR+a4BSiaQgX0
 4Yci3gzRL3oChQpgL6giuQrBepOpfYzAis26IiY7LxkhLPKzthZsc8s
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: xi8o95ByiI_opiwOGtE1q_gUL9PqaGbb
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afc1f32 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sZWN_0Fz8a1rRJcCqgEA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-ORIG-GUID: xi8o95ByiI_opiwOGtE1q_gUL9PqaGbb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX7OviMjH3Jf51
 z/ncjlAcg3aIVbQ5Od9x1MUv0vw64JaFcZwxLFldkDLoe3f8ylLqXgJgJbIZF3c6A2ZHjjLVZhT
 /RRty+35JIYq9Hcn53LNM+P6tYzQu+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX+BFvkfmkDX8v
 3tM4gppvMlRN3XEo1yjRR5PtzDXIJkM7M8irZr3saDlWGCFNATESwM5gTwffVMuTog/ZdmkCrmh
 chcEipxxOuzJdaUn1RdpSevR6bV+P6muk1yDVcOMikfOXWFcYfCCzEdWo0pLSEPbIIiUk3+jL7r
 afC8jGM9mp2oZstYiBQnc7MHtUuDRUblI7xT7c38WtpEchW3KaR4JmhLR8X6m9k6jKmjgyncfMw
 yaKDNz/P295V2BhBZZaO86EShD8KVQdhD8tVn8w1p+hLssvOa5RPUPrblLLgkn+H7nbOnMB9AmF
 osDFTsmSTbGgQPjEmBbhBx9pP6QtOgQ0pD02hRXy7TwkbKNjlE3xHOJBpXKE8I5LBE9vLBcZjq/
 IwfajEn6VTbxC2/XqDUyH1kphbQFpjtzNtgwAXSgOO2Y7+lWpEAk69ZFKU7we5DmciZlF3ZxXWe
 hVQwdqZxadqGCiv6Wyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170037

The multicolor hardware-pattern path has two related issues.

First, lpg_pattern_set() programs one unscaled LUT and assigns it to
every LPG channel. RGB and multicolor LEDs therefore replay identical
brightness values regardless of multi_intensity, making the output
white-balanced rather than preserving the requested color.

Fix this by normalizing the requested pattern once, scaling its
brightness values for each enabled sub-LED, and allocating and
programming a separate LUT range for every active LPG channel. Stop the
channels before replacing or releasing their LUTs, and roll back all
per-channel allocations if an update fails.

Second, a pattern is scaled only when it is installed. Updating
brightness or multi_intensity while it is active leaves already-enabled
channels with stale LUT values. A channel that was disabled when the
pattern was installed has no LUT and falls back to static PWM when it is
enabled later.

Fix this by caching the normalized, unscaled pattern and repeat state.
On each multicolor brightness callback, stop the running pattern,
release its per-channel LUTs, rebuild them from the current sub-LED
intensities, and restart the active channels. Clear the cached active
state when the pattern is removed.

The second issue was identified and fixed by OpenAI Codex when I used
it to review the original change.

Both of the fixes have been tested on a Maili QRD device and confirmed
that the HW pattern of a multicolor LED could be scaled and refreshed
correctly whenever hw_pattern, brightness, multi_intensity were updated.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 274 +++++++++++++++++++++++++++++++--------
 1 file changed, 217 insertions(+), 57 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index e14a3316bf22..175b3680766f 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -151,11 +151,32 @@ struct lpg_channel {
 	bool has_lut;
 };
 
+/**
+ * struct lpg_pattern - The LPG pattern normalized from the LED pattern
+ * @data:	The pattern data array
+ * @len:	number of entries to write to the LUT
+ * @delta_t:	common step duration in ms
+ * @lo_pause:	low-pause duration in ms
+ * @hi_pause:	high-pause duration in ms
+ * @ping_pong:	true if the pattern support reverse
+ */
+struct lpg_pattern {
+	struct led_pattern *data;
+	unsigned int len;
+	unsigned int delta_t;
+	unsigned int lo_pause;
+	unsigned int hi_pause;
+	bool ping_pong;
+};
+
 /**
  * struct lpg_led - logical LED object
  * @lpg:		lpg context reference
  * @cdev:		LED class device
  * @mcdev:		Multicolor LED class device
+ * @pattern:		unscaled active multicolor pattern; zero length when inactive
+ * @scaled_pattern:	scratch buffer for per-channel LUT updates
+ * @pattern_oneshot:	whether the cached pattern is played only once
  * @channels:		list of channels associated with the LED
  * @num_channels:	number of @channels
  */
@@ -164,6 +185,9 @@ struct lpg_led {
 
 	struct led_classdev cdev;
 	struct led_classdev_mc mcdev;
+	struct lpg_pattern pattern;
+	struct led_pattern *scaled_pattern;
+	bool pattern_oneshot;
 
 	unsigned int num_channels;
 	struct lpg_channel *channels[] __counted_by(num_channels);
@@ -876,18 +900,25 @@ static int lpg_brightness_single_set(struct led_classdev *cdev,
 	return 0;
 }
 
+static int lpg_pattern_mc_update(struct lpg_led *led);
+
 static int lpg_brightness_mc_set(struct led_classdev *cdev,
 				 enum led_brightness value)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	int ret = 0;
 
-	mutex_lock(&led->lpg->lock);
+	guard(mutex)(&led->lpg->lock);
 
 	led_mc_calc_color_components(mc, value);
-	lpg_brightness_set(led, cdev, mc->subled_info);
+	if (led->pattern.len) {
+		ret = lpg_pattern_mc_update(led);
+		if (ret)
+			return ret;
+	}
 
-	mutex_unlock(&led->lpg->lock);
+	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
 }
@@ -966,23 +997,15 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
 	return ret;
 }
 
-static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
-			   u32 len, int repeat)
+static int lpg_prepare_pattern(struct lpg *lpg, struct led_pattern *led_pattern,
+				u32 len, int repeat, struct lpg_pattern *prep)
 {
-	struct lpg_channel *chan;
-	struct lpg *lpg = led->lpg;
-	struct led_pattern *pattern;
 	unsigned int brightness_a;
 	unsigned int brightness_b;
-	unsigned int hi_pause = 0;
-	unsigned int lo_pause = 0;
 	unsigned int actual_len;
 	unsigned int delta_t;
-	unsigned int lo_idx;
-	unsigned int hi_idx;
 	unsigned int i;
 	bool ping_pong = true;
-	int ret = -EINVAL;
 
 	/* Hardware only support oneshot or indefinite loops */
 	if (repeat != -1 && repeat != 1)
@@ -1002,15 +1025,16 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	if (len % 2)
 		return -EINVAL;
 
-	pattern = kzalloc_objs(*pattern, len / 2);
+	struct led_pattern *pattern __free(kfree) = kzalloc_objs(*pattern, len / 2);
+
 	if (!pattern)
 		return -ENOMEM;
 
 	for (i = 0; i < len; i += 2) {
 		if (led_pattern[i].brightness != led_pattern[i + 1].brightness)
-			goto out_free_pattern;
+			return -EINVAL;
 		if (led_pattern[i + 1].delta_t != 0)
-			goto out_free_pattern;
+			return -EINVAL;
 
 		pattern[i / 2].brightness = led_pattern[i].brightness;
 		pattern[i / 2].delta_t = led_pattern[i].delta_t;
@@ -1023,7 +1047,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1080,13 +1104,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 			 * specify hi pause. Reject other variations.
 			 */
 			if (i != actual_len - 1)
-				goto out_free_pattern;
+				return -EINVAL;
 		}
 	}
 
 	/* LPG_RAMP_DURATION_REG is a 9bit */
 	if (delta_t >= BIT(9))
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * Find "low pause" and "high pause" in the pattern in the LUT case.
@@ -1094,33 +1118,59 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * duration of all steps.
 	 */
 	if (lpg->lut_base || lpg->lut_sdam) {
-		lo_pause = pattern[0].delta_t;
-		hi_pause = pattern[actual_len - 1].delta_t;
+		prep->lo_pause = pattern[0].delta_t;
+		prep->hi_pause = pattern[actual_len - 1].delta_t;
 	} else {
 		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
-			goto out_free_pattern;
+			return -EINVAL;
+		prep->lo_pause = 0;
+		prep->hi_pause = 0;
 	}
 
+	prep->data = no_free_ptr(pattern);
+	prep->len = actual_len;
+	prep->delta_t = delta_t;
+	prep->ping_pong = ping_pong;
 
-	mutex_lock(&lpg->lock);
+	return 0;
+}
+
+static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
+			   u32 len, int repeat)
+{
+	struct lpg_channel *chan;
+	struct lpg *lpg = led->lpg;
+	struct lpg_pattern pattern;
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int i;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
+	if (ret < 0)
+		return ret;
+
+	struct led_pattern *prep_data __free(kfree) = pattern.data;
+
+	guard(mutex)(&lpg->lock);
 
 	if (lpg->lut_base)
-		ret = lpg_lut_store(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store(lpg, prep_data, pattern.len, &lo_idx, &hi_idx);
 	else
-		ret = lpg_lut_store_sdam(lpg, pattern, actual_len, &lo_idx, &hi_idx);
+		ret = lpg_lut_store_sdam(lpg, prep_data, pattern.len, &lo_idx, &hi_idx);
 
 	if (ret < 0)
-		goto out_unlock;
+		return ret;
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
 
-		chan->ramp_tick_ms = delta_t;
-		chan->ramp_ping_pong = ping_pong;
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
 		chan->ramp_oneshot = repeat != -1;
 
-		chan->ramp_lo_pause_ms = lo_pause;
-		chan->ramp_hi_pause_ms = hi_pause;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
@@ -1128,11 +1178,6 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 		chan->has_lut = i == 0;
 	}
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
-
 	return ret;
 }
 
@@ -1152,24 +1197,133 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 	return 0;
 }
 
-static int lpg_pattern_mc_set(struct led_classdev *cdev,
-			      struct led_pattern *pattern, u32 len,
-			      int repeat)
+/* Caller must hold lpg->lock. Stop all readers before releasing their LUTs. */
+static int lpg_pattern_stop(struct lpg_led *led)
 {
-	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
-	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
 	unsigned int triled_mask = 0;
-	int ret, i;
+	unsigned int i;
+	int ret;
 
 	for (i = 0; i < led->num_channels; i++)
 		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	ret = triled_set(lpg, triled_mask, 0);
+	if (ret)
+		return ret;
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		ret = lpg_sdam_configure_triggers(chan, 0);
+		if (ret < 0)
+			return ret;
+		ret = regmap_update_bits(lpg->map, chan->base + PWM_ENABLE_CONTROL_REG,
+					 LPG_ENABLE_CONTROL_OUTPUT |
+					 LPG_ENABLE_CONTROL_RAMP_GEN, 0);
+		if (ret)
+			return ret;
+		ret = lpg_clear_pbs_trigger(lpg, chan->lut_mask);
+		if (ret)
+			return ret;
+
+		chan->enabled = false;
+		chan->ramp_enabled = false;
+	}
+
+	return 0;
+}
+
+/* Caller must hold lpg->lock. */
+static int lpg_pattern_mc_update(struct lpg_led *led)
+{
+	struct led_classdev_mc *mc = &led->mcdev;
+	struct led_classdev *cdev = &mc->led_cdev;
+	struct lpg_pattern *pattern = &led->pattern;
+	struct led_pattern *scaled = led->scaled_pattern;
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
+	unsigned int lo_idx, hi_idx;
+	unsigned int i, j;
+	int ret;
+
+	ret = lpg_pattern_stop(led);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < led->num_channels; i++)
+		lpg_lut_free(led->channels[i]);
+
+	/* Rebuild each channel from the unscaled pattern and current intensity. */
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		if (!mc->subled_info[i].brightness)
+			continue;
+
+		for (j = 0; j < pattern->len; j++) {
+			scaled[j].brightness = DIV_ROUND_CLOSEST(
+				(u32)pattern->data[j].brightness * mc->subled_info[i].intensity,
+				cdev->max_brightness);
+			scaled[j].delta_t = pattern->data[j].delta_t;
+		}
+
+		if (lpg->lut_base)
+			ret = lpg_lut_store(lpg, scaled, pattern->len, &lo_idx, &hi_idx);
+		else
+			ret = lpg_lut_store_sdam(lpg, scaled, pattern->len, &lo_idx, &hi_idx);
+		if (ret < 0)
+			goto out_free;
+
+		chan->ramp_tick_ms = pattern->delta_t;
+		chan->ramp_ping_pong = pattern->ping_pong;
+		chan->ramp_oneshot = led->pattern_oneshot;
+		chan->ramp_lo_pause_ms = pattern->lo_pause;
+		chan->ramp_hi_pause_ms = pattern->hi_pause;
+		chan->pattern_lo_idx = lo_idx;
+		chan->pattern_hi_idx = hi_idx;
+		chan->has_lut = true;
+	}
+
+	return 0;
+
+out_free:
+	for (i = 0; i < led->num_channels; i++)
+		lpg_lut_free(led->channels[i]);
+	return ret;
+}
+
+static int lpg_pattern_mc_set(struct led_classdev *cdev,
+			      struct led_pattern *led_pattern, u32 len,
+			      int repeat)
+{
+	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
+	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_pattern pattern;
+	int ret;
+
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
 	if (ret < 0)
 		return ret;
 
+	struct led_pattern *prep_data __free(kfree) = pattern.data;
+
+	if (pattern.len > lpg->lut_size)
+		return -EINVAL;
+
+	guard(mutex)(&lpg->lock);
+
+	memcpy(led->pattern.data, prep_data, pattern.len * sizeof(*prep_data));
+	pattern.data = led->pattern.data;
+	led->pattern = pattern;
+	led->pattern_oneshot = repeat != -1;
+
 	led_mc_calc_color_components(mc, LED_FULL);
+	ret = lpg_pattern_mc_update(led);
+	if (ret) {
+		led->pattern.len = 0;
+		return ret;
+	}
+
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1177,24 +1331,19 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
 
 static int lpg_pattern_clear(struct lpg_led *led)
 {
-	struct lpg_channel *chan;
 	struct lpg *lpg = led->lpg;
-	int i;
-
-	mutex_lock(&lpg->lock);
+	unsigned int i;
+	int ret;
 
-	chan = led->channels[0];
-	lpg_lut_free(chan);
+	guard(mutex)(&lpg->lock);
 
-	for (i = 0; i < led->num_channels; i++) {
-		chan = led->channels[i];
-		lpg_sdam_configure_triggers(chan, 0);
-		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
-		chan->pattern_lo_idx = 0;
-		chan->pattern_hi_idx = 0;
-	}
+	led->pattern.len = 0;
+	ret = lpg_pattern_stop(led);
+	if (ret)
+		return ret;
 
-	mutex_unlock(&lpg->lock);
+	for (i = 0; i < led->num_channels; i++)
+		lpg_lut_free(led->channels[i]);
 
 	return 0;
 }
@@ -1433,6 +1582,17 @@ static int lpg_add_led(struct lpg *lpg, struct fwnode_handle *fw)
 
 		/* Register pattern accessors if we have a LUT block or when using PPG */
 		if (lpg->lut_base || lpg->lpg_chan_sdam) {
+			led->pattern.data = devm_kcalloc(lpg->dev, lpg->lut_size,
+							 sizeof(*led->pattern.data), GFP_KERNEL);
+			if (!led->pattern.data)
+				return -ENOMEM;
+
+			led->scaled_pattern = devm_kcalloc(lpg->dev, lpg->lut_size,
+							   sizeof(*led->scaled_pattern),
+							   GFP_KERNEL);
+			if (!led->scaled_pattern)
+				return -ENOMEM;
+
 			cdev->pattern_set = lpg_pattern_mc_set;
 			cdev->pattern_clear = lpg_pattern_mc_clear;
 		}

-- 
2.43.0

