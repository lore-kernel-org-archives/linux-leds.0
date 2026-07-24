Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AA23B3BFA
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879309; cv=none; b=XfQzf9GvNniJT8rhVT0D4zDElcjV7RWr5JnDoaRv+JHqGWMMPuicTCRD37Wr5f/xOZaGh5EBmqRZteSxxd9tNhJpbvphFGQDxAvGmk2xN1vfj+PzHRGnKEtUgf27UxzyjP4wp3MDlwxHvM7r2DpPdVkxKLuaYE+QTQUJosMHs9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879309; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KopJsnYcDvBBpvJpA0sh0UKkzPiCCvqUAl2HYUk2PybIcafkABZJ9P3r95v1YaF9WiSuqf6naZspdYzYWj0iCh2W9g89WqziGNGm7/aHRcN74ufsJUGuYnoBSONfGvGXApixIBfGsF34BQySii3/ryuE9pcvxw5X8suoqvl4zKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOLvKDSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQgEQSGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOLvKDSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQgEQSGV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4liLD1869814
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=MOLvKDSJDwCdMF7G
	c/hsWbeURg66kQg48xz8qmW0sIIYhdzQw8QneA0LcJffA2IQJ9J2TFKJSdbkPwss
	wghNg7yL2Z6zZ13uYWLBWMpEfyQFqSrGHWL/024wKdCNb5d7KgzljTmgXvP1lHHk
	+G+a6Ot4yY3yKrK/WpiFGunsNaeoG0VNVUNvQOwvQ8scBKjZ5qcQPfECMitFaAAI
	P/L7m/IWmMmZhV/EO+uM4LmDLcGSX58EjlTVvkcWudm9M3+/NYXO4CTc2QOXPB98
	Xhk6tyK68KhoNtFj3IbcCGz1dx2RPkk4aRiXhEbQtnICGEuH5VqJIhMMXDmsBKsb
	9eyecw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw8r35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 07:48:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso25157331cf.0
        for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 00:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879305; x=1785484105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=IQgEQSGVr4nx0SV7Gn0fBEA1PLuVEAX+fGISkpZj/5RmTRWpcJsrSKpM/HQalISCRQ
         aW/RvE4kMoFgemnBHxkL01Ilxg2mKLAgvyqjYq2SU3bKZ6H4GfzB5HSFfg/iCaGfhw9L
         8n/xLIZ7ngzN+OYUc5iAbzvYzGtjMFJu5ZRcjA1vXLk1mOi9zDDnOCFkMX4k98BAUGe9
         Zm7++foOdABjzfAeCqo7XOV3V86w4PGiKg9Fh97AHr1ToyQK8ILkiDZvLzIFUyc/HS1V
         tZK/1NkBWtDE+7LG79k1t7Cg8ZC+eZz76wz4hNAUSixqk+IIJOK3knyu0s5cepOV8fNS
         7gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879305; x=1785484105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=OEaeGyOEL+x0W8Hg/oIs9WnCD1z9KM6f9Lx7Mw3ASKtVfJE15WDLo2bGiF6CpQ9Y4G
         elWK7nL1D6QwfhO6Pk6mr3Ip91kMvEofeSO6/LKdhbUOeBo9aeViJTHGfm/kf/nbBjHy
         VuikjkiUkvSRzoXDMZOTdiyx3BY8+haQcC3UYiExuT8AEW1B354N7SSG5tpanmw7KkX3
         H4CayGllxYwa2wiprDHEjjjlP+okcKfUugQxtMnrJIbVDwG1ekHl+yd7p/thP9SQ89EA
         8ojwCh7hn8d0C2gC71kjrckNx3/Cyx++R7AmvSvZAyn3BqkljCoXqZ4SyuDsDQoyBGUu
         2BhQ==
X-Gm-Message-State: AOJu0YyJXXve23Mhki2lz7V7yEc7RhOOjZGoCGTPe2+GJsIw/r8C/VLJ
	U1zEgwbyYPds4gUGtPRH/+QCWo3U+IEP4XJOpKa8stovEh8SCSSmySpeiOIJJM9DhTcEQ+IM1IT
	OhmZz2ZmuU+fGwnLmIgSkx4iLGAG/TWTKNfkbxjJD0KW0Qi+Z6CkUBBIkqjnnO11dQoTXiYqOU9
	M=
X-Gm-Gg: AR+sD11iM1dOModsHuhrJcSTPqAmPSHP8wW3eltrU5jxlDXd7WoutZrjsP1Iggt71ed
	8aBk6ldfWR5nD3lP5LUfpVqmlavfKOK4SuCXQvm8G9QUQv87v0ujbYAVwwwyZsv3TkMIVPS4ajK
	gn+OETm1SmmJYQQv/ru2qVn7SyQ2dQUjWG3pyXQs1IOGXSBu32Ngr66teCT69z+L/gNqZAGqKaY
	gEBpXZdKzQXHPpuLeO7Z8kaUztrKz4ouVpDIrpJEOg1hxGtKOZwUVMlPrcZdZ4nzF7TxV9naQuP
	LECB8cbHRugkJsuO3++/w875Vznz27v1LevD20iil6GIdmMmHAtlWVobl5OkLy2EoV6hoRc/OpT
	+H18FXI5df9+32Z344ak5Flxlxv7PIlUs+SSU2wC1YHuiNeIYfQ2b3bXm/P+k1TEBM6RPcsgpsH
	15aV3vEfWwOJSpJQhH/OypcAoHuwd7aDbU1d0WHElGNnDRTFnMyA==
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr55302811cf.25.1784879304955;
        Fri, 24 Jul 2026 00:48:24 -0700 (PDT)
X-Received: by 2002:a05:622a:2c2:b0:51c:98f:f288 with SMTP id d75a77b69052e-5283edce89bmr55302711cf.25.1784879304551;
        Fri, 24 Jul 2026 00:48:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:18 +0200
Subject: [PATCH v7 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-4-0125a3bfea98@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX2YjcNlGNM5F1
 z1RclcfwDmg5HI3hGeDQAIq63xfVtwOstZPF/pM1+M1MGfBa5N67H6viEogk0UIYZvIWoZkMlC4
 s5vkm4u3U46ol6NbqObO+KDS/fhv/83I5ZeGD0jooVukMjdmKQOdMhgoH+jHmEeFPoKHLd7ujXn
 9/K5n8nIBlkwL77wMRF4E9gBzjCV7ggK1o9hHMX/HmG8PAjqs/5AaUZ9Re9W+HpKvGF3SPBZ+DX
 igsRO67s5yOGalIiSnm1Ll0YrhyEDsQ59WaS/cigRu3jLC/mFPueQtSMNPU6r50YQOhxBLQZ+cq
 Ut/wpsoO3rlLp2cciviLU0nwDTMYasmOWNJgtWPnvL+tm6dKoFNW5V3BnKUeeB7fR2CvaUiKOtC
 X/QIKJVmEdFOUdWe1WGTfrCws5oZj6f1wksU/OLZioxWADwlelcIUujhbJnYVFFbRa4hT3xeX59
 q3M6K6bfXcS3ET0vsmA==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6318c9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RwbIm840octrxIRE0JVqH-jnefRCbjzF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX9jl7J5Zr/v1/
 d6pI7YDxeVqEuQqde3Fx4YoLsGcuAp/YdXhMd+xZx/IUBWB78dwlOovKyJhXPvIPa/w61lr4jqF
 cwavv76lC1ZBi5XYARD07AK5aTgzNE4=
X-Proofpoint-GUID: RwbIm840octrxIRE0JVqH-jnefRCbjzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..21e32df66667eab2f882731f6ef09b7b6e29e61b 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1

