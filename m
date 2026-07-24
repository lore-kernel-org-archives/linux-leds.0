Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95652E22B5
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879306; cv=none; b=BQhMPITWl864VnXTi0SvaTotxxKR8Du8mgdzBmKmurmsdmki2e0eiHCVTHRDoryavBnCi0RNcLHzqPXgBp5K7MZBOgr54qza8aISLTqJOL+LjR8sOSSWzZZsXOkar1vZidKxyrcMmLaQNBJvMIVCqz7IGLmAcbKmplPD6jPe98w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879306; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFJdXI3vJ9JChHpzmtulksAeB6TgMFgGp4r7BeL7YS/t1NR0ktotCFbpuxwjRSdQWuTK0UfhKx5topTJPiI1c7p2oyhEO6LSY5yElhtRFxt9GPAyPOL5xT2jDc+DbpCTZ/95LRPvBg9yldL5FVSkWQRfRKBqrsBbelWSFREv/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXcHTWa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck6QSB1h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXcHTWa+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck6QSB1h"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lXTh3139770
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=BXcHTWa+XdhLzidT
	UzspvCo4elz9OZrnaRGbWgH2zpQ/GWYE9LccH0sMVP7WAJw3SuRxFYtG88PnzXNN
	eQtkNHLcJBEK/XbQppjf2Mcs0vY01OzEY8mZJoEeRYHDh2yijtT+tFOmV4tFi0xd
	8bMT6w5Tpbej5Nw+Q2zLCbVUpDhvs1+5dO4I6aCxINQdAYTmvuH74DijrYQ78jSm
	1xFadpDXjYxwZ05eadgN8GkHVu2JbCRxyQP16KIDVfzvV+A6YHWKAIk7UWTP/B4d
	Cm5TQFV4ILMXtA5jZQiONPlzlu3PZzHfikCFmTYVBQ6JGqHHEHFBVG0R3zbkMbW9
	+dZPGw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a3eg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-522de3c645dso2722421cf.3
        for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879302; x=1785484102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=Ck6QSB1hz/JIR7GayCYG8YoSgEH7RE8vK7yx6ehyLXCKIT00Dp4PJogyry1Rdtu4+s
         L7Y/mZ7isqBrvhEkRnOClUb07qFgJRy+sDXCeYzo9yoCVEOlFnCmNCNgjPjfjxn4mIFQ
         //YLL/c2zzhNKuBPExLnRDgtaLKPrx6CmaQBOAH2Y3eeN9JlKYw1gmCXOeSIXDG1553m
         OFe5Kij1tBoFWVE6xY7mOqb8Vjayw+0l8ZMLr08RLN3J1O5zHN8NRCLyP9pI+ED3pCcJ
         uQp8nvTC00BBHKDlUXZByGHDIGuaZY6VT9wXBGJlJcssCbzMIyyw6OjppEonGaL/pHXa
         RXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879302; x=1785484102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=WUt3GPfuaBq2TLCazNBCqNl0EYazx8YIlrvrlYd3MxKiy3+kI6skVz9ZbPsjixkov7
         7ecM9dWTc+MeGNpO8CF6eLPlHyP6aDMK/P83XpJFwVR3hpGA/yw2DARDu3+yA2mYzTxW
         uAj7GQ/9QfcZqNUX//EhgMOVPrUBjmk1fURlbLXxdudr7zi0t0KMruUZXQ4z8jxHe+4y
         sWABzrIwHzk4IhSURjpvlUNO9iU3GqTRDuxuy6ksXiUczHhkbAsCm4ztK5g+lhx2bV/I
         cL+A0nskMnjyJ3FEidDEX3fSDhKF8N+Cia3Q3gNFXEMLsJCoUqvMAVI35WzSbZRh1diL
         3JaA==
X-Gm-Message-State: AOJu0YwWJStj4GQWftdZnG6zNh7JJ9gcwYHCEt+XrDxEG1XPKqScOid2
	nxu+fAM7jb0mqOijGclw5AYVbF8Z/h7mfIacjFgE8vXl6floD+a1Z4MCkcNkQhaB1Ug/ibWXxAw
	tEIxhCTP+9Ziz1DcZZm+aDplo6SHiGB+WXSPAYwNSLpUv7AHrCfROfHwtwWyEtxN9
X-Gm-Gg: AR+sD13yqAwunKrtyAmQOygo2Bmgv0MLawZ/XvDFmbJ6U67NVhT6+ZqTCtt+QHuBgxj
	AhsAfD0xF3190f1d3TbF6HZBBO6/IOeQ4VcglDIexGrl0E7zsC1dSRRD6g44f8PEnT483qREUNo
	z/O6KTJ5QJKSbhy0fNsxbCCZ78cmK4KHDYSLcmnHczpnWQAxyJKKrQlLS24GinjKjpvuRosw0F7
	Z7jPF0//0TdYZCKOm1fM6x/mfudVFp8GNIhbHrgrjICadFJiVSgiedJQSI7pXSnmtRWbrcV5hmD
	ub7sXsrOadifx7ZT4OJPOgLwg4Pfsw/WwyUCe/Rkhm49fB63k4RuCDjbGzTdlJQ+/OmmuE0Ajhr
	A3N7nMXqH04rc6ut5owTNVZkxMQFz1JckZ1TvS38X1NRg9/BXhw0Yv5BS1xfOzEAuAt2WxxSFcc
	sC++/gEMfHTEKRw8qPCW6bPU27aG5vLrkEguhoo9jQqenCoAmWjQ==
X-Received: by 2002:a05:622a:1a8e:b0:51c:1590:8e13 with SMTP id d75a77b69052e-5283ddd1751mr62829441cf.4.1784879301802;
        Fri, 24 Jul 2026 00:48:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8e:b0:51c:1590:8e13 with SMTP id d75a77b69052e-5283ddd1751mr62829231cf.4.1784879301298;
        Fri, 24 Jul 2026 00:48:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:16 +0200
Subject: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX1bu3ZHqjaJy4
 fuwhRDOhJldd1yXm24zT4xyQsMwJUu1YWFDJkvCR9r4+Q5MjTn3pS3B9ryOXykw3xAbzt+Cl2e9
 cTk+RruzgMJ4Owxs7lYWDfKkExZ86LrdSSmfjxzPWs5uVZUJpYx9fKElarR3S5GuGV2oj6evUzk
 AfAnX+MR2km+lxUOYjUQQrNtVUZ37e16kWCdr1/y6rswmn9tiMsD8s/dYr5wvD/w8dRo7i9nw28
 XPXVT1BahS+7WtsgDb6mv1UI45LtMn7gSkpenl6t2C9GtClUopfc4ADvzs+t/vXdX5pKt25jgn5
 TcFnxkenC8FvBDRXrW2KBMx9d4e7mYgpn2YD5Cf1w4CJNoWzZ4jZAkFNhxxD8XTnF8p/HP+nfUv
 DjMkqpg3wPQuVkZ3zIFiRQ3hJWR8m7GQ2po6QYTiyjfpdG1aoFsuvZ11BE47KmWxaMRA0jIY3At
 nJr6MJC/Z4/d+HeAbSg==
X-Proofpoint-ORIG-GUID: NIjvMYiyrRjwW78uTnkG60nL-0-y4bgg
X-Proofpoint-GUID: NIjvMYiyrRjwW78uTnkG60nL-0-y4bgg
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a6318c6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX74rvd7k/qMbi
 NI10RWurBqFYaO3dWbmbhEeU4fmPOe7eUFi1GiyXr6C1TIvBeJmSLyyTdh/65u0D2+icQboIuiM
 8nItCQiRuK8cc4s6KXWmD60YcDU8P7M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 96 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4fda602912f7a9443b8a77e46bc015e244f82e08..eccf37de51285a0dc6d28ffaba2d47a9f93d867f 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 15
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,10 +118,16 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,10 +136,16 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 7
 
 additionalProperties: false
 
@@ -143,4 +189,50 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9633";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three channels controlling one RGB LED */
+            multi-led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RGB>;
+                    function = LED_FUNCTION_STATUS;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_RED>;
+                    };
+
+                    led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_GREEN>;
+                    };
+
+                    led@2 {
+                            reg = <2>;
+                            color = <LED_COLOR_ID_BLUE>;
+                    };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                    reg = <3>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1

