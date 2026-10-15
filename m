Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3C43F4BB
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093679; cv=none; b=rFDolTFal/lZTA6LjNj5FMaGvGj4MJOZ+CU0uQpkdyS+k/O5MZDOTefwGnwTQiJPbaDduLaalKx5w9AH0QRJC06yWK3j57J79jKG4hbToyZuVy2+y4TSIu0P10nask+/Mw73xHwccGoiaRFarxAd4aec5l0VUiAR3SwZuvcGd2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093679; c=relaxed/simple;
	bh=OGpe59J1qKtUFqCU+E7+QmVCO/53r56q4vFIjT3Ui1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QAC96UP2ZCtWlRinNBofrF9De9W3xdcCmlVzo3EjRLyG4WVgIs+b8VDQZ3YPYGC6FuAzpGT/MeXCY1e7dH3DON8AW/+iFasfNOqAOVQbY5yVYw83yfUJ6diRJBbpYdk6BNagTvE8chXLoQd3cJcFoi2/Q2YokwJYRR+EEI4PHio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cZjEoK48; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAxgbsN/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cZjEoK48";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAxgbsN/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FI3qLU3902412
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6q3S3XwD3ss
	KNTNzg+SEXrc734GFwZ80COO3a8rdsI8=; b=cZjEoK48lWk7wepcehAUJRrbnyJ
	a1/4Zso2ZJYgbTNc9xl4/aKdz1y7YWA/TvmG++4IijvmmQGTgIHAyiwAMtQXSRo1
	HNCSsA9c0R/U7tEYNmsXaMC4obIuZDJizcFnN09NKmFDInDc9/+b3kdabJJox+1G
	v0RNRPTzKxdXXqBawtIstdLW7Au7l/FPxGDeRO7sDdNQ8rD6vJYpxi2lJOgFSyXx
	XYrP3WJPKrY0g8FOEDxiXYbngb8J+dUgMlKx2aXcM/2zFgZUMnTQ5GO50gi9UY8S
	kT/KryFVABeosVQybw095uo+29YAsI5Gsc4cNZ3sihMGGGoprGOBzVrB/8Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3serbkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso1042457685a.0
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093676; x=1792698476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=NAxgbsN/NpWfTUIZSMw3cH6CkMNsOb2Af8tK1xVkEACEsZGupw6x6RJBXey5vh9HN3
         cDRQd1qpp6kUnuct+SrZipO41cVDVx5lbQwmgKenjIeLDE/Nz6Bl6vWlmxG0dby85qhi
         XV0yjSfeUgIyrMhnHN13XzG6rbBSlhM7wAKpcGeVo+gPTwT9DSFED7cf1rZhUSNXZeEj
         /EiY6zUz347I3FrlAcNt/IPYoeGTHEYmzWzXrZRtaGmB1jUKtvhjg39/I1JDLB0tw8Le
         Mz2NtoLzRPVy5oD8+Q95Hw3lvZ3yvjU4XOrPpUkDlLj7NCnQHCnw63Sj4hQD03DjJyLS
         JB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093676; x=1792698476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6q3S3XwD3ssKNTNzg+SEXrc734GFwZ80COO3a8rdsI8=;
        b=U0guOfMjeaw9E80SetF1ra21v9LWmAzJ7usigANW1zeEc1k0WObCXEz3lvgnYj9e5+
         miIV3yH53GWjsQZtR3tP8jaidK0t/xv9JaTUOVa08kVRXgiCjzQd8S89tQH4boRntgI3
         ibbWhUSL2uZKqjQUn0cEF2N22Iy5NfBe/CKSdE7aEKPTVIeIEfMl1qF1/JxYJdYBLjHe
         +RvdDAuJRnXWGqWZbADww5ljzdilv8e9sPKgrw3WfdB4svxdEDgMrMXvwtGokd9H9Y+B
         uE+O/Cz9Je8R7u3wkuxV2CxuFKZZ5DVzHSkPo1UAprulGqDdeZxgkP9K9KP/HG/xotoN
         Gsow==
X-Forwarded-Encrypted: i=1; AKwUvBzVPUBm4TK3MgPN1U1CFGPvil7YJC4fq6lN62i9sGtlndcEoT7qVd+VhuJBDtKSln+3iHJB+pQ/TwC3@vger.kernel.org
X-Gm-Message-State: AFq9FYISt+Rty/Ifobawjpa5D0emTSCkNDY19TMImbVr7G9idT1cboQc
	GgK2NLjnE8Z2nL+yCH+06sXaJzTB6PLal19hsCJsFJ3Vz1sgzmgzWVTMrjF/Vl08U0S1Vuwr3iY
	zPJclWRy6AaIs+rh9oStkRKCURhITcXHONHzVhIIz6f/k9LfQnZxZN6NxYztTI4Xh
X-Gm-Gg: AYBFou3ggK+ayACfzv4elRoAh9YUDeq1g8Tm4khe6ZtGPjl+zQaGLvjpdygWqIFCU6P
	G4twE/Hr3Hc+Q1s9SGp0Zx3ESVLiq6jN1cpiyCzbmBzhXw0VE/I5nI0mXff3iLDiP9yoxcLJ/Ne
	NMQLWEyyfmihMiALKMtTmtpnJlONMyZRBN0kdq1HsHeflMOmNc+J/mJyCH8n8rpj3vhQIvHHFP7
	01naZFQXzA6tCsc/yWBIuJwj3u9xWK4imeqwumUtvMcwC9Pw4JlFg5neC1biXVIzgg6u4DEe4eW
	ycEd7NCeSY+VSoYVYWL4aDoKm9xHsfPGAGzcp8EQhCkCtkzoNzwcBc0vairGCASfFn+Ao5RitMi
	noyzvG5lNtegu
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604371985a.41.1792093676406;
        Thu, 15 Oct 2026 12:47:56 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:93e:4594:f5ce with SMTP id af79cd13be357-93ebd22590amr3604366385a.41.1792093675818;
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Thu, 15 Oct 2026 20:47:29 +0100
Message-ID: <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z5ukmtX_oMBnXHDH-BbzubMapX6DJ_cj
X-Proofpoint-GUID: z5ukmtX_oMBnXHDH-BbzubMapX6DJ_cj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfXxEUjt8lURgTY
 YxMB6zj77SPpUcyQFF+MjMC74MfBPkApwzDg79poCQ6i2RMrzipXPSly55YkunZnZtxgrVlnRo/
 S3jbh3ZHod+kYsunhJMr8BLpMlvibHc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX3EgsgoPY4+VC
 pZGo2H4q6AtVXPA2ddpMFUTwsA8dtau8xf6Hkr49KyY5t782ZmWY39kCuhfweLAeXhIDxip3R9l
 YVSrKXrDyn5y2zcR+EnX3Id2hW9cJsJEF5cKvlK0OIULGtsvKgcJj5wdBS/RfcXmcTV/U2/Bv72
 /mHqyYX6LmEN+GjucOQsk8mybr6MOVXV5Twa15T3kQ2upcc4XFbNKTa/JwokvscuANtq1aJcAcf
 RyphAvyXQT6rdLk2fHE0bFOPGMak/hRr7P9rB8LBGCrtQMdnfzbiNOqeC0CbnjCl1UexCHKiduE
 XdbKRYxyi2fBn1DcKEZ+kldb4QDRjFqeGZ/DKJX/tJyjEVglYaWPBUq/BhVTdUWuVE1MHhxg7dn
 KQUI14iefYGpIQdtz7Shxpnp1UqA/OJOnwF9rHvOgzwNCjtU9Mc/Oj/zMZtjAdSTUUoBqEHKutX
 c4dowOA/+1aHLzqmVpA==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad12ded cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QIIdgxlFtvIS5BbdDE4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
reuse pmk8550_pwm_data.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..485fa2a7a848 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
 	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
 	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
 	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
+	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lpg_of_table);
-- 
2.53.0

