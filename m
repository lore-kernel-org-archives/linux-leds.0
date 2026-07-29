Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F30E448B8E
	for <linux-leds@vger.kernel.org>; Wed, 29 Jul 2026 09:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318545; cv=none; b=m60L4MGEyU9pl3w4j/MK6boS1XwishkBhGRYLttxQQHFSu8MLTbnNbgo+mhVNeoGJinNEVz05VPtO51WF+OTy6ho+HhZLfbbTc28zhSGZ0TZdf5hmE1ELUMqmNcevQ0OEXwA7ugy6c3aVanrvCRmFrY1iEoGBaC92p34i4gezWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318545; c=relaxed/simple;
	bh=Mk+d/EGxuJVMnc052Gbq+ANRTVQ4A2aM0hLaOKPr7c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ah3XWkIXfT90hJrwBMf54WBL/qZ+6C957idksbWH8Q65uZ/KNSElhajDJhHI04FBuhMKexwttyvtL98p4pEnjjdGPOTlTollVHuvQk2UkskEUbxxTFEd2WzRwYNM5qf7e9gX7paoQLWBjOPV7FKrswo1o5y9lUzLOxeRlC5pkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lXUzgaAT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNoGE/Zr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lXUzgaAT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNoGE/Zr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fBTc1372349
	for <linux-leds@vger.kernel.org>; Wed, 29 Jul 2026 09:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a4YppQYLNI5+/rjMODm4jC
	S0HutRLSsmSdJOIXEiHJg=; b=lXUzgaATVtfZgv+tz4pZnH7zAC1fVYGphXSpE0
	HSIl52HMxiyH3sEEb+e9DqhAYb/FZluVEmu2gvH8hcfB8A/eAvqBU/xE3P7SGMaC
	b2FtQbv4mth54cmzf9UrXcJ/2ppD5GrshufZNHPvoYRlZ2qbvc7+cmd9Kv8BQEXe
	IkvCUQ0aKokRedsdzpMrtEA46z5ch4IBJ4yuxiNEVopvDG/+ZBhifWCNOBUIXfK+
	QccAVSIYBSzwONXJz87/j/r3gsHfDZ8lZ8njphEMOT5DJ3g9TFck08CbZXptj5L6
	ITjZCjUOzDvBSHsCBAdtKoo0ah01uRxXveFpceshGR8GmWmw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm90e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 29 Jul 2026 09:49:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so1072908a91.2
        for <linux-leds@vger.kernel.org>; Wed, 29 Jul 2026 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785318541; x=1785923341; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a4YppQYLNI5+/rjMODm4jCS0HutRLSsmSdJOIXEiHJg=;
        b=dNoGE/ZrB68Xl69bOIa/iRFgXoOlFUvwTVfenFrWqPo8lvqh9Qb4MkqFypskrx16xF
         4ekeP8if3OfkBsWedEwhU0i22zpUVM5Bcc6WrT2kz/Cl+pFjyrFEnUbHoOBt4dbx18Pt
         6XGLy7MKa6murmC+cVycM7UX8saA6vdCTzabmABdCuHyxS+lQzUw3hGYU69ZGXA8ZCak
         IhHIXpEsl9AQcfm9t7mpHef4OfvtQaddjidAHeYA4xI6nZbRSjC9rNW2k6fCx5STLK77
         wicio/XyUB82ZaqKqo/tp8AjTaTIWOV0IM7RXfaQynJt8HHzM9YQeu+QAePme/nESPo7
         k6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785318541; x=1785923341;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a4YppQYLNI5+/rjMODm4jCS0HutRLSsmSdJOIXEiHJg=;
        b=ZsnrdHfQ22br3U50ouXb8eTFXzrp3KH4OLYC60PESHWfuryKnko7GsyHGRxz6Akz/K
         GXD7N2SNocs9LERNic8G41IUjKKc7smud2d2jFsImB8WGtqvWFUvo1jDY8qZ6siHBl8I
         Gf5eeQrnnRaYlrhkEZ5WwohY92O9l8jKNa7bZVAPuYXz7cBtzQU3AZjy6XgB/DGYc0tC
         qzocEjZsNoWi2q3NqVSJGhjgKtTWXMQMGA85zcwVX3dDlPVnTWQNUHimQlX4QCSQV6xG
         NVJbg9f6g9wJAWwK9H3elnzwUnL83AHCpDIvKYCtHZf3K7aa1n5x2E4/4gUhO2RtoMqH
         9G0Q==
X-Forwarded-Encrypted: i=1; AHgh+Roe9AMPFX2Wgujs8kg8UuYzwLD20eD7JIena/bd5ryThcHVEbnwhNphVY8WRikD+VlKxf4jOQiPpMOX@vger.kernel.org
X-Gm-Message-State: AOJu0YxtTDyN6APdpotfufMQC6TGgjU0VMpzLYy1TAbNaK0nnQDhlwEz
	ce4Y6ss99UuTC94pc3LUEIVNjqfYxLlTEmby3FV6PnDI6DkWmrYWGOgYLiuHzv5lK2bfZCRzYM4
	tK86L2wxt+H9jdWjAPV9hQP0va538NMRZDe9ks2EMA1K2wxrOesWxxF4x/vBbdSjExXaYnB09
X-Gm-Gg: AR+sD103kuJVeZGPfomch/OpPkIGEHGdnvGHlCTZxON+U54JP7A27KKwycHvYze1W9m
	D34wMFwtQyHjFb1GUEZek11ZyQhaw+UeD+rSo13Trcg15mi7UMbs0uvgn+2F1NY8S7bQvF2REuD
	gu15Kf0FU/aAl718B4QaIX/I+oP3OsQkVyspra0clFLKhpoTTQPCw/OAA6/kftTJjDP2iwG+HQJ
	PfvbQ4i7WH2lzVQC1mUOngIpWzRCAFoW9qsPg2bGSYig7oAJGCmq+b5OBx0Mp1DgOgg7i5l6vXj
	O4jYALYa/z98egCELTsBIyBOMVV4lIt1yYdKDCn4JhLZKmI4py0Z5lIT28TxZyhbJ2PeNXNLndR
	MoFAmwwngVw+7QjDglomXJBFLkU22d+aHWzzKD+y02u0CmPUQU48Z
X-Received: by 2002:a17:90b:5868:b0:38e:a74:dfe4 with SMTP id 98e67ed59e1d1-38f6a422e0fmr6511793a91.25.1785318541139;
        Wed, 29 Jul 2026 02:49:01 -0700 (PDT)
X-Received: by 2002:a17:90b:5868:b0:38e:a74:dfe4 with SMTP id 98e67ed59e1d1-38f6a422e0fmr6511766a91.25.1785318540583;
        Wed, 29 Jul 2026 02:49:00 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642fbf74sm2531982a91.17.2026.07.29.02.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 02:49:00 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 02:48:58 -0700
Subject: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAInMaWoC/0WOS47DIBAFr2KxTksYMP5cZZQFDY1D5A8DdmakK
 HcPcSJl+aTqqr6zTClQZkN1Z4luIYd1KaM+VcxezDISBFc2E1xo3ooOpjhC/JvBz5D3GNe0QeO
 5UVpqJ51l5TAm8uH/kP6c3zvveCW7vUwfItHvXmrbG/vGhupIad4cqTQi2HVaE6CZzGIJiho6o
 aTWqjfo5XDTLyWaTIWc57CV99u+8U44pE6RV072EnVvOAojUba172qOjhp2fjyeiuoUswMBAAA
 =
X-Change-ID: 20260728-lpg-pwm-fm-support-5f0a4636d3dc
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785318539; l=11624;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Mk+d/EGxuJVMnc052Gbq+ANRTVQ4A2aM0hLaOKPr7c8=;
 b=CLisPe6h1Tf8sGvNCRMc62ojB+G08ZZVlBbU/8G5Imm30Ed3mB5gijGokHAkW+nRYWOpePrGr
 GBmHAD1zZxlBLRSJat9E9Iw9DgJ5lterNfy22Yk3mGmARtKmUeka4xC
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4MCBTYWx0ZWRfX+J7uwX+DUOAz
 rOrOWOBCYBbOAgKmmHunBvrOA+gRqdCkstsmjOUneZw8JHqeZgDiJ51FtoBwlYtBoYtmaAjpeLG
 qOow43yPy1Wrou77VweKgnECiiIjGQ0=
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a69cc8e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KiLQHq0dUJNUFEj8lKYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Z2wsWGXl-e1ErSVt5xDE0-MqtRyfBnEw
X-Proofpoint-ORIG-GUID: Z2wsWGXl-e1ErSVt5xDE0-MqtRyfBnEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4MCBTYWx0ZWRfXyta27ncbiuA4
 x4/hqo3ZajcKji4S3u88VqQmkZp+mclQZAPiD4Y6EXbFgOLodF1/nhRsADiSd+vxNr2G/Pvsv8F
 tOfn/+C5Dee/yu8D/6PMbcnOiUbxq3ogYDXPLYbRhb6b2YBfzGzArGZNIBxwAyhTXaRlhJ3wNIQ
 nTWllkEDi8YBZhjFCn3PLGg+NcQDP+lx1XF+DtUQtiDE4Z8szntmQA7wSEafoqI+tKTXIRqFQGd
 CrwaWXIgbmnPMgJsmXxKNYpSFPg/AXoHj5ckcn9XVT1PelqdfaOb7YHZ3wjU0zmsKv553HDcZ4H
 2PwNSk7Qyi3A2KpMJ6KzAp4ju+vdT7d4mW6M7uy6FjSHPjb8t9BApeOnbeY5f7NweFIZqai2fK2
 D4a3rMb9a757Gbq41QuPtCwc4KYbQxnQvVUOanCb4j9rHyNzJs0YD3gx5FtWvvExCAOkqIKB0Ix
 uXHkcAa2mZKn3Chhv6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290080

Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
Mode (FM) that can generate waveforms with more frequency points than
the standard LPG PWM mode. The trade-off is that the duty cycle can
only be fixed at 50%. Add the FM support. When the PWM channel is
requested to set a duty cycle to exactly 50%, use FM mode by default
as it provides a finer-grained frequency resolution in that case.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Dependency:

This change was made based on the LED color balance fix change which
is under review and has not yet been merged:

https://lore.kernel.org/linux-arm-msm/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/

This change should be applied on top of that one.
---
 drivers/leds/rgb/leds-qcom-lpg.c | 199 +++++++++++++++++++++++++++++++++++----
 1 file changed, 183 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24b1f570f524..be3398b60445 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -21,6 +21,8 @@
 #define  LPG_SUBTYPE_PWM	0xb
 #define  LPG_SUBTYPE_HI_RES_PWM	0xc
 #define  LPG_SUBTYPE_LPG_LITE	0x11
+#define PWM_STATUS1_REG		0x08
+#define  PWM_FM_PRESENT		BIT(0)
 #define LPG_PATTERN_CONFIG_REG	0x40
 #define LPG_SIZE_CLK_REG	0x41
 #define  PWM_CLK_SELECT_MASK	GENMASK(1, 0)
@@ -42,6 +44,9 @@
 #define PWM_SEC_ACCESS_REG	0xd0
 #define PWM_DTEST_REG(x)	(0xe2 + (x) - 1)
 
+#define PWM_FM_MODE_REG		0x50
+#define  PWM_FM_ENABLE		BIT(7)
+
 #define SDAM_REG_PBS_SEQ_EN		0x42
 #define SDAM_PBS_TRIG_SET		0xe5
 #define SDAM_PBS_TRIG_CLR		0xe6
@@ -110,6 +115,8 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @fm_capable: hardware supports Frequency Mode
+ * @use_fm: set the period using Frequency Mode
  */
 struct lpg_channel {
 	struct lpg *lpg;
@@ -146,6 +153,9 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+
+	bool fm_capable;
+	bool use_fm;
 };
 
 /**
@@ -238,11 +248,13 @@ struct lpg {
  * @sdam_offset:	Channel offset in LPG SDAM
  * @base:		base address for PWM channel registers
  * @triled_mask:	bitmask for controlling this channel in TRILED
+ * @fm_capable:		channel hardware supports Frequency Mode
  */
 struct lpg_channel_data {
 	unsigned int sdam_offset;
 	unsigned int base;
 	u8 triled_mask;
+	bool fm_capable;
 };
 
 /**
@@ -431,10 +443,105 @@ static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
 
 static const unsigned int lpg_clk_rates[] = {0, 1024, 32768, 19200000};
 static const unsigned int lpg_clk_rates_hi_res[] = {0, 1024, 32768, 19200000, 76800000};
+static const unsigned int lpg_clk_period_ns[] = {0, 976562, 30517, 52};
 static const unsigned int lpg_pre_divs[] = {1, 3, 5, 6};
 static const unsigned int lpg_pwm_resolution[] = {6, 9};
 static const unsigned int lpg_pwm_resolution_hi_res[] = {8, 9, 10, 11, 12, 13, 14, 15};
 
+static int lpg_calc_freq_fm(struct lpg_channel *chan, uint64_t period_ns)
+{
+	const unsigned int *clk_rate_arr, *clk_period_arr;
+	unsigned int best_clk = 0, best_exp = 0, best_lsb = 0;
+	unsigned int clk, exp, lsb;
+	unsigned int clk_len;
+	u64 lsb_tmp, period_actual;
+	u64 curr_err, last_err;
+	u64 min_err = U64_MAX;
+	bool found = false;
+
+	if (chan->subtype != LPG_SUBTYPE_PWM) {
+		dev_err(chan->lpg->dev, "Only SUBTYPE_PWM support frequency mode\n");
+		return -EOPNOTSUPP;
+	}
+
+	clk_rate_arr = lpg_clk_rates;
+	clk_len = ARRAY_SIZE(lpg_clk_rates);
+	clk_period_arr = lpg_clk_period_ns;
+
+	/*
+	 * Formula (rearranged to solve for pwm_value_lsb):
+	 *
+	 *                           period_ns
+	 * pwm_value_lsb = -------------------------------  - 1
+	 *                 2 * (2^pwm_exp) * clk_period_ns
+	 *
+	 * For each (clk, exp) combination, calculate pwm_value_lsb and then
+	 * use it to calculate the actual period. Store the combination that
+	 * yields the closest match to the desired period.
+	 *
+	 */
+
+	for (clk = 1; clk < clk_len; clk++) {
+		last_err = U64_MAX;
+
+		for (exp = 0; exp <= LPG_MAX_M; exp++) {
+			/* Calculate pwm_value_lsb for this (clk, exp) pair */
+			lsb_tmp = period_ns;
+			lsb_tmp = div64_u64(lsb_tmp, clk_period_arr[clk]);
+			lsb_tmp >>= (exp + 1);
+
+			if (lsb_tmp == 0 || lsb_tmp - 1 > U8_MAX)
+				continue;
+
+			lsb = lsb_tmp - 1;
+
+			period_actual = (u64)(lsb + 1);
+			period_actual <<= (exp + 1);
+			period_actual *= clk_period_arr[clk];
+
+			curr_err = period_ns - period_actual;
+			if (curr_err < min_err) {
+				min_err = curr_err;
+				best_clk = clk;
+				best_exp = exp;
+				best_lsb = lsb;
+				found = true;
+			}
+
+			if (curr_err > last_err)
+				break;
+
+			last_err = curr_err;
+		}
+	}
+
+	if (!found) {
+		dev_err(chan->lpg->dev,
+			"FM: Cannot generate period %llu ns\n", period_ns);
+		return -EINVAL;
+	}
+
+	chan->clk_sel = best_clk;
+	chan->pre_div_exp = best_exp;
+	chan->pwm_value = best_lsb;
+
+	chan->pre_div_sel = 0;
+	chan->pwm_resolution_sel = 0;
+
+	/* Calculate actual period for reference */
+	period_actual = (u64)(best_lsb + 1);
+	period_actual <<= (best_exp + 1);
+	period_actual *= clk_period_arr[best_clk];
+	chan->period = period_actual;
+
+	dev_dbg(chan->lpg->dev,
+		"Frequency mode: period=%llu ns -> clk=%u Hz (idx=%u), exp=%u, lsb=%u (actual=%llu ns, err=%llu ns)\n",
+		period_ns, clk_rate_arr[best_clk], best_clk, best_exp, best_lsb,
+		period_actual, min_err);
+
+	return 0;
+}
+
 static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 {
 	unsigned int i, pwm_resolution_count, best_pwm_resolution_sel = 0;
@@ -802,11 +909,23 @@ static void lpg_apply_dtest(struct lpg_channel *chan)
 		     chan->dtest_value);
 }
 
+static void lpg_apply_frequency_mode(struct lpg_channel *chan)
+{
+	struct lpg *lpg = chan->lpg;
+
+	if (!chan->fm_capable)
+		return;
+
+	regmap_write(lpg->map, chan->base + PWM_FM_MODE_REG,
+		     chan->use_fm ? PWM_FM_ENABLE : 0);
+}
+
 static void lpg_apply(struct lpg_channel *chan)
 {
 	lpg_disable_glitch(chan);
 	lpg_apply_freq(chan);
 	lpg_apply_pwm_value(chan);
+	lpg_apply_frequency_mode(chan);
 	lpg_apply_control(chan);
 	lpg_apply_sync(chan);
 	if (chan->lpg->lpg_chan_sdam)
@@ -1318,28 +1437,42 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 {
 	struct lpg *lpg = lpg_pwm_from_chip(chip);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
+	bool use_fm = false;
 	int ret = 0;
 
 	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
-	mutex_lock(&lpg->lock);
+	guard(mutex)(&lpg->lock);
 
 	if (state->enabled) {
-		ret = lpg_calc_freq(chan, state->period);
-		if (ret < 0)
-			goto out_unlock;
+		use_fm = chan->fm_capable && (state->duty_cycle == state->period / 2);
 
-		lpg_calc_duty(chan, state->duty_cycle);
+		if (use_fm) {
+			ret = lpg_calc_freq_fm(chan, state->period);
+			/*
+			 * fallback to use the standard mode if frequency
+			 * mode couldn't satisfy the requested period
+			 */
+			if (ret < 0)
+				use_fm = false;
+		}
+
+		if (!use_fm) {
+			ret = lpg_calc_freq(chan, state->period);
+			if (ret < 0)
+				return ret;
+
+			lpg_calc_duty(chan, state->duty_cycle);
+		}
 	}
+
+	chan->use_fm = use_fm;
 	chan->enabled = state->enabled;
 
 	lpg_apply(chan);
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
-
-	return ret;
+	return 0;
 }
 
 static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -1347,8 +1480,10 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 {
 	struct lpg *lpg = lpg_pwm_from_chip(chip);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
+	bool fm_active = false;
 	unsigned int resolution;
 	unsigned int pre_div;
+	unsigned int clk_idx;
 	unsigned int refclk;
 	unsigned int val;
 	unsigned int m;
@@ -1360,7 +1495,7 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 
 	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
-		unsigned int clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
+		clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
 
 		if (clk_idx >= ARRAY_SIZE(lpg_clk_rates_hi_res))
 			return -EINVAL;
@@ -1368,7 +1503,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		refclk = lpg_clk_rates_hi_res[clk_idx];
 		resolution = lpg_pwm_resolution_hi_res[FIELD_GET(PWM_SIZE_HI_RES_MASK, val)];
 	} else {
-		refclk = lpg_clk_rates[FIELD_GET(PWM_CLK_SELECT_MASK, val)];
+		clk_idx = FIELD_GET(PWM_CLK_SELECT_MASK, val);
+		refclk = lpg_clk_rates[clk_idx];
 		resolution = lpg_pwm_resolution[FIELD_GET(PWM_SIZE_SELECT_MASK, val)];
 	}
 
@@ -1384,9 +1520,32 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (ret)
 			return ret;
 
-		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * ((1 << resolution) - 1) *
-						 pre_div * (1 << m), refclk);
-		state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value * pre_div * (1 << m), refclk);
+		if (chan->fm_capable) {
+			ret = regmap_read(lpg->map, chan->base + PWM_FM_MODE_REG, &val);
+			if (ret)
+				return ret;
+
+			fm_active = !!(val & PWM_FM_ENABLE);
+		}
+
+		if (fm_active) {
+			if (clk_idx >= ARRAY_SIZE(lpg_clk_period_ns))
+				return -EINVAL;
+
+			/*
+			 * FM period formula:
+			 *   period = 2 * (pwm_value_lsb + 1) * (2^exp) * clk_period_ns
+			 */
+			pwm_value &= 0xff;
+			state->period = (u64)2 * (pwm_value + 1) * (1 << m) *
+					lpg_clk_period_ns[clk_idx];
+			state->duty_cycle = state->period / 2;
+		} else {
+			state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
+					((1 << resolution) - 1) * pre_div * (1 << m), refclk);
+			state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
+					pwm_value * pre_div * (1 << m), refclk);
+		}
 	} else {
 		state->period = 0;
 		state->duty_cycle = 0;
@@ -1560,7 +1719,8 @@ static int lpg_init_channels(struct lpg *lpg)
 {
 	const struct lpg_data *data = lpg->data;
 	struct lpg_channel *chan;
-	int i;
+	unsigned int status;
+	int ret, i;
 
 	for (i = 0; i < data->num_channels; i++) {
 		chan = &lpg->channels[i];
@@ -1572,6 +1732,13 @@ static int lpg_init_channels(struct lpg *lpg)
 		chan->sdam_offset = data->channels[i].sdam_offset;
 
 		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
+		if (data->channels[i].fm_capable) {
+			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
+			if (ret < 0)
+				return ret;
+
+			chan->fm_capable = !!(status & PWM_FM_PRESENT);
+		}
 	}
 
 	return 0;
@@ -1895,7 +2062,7 @@ static const struct lpg_data pm8350c_pwm_data = {
 		{ .base = 0xe800, .triled_mask = BIT(7), .sdam_offset = 0x48 },
 		{ .base = 0xe900, .triled_mask = BIT(6), .sdam_offset = 0x56 },
 		{ .base = 0xea00, .triled_mask = BIT(5), .sdam_offset = 0x64 },
-		{ .base = 0xeb00 },
+		{ .base = 0xeb00, .fm_capable = true },
 	},
 };
 

---
base-commit: 1795fd2dbe84ef4d393b69a0b2a3b371f810bde5
change-id: 20260728-lpg-pwm-fm-support-5f0a4636d3dc
prerequisite-change-id: 20260605-lpg-rgb-color-balance-fix-82436649abf3:v6
prerequisite-patch-id: 931a69abc7b07f7f5b5603e8159c092d9a54703f

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

