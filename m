Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE2F28852E
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 04:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784263287; cv=none; b=uKcavxi9WEQWwi2A8QFp0qfHyHxvJcoTWk/jVy4f0I+6lQtVd4KeYKa/ZkOyZX7rPUViLiHY0m5UVqBi4pUvfvRAuwHE+590uRS6l6nqMOgsCFjltW4pNK0L/GTLwCYi0V2wspjKaa9TL3uCflbP5N15XuC/LlWW1xq10YvamAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784263287; c=relaxed/simple;
	bh=qw3UlfHqx9g7QO6+Mmao8Q1/I71j8qvLvF1DF9oIM9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dBTkhi7ykQxzOrjlTf7ljO9JoGHe3pcym00c5UpRXr1zIYu8i+rynJKqCqdukfvNzrYGPsye+PCtKry/7KeuBcA6HW1GJDONnGe5Ltcl1tOwz6+wuMBPo+huq3CncCVqoNuLdbFsksrKgyRJCycXhR/kheONpb2TujsGf1/HBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PcHlIJ5b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XzLqURzL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PcHlIJ5b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XzLqURzL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H34XXQ183639
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 04:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FRBWIdccCY+PmppSXcBYV3
	S4pjZTWpMiCSXziGIBsQs=; b=PcHlIJ5b8O3SVu5n3G0BaeJ+tz1w+fTeccmhQH
	wElHDzdp8d4FJucDnDWwkU8OX0CLMLB6UmqhijeGlJfu3SPcHB7yWEvhIqazn3Bk
	LrQNWg8Q4FHhkloM0M3/6jJmjqMHjO6r5p6gWBLqJ2exKTTrFm1xhs4kSJvKT/kB
	yL6sEuxzSQPyha0OfK49VQFtPba9fNDhQWsRg0q8cI2w8yx7E3+lEZb0DYSgUUhg
	PAdFSlHnXF5d4J40ZYc7Lvc5F6K8llHdYHuqC60FGzfNQWciVKylT86+wYG5l54R
	OnwLLkL53j4W+w9H8fPaWbAfkDAKyust6TWOTjriUdz0OROA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9jnw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 04:41:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so4050057a91.3
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 21:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784263284; x=1784868084; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FRBWIdccCY+PmppSXcBYV3S4pjZTWpMiCSXziGIBsQs=;
        b=XzLqURzLMjac2GvdVQdAqjjLGl9phXDqpVxiCbeReOMVwyGYedGFBMvMpgFq2CvVss
         ksB1Gagr6XHDOdLnaKWbskXfQVwUx3Jqq92lm0eFX7+DJjJC5rkwiy1cb+x2cyMJoFbU
         H0MERWGgEhEt9h/gZUWKgqo00xo4dJX21Y3sjAmNBsjg8bVBJxXPJ/jSP69CrIiE965H
         OFwR2AI2AoZCNZe3aO0GqQkCYLyn2gGsINdS2RMcoM1ocYCJsswgIAvV0uHQCbu6uFhU
         G7D0dqlpF+tuCFzOabgB72d/KKdJgzXYEG/kFG3P7ciChcqykw3gXKKI7ahSda/IKSh0
         eZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784263284; x=1784868084;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FRBWIdccCY+PmppSXcBYV3S4pjZTWpMiCSXziGIBsQs=;
        b=FNF1vGWhRgA+GjDubOIpv+2OlmlApGqBRHoRHyI++8sR/OKoNrQHsYT8ZjHiSou7CV
         +dzWc4OTLS9fOqpkTeDvCNIuH4C3mvUxN857WvBcCC3LutnB/aut8MWxZ3o80Sbw1cLk
         IHI+BXTfitVY3JBlKt1ikxWfeNVEGk6vujvfc84lGUfNoLad9V5lhTUDbPFKkFN5FL6z
         K1hTGDApcKYXX8NUmSnM73fw0ywnZcddBkGlABHBXTo36MFSIdu+JVTtiYJlwUILUlhU
         hSVxEo43subKDbiz62B9JzYrTTiJ7qDZAL3rZADdLzCxKkiHXpo8BGosvsIiJ9J9T6+p
         UWhg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6+cR/3jCx0A0N40iXb2GA/iUl142dy8z1b6xwbR7zk+i/FoF2aikxFQULXkBA9eO98F0JR+EM3R8H@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrrkZiCV2Vqb8zUMgteWFTgNaK7xC0Qt2ldLl/I0bCZNz8eVJ
	NQlqeWX1A06vDGmU7gG1vS7Z7MqbNyN/+JKwwVYRFp2CQpxSwdH98pKIsxD0aEWBl5toe226u52
	dpL6HzD1xfsKmYE8EbjNoM32iFZIrRb3hFxw6bPcLrIlJwAamlu7aClAJL5B97RGn
X-Gm-Gg: AfdE7cm8yXjtMwFUq0PlKrxYc3AgPDxkzRaMXxyxhqKmCgCxiV+fo5/dp0BFQDRpwBe
	MBYvMOCTmWl7Pg2tPtaiqU8dl32AW2yqZuX8yGnOBI5q28d1+aAlZGcHMU6t6rT4lq0W7eLXFlr
	TCppkaLEDimkQRgiZT2jmS1T/5JxMs6N1jUrwE4jo8jMeb0Px6dNL+ytMyZ3JZTcrn/oCqaLLxe
	fVJYuPaQM/RhZHhm/tBY1hw3XqVAQC6VpS2BCHve4NcCkTx6WIT6rzMqj1egfBrKw3t+epGZQ1f
	Qf4Tqs26Y0Om58K4zrph4geqQ3/3EW9auEzwM3IwjfvNFFHY+vilEulhtaYMBV2f3/DXKShyTlo
	TW+PnkGD+fq6F79wk7bQOAuBvsAhT5CCkCsYlzwbYNoVbJ3NJZzzK
X-Received: by 2002:a17:90b:5344:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-38e4b423596mr959866a91.14.1784263284078;
        Thu, 16 Jul 2026 21:41:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5344:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-38e4b423596mr959824a91.14.1784263283507;
        Thu, 16 Jul 2026 21:41:23 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm2451437eec.20.2026.07.16.21.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 21:41:22 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 21:41:17 -0700
Subject: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW
 pattern mode
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAG2yWWoC/43PzY7CIBQF4FcxrAcDXH6KK99jMgugUJnUoqDNT
 EzfXaqLcTFt3Nzk3Fy+E26o+Bx9QbvNDWU/xhLTUIP82CB3MEPncWxrRowwSSQRuD91OHcWu9S
 njK3pzeA8DvEHN4yDlFwbGwDV96fs6/phf349c7nab+8uMzhfHGK5pPz7KB/pfPdOz0gxxcAAJ
 OcGoBH7VMr2fDW9S8fjtg40143sBWR8DWQVdIRa4gVxJsgFEF5BvQZCBalSWhoiW6X1AsjfBnk
 FeWsboVmw4Ja+LP5ARdQaKCqotWetAtLw4P4Bp2m6A6A9xm0fAgAA
X-Change-ID: 20260605-lpg-rgb-color-balance-fix-82436649abf3
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784263282; l=10916;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=qw3UlfHqx9g7QO6+Mmao8Q1/I71j8qvLvF1DF9oIM9w=;
 b=kYkQjIOuGiFnhdeBQez7iOOUk6LDE4LC9699I+Mdz2HnEe4+14N4NbrQdV+v/K5kbIVRqQzd7
 4gAR7JK9f6LBKVmYzsiDSxhU1DPd9ZBz2ep4HYN6dHcF15Kfyttep0f
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59b274 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=63AshnvTA_EL1TQD_80A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0MiBTYWx0ZWRfX3e7FPsFlahNT
 +NImNJCYTAHurNE/KhtjZYGGZ7kY3d/NvNsnpF/C+YeRtQa0r34UcgCwEmMFpOJChT5DgoYQABL
 gTyZca7TqkblINAzYWYo2gIloH8gLIhqN/bbLKHLxQjDifrK5bBZGdmLiOybF1Btb+qTP65tFCL
 5XuceVqQDocafPNqq4yp11Q4H7byB4rHpuCp9S4JWM3sOeak48n7+CLT6Kb6ncow03b72mZ06H6
 9u4DOZcyKFKfw15k4hD04Z+FagmgYTUcLCa4aS1CZj1KEcYUrLxNAjq5KPiGw+cs75JPFZyPNLp
 /JnjQygcpEnyFAmccCDHiquS8JIi+2V9v/477K1GyfSdFgEqvykn5TTTRNt1qjW262As7oWcdro
 2xtKo5WL1VX3t+CmSQuJB7PIsHjzNcBPiHCzKFrzGOqVMMVcjQgA1ory7FA3LY0IljParWdNj1e
 ZONwn3LSph70MbPGcNA==
X-Proofpoint-GUID: BzHmqzw8NfhxlALyFMYIBsRrabqzPjQ1
X-Proofpoint-ORIG-GUID: BzHmqzw8NfhxlALyFMYIBsRrabqzPjQ1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0MiBTYWx0ZWRfX8lJI5tnnP7ps
 6Vtjp25CxE5YBl0+Jt4Rtwh+W/Yx2N35tMPrs97Y/G5LNJpKvmQzMuD+Lwf46qEuULwrvMZ+Yu0
 piN2V6hwiBUMYla87Ny2nybVEpwI9T0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170042

Currently, when the LED is configured as a RGB LED or a multi-color
LED device, the same pattern is programmed for all LED channels
regardless of the sub-led intensities when triggered by HW pattern.
It results that the LED device is always working in a white-balanced
mode regardless of the intensity settings.

To fix this, scale the pattern data according to the sub-led intensity
and program the HW pattern separately for each LPG channel.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v6:
- Fixed comments form Sashiko, and transfer 'pattern.data' to a
  '__free(kree)' local variable to get rid of the goto.
- Link to v5: https://patch.msgid.link/20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com

Changes in v5:
- Add no_free_ptr(pattern) to avoid it being cleaned up
- Link to v4: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v4-1-4db8592fb3c5@oss.qualcomm.com

Changes in v4:
- Fixing LLVM compilation issue: avoid jumping over guard(mutex) initialization
- Link to v3: https://patch.msgid.link/20260629-lpg-rgb-color-balance-fix-v3-1-17796a06d799@oss.qualcomm.com

Changes in v3:
- update to use __free() and guard(mutex) for easy cleanup
- Link to v2: https://patch.msgid.link/20260624-lpg-rgb-color-balance-fix-v2-1-c01b0e50caf6@oss.qualcomm.com

Changes in v2:
- Change to use tab for the indention in the comments of 'struct lpg_pattern'
- Remove the comment in lpg_prepare_pattern() as the function name is
  self-explantory.
- Link to v1: https://patch.msgid.link/20260605-lpg-rgb-color-balance-fix-v1-1-3233644a3385@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 172 +++++++++++++++++++++++++++++----------
 1 file changed, 130 insertions(+), 42 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index d7d6518de30f..24b1f570f524 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -148,6 +148,24 @@ struct lpg_channel {
 	unsigned int pattern_hi_idx;
 };
 
+/**
+ * struct lpg_pattern - The LPG pattern normalized from the LED pattern
+ * @data:	The pattern data array (caller must kfree)
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
@@ -959,23 +977,15 @@ static int lpg_blink_mc_set(struct led_classdev *cdev,
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
@@ -995,15 +1005,16 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
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
@@ -1016,7 +1027,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 	 * through the entire LUT, so prohibit this.
 	 */
 	if (len < 2)
-		goto out_free_pattern;
+		return -EINVAL;
 
 	/*
 	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
@@ -1073,13 +1084,13 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
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
@@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
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
 	}
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
-out_free_pattern:
-	kfree(pattern);
-
 	return ret;
 }
 
@@ -1144,23 +1176,81 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
 }
 
 static int lpg_pattern_mc_set(struct led_classdev *cdev,
-			      struct led_pattern *pattern, u32 len,
+			      struct led_pattern *led_pattern, u32 len,
 			      int repeat)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
+	struct lpg *lpg = led->lpg;
+	struct lpg_channel *chan;
+	struct lpg_pattern pattern;
 	unsigned int triled_mask = 0;
-	int ret, i;
-
-	for (i = 0; i < led->num_channels; i++)
-		triled_mask |= led->channels[i]->triled_mask;
-	triled_set(led->lpg, triled_mask, 0);
+	unsigned int lo_idx;
+	unsigned int hi_idx;
+	unsigned int scale;
+	unsigned int i, j;
+	int ret;
 
-	ret = lpg_pattern_set(led, pattern, len, repeat);
+	ret = lpg_prepare_pattern(lpg, led_pattern, len, repeat, &pattern);
 	if (ret < 0)
 		return ret;
 
+	struct led_pattern *prep_data __free(kfree) = pattern.data;
+
+	/* Allocate buffer for the per-channel scaled pattern copy */
+	struct led_pattern *scaled __free(kfree) =
+			   kmalloc_array(pattern.len, sizeof(*scaled), GFP_KERNEL);
+	if (!scaled)
+		return -ENOMEM;
+
+	for (i = 0; i < led->num_channels; i++)
+		triled_mask |= led->channels[i]->triled_mask;
+	triled_set(lpg, triled_mask, 0);
+
 	led_mc_calc_color_components(mc, LED_FULL);
+
+	/*
+	 * Each channel gets its own LUT block scaled by subled_info[i].brightness
+	 * so the pattern respects the configured colour balance.
+	 */
+	guard(mutex)(&lpg->lock);
+
+	for (i = 0; i < led->num_channels; i++) {
+		chan = led->channels[i];
+		scale = mc->subled_info[i].brightness;
+
+		for (j = 0; j < pattern.len; j++) {
+			scaled[j].brightness = DIV_ROUND_CLOSEST(
+				(u32)prep_data[j].brightness * scale, LED_FULL);
+			scaled[j].delta_t = prep_data[j].delta_t;
+		}
+
+		if (lpg->lut_base)
+			ret = lpg_lut_store(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+		else
+			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
+
+		if (ret < 0) {
+			/* Free LUT slots already allocated for previous channels */
+			while (i-- > 0) {
+				chan = led->channels[i];
+				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+				chan->pattern_lo_idx = 0;
+				chan->pattern_hi_idx = 0;
+			}
+
+			return ret;
+		}
+
+		chan->ramp_tick_ms = pattern.delta_t;
+		chan->ramp_ping_pong = pattern.ping_pong;
+		chan->ramp_oneshot = repeat != -1;
+		chan->ramp_lo_pause_ms = pattern.lo_pause;
+		chan->ramp_hi_pause_ms = pattern.hi_pause;
+		chan->pattern_lo_idx = lo_idx;
+		chan->pattern_hi_idx = hi_idx;
+	}
+
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	return 0;
@@ -1174,11 +1264,9 @@ static int lpg_pattern_clear(struct lpg_led *led)
 
 	mutex_lock(&lpg->lock);
 
-	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
-
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
+		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
 		lpg_sdam_configure_triggers(chan, 0);
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;

---
base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

