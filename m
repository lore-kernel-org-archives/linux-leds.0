Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A863C4171
	for <linux-leds@vger.kernel.org>; Wed,  5 Aug 2026 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910053; cv=none; b=V0o+HYtSzvsZXnPmLVBlLmWmc/z6N6BeDbsG0Jp+q2baOZ6beE2V7CFWRTqVY3zQ1K5c51brKsyP64s7tN4dexmWg1UV7TKwzYLRJK+w8qPgGTOV9RJV2Syde48gQm4+p/d8XJXX1yYXWfGje4bOW6r5KoGe7LIG76onsLBkEWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910053; c=relaxed/simple;
	bh=v5A35AsIX1FU9PnlCaxEuScG//lY3QWfODA5E4NAydQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bem+XbkBIgb6B5egMJxwwj5e6duqAKDVupJj5Nbft1/qILNK8jgaa8tZF3bpEJw1Hr4JcfaWffdgsAzyseGJ3FhEzSbPutjUmJ5FAFdDPRCW2TH8qk6LH5Z361vmrVJ5lppL0ccCi4Awn7RG/Bsrqwa1+IH+FaNaCMttXqpFrvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UA4aliFH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCA37vZm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UA4aliFH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCA37vZm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755l2vW1736589
	for <linux-leds@vger.kernel.org>; Wed, 5 Aug 2026 06:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P20Xb1E7kJMyaj3ABhnnsY
	mgv+Ve8QuEQi4ULh8hl84=; b=UA4aliFHNojrNRQcRdzQ8JqdAmbWz0DNuWcn/n
	3+5dcarVFUNXSVNTBLMk4O/OmH6znvrVntLpucAVCLfAY7Uy1mxyCOI/nxqLuQXR
	h+U/V3hIh4gAzVBKaqTUHvqzuTsDBOoMLOLA8gyys5e7Bt9eLgkspSQUWTWgpMrR
	JZfRCiI8AV3hK0WLu6hhtIiGMjbfeGXrG/z8/IydywYMgvN6CFNf6AWpLSe34ouI
	cg5Lq9pSA2/07LuZ0IyLGHW/uBGWkHvWVZZsPVrbDtBmGqCc9rV9h038OQkIQQcq
	5tQU0WHrwyDd4PYtmi+44uihSyNeZnVHuv0BJ/62Pt1s52xA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56awwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 05 Aug 2026 06:07:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1408363a12.0
        for <linux-leds@vger.kernel.org>; Tue, 04 Aug 2026 23:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785910050; x=1786514850; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P20Xb1E7kJMyaj3ABhnnsYmgv+Ve8QuEQi4ULh8hl84=;
        b=ZCA37vZmkAa0iJGNuMOZDDnpOAG0gQkkyxXAxwGmHGLzTqLLVB+VONU2VqV1BKHzml
         9pZGmb7usksULNXT8xEx+2hIpRotECNm1N1TeO8HGu8B2+XhFd0EDG4Yd4uf17MGxaj2
         4SwUs8MJZZ/qAR82ucMGNmHEEjlSo32lgul+hiTimlVJIanhtZLTqAXEH6BxvPqB9nEB
         irCgIgxs54ynSqPpnDhXgyCJGqKkfVnvFaOHI1qmwry1RflxhPbhQ7cD91QIy8Iex6LM
         MPf/o2Fnqx8AU9Herwe1TVsNwMlETSfHKkIwV5zAH3F/ijv3YX065TCVK02qNzwD9ON9
         x8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910050; x=1786514850;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=P20Xb1E7kJMyaj3ABhnnsYmgv+Ve8QuEQi4ULh8hl84=;
        b=iOXl5TPKB6MQaPRhjJKcQ4knI8okxuttEunGxbDYZK3HvsihZsT5IzTFoqSePJrLML
         GsfVFMRaUHsELN2+zv4FKQ5lAVEYYV2x0IdwKRNevpqXHe899SkHO5qij3rG+JuTo0Yv
         iPY89TkZMZ3EuRFaMnCXp/WdYkTe9SUQ6A2D9BQOj+i4lP/dTViVNy8V4HSACrol1I6f
         40CuaiJi0WGzBnVFizTx5HQ12N0RklH/ADug9Td/sGgFmZVqzMFZWCV+W41YsWB9Q//f
         lNjaHHDHpXBmnJ0FW/G8XsefwdI4CTvJxOyywoGZtIpXCtcOBOYkTo7cc+8IrwP8YL4E
         X2ng==
X-Forwarded-Encrypted: i=1; AHgh+RoiKnc4Ur5ZXNRqOlTlhEj39/WGbDFblK3OcdCBj0GHZLlrW1wyJiC0q3toi9Y2k7TbMm+PBXDLRH7a@vger.kernel.org
X-Gm-Message-State: AOJu0YzyffTpBVFKWMdkBX3Sb4yzB/ROwY55Wu6Hc/sbch3cLwxozD53
	uA+Uqg5ED0bKQOSAs+WiOIAusLiQYkQU6jRtrhhhuo7n1PSvVLEda20Kdl84Nc6j9nUxmlz2HTP
	/X3Kz8snGAmZ5fQdzg1HU01fD0QD4E0w01InmBfev5OB55CYfquPnijHszUwoP4w0
X-Gm-Gg: AR+sD12YBarEq5wL5dTDM0zljmSZOsyd64rwOlzeNGlgvHHib7ER47YSDEWHFw+J0e9
	tIoa43nPjW2FuXND/UUlSbXcGL8QFuLT32Zgm8a849ulC/vtmAN4H/ut3Q0q/FC/aWqexMw0Wp8
	4PfgFp3fyW9USifvWzX+Y1JJXQG4kAPyDe9uKnAH9B2duNcvzq/F1wdebfSurWtFzv/eSfBMrT1
	awMyD9PCNmb4ODGxz34xpIEKZhhx7EdM25zAXlbt35olBCjGqCp74YBq73BzLnXprOPBAFiIYJY
	0Jp+xF6wOfwZFA9XIqgSZCODBlaVAzuYTW3JflwDfOvS0zjtIR+g9K463LAKkDj6sF3rouNxygZ
	MjNGqkQR3S2GTM72porN2gwR+GNgflPm8KW9tuhg/4tqcogeydYrf
X-Received: by 2002:a05:6a21:6e4a:b0:3b4:a0c0:6cb7 with SMTP id adf61e73a8af0-3cb859365c2mr5077717637.11.1785910049508;
        Tue, 04 Aug 2026 23:07:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e4a:b0:3b4:a0c0:6cb7 with SMTP id adf61e73a8af0-3cb859365c2mr5077624637.11.1785910048647;
        Tue, 04 Aug 2026 23:07:28 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe7092b0ddsm735861a12.30.2026.08.04.23.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:07:28 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:07:26 -0700
Subject: [PATCH v2] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-lpg-pwm-fm-support-v2-1-bc4d1041eeda@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB3TcmoC/22QzW6DMBCEXwX5XEf+AYM59T2qHPyzJq4AOzbQV
 hHvXkMi9VKtZGmk8Xw7+0AZkoeM+uqBEmw++zAXwd4qZG5qHgB7WzRihAnSsg6PccDxa8Juwnm
 NMaQFN46oWnBhuTWofIwJnP8+Qz+uT51X/QlmOZJejgT3tdCWp+0PVtgHSpDmRKVBYxPGkLBWo
 5oN4BKNO1ZzIWqptOP9Jo5IrTIU5zT5pa9oKxtnmdXQ1eBqyyXXQiqimeKat9R1lGgLDTrWu/m
 8hPRznmCj5zavtvK/thvFZUpZ0zIlJaPvIefLfVXjQb+UB133ff8Fi9buf1oBAAA=
X-Change-ID: 20260728-lpg-pwm-fm-support-5f0a4636d3dc
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785910047; l=11834;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=v5A35AsIX1FU9PnlCaxEuScG//lY3QWfODA5E4NAydQ=;
 b=ibviDp7swkrVgIvu07f5kv6ICqf75PzjRVaXUBWWdtv8hKtpK5lrGke6scHtFBiYVKQkoD4TJ
 i2xeLjuR5vnCy6Ye4VqJGe/f1sWWKBdD4PvDx40AVg2vdJ+6s8SpxDb
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfX7+52vkTPc3uY
 7wcSNtIMDOvxEE76Ru37Inay3UmjIYRu7EVZkeubxsEJ9NvLUshAvU429nIfzdOs3potOL5youq
 I8YqWuczMkzpJgr1BG+5Bnu0eQTJ6j+htZLgrPx0mh6M0zELcHS5HHOzhojLY8hEDsjG1bm6TcU
 fvkOkqFJObnXJTXG6s5EkQe25PI2os3lP4jfP1aYQ7ISDVo8P8ydZ2D1rEKevj997vNmlqGzjED
 CfgMsf9Jr7w6dbSrLfj3I4zOLUy0HFA8SpNQhUn7LzeUxxOpIpcTeET6IvWrxDqrqf/koUBTKcN
 5HS6u4w0gZqv7Lo7bMsGYG6uxrRrjih3BCrg/0SZA63LGUXVZhn9EINpevS2hdW1XQvSokhTbNs
 OIMStKuBu/+muTmbYZjWkVZ7CVkBmUyRzzmDnJv0s6BPphF8ZGSHa38Uza5pe9BjwNXX5tb6t66
 K45KDgEDkV6IQa81rJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfX/ZVxKxrxc2Eu
 4VqOaG4/dUPydS2XUjfRKTN/7+R3koRP1RTDnjrJ2wq4NWKKKarImMTpN6CRol2YY8nTBrCj1S5
 ZUgxFmbkmFdY9Ufm24K4zHk+sz1Cxao=
X-Proofpoint-GUID: -UiMjuXyGi3W87hzETW_fWB3g_gKKVgD
X-Proofpoint-ORIG-GUID: -UiMjuXyGi3W87hzETW_fWB3g_gKKVgD
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72d322 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=KiLQHq0dUJNUFEj8lKYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050045

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
Changes in v2:
- When assigning lsb/best_lsb value to period_actual, cast it to u64 1st then add 1.
- Link to v1: https://patch.msgid.link/20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com
---
 drivers/leds/rgb/leds-qcom-lpg.c | 199 +++++++++++++++++++++++++++++++++++----
 1 file changed, 183 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24b1f570f524..ab5b64b17afb 100644
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
+			period_actual = (u64)(lsb) + 1;
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
+	period_actual = (u64)(best_lsb) + 1;
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

