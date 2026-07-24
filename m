Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB537DADD
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879303; cv=none; b=BzT/15ITEYtFOfC3+p6erfa/XcqnTcCfZkqeIk+P/c7AVIoYPO4/phyPFOkCrG5k4kzBeEDeRSPHFfWfcdVvHBIOyfv9yVJGSrmWisB29b6ogfasAZCmLHnbBi0oFbzVpZOQIr771gDN4MeFMWNsvyFB69+vMRWoqThF6SpIpGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879303; c=relaxed/simple;
	bh=d09lYffK7NKQtWks133wtN3qnkJ/qWtJQRxHm1karAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiLns79mr1WiSA9ufBOUiYazzydCe86RG6sNtfU5smLdeDtF9DsN3B+27jhFIYXxsNW+ts1hoG1Px+d7lc8v3sYAbI/OkaFDYvYkL+VlO2w0yB/oG/GxdYH4gFLguKGinC6YPdqy9DWNRERF7XbR6iI76ViwoD8Qvz+dHF1J1RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPDv5Ihq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSq+IU1o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPDv5Ihq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSq+IU1o"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lX022125268
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=; b=BPDv5IhqRz24VEPV
	Z8D6jAwAVmRHskvEeR/zbjVpWAQMrMnl3/Kkv8GctaRTnGvYHQ6dt8BYUULR1MoJ
	W07bj/3/zZIgIgptMdTzszxj5RpbOpOW1AR1bLrxRkNciJWTH/jPOYprT9Wv3q2g
	5xL1dLWxsLG07V1vqzH8Fm4BBlO9XMa59QASARgfSANvSaTa29eTnIlStzcAPROH
	DD54wOIEKRinSmXwz6KoUYA2RdZpPEmLJLGhH9UqXMuMXqFqUoQMkVJkTdPxlBmr
	0+cbuXDyzsLCAtYPEbjy81y+gAKFIy5XwdIpqqwDYSpAbzIzFc7PO4lWSqIZthyd
	5dllEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqamtnhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so1474341cf.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879300; x=1785484100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=RSq+IU1o6q6ydOcrtpn0eY0WB1B/DYKHW8MUWZieOiQQfCudhJYNtHUUJog6Q+NShy
         eklljUUHibhYVxAD03IV3WZqHE6dfs1O+An7Lb4j/4bsKkS6G96FYFRR+NfkUlW2iRbN
         VDVkFypLQ8jBWZxO/zKZL13g4G436qeQ47WYZ5cHazZpEF6BZUE3tsx6hl/xme34YYWp
         sEN2IHUopg3uSL3i4xkJ9xNey1EtGH+ZeoESDMh4fuBpu3NrxJFlW97bBs3H+dGqYcyM
         XoOr624BvdlLn3AmxHjepqF3lFMxZhewudqzkPCwzTgDIgrV1yqWBZ/Wk0Mj22BOQKRt
         rwTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879300; x=1785484100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GQ2mUQRBJOhBt3jiMHO33GZLC4ik6IchEt7Uxsn85FA=;
        b=OLBzaTVjdu1t6sXnmqO1AtWESeF1U52U5vXJ5MkBM77PbKvXc4ZWdbtPm0N5aVAqrt
         ZhjDgoEx2vSbWbfpIUs5OpFMZaBRitiiSjRrdZQFDiIRgZ5X9kLfB2lXE6Fj/bGoF/gM
         OqGmllykUgKRVJewx1Pz2cgtNj16Vjg5PTL2cK41YlNZOa6V0MEZxXmTQhSYPyaC/1mV
         XCzh/jCj8F3W9wS9uOziba/3Br9du5lDbjmYAA4sfcpiDGWuQ1/xze4kWoiGoWMTKcYy
         DDxCPFHvpZdKlY0iALpDtIniRndTCSedir442k64Za69Yqi0X14l8r5Af4qLQTGehJva
         b/pw==
X-Gm-Message-State: AOJu0YwZxAcne4UU0RWUKkKrJ9fNZynt1SpgWqiPkwfvBUIwLh/4selD
	uKevUnNU7R/0GpkSitaXon8qYnvXTO5JKjJOLpLt8M8nrfVN5alJnCZUIzEMVK8QTlfE24KgUEm
	IwHZ0HSCavQ4vJ/L/pQflBhGRaqrYvfQAlbZE3nKFEyl4OYkID8GMm3usnbefbpk8
X-Gm-Gg: AR+sD13K+0rYfNoliO7q7HKJsDt1PK4ZX7ezB5YW64gdcSWIuBhabSYpJkBE58nkBrN
	DNLpIMd4TnzmKa8YkeozG86EeBMPOnw9uGlFDqsfkry89qYq97vn5uHrSJIHHT8zy6WDNhyDiSP
	+xOgEQaAH5hQOQtT4z7Hd4ja2h80LFgRWXqvzLBuYlc20jAKI0G85m1eKBhKWujAXH94D0oQxxY
	mUf2WejM8gRK1Kcewut9Tjln9FR7zpVG8qOKrGnSQyYfi0Y4mqQeiix5qQa6yUdaKJMHGhUqlrx
	GAJgr0lJlpdWig4matH3InWDBRLDfZPpHLTX90+Sz0RBPBriW15FLwhbDxIRYNKOm9t9Pbz8olE
	s50FNPQjkAyneANMWXIojp72oWJ5JIyH1nK2DU0CRf4L/Rc84g7qnYaLtTH3NJNpDxYQMhOd8+X
	Fki7doZJOCduSkAnht1JcUEv9s8Zxo3Cz+T0WlWdHR7Okk/E3Efw==
X-Received: by 2002:ac8:594f:0:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5283dfd4f37mr63032231cf.86.1784879300139;
        Fri, 24 Jul 2026 00:48:20 -0700 (PDT)
X-Received: by 2002:ac8:594f:0:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5283dfd4f37mr63032151cf.86.1784879299708;
        Fri, 24 Jul 2026 00:48:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:15 +0200
Subject: [PATCH v7 1/4] dt-bindings: leds: nxp,pca963x: fix reg maximum for
 pca9635
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-1-0125a3bfea98@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfXzNjLHw6HD457
 HVaAHv9xtb30d1KQA8KXUWnZUHN10d4OXOVFmLsIsih83iUz58ZBO39VUCn/cNT90zJ5Ym8ccCM
 nigbUxn0xFQuBFdtu34UFwi4Rp11kaQQnuWkA+oLjl9D+VxAPAIHwqLQSmmtpCOzEUaPKcXZTiA
 2Y52hUyrOCBbt8kYr5ZIFVzj1TvmgxOCuyYEBVKvrQP55ej6gkX/rPwkL9b8vdac8J4crXLqdIT
 t9+3X9cNVoc4m57dTjWyjEmqqHTNF5yNnfAjomoqtxibouaDEs2nSQpANBnDKHVTMnpwpkW+Oa9
 zVe/mp+r1FINtkqrTUVUdilyKGLKx/az9nJHWMlCK0n1xUjdYacmzyVew2xeqOOs/5Zf5t+/3Vm
 +X9Us4taa7aqUSJeDKiU+apx9dPoVTpzFJKMb45GFBX1hj7uL9nRXh70WDvd14eqx7Jp4Gg2ebL
 Z3tVF+u5Hf4oVnqzcLA==
X-Proofpoint-GUID: 0DH-i2HwlowHIvWyjaWcjFVtAJH1S3qc
X-Authority-Analysis: v=2.4 cv=DfAnbPtW c=1 sm=1 tr=0 ts=6a6318c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX5leUfgi4DnLP
 VWGndVPXoK0YuL5y2Gx2j6R6Kalb8E9qpnlGk3me/BWYceCLVltsc+Q/InJ+ZCDf7zzgnNIfW4q
 /cbp4LhzkpdLCO1fCDE1OSbFRtNXSnI=
X-Proofpoint-ORIG-GUID: 0DH-i2HwlowHIvWyjaWcjFVtAJH1S3qc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240069

The pca9635 supports 16 LED channels, unlike the pca9634 which only
supports 8. The allOf conditional grouped both chips under a single
else branch capping reg at a maximum of 7.

Give pca9634 its own if/then block and set maximum: 15 unconditionally
in the top-level led@ node, making it the default for pca9635 and any
future compatible. Also tighten the node name regex from [0-9a-f]+ to
[0-9a-f] to match the single-digit hardware limit.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca963x.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 938d0e48fe51bce82779c4457c8e99cb6d80fe70..4fda602912f7a9443b8a77e46bc015e244f82e08 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -62,14 +62,14 @@ properties:
       open-drain, newer chips to totem pole).
 
 patternProperties:
-  "^led@[0-9a-f]+$":
+  "^led@[0-9a-f]$":
     type: object
     $ref: common.yaml#
     unevaluatedProperties: false
 
     properties:
       reg:
-        minimum: 0
+        maximum: 15
 
     required:
       - reg
@@ -88,7 +88,13 @@ allOf:
           properties:
             reg:
               maximum: 3
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9634
+    then:
       patternProperties:
         "^led@[0-9a-f]+$":
           properties:

-- 
2.34.1

