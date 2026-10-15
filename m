Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA13A416872
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093677; cv=none; b=ahzrFaNBiD9GVHdFLQ7Z4KCIs+4jTvuj9JlJOrIMcwRXWPEjpV4O6RCB5U5/GT7XK0/55I1hx1W4DQkl6hdhoqNodrEJXjR8jVmAoxXhMLQc4vSAbeiKBoMEtEQT8I8O9JbqH7Hqf66FkJLdofxM7PqPCyJ0kqkJXVIkzPks8wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093677; c=relaxed/simple;
	bh=qFFJoTb3nSIwO16p02ugqs110utzgGRrGhD6kFiWYAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDTpwWT0xpLQqxAjg8PCc4L9yiehi5sldx48szule32y1ELlt5H1LPR5/F0mSyFNN3pdpEWIgBsHTQ4a6ZmrJh8b/2cpMw80hk1dg67OGdxOrlfgzK5kF+apNJgZg/HbP3uRUOFAG8cHbIvLRVvcmYEZQUmmgO1IGXeMfw3atMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXGvTxvZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0VdDo12; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXGvTxvZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0VdDo12"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FI3qLT3902412
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tthqinjGo+c
	QYBpFVofOLlCbpS2sIE/5ejUO/Scun3A=; b=oXGvTxvZ/NXDFHECrfJAJcfJak1
	oPzRkHvsFkm7dNv6a8l22A30v8u4FABKZo6gbQZb3JslwRGMf13vkNPU1I/bh8wo
	4y+XDd1AxMc4J2+2lgvYCVUdPE4hGfnM9DDd1Lyy+Sn5c7oijsCzBhpVkd4t2PgS
	K9m5/45XuAUu7Mg0zEisuidxcQdIHgGyWNE1gkG7IX1kREfIwiZm0cO3C1KM+5ad
	2VzZtKJPTjHt8VN2jHIpamO2fgzry6MqHqVnhPFePJVdGKwM1p5oD1zLnhRR/LGm
	2SrxTrwaKyJcxRuRyryxDOFElTWLU+F25ewj7QXtbeTLdgleFU5TVNceIqA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3serbk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so374245985a.0
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093674; x=1792698474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tthqinjGo+cQYBpFVofOLlCbpS2sIE/5ejUO/Scun3A=;
        b=Z0VdDo12tUsRThJ1eraqQOy7Of6zwTzNJGEJTmnFWA3l7y2kpqKj7Vf8M+1w3tYxtR
         Q09/52igjpqjRF3V8zKMMOddEpl+57evNrZvnvy+9ShA0QTJjqITy9CpATAWd7bOWXww
         JG6Rua1c4991ZlU2r99qSTbg16YMPXa6Q5K6wS0v6kbRA0vOKGyPw3OO3OZvVqiyGYwz
         7hxqMEFDT8nQfvGjbI2GytksghLcUH1U9U2eAGnksR1ZSstCIq2Czja7pShoCKKigS87
         rpFqowRbzyEJXg28aTD8iqDPeKo1fM7x4SZE38j8KbZtHxsYi0dtJOtyxcfyp9PEn/HA
         T92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093674; x=1792698474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tthqinjGo+cQYBpFVofOLlCbpS2sIE/5ejUO/Scun3A=;
        b=H3pAgUU4r68pKfex1Ejz+mcjjHcAz09gVBClZF1GbMsgF23iiY4E5XUT1Mki8K5Xje
         A301TaVzBmPH+ZI3qSvSDPPpR3fg8axk0WmlfdFXA/fpnyZZWlh9RmROstAhin8gM+1K
         uOWUEmUngJXD9w49RMpWcptDymXTx5e/QLZSAL7klTUWahNvP6A1mVwhSBi5gP9Nm6JG
         Fb/XFsGmgpt0alGsS937QicDiSta5+quKV6h+cRx32di/AGe/uQqEWJ6/XdqdME2ZYj1
         M5DUYbzW21PEKRB0i3dI0esWMIrlA+eOi9NlVl4MtL3oVX8i9MDPEkPVVSC6e7EWJOGn
         hmjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAac8N6rekyskjA4vgkfQe/aJHQVonR8kanjxK0CziYFtLJQoPdkSSCvXJqrmV+xixmdi/MnZTDLps@vger.kernel.org
X-Gm-Message-State: AFq9FYI5k1JczqIiV94Ki9gXWn7n8+Di6T5t/CImwlcUhW2OInjgDbqf
	Ax8QuOMSR+fc2COEyPrm04xxDNJLAKWOZ7QU59Xs2cD4jX3pEO2ueJlqZIsryUafziVlfimozF5
	i0PUNQxQlOkD5bKv12o4NxRm7cZRw4Iqe+K84h9cffDn4CiqX3OKaOzmsBPprk1dJ
X-Gm-Gg: AYBFou2eY99ESye5/gGECL/otjAutflT46x+odeS9xknIQtmrqPody0/1oxEe6BJw2W
	gBDZTFKkJAPkGr/gI4+JnsbD/5a+D7zotrMgZMiS2UJqezF3CDHN3tL/9kGegzrQ1959t/b5HMh
	jmlOrox2WS/LDH+9G8WuuI7QfePV947tp+FDlGbPLdcwB0yrjIczpuPnseJBmPl+TaVHKb2MGq4
	iM7CtIKsf7eXwrnrXzyX8spjfQRdZO+eE7UMnxpT2EZcFdPgRERY7rczFuNdyqXJtw/TLrzYjQ4
	G5HJelyw2gOgXw7mBMr74pcGvUHsaNZZmEWcqZJLxC6ogEJVGFA8x6JRX42N8NBDHR+o84OHv8R
	LGFTl2sBCDD0R
X-Received: by 2002:a05:620a:2621:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93ebd22481emr3504841185a.27.1792093673978;
        Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:939:7fc4:fb1a with SMTP id af79cd13be357-93ebd22481emr3504837285a.27.1792093673548;
        Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Thu, 15 Oct 2026 20:47:28 +0100
Message-ID: <20261015194732.64428-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: NBzHL1UkcQFOTQmUiIHsiCcN3CdYxmIS
X-Proofpoint-GUID: NBzHL1UkcQFOTQmUiIHsiCcN3CdYxmIS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX8F5NfAY1utpJ
 McWjMaVEl/jbFhAFpJuL35xYEaQ1/3K+GTBSCV6QHdJJGmeVzHQwTsOqDdHPQPGD2bbap5aGtcn
 lt1FaCzk8mLM5acTTbxSWH8F7lxAUj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfXxTGuc3Os8Orc
 cLwOA5zvazKf6oMLfiOfSfVwMBmjuUDDzgmFq8i8zIAKIGc/zAjNhPokTRZPlRVYsRXqUWTMKMj
 UxuqziGAU2v03hVX9MfDFMWX68g2h5xqQBpBE02qLLBgosQO0yp8RLaIAzOMjv6s2/wVsIsRJDD
 PVWkUAm9Ny2oOyOG+nX1d4pzpSFuL8APdbGEV/TY0DILQ5nT3P8Z+YaOvirWzUBFmilUqEljtZt
 yP88GHwb4soD7p35NZn2JUo+y0w+F9Hc2eRdJIfDx/mU6IKgRUyXzIeAchdrev0Qn08VOzNeVjg
 h4TWpnC0FHYIa1yUM+SMfCEhPsdnPhRpYOfvZVLmTCwYpaE/cwY6QdX2Xq4zdE7SO1dl60hSdoG
 xmST1sbWkpy4n2flOD0daOPix/mqav7XkiqEr6EbsXZVwVwqkaVlPFnewwPAsl/6QHzlm9yFQh3
 1cJIP96fLVzLRTbs3zg==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad12dea cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=nXq7z_EH6Q6EphABe4AA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 and reuses the same
programming model.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..db30dd3dfc9f 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,pmi8994-lpg
           - qcom,pmi8998-lpg
           - qcom,pmk8550-pwm
+          - qcom,pmk8850-pwm
       - items:
           - enum:
               - qcom,pm6150l-lpg
@@ -161,6 +162,7 @@ allOf:
               - qcom,pmi8994-lpg
               - qcom,pmi8998-lpg
               - qcom,pmk8550-pwm
+              - qcom,pmk8850-pwm
     then:
       properties:
         nvmem: false
-- 
2.53.0

