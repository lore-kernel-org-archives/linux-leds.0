Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417339;
	b=zV9YDRN9SSW3adsHqhOzujB7ARxBypSzpGN4Ek51PL8pl2iKXOv6E5Ryw36rE2N/V9PY
	 s3dyi1EeZ2dJmeF1+lcCo8hfOK8wY2C5q6oZZ+jYqjq8Ex3+C40FeG0bizGUJnSCYO80i
	 cUlCaJehYp31FS9KSOI+lp7929WwKlQqWron7xW82/ZW7nD7l9ilUfNFBQtnyHbGPphJn
	 Yko7GltVWyCgVUE2uLFbEacRItgVWAMlxNV8c8rtJ+BT85mgKH85gs+20bD+fFf/HoMx9
	 v/L+tVWnOatDWmpDYy4/eiijaSBXwI5wbqQ84vZt4lfEGY9H9g2cueVtAutuWofbRfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H3RRuKruS4sbW6PxIIqA3BjdncAT0rqRUpjZANWHHAk=;
	b=MnAdAG6EBdcPSGqgM6JdkyqS6zum/whJ/jUFDnMUILk/YebWEDYPBsLuBRZQ0Ph0654/
	 GDjvkl35GFoaZXdoJ+JSrttfuhTukLVlORlJGEb/R34mFn0OVllGBg1nw1QyzH6HJ4kwv
	 2t2Y5ubAJIWbgNeGpJqe3JVGTZINNvy2S+7ytbCju5cy1rI3yOrgyIVsTU6U/6T0WKczz
	 t1EYqNFNQt5WjoY0NTRRWPAmier4UpuLFaOMiELr1MWIWPmUzgeEU0zn2pqlVWBdAJEmf
	 vgqis627Oihe1XEBjzVT0VFgE3p+4WFZNMlELbzX8xvWM+BvVHbxJRZyTb4Erlc2WfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NAAMWHCc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrLkT79u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA88D606A32E
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 07:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA88D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NAAMWHCc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MrLkT79u
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN50w6v1960989
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 07:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3RRuKruS4sbW6PxIIqA3BjdncAT0rqRUpjZANWHHAk=; b=NAAMWHCcRtYmIfW8
	HbpkX57loywKY52GMVsv8E9byAtXUpYhGoWl02s7KM3+p30gj2peUY7l9rIFao66
	xthpJoRQhFZuATfYW+PmglKZQQGlQTAUIGz4HtklFHIT7HZ74wTL4wyJlxj/Yd4M
	gMcH4mW8UsxosPqIRipTE9JA9ua6ADEsS5FflGt85dt3XfgIK+aESqq1r0Loq2mV
	F2nbq5b3eAIlmfTaK0ToClq8sA59IDrQYXxTTkcKQ2aloE3REvB/42GE6kQ84joR
	W0A720VSMEA3j4lsqpoM3ni1fKPOmosmsnlUmqHX3gtTJL7KHAHSrh8OK7PEdm1t
	axT4Qg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6npj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 07:02:17 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-57289376805so3186000b6e.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 23:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795417337; x=1796022137; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3RRuKruS4sbW6PxIIqA3BjdncAT0rqRUpjZANWHHAk=;
        b=MrLkT79uE3OFIlVOa7Z6AFTDCOkslgGaXhpY0nrOwUYyyQJqPVY0PkEWKBsN/+qSEH
         9iP7iB3TjV+JyKXxRBCNPCWLBv7PjK788daMrl/aO40yN21QZa3yPDQ/SyQKGpGKWyxZ
         FzCFadE9VBTFMeHaiutgeWFqcUy8B9k7Pbiaps6w6grrdd1PDrktn5RKASM5SfVFxUx3
         48tqzjUd+wDCmWmBob4Zit7VNK8QagZygSrGzmhEL57yl6KQ11RZAmWpA5Jtma3VB+1x
         0BNrbQlPvStl68MjB2bIgOTYRIAsQG8PE7uLCt2rHO/2Etbv3ydeekVWjBLec6i2SFAW
         9cRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417337; x=1796022137;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3RRuKruS4sbW6PxIIqA3BjdncAT0rqRUpjZANWHHAk=;
        b=EforWjOD6umvsXyuBCO2eVgBejufEjrkngXDP6nAhlAdd6nsSvD65uDlDDaVRMvdM5
         jMqzOCh9XSaN3N3fHtcKeJMbDozHmSypCm50YYe4LFH+JSaVMUaS4riyCyp20v36lc3s
         TLxTt3QJQBn/r5MMWfNtydyZCSTbepjsm2nNEHhBnbNaGJ27qKvWCZIdbYMiYz7n4df7
         kPKSsstZF8yyIMEpEcaVE1Q8ZkNWE+Lm6XOPrtgaM0FAkOG7hNLyGxKthKa5rSxyVH9+
         6wSHNFjyUcxbkWrvgrAW0GuylHYEhjaF5kMKoyTEMSioX/Pa5oev6aXkC8VAhhi7jYMQ
         eSdw==
X-Forwarded-Encrypted: i=1; AL+hErFuxX3tOnqHeRcTBmWqdn7noCtt0JbcEnKHAZvIrckhuP8OWg7mHlNXtJYCsbJKZ9LjuOiPEc6sU+Ni@vger.kernel.org
X-Gm-Message-State: APuU4Z9xZe7kHWNIgZyAMOC72GjeSo1GdN40vCL/D8+F9Odgb2bnMkKd
	txy5lsQj/Ebfim0Lf5DcDPv8gskOLwVSLA22oT7XydTyoNclnSxvjTY3ZxYKy31Mz8lH7rc7/i/
	ULM5poxpP0mg2/8gVMk6TYJfEHkkGbzmOOPlUryLByuEAhV0opXtjFKsQtrCWEuhC
X-Gm-Gg: AZFdTZcqVnCx9FqGsfS1i3DLEqNdAl1JOWHAkMjzoyPQgWK3csTlAs+7/rB5j7xYzSt
	N+Yd1PxIDrU/Rx8mqGICeIV/8I4FqTpqXh/R23NXqGqQ566nnRSgoWi5QqyDbrkIZYVoGKdlXrZ
	RvWRYuh6ZGpt5mq6hsHLSbswV0kAEvRvKazEV4naJT8eAlXDRJjf+KTIhlVFE4isNP3oCvLhG8n
	d2I8pN9u9za5OX7/borN/uzUOaHefySSXRofFOomppjta6wdqvC6gFCwNB2EyFvUHCrlr2arNwS
	tzyXvA2VH7TvznZ193HVPCHPO1rZwB2k6sg/o5hmFsV2eLq0CxmgauvqkTgDCUPlsrmAQZYthRh
	02m2C7ReUbao3u9jCbW7K8KX5i6NQsz6cWFX92YJQAGGOZs9JCA8FNb+NnrcFcLMup0FMwhdz9A
	UCCBSqM2rGk2BNtcolQdJSWG7eZg==
X-Received: by 2002:a05:6808:6711:b0:4f5:4eb5:1cd3 with SMTP id 5614622812f47-57a0cdde540mr11145086b6e.61.1795417336755;
        Sun, 22 Nov 2026 23:02:16 -0800 (PST)
X-Received: by 2002:a05:6808:6711:b0:4f5:4eb5:1cd3 with SMTP id 5614622812f47-57a0cdde540mr11145042b6e.61.1795417336196;
        Sun, 22 Nov 2026 23:02:16 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8817213b6e.17.2026.11.22.23.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:15 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 23:02:06 -0800
Subject: [PATCH v3 4/4] leds: rgb: leds-qcom-lpg: Add PWM frequency mode
 support
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-4-f911edd40a31@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795417325; l=16928;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=HUEm9VB1XqHJunRn+djVse3CicVRWRJ34Gheyc0qcYM=;
 b=iEe/2zkd8tbHadRKxFACeQSngUBRpfHQp4LytOvP54cXHZCRBDJEnTZCfC3ByaOkIa2pNVfj5
 Fo8ye6zLjd8BIBRBvUmcuH7Widktej6WfNBWjIJKPEWmNMDioXzmLkv
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: SGsqkTlqhZSg6axR1re_XtiZhpsIN4YV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfXwduZm8dntrmz
 8iFpJ/XyUZzVmY4jPolyYD1oslDKzZzIX2BnM2xFJPBn2CQgWvayM9Q2De3D5UhZ2nNS8a1JEcp
 Q3CQu3LSNiacfWdblQ3L8bthteio6KU=
X-Proofpoint-ORIG-GUID: SGsqkTlqhZSg6axR1re_XtiZhpsIN4YV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX1a0MDx3I1+pr
 B5t5s1nJ7XCOgVR/7xk3TTybto7nS03edE8SCIWi+bn83WzTmRernT5rzLp0L3mxLnDLOPOP9oO
 UPnfY30BbfmXxGBpQHuvOvkMiTclHAHMD/w7r4XJSmRMdi/Ve0Lt6CfO3UiAqKq4KuvZho37YwC
 wbgsrQ9zNMIiLFgo6Uds+G8NnYndVM+CDMcEYA5KY+OH1GY10DencoJq2fUHhM65rIjI22iGyIl
 P8CVcGJ0GaQs53tZVoJvxju+d83DLHSDyDJsTObbYLtbGWJ6tstf6/7K7p6z2NnLFQeItJwAmzz
 ygpNcHlkIuzaUfXe/UqTbn37oAvCbZ04O0LpkDp6jy2vc2CISg6UIgzN62whu4HHjU0gGPC/Jk1
 Fbq7VMR0m30U8UccFmmi0SQrY+yAhNqk2afDglSuMkLgoK1prnX62ix73wYpRp+C+sNi3IgW96k
 p/bIPtyiCuJsQBhTKUA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03e4f9 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=NSaPA566YKEXnaOw_k0A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230027

Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
Mode (FM) that can generate waveforms with more frequency points than
the standard LPG PWM mode. The trade-off is that the duty cycle can
only be fixed at 50%. Add the FM support and try to use it when the
PWM channel is requested to set a duty cycle to exactly 50%.

Instead of always selecting the frequency mode which might generate
the PWM waveform with less timing accuracy, the Codex AI suggested
and implemented an update that compares the PWM period and duty timing
accuracy in standard PWM mode versus frequency mode, then selects
the better option.

The change was tested on the Maili QRD device with pmh0101 by exercising
the pwm4 channel with a fixed 50% duty cycle and a period range of 40us
to 55us in 0.5us steps, and confirmed in the log that correct frequency
mode configuration was selected.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 349 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 330 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 06588cd0b3ae..93aa0037d13e 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -22,6 +22,8 @@
 #define  LPG_SUBTYPE_PWM	0xb
 #define  LPG_SUBTYPE_HI_RES_PWM	0xc
 #define  LPG_SUBTYPE_LPG_LITE	0x11
+#define PWM_STATUS1_REG		0x08
+#define  PWM_FM_PRESENT		BIT(0)
 #define LPG_PATTERN_CONFIG_REG	0x40
 #define LPG_SIZE_CLK_REG	0x41
 #define  PWM_CLK_SELECT_MASK	GENMASK(1, 0)
@@ -43,6 +45,10 @@
 #define PWM_SEC_ACCESS_REG	0xd0
 #define PWM_DTEST_REG(x)	(0xe2 + (x) - 1)
 
+/* offset 0x50: PWM_FM_MODE_REG on LPG_SUBTYPE_PWM */
+#define PWM_FM_MODE_REG		0x50
+#define  PWM_FM_ENABLE		BIT(7)
+
 #define SDAM_REG_PBS_SEQ_EN		0x42
 #define SDAM_PBS_TRIG_SET		0xe5
 #define SDAM_PBS_TRIG_CLR		0xe6
@@ -111,6 +117,8 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @freq_mode_capable: hardware supports Frequency Mode
+ * @enable_freq_mode: set the period using Frequency Mode
  * @has_lut: channel uses the associated LUT allocation
  */
 struct lpg_channel {
@@ -148,6 +156,8 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+	bool freq_mode_capable;
+	bool enable_freq_mode;
 	bool has_lut;
 };
 
@@ -249,11 +259,13 @@ struct lpg {
  * @sdam_offset:	Channel offset in LPG SDAM
  * @base:		base address for PWM channel registers
  * @triled_mask:	bitmask for controlling this channel in TRILED
+ * @freq_mode_capable:	channel hardware supports Frequency Mode
  */
 struct lpg_channel_data {
 	unsigned int sdam_offset;
 	unsigned int base;
 	u8 triled_mask;
+	bool freq_mode_capable;
 };
 
 /**
@@ -450,6 +462,116 @@ static const unsigned int lpg_pre_divs[] = {1, 3, 5, 6};
 static const unsigned int lpg_pwm_resolution[] = {6, 9};
 static const unsigned int lpg_pwm_resolution_hi_res[] = {8, 9, 10, 11, 12, 13, 14, 15};
 
+/*
+ * Compare exact physical durations without rounding to whole nanoseconds.
+ * Return positive if the candidate is longer, negative if the best is longer,
+ * and zero if both durations are equal.
+ */
+static int lpg_pwm_compare_candidate_duration(u64 candidate_duration_numerator,
+					      unsigned int candidate_clk_rate,
+					      u64 best_duration_numerator,
+					      unsigned int best_clk_rate)
+{
+	u32 candidate_remainder;
+	u32 best_remainder;
+	u64 candidate_whole_ns;
+	u64 best_whole_ns;
+	u64 candidate_fraction;
+	u64 best_fraction;
+
+	candidate_whole_ns = div_u64_rem(candidate_duration_numerator,
+					 candidate_clk_rate,
+					 &candidate_remainder);
+	best_whole_ns = div_u64_rem(best_duration_numerator, best_clk_rate,
+				    &best_remainder);
+	candidate_fraction = (u64)candidate_remainder * best_clk_rate;
+	best_fraction = (u64)best_remainder * candidate_clk_rate;
+
+	if (candidate_whole_ns != best_whole_ns)
+		return candidate_whole_ns > best_whole_ns ? 1 : -1;
+
+	if (candidate_fraction != best_fraction)
+		return candidate_fraction > best_fraction ? 1 : -1;
+
+	return 0;
+}
+
+/*
+ * Period calculation for PWM working in Frequency mode:
+ *
+ *          (pwm_value + 1) * 2^(exponent + 1) * NSEC_PER_SEC
+ * period = --------------------------------------------------
+ *                            clock_rate
+ *
+ * The duty cycle is fixed at half of the period.
+ */
+#define PWM_FM_PERIOD_NUMERATOR(exponent, pwm_value) \
+	(((u64)((pwm_value) + 1) << ((exponent) + 1)) * NSEC_PER_SEC)
+
+static int lpg_calc_freq_in_freq_mode(struct lpg_channel *chan, u64 period_ns, u64 duty_ns)
+{
+	unsigned int best_clk_sel = 0;
+	unsigned int best_pwm_exp = 0;
+	unsigned int best_pwm_value = 0;
+	u64 best_period_numerator = 0;
+	u64 max_period_ns;
+
+	max_period_ns = div_u64(PWM_FM_PERIOD_NUMERATOR(LPG_MAX_M, U8_MAX),
+				lpg_clk_rates[1]);
+	period_ns = min(period_ns, max_period_ns);
+	duty_ns = min(duty_ns, max_period_ns / 2);
+
+	for (unsigned int clk_sel = 1;
+	     clk_sel < ARRAY_SIZE(lpg_clk_rates); clk_sel++) {
+		for (unsigned int pwm_exp = 0; pwm_exp <= LPG_MAX_M; pwm_exp++) {
+			u64 duty_counter_length;
+			u64 counter_length;
+			u64 period_numerator;
+
+			counter_length = div64_u64(period_ns * lpg_clk_rates[clk_sel],
+						   (u64)NSEC_PER_SEC << (pwm_exp + 1));
+			duty_counter_length = div64_u64(duty_ns * lpg_clk_rates[clk_sel],
+							(u64)NSEC_PER_SEC << pwm_exp);
+			/* The counter must satisfy both period and fixed 50% duty bounds. */
+			counter_length = min(counter_length, duty_counter_length);
+			counter_length = min(counter_length, (u64)U8_MAX + 1);
+			if (!counter_length)
+				continue;
+
+			period_numerator =
+				PWM_FM_PERIOD_NUMERATOR(pwm_exp, counter_length - 1);
+			/*
+			 * All candidates are within the requested bounds, so the
+			 * longest period has the smallest timing error.
+			 */
+			if (!best_clk_sel ||
+			    lpg_pwm_compare_candidate_duration(period_numerator,
+							       lpg_clk_rates[clk_sel],
+							       best_period_numerator,
+							       lpg_clk_rates[best_clk_sel]) > 0) {
+				best_clk_sel = clk_sel;
+				best_pwm_exp = pwm_exp;
+				best_pwm_value = counter_length - 1;
+				best_period_numerator = period_numerator;
+			}
+		}
+	}
+
+	if (!best_clk_sel)
+		return -EINVAL;
+
+	chan->clk_sel = best_clk_sel;
+	chan->pre_div_exp = best_pwm_exp;
+	chan->pwm_value = best_pwm_value;
+	/* Frequency mode does not use PRE-DIV and PWM resolution settings. */
+	chan->pre_div_sel = 0;
+	chan->pwm_resolution_sel = 0;
+	chan->period = DIV_ROUND_UP_ULL(best_period_numerator,
+					lpg_clk_rates[best_clk_sel]);
+
+	return 0;
+}
+
 static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
 {
 	unsigned int i, pwm_resolution_count, best_pwm_resolution_sel = 0;
@@ -577,6 +699,112 @@ static void lpg_calc_duty(struct lpg_channel *chan, uint64_t duty)
 	chan->pwm_value = min(val, max);
 }
 
+static u64 lpg_pwm_duration_numerator(const struct lpg_channel *chan, bool duty_cycle)
+{
+	unsigned int resolution;
+	unsigned int pwm_value;
+
+	if (chan->enable_freq_mode) {
+		u64 period_numerator;
+
+		period_numerator = PWM_FM_PERIOD_NUMERATOR(chan->pre_div_exp, chan->pwm_value);
+		return duty_cycle ? period_numerator / 2 : period_numerator;
+	}
+
+	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM)
+		resolution = lpg_pwm_resolution_hi_res[chan->pwm_resolution_sel];
+	else
+		resolution = lpg_pwm_resolution[chan->pwm_resolution_sel];
+
+	pwm_value = duty_cycle ? chan->pwm_value : BIT(resolution) - 1;
+	return (u64)NSEC_PER_SEC * pwm_value * lpg_pre_divs[chan->pre_div_sel] *
+		BIT(chan->pre_div_exp);
+}
+
+static bool lpg_pwm_config_has_smaller_timing_error(const struct lpg_channel *candidate,
+						    const struct lpg_channel *best)
+{
+	const unsigned int *clk_rates;
+	unsigned int candidate_clk_rate;
+	unsigned int best_clk_rate;
+	u64 candidate_duration_numerator;
+	u64 best_duration_numerator;
+	int period_comparison;
+	int duty_comparison;
+
+	clk_rates = candidate->subtype == LPG_SUBTYPE_HI_RES_PWM ?
+		lpg_clk_rates_hi_res : lpg_clk_rates;
+	candidate_clk_rate = clk_rates[candidate->clk_sel];
+	best_clk_rate = clk_rates[best->clk_sel];
+
+	/*
+	 * Both configurations are within the requested bounds, so the longer
+	 * period has the smaller error. Use duty only to break a period tie.
+	 */
+	candidate_duration_numerator =
+		lpg_pwm_duration_numerator(candidate, false);
+	best_duration_numerator =
+		lpg_pwm_duration_numerator(best, false);
+	period_comparison =
+		lpg_pwm_compare_candidate_duration(candidate_duration_numerator,
+						   candidate_clk_rate,
+						   best_duration_numerator,
+						   best_clk_rate);
+	if (period_comparison)
+		return period_comparison > 0;
+
+	candidate_duration_numerator =
+		lpg_pwm_duration_numerator(candidate, true);
+	best_duration_numerator =
+		lpg_pwm_duration_numerator(best, true);
+
+	duty_comparison =
+		lpg_pwm_compare_candidate_duration(candidate_duration_numerator,
+						   candidate_clk_rate,
+						   best_duration_numerator,
+						   best_clk_rate);
+
+	return duty_comparison > 0;
+}
+
+static int lpg_calc_pwm_state(struct lpg_channel *chan,
+			      const struct pwm_state *state)
+{
+	struct lpg_channel standard = *chan;
+	struct lpg_channel frequency = *chan;
+	u64 half_period_ns = state->period / 2;
+	int ret;
+
+	standard.enable_freq_mode = false;
+	ret = lpg_calc_freq(&standard, state->period);
+	if (!ret)
+		lpg_calc_duty(&standard, state->duty_cycle);
+
+	if (chan->freq_mode_capable &&
+	    (state->duty_cycle == half_period_ns ||
+	     state->duty_cycle == half_period_ns + (state->period & 1)) &&
+	    !lpg_calc_freq_in_freq_mode(&frequency, state->period,
+					 state->duty_cycle)) {
+		frequency.enable_freq_mode = true;
+		if (ret) {
+			*chan = frequency;
+			return 0;
+		}
+
+		if (lpg_pwm_config_has_smaller_timing_error(&standard, &frequency))
+			*chan = standard;
+		else
+			*chan = frequency;
+
+		return 0;
+	}
+
+	if (!ret)
+		*chan = standard;
+
+	return ret;
+}
+
 static void lpg_apply_freq(struct lpg_channel *chan)
 {
 	unsigned long val;
@@ -817,11 +1045,50 @@ static void lpg_apply_dtest(struct lpg_channel *chan)
 		     chan->dtest_value);
 }
 
-static void lpg_apply(struct lpg_channel *chan)
+static int lpg_apply_freq_mode(struct lpg_channel *chan)
 {
+	struct lpg *lpg = chan->lpg;
+	bool enable_freq_mode = false;
+
+	if (!chan->freq_mode_capable || !chan->enabled)
+		return 0;
+
+	if (chan->enable_freq_mode && chan->enabled)
+		enable_freq_mode = true;
+
+	return regmap_update_bits(lpg->map, chan->base + PWM_FM_MODE_REG,
+				  PWM_FM_ENABLE,
+				  enable_freq_mode ? PWM_FM_ENABLE : 0);
+}
+
+static int __lpg_apply(struct lpg_channel *chan, bool check_freq_mode)
+{
+	bool enable_freq_mode = chan->enable_freq_mode && chan->enabled;
+	unsigned int val;
+	int ret;
+
 	lpg_disable_glitch(chan);
+
+	if (check_freq_mode && chan->freq_mode_capable) {
+		ret = regmap_read(chan->lpg->map,
+				  chan->base + PWM_FM_MODE_REG, &val);
+		if (ret)
+			goto out_glitch;
+
+		if (!!(val & PWM_FM_ENABLE) != enable_freq_mode) {
+			ret = regmap_update_bits(chan->lpg->map,
+						 chan->base + PWM_ENABLE_CONTROL_REG,
+						 LPG_ENABLE_CONTROL_OUTPUT, 0);
+			if (ret)
+				goto out_glitch;
+		}
+	}
+
 	lpg_apply_freq(chan);
 	lpg_apply_pwm_value(chan);
+	ret = lpg_apply_freq_mode(chan);
+	if (ret && check_freq_mode)
+		goto out_glitch;
 	lpg_apply_control(chan);
 	lpg_apply_sync(chan);
 	if (chan->lpg->lpg_chan_sdam)
@@ -829,6 +1096,17 @@ static void lpg_apply(struct lpg_channel *chan)
 	else
 		lpg_apply_lut_control(chan);
 	lpg_enable_glitch(chan);
+
+	return 0;
+
+out_glitch:
+	lpg_enable_glitch(chan);
+	return ret;
+}
+
+static void lpg_apply(struct lpg_channel *chan)
+{
+	__lpg_apply(chan, false);
 }
 
 static void lpg_brightness_set(struct lpg_led *led, struct led_classdev *cdev,
@@ -1433,28 +1711,30 @@ static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 {
 	struct lpg *lpg = lpg_pwm_from_chip(chip);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
+	struct lpg_channel config;
 	int ret = 0;
 
 	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
-	mutex_lock(&lpg->lock);
+	guard(mutex)(&lpg->lock);
 
+	config = *chan;
+	config.enable_freq_mode = false;
 	if (state->enabled) {
-		ret = lpg_calc_freq(chan, state->period);
-		if (ret < 0)
-			goto out_unlock;
-
-		lpg_calc_duty(chan, state->duty_cycle);
+		ret = lpg_calc_pwm_state(&config, state);
+		if (ret)
+			return ret;
 	}
-	chan->enabled = state->enabled;
 
-	lpg_apply(chan);
+	config.enabled = state->enabled;
+	ret = __lpg_apply(&config, true);
+	if (ret)
+		return ret;
 
-out_unlock:
-	mutex_unlock(&lpg->lock);
+	*chan = config;
 
-	return ret;
+	return 0;
 }
 
 static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
@@ -1462,8 +1742,10 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 {
 	struct lpg *lpg = lpg_pwm_from_chip(chip);
 	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
+	bool freq_mode_enabled = false;
 	unsigned int resolution;
 	unsigned int pre_div;
+	unsigned int clk_idx;
 	unsigned int refclk;
 	unsigned int val;
 	unsigned int m;
@@ -1477,7 +1759,7 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		return ret;
 
 	if (chan->subtype == LPG_SUBTYPE_HI_RES_PWM) {
-		unsigned int clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
+		clk_idx = FIELD_GET(PWM_CLK_SELECT_HI_RES_MASK, val);
 
 		if (clk_idx >= ARRAY_SIZE(lpg_clk_rates_hi_res))
 			return -EINVAL;
@@ -1485,7 +1767,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		refclk = lpg_clk_rates_hi_res[clk_idx];
 		resolution = lpg_pwm_resolution_hi_res[FIELD_GET(PWM_SIZE_HI_RES_MASK, val)];
 	} else {
-		refclk = lpg_clk_rates[FIELD_GET(PWM_CLK_SELECT_MASK, val)];
+		clk_idx = FIELD_GET(PWM_CLK_SELECT_MASK, val);
+		refclk = lpg_clk_rates[clk_idx];
 		resolution = lpg_pwm_resolution[FIELD_GET(PWM_SIZE_SELECT_MASK, val)];
 	}
 
@@ -1501,9 +1784,28 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 		if (ret)
 			return ret;
 
-		state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * ((1 << resolution) - 1) *
-						 pre_div * (1 << m), refclk);
-		state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC * pwm_value * pre_div * (1 << m), refclk);
+		if (chan->freq_mode_capable) {
+			ret = regmap_read(lpg->map, chan->base + PWM_FM_MODE_REG, &val);
+			if (ret)
+				return ret;
+
+			freq_mode_enabled = !!(val & PWM_FM_ENABLE);
+		}
+
+		if (freq_mode_enabled) {
+			u64 period_numerator;
+
+			pwm_value &= 0xff;
+			period_numerator = PWM_FM_PERIOD_NUMERATOR(m, pwm_value);
+			state->period = DIV_ROUND_UP_ULL(period_numerator, refclk);
+			state->duty_cycle = DIV_ROUND_UP_ULL(period_numerator / 2,
+							     refclk);
+		} else {
+			state->period = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
+					((1 << resolution) - 1) * pre_div * (1 << m), refclk);
+			state->duty_cycle = DIV_ROUND_UP_ULL((u64)NSEC_PER_SEC *
+					pwm_value * pre_div * (1 << m), refclk);
+		}
 	} else {
 		state->period = 0;
 		state->duty_cycle = 0;
@@ -1691,7 +1993,8 @@ static int lpg_init_channels(struct lpg *lpg)
 {
 	const struct lpg_data *data = lpg->data;
 	struct lpg_channel *chan;
-	int i;
+	unsigned int status;
+	int ret, i;
 
 	for (i = 0; i < data->num_channels; i++) {
 		chan = &lpg->channels[i];
@@ -1703,6 +2006,14 @@ static int lpg_init_channels(struct lpg *lpg)
 		chan->sdam_offset = data->channels[i].sdam_offset;
 
 		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
+
+		if (chan->subtype == LPG_SUBTYPE_PWM && data->channels[i].freq_mode_capable) {
+			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
+			if (ret < 0)
+				return ret;
+
+			chan->freq_mode_capable = !!(status & PWM_FM_PRESENT);
+		}
 	}
 
 	return 0;
@@ -2029,7 +2340,7 @@ static const struct lpg_data pm8350c_pwm_data = {
 		{ .base = 0xe800, .triled_mask = BIT(7), .sdam_offset = 0x48 },
 		{ .base = 0xe900, .triled_mask = BIT(6), .sdam_offset = 0x56 },
 		{ .base = 0xea00, .triled_mask = BIT(5), .sdam_offset = 0x64 },
-		{ .base = 0xeb00 },
+		{ .base = 0xeb00, .freq_mode_capable = true },
 	},
 };
 

-- 
2.43.0

