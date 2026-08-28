Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A02D7BF
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 02:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882845; cv=none; b=ppBS/OeoRIpa6fA2AYvxwrz/GIvVZ5kHwe2DbjY50S4wbaaQBe/PFtu8h7yaSvYWPzxQiYoE1CjUYUQpuOC1LgAK2ry3XZ8GEsKgI83KCrMu2t56pdhPVyoyE7GtZbWxY4pmw9TRqpPOdBwiyElBwyXIpUKSu5Byay8RpMOn/80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882845; c=relaxed/simple;
	bh=jQeszfyCJomcExvHKytY2Ovxm3FNHZMnkqnNU5UTBTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tpS8On3Vq4UIuRsXrQ7cq1T2zqiQX2AJrY4jf/rh3j4fvTdb2VlHOgfzN9IpflREWaO51oGhiIscaHGrTLffnomvVVGo0aCv1iwJo3YguniVW5LTblbcLODW/lUq+D3Z5qwVEDgXNSUebODhQFhCEQ3YwpYaz37yyMiYrkZAJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAj/x+jD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imtP5F2T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAj/x+jD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imtP5F2T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S22MK61063897
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 02:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=U2W7usSLOkQrYBFd/rybpv
	Iuwsk/lZ9gf+4UZ0R1Ctw=; b=hAj/x+jDywP+xyFT860j1c2+K6LlGGzgsCMoNO
	1ZhkVyUF8j+73xsx1ENXtmw9ln6nxX9MTOgisB9mAdPzmjxJ5RprjcWsupByxzls
	pISOMwXIU6oxUnFTOSzWBph9gIfGJiJZJdQfoZV8iRZGLuC13a6TgOplPN41BuUV
	3hyNR2Hwjkx6FmmxZi0Xdov2zkqrKz4oi4qrqfaPjwBFRBj72rKJuFFLT45+aikf
	ICo8JGAOBNz8hQCaygbSG3jiMTZkwwktpeHbR+XteupPdaQeGiJM1WmHjjlTwRLL
	0KeJ5MFAvNadIU9LuZ4f4TYbDmpzkpivk41WCXiJSETBB4nw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw2tbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 02:07:21 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4519fdc5145so1191940fac.1
        for <linux-leds@vger.kernel.org>; Thu, 27 Aug 2026 19:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787882786; x=1788487586; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U2W7usSLOkQrYBFd/rybpvIuwsk/lZ9gf+4UZ0R1Ctw=;
        b=imtP5F2T/b1/stgU7JjiSOGo09RoW3XL8naAjWNf7MafObRSlmedvaoAQpTyiD6I1L
         /UKz+kl/aiTwELFxSJKWyHxu/vjNZvnOFH3C6lpqAlKbDPPZExO35Fcx2yX6qsQOY1nf
         PJpsI//jQzOgq8KdDrPVbk5ZluUHoH/gPqRfP7NSf7K+L/B8vlh0WtE43GAYGBTwLW/W
         DXRdC8UlOHvox7ZPJgP2ShWKuH6PlsXIE9OiobySz/oernCcQwEzgj86yggMWuk2Udte
         5KRrlY4eAz9whMOKEv2oFY5KcVZ0XkU7adkv4F2s62vb14P3MTT4g9mDPwXNPv/bJVTI
         4EdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787882786; x=1788487586;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U2W7usSLOkQrYBFd/rybpvIuwsk/lZ9gf+4UZ0R1Ctw=;
        b=HF0UlOZ34xqaJ4nVdqpFauscJimQeGyNR81FBsrQHxAqrLbgUKGQLqcww1fdYAg9oL
         DA3Tm2U88ayyu7yysdIM7fe40xuNiXo3oTxxRWVpFypBMykiaUn+HQBB3t094ulln5K2
         Sm84j+oKdOOe2eoq32UbNACc5zG/yuj0fd0SL/02K1n32stKuR7zZvHwpb1ce3DVFMI9
         PcCZNLLu/+kS5KfaFlYPSdAJXNBq1FmsslUvMtpVsYGlsv5nI6OOwQgYVgzR5U11SJ5R
         LuqezgvQnqywE4mTM7r2YzUWoAKH3z+U/vCNCFLPMCxxEXHBkLIGTBw2OnygTcO5kE5E
         PKnA==
X-Forwarded-Encrypted: i=1; AHgh+RrQvYwLnOEphFtJdrqq66kwvFjVbTCk0f+jtE61Z57mga3wO8jiA01kE45nTXnnhmpncrdXgnObQHsV@vger.kernel.org
X-Gm-Message-State: AFuF++m41gWqVFjOgMRo6dyT/e4/wNaXdTi1/Fr/eiSKt0X61ih+Ko0e
	feu9/dIQh08sKesFgnaLuDzQKyoPTXGfG7T/lvOtJwScE0+oWrbDmvM9Z3LMwUxEWcEdFixbkrk
	Fhk8A8HPQsr8MjsGwFhM8C8AFQ7oJs2aGxYYGvycLZU1decaRl9sKwV8rALVKbLXNbpDjHgTrcq
	k=
X-Gm-Gg: AR+sD125u0fAKQh1v83yF6ttMxyIJyUKD7NzxVf8c6ARIP1KB/PXpfqWq0Q8IDlXGti
	n9qYjF8fqFWDsGPtqRILwgCaRUjIrnOb4JtgBmHeL17qP4coZetSda/aWCv2ExYxWTku/VC0Dvt
	VBdP5qjqAOYZhQLxG4upS5R8BTGAlJSD3MG16F2r3ltXeN68LDUnXvSw5kD0DNcXf+Ie9ZCrJn2
	jleskT+rrTQNIIbp3IxJtcD8n7enwWQgJg/NrU1FhoPE4WDtTW1TtkoGp9GhWVFRSp268NUqP4V
	aYfhAphp3oxnCNvlFVEGSSbGY2q+JPz0PYIcpChE6zM6RDEiXqHqG4DmajhRqb+lAAQPPsvnFQo
	z6asS2e7hudDvjWj/qf4LJ1owc5PC1S5YSLHkTFfZQwMuCQXaj11H
X-Received: by 2002:a05:6820:f112:b0:6b1:7251:4210 with SMTP id 006d021491bc7-6b1c6753cb4mr2384812eaf.22.1787882786450;
        Thu, 27 Aug 2026 19:06:26 -0700 (PDT)
X-Received: by 2002:a05:6820:f112:b0:6b1:7251:4210 with SMTP id 006d021491bc7-6b1c6753cb4mr2384744eaf.22.1787882785921;
        Thu, 27 Aug 2026 19:06:25 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f80a0a5sm613290eec.11.2026.08.27.19.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:06:25 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 19:06:17 -0700
Subject: [PATCH v3] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABjtkGoC/22Qy2rDMBBFf8VoXQW9LFte5T9KF3qMHBW/ItluS
 /C/V3YC2ZgBwYWrc+fOAyWIARJqigeKsIYUxiEL/lEge9NDCzi4rBEjTJKK1bibWjz99Nj3OC3
 TNMYZl55oIbl03FmUP04RfPg9oJ9fT50W8w123kkvR4T7ktPmp+0d1hRHlCTlERVbg+3YjREb3
 enBAs5oXDPBpRRKG8+bVe5IoxNkZ9+HuSlopUrvmDNQC/DCccWNVJoYprnhFfU1JcZBifb1biH
 NY/w7TrDSY5tXW3XWdqU4Ty5rK6aVYvQ6pnS5L7rb0y/5Oagre5NqIk5JLJOMFY4SQQGcPiFt2
 /YPkMeySKQBAAA=
X-Change-ID: 20260728-lpg-pwm-fm-support-5f0a4636d3dc
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787882784; l=12891;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=jQeszfyCJomcExvHKytY2Ovxm3FNHZMnkqnNU5UTBTk=;
 b=TVDAkewAMhUypIIZ2DF3QSycdCE7nxavnFDCCYJZnROIEp+rKVfmIGaG2FlaUwwknMWSvYd8I
 FO9wW9a+oneC9+sxfzLGeFaOlMVtRrJxKWK64p66ysJlrTCfYj5jfA/
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: xcif1GLCBGSaGrVorQ9Cku7XYDZrTWK-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAxNSBTYWx0ZWRfX6AmLC/kXGU77
 LxUhSewfXTFoU1UDezaLjMr8bJn41oZCqmifFOA5ezhQlxj0tkRdOoLNmN1FWLjarNcyBQv2Pw/
 oMkNEGZu3bnCNPOi3BRlbt1bku80b+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAxNSBTYWx0ZWRfX5YROZ5jS5yW7
 8Py08KResgJDeBqsgt0HuD2pN3FsNtDkvq52MIpY+kgeRzuYlUJ0HI/NC0amLDljaHrq4QUT6/U
 5IEFq3sVKmoLbHi3oNj6gKmNbQ5+qF0YRRms/GhnJzdPGzmJkUMhGE0ywwh+/UOf59onO8pduUr
 W8Rk4aFoUuAfdTqK4RGb8UToSCq6t6ldOtsYubLfk+OoHKBJJ2ghDYxPYI/wwa9APvFkF101dZp
 qdNOUXcuQT9920hO3ulQ/c9oIh5xonlvjC/kVJTfQ384C0jZVb75A0dVcONp5K/Z24OCmSy5KeO
 ATfxBqFhAfIThADG1Tx7ioAKm21QImOSK0FfqXwMSNaM1wobzdVNcJhea+0MyBX9hgTdQtyqHgW
 9UKTcpO3BSSdhJmfcLP/X1FucchrRyCi4dNLZ0aL26SCcXqQTAjVthKY8Q6jJdlFjsKu3UC/9lJ
 t7N/FJBRy5+XQafygHA==
X-Proofpoint-ORIG-GUID: xcif1GLCBGSaGrVorQ9Cku7XYDZrTWK-
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a90ed59 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=lUA4vhS5x62BsxejJRMA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280015

Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
Mode (FM) that can generate waveforms with more frequency points than
the standard LPG PWM mode. The trade-off is that the duty cycle can
only be fixed at 50%. Add the FM support. When the PWM channel is
requested to set a duty cycle to exactly 50%, use FM mode by default
as it provides a finer-grained frequency resolution in that case.

Also, guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in lpg_pwm_apply().

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Dependency:

This change was made based on the LED color balance fix change which
is under review and has not yet been merged:

https://lore.kernel.org/linux-arm-msm/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/

This change should be applied on top of that one.
---
Changes in v3:
- Fixed Sashiko review comments:
  1. Instead of using an array with pre-rounded values in lpg_clk_period_ns[],
     calculate the clk period by using the lpg_clk_rates[] to improve accuracy.
  2. Move the subtype check in lpg_init_channels() so the check in lpg_calc_freq_fm()
     could be removed along with the error message, also change the message
     to a debug level when calculating the period in FM failed.
  3. Check if the requsted period is out of the frequency mode support range
     at the beginning of lpg_calc_freq_fm().
  4. Update PWM_FM_ENABLE bit based on the channel enabling status in
     lpg_apply_frequency_mode().
  5. Add mutex gaurd in lpg_pwm_get_state() to protect the register read
     from the register write in lpg_pwm_apply().
- Link to v2: https://patch.msgid.link/20260804-lpg-pwm-fm-support-v2-1-bc4d1041eeda@oss.qualcomm.com

Changes in v2:
- When assigning lsb/best_lsb value to period_actual, cast it to u64 1st then add 1.
- Link to v1: https://patch.msgid.link/20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 203 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 187 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24b1f570f524..2907ddb3a568 100644
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
@@ -42,6 +44,10 @@
 #define PWM_SEC_ACCESS_REG	0xd0
 #define PWM_DTEST_REG(x)	(0xe2 + (x) - 1)
 
+/* offset 0x50: PWM_FM_MODE_REG on LPG_SUBTYPE_PWM */
+#define PWM_FM_MODE_REG		0x50
+#define  PWM_FM_ENABLE		BIT(7)
+
 #define SDAM_REG_PBS_SEQ_EN		0x42
 #define SDAM_PBS_TRIG_SET		0xe5
 #define SDAM_PBS_TRIG_CLR		0xe6
@@ -110,6 +116,8 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @fm_capable: hardware supports Frequency Mode
+ * @use_fm: set the period using Frequency Mode
  */
 struct lpg_channel {
 	struct lpg *lpg;
@@ -146,6 +154,9 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+
+	bool fm_capable;
+	bool use_fm;
 };
 
 /**
@@ -238,11 +249,13 @@ struct lpg {
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
@@ -435,6 +448,101 @@ static const unsigned int lpg_pre_divs[] = {1, 3, 5, 6};
 static const unsigned int lpg_pwm_resolution[] = {6, 9};
 static const unsigned int lpg_pwm_resolution_hi_res[] = {8, 9, 10, 11, 12, 13, 14, 15};
 
+static int lpg_calc_freq_fm(struct lpg_channel *chan, uint64_t period_ns)
+{
+	unsigned int best_clk = 0, best_exp = 0, best_lsb = 0;
+	unsigned int clk, exp, lsb;
+	unsigned int clk_len;
+	u64 lsb_tmp, period_actual;
+	u64 curr_err, last_err;
+	u64 min_err = U64_MAX;
+	u64 max_period_ns;
+	bool found = false;
+
+	clk_len = ARRAY_SIZE(lpg_clk_rates);
+
+	/* Check if the requested period exceeds what freuqency mode can support */
+	max_period_ns = div64_u64((u64)NSEC_PER_SEC * (U8_MAX + 1) * (1 << (LPG_MAX_M + 1)),
+				   lpg_clk_rates[1]);
+	if (period_ns > max_period_ns)
+		return -EINVAL;
+
+	/*
+	 * Formula (rearranged to solve for pwm_value_lsb):
+	 *
+	 *                      period_ns * clk_rate
+	 * pwm_value_lsb = ------------------------------  - 1
+	 *                 2 * (2^pwm_exp) * NSEC_PER_SEC
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
+			lsb_tmp = div64_u64(period_ns * lpg_clk_rates[clk], NSEC_PER_SEC);
+			lsb_tmp >>= (exp + 1);
+
+			if (lsb_tmp == 0 || lsb_tmp - 1 > U8_MAX)
+				continue;
+
+			lsb = lsb_tmp - 1;
+
+			period_actual = (u64)(lsb) + 1;
+			period_actual <<= (exp + 1);
+			period_actual = div64_u64(period_actual * NSEC_PER_SEC,
+						  lpg_clk_rates[clk]);
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
+		dev_dbg(chan->lpg->dev,
+			"FM: Cannot generate period %llu ns\n", period_ns);
+		return -EINVAL;
+	}
+
+	chan->clk_sel = best_clk;
+	chan->pre_div_exp = best_exp;
+	chan->pwm_value = best_lsb;
+
+	/* pre-div and pwm-resolution don't impact frequency mode */
+	chan->pre_div_sel = 0;
+	chan->pwm_resolution_sel = 0;
+
+	/* Calculate actual period for reference */
+	period_actual = (u64)(best_lsb) + 1;
+	period_actual <<= (best_exp + 1);
+	period_actual = div64_u64(period_actual * NSEC_PER_SEC,
+				  lpg_clk_rates[best_clk]);
+	chan->period = period_actual;
+
+	dev_dbg(chan->lpg->dev,
+		"Frequency mode: period=%llu ns -> clk=%u Hz (idx=%u), exp=%u, lsb=%u (actual=%llu ns, err=%llu ns)\n",
+		period_ns, lpg_clk_rates[best_clk], best_clk, best_exp, best_lsb,
+		period_actual, min_err);
+
+	return 0;
+}
+
 static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 {
 	unsigned int i, pwm_resolution_count, best_pwm_resolution_sel = 0;
@@ -802,11 +910,26 @@ static void lpg_apply_dtest(struct lpg_channel *chan)
 		     chan->dtest_value);
 }
 
+static void lpg_apply_frequency_mode(struct lpg_channel *chan)
+{
+	struct lpg *lpg = chan->lpg;
+	bool use_fm;
+
+	if (!chan->fm_capable)
+		return;
+
+	use_fm = chan->use_fm && chan->enabled;
+
+	regmap_update_bits(lpg->map, chan->base + PWM_FM_MODE_REG,
+			   PWM_FM_ENABLE, use_fm ? PWM_FM_ENABLE : 0);
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
@@ -1318,28 +1441,42 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
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
@@ -1347,20 +1484,24 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
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
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;
 
 	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
-		unsigned int clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
+		clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
 
 		if (clk_idx >= ARRAY_SIZE(lpg_clk_rates_hi_res))
 			return -EINVAL;
@@ -1368,7 +1509,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		refclk = lpg_clk_rates_hi_res[clk_idx];
 		resolution = lpg_pwm_resolution_hi_res[FIELD_GET(PWM_SIZE_HI_RES_MASK, val)];
 	} else {
-		refclk = lpg_clk_rates[FIELD_GET(PWM_CLK_SELECT_MASK, val)];
+		clk_idx = FIELD_GET(PWM_CLK_SELECT_MASK, val);
+		refclk = lpg_clk_rates[clk_idx];
 		resolution = lpg_pwm_resolution[FIELD_GET(PWM_SIZE_SELECT_MASK, val)];
 	}
 
@@ -1384,9 +1526,29 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
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
+			/*
+			 * FM period formula:
+			 *   period = 2 * (pwm_value_lsb + 1) * (2^exp) * NSEC_PER_SEC / refclk
+			 */
+			pwm_value &= 0xff;
+			state->period = DIV_ROUND_UP_ULL((u64)2 * (pwm_value + 1) * (1 << m) *
+							  NSEC_PER_SEC, refclk);
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
@@ -1560,7 +1722,8 @@ static int lpg_init_channels(struct lpg *lpg)
 {
 	const struct lpg_data *data = lpg->data;
 	struct lpg_channel *chan;
-	int i;
+	unsigned int status;
+	int ret, i;
 
 	for (i = 0; i < data->num_channels; i++) {
 		chan = &lpg->channels[i];
@@ -1572,6 +1735,14 @@ static int lpg_init_channels(struct lpg *lpg)
 		chan->sdam_offset = data->channels[i].sdam_offset;
 
 		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
+
+		if (chan->subtype == LPG_SUBTYPE_PWM && data->channels[i].fm_capable) {
+			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
+			if (ret < 0)
+				return ret;
+
+			chan->fm_capable = !!(status & PWM_FM_PRESENT);
+		}
 	}
 
 	return 0;
@@ -1895,7 +2066,7 @@ static const struct lpg_data pm8350c_pwm_data = {
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

