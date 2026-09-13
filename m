Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD523EB818
	for <linux-leds@vger.kernel.org>; Sun, 13 Sep 2026 12:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302791; cv=none; b=ZXxWnojVGapLFvbTeINjPdSgkj8lz5IYMnmKCLWIrZuzj1mnN6t5iPKf8NSL7IfI5GVhhRNtLcU7EF3t24BbBf9r44zMdycIAHo+HcZ/PYyfUuQqJFbLaw0N+3wkAxln7fatZkTWCAHM0XHKyewwTZbx9EoE0ZdoN83kzE7UhbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302791; c=relaxed/simple;
	bh=AlIaJEIuArFUR/Ki7M8tVpoeGLbBeitAeHOitnugLnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0Ftk+6ms8m1bJJArZK9K5C5pHHoIiVSDef30Mzm3od+GXugNapQrHwb3+ZPVwBc3K3MYFeG6BUVR2gocnXI+pZaErW3Z/0vhAMkc4fPF+ayUjtDyhZsyBjJtGtGbdiSyOcqUeJzkP55CHxjGDoJDdmOaohDe/pc3zd6DDU86ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTM+lnbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDzBvyNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTM+lnbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDzBvyNv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU5Ig1367401
	for <linux-leds@vger.kernel.org>; Sun, 13 Sep 2026 12:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fpGKnPlwQMJ6d2jd+nVDM/rLtIW0wAEYfjJ
	WJ0/R6KU=; b=ZTM+lnbIWAuul4Hcc1MMF1HCH6I/TcSe78+k0+DQpEJZ1fEdrLd
	cZiGKC4sCIZkwHPKu0vru9hnOp2QQRLMO2SFxQzmJIKWD66GKfkB6kg9fDx5A3qT
	9UQ7s7PmGOxsfgp9Sy3iG2t0zE1VaBVmehixQfTN4u7EP+kOlGK4E300Qi6FOoQ0
	FIO3LK1Ex7akrRHQwIh6lTnATnUiIA/JzgM4a/tzXU8APjzSm1dNeVac3KeolaBt
	vn3UWyZtZSt0MfGElRkoPf1NMpAH3u8JT/jyLmiRe6TeBRWgtEXAD2zA3xRs4//N
	WSO8b506TXCzQnFVuTGfvPUCbxjyhBbbipw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9db6gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Sun, 13 Sep 2026 12:33:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso482465185a.3
        for <linux-leds@vger.kernel.org>; Sun, 13 Sep 2026 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302787; x=1789907587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fpGKnPlwQMJ6d2jd+nVDM/rLtIW0wAEYfjJWJ0/R6KU=;
        b=hDzBvyNv4h6hw/ctZSwrbSnhp7tDlclbK0IWb95Xu4vpOva/k0M9cCcVih0+lZE7KS
         IY1lOgYZWD5WyRQnl6or+b4gf1OjmqCmfZV3+/4OKcfa3oAumNyqKRQov7B5hkcggljs
         KJhIhdXuRbwRrFL0FOHVaqmdKGu1oPKYL2pClD44tLoL+wlAp/DrpIijJIytD+T8UOvu
         bi4rEFsOQFrh/RMxB2hQvOoI2vOb4Ynj+TXBOCJ0fUy0hwigfWFjnxnUMxgJrPi5jLsp
         6d6wo2PNT8qqd2LHp3FVD9jMyfD3tFwIhBP9GCHM1LJalq0ioDPuQ3BfJ8yvXrIgD8iF
         W9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302787; x=1789907587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fpGKnPlwQMJ6d2jd+nVDM/rLtIW0wAEYfjJWJ0/R6KU=;
        b=DvBJA0DU1wLzZ4vUKBrqxvCxwRZtjfKVw5XCnNekaB/NK6UTZKE83w+r/O81iFw7FL
         3MQIZgJPXyOmRWgG7xutY0Ezjy0ufGb9ZSfzU+Zkg69NEO37e/odld/XjT85wkkw81lW
         ee9IdaJx+wepUNrclFTjiSSAQupHpYHympEW4s37tz2rP+V23g5HMSFJOe8cFWmL99o5
         zJeuxizZUMX1xFtFSM9tCKlJAFjs0aTxmCHo1DA+vl3o1dJjy5HgQtxirMVvEOenf8BX
         +hl9ccOs1BZVh10g/cwdXnUx5Y8Y/y0l6vq4uxTINVyS19yK9CKltM1d5YJUzcR+uRLs
         eO3w==
X-Forwarded-Encrypted: i=1; AKwUvBx4uxrtVnrJw8MGb8Oeq0AdLPURfykY7HRQ0Leb2xJvkTRkviYOpaZXjxbrUtNCf8ypn3lSO9fLsS/L@vger.kernel.org
X-Gm-Message-State: AFuF++n4Ldn/CeMhX9AK65XvHqcGMk3d4C5xM+8hPMelQmJlGD6/Zeje
	N6oI6jF631bJn+3CGE+XHs5FcuzSy4T4+ap5dJ/CPwBcjd4fOOgXUm2DSpk/L4kmNnEIeoIL+8x
	7hMLSARdG6BPXOEJIfOoJ9QbUNuhYcjH8Adc7+LxnyzJmDpsE5JYWpWSG5FOPtIH2
X-Gm-Gg: AYBFou2yVe8mlRHU0ki5pYDV+k+ukkJApQbiweQ/OILSe1jrCfEvSoEkWV1z69SHJc5
	nMhMS9snFShSOH6VgoDyquRLglfXJev+RU1tnhIJFybUPBiX1QlRvfvowqLHgUoEkcWcSOH9lDY
	Z+qZ0NFcuKQwVlrFgotOREEZJEVq7rMOpYhqq3VHFC1ay/MGR4oLpLoZAW2mYEj42qJ1m5QVghh
	jNtqrhFqBxX+CX2PrplofvPKHMSAPlHNivnmi+3eRbfb69AiKPonYbBwrMv/izMc+8Gn1C7ax7d
	LJDIbZmNs24I6oFTzCJ47mMe3uTcdguxCBt2kRQ1ZsD4n4l4fmAZ8sQbwipWsrTrfZuKxsAb1aI
	xatL9/Xs2zQbzkyc=
X-Received: by 2002:a05:620a:8390:b0:93a:83d:1d26 with SMTP id af79cd13be357-93a083d2432mr875127985a.32.1789302787214;
        Sun, 13 Sep 2026 05:33:07 -0700 (PDT)
X-Received: by 2002:a05:620a:8390:b0:93a:83d:1d26 with SMTP id af79cd13be357-93a083d2432mr875122385a.32.1789302786689;
        Sun, 13 Sep 2026 05:33:06 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm20863041f8f.27.2026.09.13.05.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:33:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Artur Weber <aweber.kernel@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Aleksandrs Vinarskis <alex@vinarskis.com>, Andrew Davis <afd@ti.com>,
        Steffen Trumtrar <kernel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: leds: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:33:02 +0200
Message-ID: <20260913123301.100129-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10147; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=AlIaJEIuArFUR/Ki7M8tVpoeGLbBeitAeHOitnugLnU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppf9BkR0CkRS49lp5YPjksTU5OTemdYktvvon
 lGCs9CU1+SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX/QAKCRDBN2bmhouD
 18+LD/9eTwuH4DhTOVdNetOCBQo8mjmDh6a46105Id9+ghu8F9b+7iOHiFMhbH/AdIA0ZAIup4f
 ZTB4BGdCmpmHTHp6DwZSY5j1FPDvr1D4h5iI12xvzO15ohg3OY04iOS4XKzXQFQ90F3IP7W6nOW
 TIGe3bQtAKCCp8tRxMQE23+eQ7nUv8AOMtIhhFQc5Q6KamCzz4yDMdC4iKDZIN12c5GzdXxO2T/
 72h2eXlh1ji7s3lTNlcTbYZOQClhpyXO8DA47EZIvZjKUaRWrKliD2OwRgVqesIKasXdbxKd+wx
 bHcuTklRP2ZKr5rN/XTnhjGzWJOgWEpQEFSDzPOwnP9oS8PNnSg5355vTA7RgYNYOXDNVd9zkXa
 oWu9ecRoj5S+3LHmoYLyWRP0GEkg5YCBy1JdoAAqx88JxnbOHUUgWAfkHbmOPYYyULs0Ury3b1L
 ByD7vZZ2dG6J8AxLGi8XCx9VRiM6pu6nNffefgU1gw/HmNM8H2V8850EWjqfb+cz490HvkIIzUy
 De4qYJda1Ux+Cr4abTGe9mEf1pTmvAJFzY05UbDzExqZ8XsbFHAY9f8WfvvC87YstXzPk+fnT6U
 JUbce9aHBVECCmt7GscfPtKtfwuhuEhCs86If+FdVZMzHrhvvAsKJ/xIehOhfpJdSF6xJUFZp7j s6+waFjqULVNcWQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX1FZPCEm64t08
 me27sE+EcEmBNpJwcMhsocIfsSRZXiCqCX4SHMv66vN5YIM4oQ+rnFrSTJERGeFkWwBsOf+n2pZ
 Qu9Twe5u/QsEv/0Pa5O69ymGw5xogO3m2fDmFcGXOuDLFO+1jzwy/1V9VSoWcgHcXe09umDAOM5
 uEQINW+7FlWn95t2M5l3tQYFR/CkCiSV4sdq/ZkR1EyseJY1MF77UaJT+ifrMT4Z8YaA4iRrDac
 kHL7IkOlZfh7oV5PfWxHP0QgOpcETTgOqAXtxlMRbxTDQA/GpWkWHeP4zFfMp93wBqR4+xHah6w
 fly8SVK32MdZiOlbd3PEQ8+zP6vZkbkAkIMqpaRwNOreXis6zUKjTL17oBM6apRMnnXaR6hly0y
 x4B/lhmUhvL/4+oy3XE0rOhL970nHj2BUOxOV+wPXeJq0157mwJEpzCiElXGFBlm6jx90nymREO
 CQaSeEIWuduwS0bhvEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX50jWz87logAb
 oHIK19czHumdBVLlaFmmcz0+dHiuj2SV5EZEPfSKcNRpFy42pHdiPFNEXEELwsIV4nhq4/6sTid
 a9e6cBVDjymZOkZV/rgS+O7aqqtpRCg=
X-Proofpoint-GUID: wllvsFdOtH5erw8qtiT_8w1g8AGPGX7E
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa69803 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=a7949CMAvHCJeXM5QSwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wllvsFdOtH5erw8qtiT_8w1g8AGPGX7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../leds/backlight/lm3630a-backlight.yaml     | 52 +++++++++----------
 .../leds/backlight/lp855x-backlight.yaml      | 18 +++----
 .../bindings/leds/backlight/qcom-wled.yaml    |  2 +-
 .../bindings/leds/leds-consumer.yaml          | 14 ++---
 .../devicetree/bindings/leds/leds-lp50xx.yaml | 12 ++---
 .../devicetree/bindings/leds/leds-lp5860.yaml | 12 ++---
 .../devicetree/bindings/leds/nxp,pca963x.yaml | 24 ++++-----
 7 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
index 3c9b4054ed9a..6393cbf3afdf 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
@@ -99,20 +99,20 @@ examples:
         #size-cells = <0>;
 
         led-controller@38 {
-                compatible = "ti,lm3630a";
-                reg = <0x38>;
-                enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
+            compatible = "ti,lm3630a";
+            reg = <0x38>;
+            enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
 
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                led@0 {
-                        reg = <0>;
-                        led-sources = <0 1>;
-                        label = "lcd-backlight";
-                        default-brightness = <200>;
-                        max-brightness = <255>;
-                };
+            led@0 {
+                reg = <0>;
+                led-sources = <0 1>;
+                label = "lcd-backlight";
+                default-brightness = <200>;
+                max-brightness = <255>;
+            };
         };
     };
   - |
@@ -121,22 +121,22 @@ examples:
         #size-cells = <0>;
 
         led-controller@38 {
-                compatible = "ti,lm3630a";
-                reg = <0x38>;
+            compatible = "ti,lm3630a";
+            reg = <0x38>;
 
-                #address-cells = <1>;
-                #size-cells = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                led@0 {
-                        reg = <0>;
-                        default-brightness = <150>;
-                        ti,linear-mapping-mode;
-                };
+            led@0 {
+                reg = <0>;
+                default-brightness = <150>;
+                ti,linear-mapping-mode;
+            };
 
-                led@1 {
-                        reg = <1>;
-                        default-brightness = <225>;
-                        ti,linear-mapping-mode;
-                };
+            led@1 {
+                reg = <1>;
+                default-brightness = <225>;
+                ti,linear-mapping-mode;
+            };
         };
     };
diff --git a/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
index 9416e1bfab92..2215ee1b2e5b 100644
--- a/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
@@ -95,20 +95,20 @@ examples:
 
             /* 4V OV, 4 output LED0 string enabled */
             rom-14h {
-              rom-addr = /bits/ 8 <0x14>;
-              rom-val = /bits/ 8 <0xcf>;
+                rom-addr = /bits/ 8 <0x14>;
+                rom-val = /bits/ 8 <0xcf>;
             };
 
             /* Heavy smoothing, 24ms ramp time step */
             rom-15h {
-              rom-addr = /bits/ 8 <0x15>;
-              rom-val = /bits/ 8 <0xc7>;
+                rom-addr = /bits/ 8 <0x15>;
+                rom-val = /bits/ 8 <0xc7>;
             };
 
             /* 4 output LED1 string enabled */
             rom-19h {
-              rom-addr = /bits/ 8 <0x19>;
-              rom-val = /bits/ 8 <0x0f>;
+                rom-addr = /bits/ 8 <0x19>;
+                rom-val = /bits/ 8 <0x0f>;
             };
         };
     };
@@ -125,7 +125,7 @@ examples:
             dev-ctrl = /bits/ 8 <0x85>;
             init-brt = /bits/ 8 <0x10>;
         };
-      };
+    };
   - |
     i2c {
         #address-cells = <1>;
@@ -142,8 +142,8 @@ examples:
 
             /* 4V OV, 4 output LED string enabled */
             rom-14h {
-              rom-addr = /bits/ 8 <0x14>;
-              rom-val = /bits/ 8 <0xcf>;
+                rom-addr = /bits/ 8 <0x14>;
+                rom-val = /bits/ 8 <0xcf>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
index a54448cfdb38..bca00b774bb0 100644
--- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
@@ -280,4 +280,4 @@ examples:
         qcom,ovp = <29>;
         qcom,num-strings = <2>;
         qcom,enabled-strings = <0 1>;
-     };
+    };
diff --git a/Documentation/devicetree/bindings/leds/leds-consumer.yaml b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
index fe6a0faa1d3b..b4065c9733a5 100644
--- a/Documentation/devicetree/bindings/leds/leds-consumer.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-consumer.yaml
@@ -53,15 +53,15 @@ examples:
     };
 
     i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      v4l2_node: camera@36 {
-        reg = <0x36>;
+        v4l2_node: camera@36 {
+            reg = <0x36>;
 
-        leds = <&privacy_led>;
-        led-names = "privacy";
-      };
+            leds = <&privacy_led>;
+            led-names = "privacy";
+        };
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 23f809906ba7..85182ad7ad09 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -121,18 +121,18 @@ examples:
                 function = LED_FUNCTION_CHARGING;
 
                 led@0 {
-                     reg = <0x0>;
-                     color = <LED_COLOR_ID_RED>;
+                    reg = <0x0>;
+                    color = <LED_COLOR_ID_RED>;
                 };
 
                 led@1 {
-                     reg = <0x1>;
-                     color = <LED_COLOR_ID_GREEN>;
+                    reg = <0x1>;
+                    color = <LED_COLOR_ID_GREEN>;
                 };
 
                 led@2 {
-                     reg = <0x2>;
-                     color = <LED_COLOR_ID_BLUE>;
+                    reg = <0x2>;
+                    color = <LED_COLOR_ID_BLUE>;
                 };
             };
 
diff --git a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
index 0e88c71c2d39..710fec3738ed 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp5860.yaml
@@ -100,18 +100,18 @@ examples:
                 color = <LED_COLOR_ID_RGB>;
 
                 led@0 {
-                     reg = <0x0>;
-                     color = <LED_COLOR_ID_RED>;
+                    reg = <0x0>;
+                    color = <LED_COLOR_ID_RED>;
                 };
 
                 led@1 {
-                     reg = <0x1>;
-                     color = <LED_COLOR_ID_GREEN>;
+                    reg = <0x1>;
+                    color = <LED_COLOR_ID_GREEN>;
                 };
 
                 led@2 {
-                     reg = <0x2>;
-                     color = <LED_COLOR_ID_BLUE>;
+                    reg = <0x2>;
+                    color = <LED_COLOR_ID_BLUE>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index a16ca11f630b..dac316741b9b 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -164,27 +164,27 @@ examples:
             #size-cells = <0>;
 
             led@0 {
-                    reg = <0>;
-                    color = <LED_COLOR_ID_RED>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <0>;
+                color = <LED_COLOR_ID_RED>;
+                function = LED_FUNCTION_STATUS;
             };
 
             led@1 {
-                    reg = <1>;
-                    color = <LED_COLOR_ID_GREEN>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <1>;
+                color = <LED_COLOR_ID_GREEN>;
+                function = LED_FUNCTION_STATUS;
             };
 
             led@2 {
-                    reg = <2>;
-                    color = <LED_COLOR_ID_BLUE>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <2>;
+                color = <LED_COLOR_ID_BLUE>;
+                function = LED_FUNCTION_STATUS;
             };
 
             led@3 {
-                    reg = <3>;
-                    color = <LED_COLOR_ID_WHITE>;
-                    function = LED_FUNCTION_STATUS;
+                reg = <3>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_STATUS;
             };
         };
     };
-- 
2.53.0

