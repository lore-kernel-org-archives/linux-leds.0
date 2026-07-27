Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E841BA93
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164086; cv=none; b=Oqtn6IYbTCwyqa6fNENSdPh+4RzvFRVLR3LAfwM+nyd8wxmtRQNu3yAP+EfXdsZDOwn4GMg6pE47i/8k4/7DjeHXFxvGl1XTSebGHEtmswllsl+tkufVElelsgaOZysZIvCZYZyBVYIUIBzxNAdELuhPPjRrylACHtdzgo9Bz9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164086; c=relaxed/simple;
	bh=0Rq8D/NoyC39EmLSzNVbHI8oYiwR5Wkjwf+f9tdSuzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BC4V/EpZCqIrhqIDb81Q/f5A7vWv4j2VPIGhs//lUKFH0AKp9A9RZ6P0y1B65NCwDm9103OpjxB/ZCDWIi4xT2emuVd9j+f3uvuvhvBZGSWox+eelULWqGXG2syjWS+FkUdtL7CBQmYYCRH9W11HZdYnMJi/J+vKpoyWYxRpVF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXw+hvbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pwc77CBm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXw+hvbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pwc77CBm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlrcg3787448
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=; b=oXw+hvbgdRd/UmoD
	WmxZM7QP4OtKvON32kiP0Y2RsK4RLE1O4w67ezHhHmnRLUKhyT7l2QK4xGbryt5M
	9/yejvf/a/ijo3x3huZjTyYUVkmqa4efN6rij5QfCTrh9bTQgu8gZ96ZHu2h4Ggs
	0+O5LhhYStp1XyjHpusoS5AfOWtHmJcsL1CEr/8RMvEE7kL5tZFva6WbyQal/cUj
	YD3167WZGbUvbEv4+ZEmvwN8pJ1FOeBmocHOWuMX5ik9DsBIX7yVUH9JDw6w0NuW
	5QaF2Y4OO+DHV5lnLo+r+m42r16wJ6rJzqQ4JjTxZcJbjxaeW5QOvc/9H+9uCNGN
	UM3RZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2hg5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 14:54:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so25990341cf.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 07:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164083; x=1785768883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=Pwc77CBmnuGgtjqehV5kflLz7UAHplxb0E0LwI6sKQCwBOnOyR31BVbBKTb7jiG3dB
         LDB60dWKQ0eFXB7tZYlsI48BIUl761NxwmH+U1aciIHeE2jVqlrIjoEfU7QCBpKQmZSm
         F5qwv0i2OGnVzdmTcl1pEYTI0oq8exzTN9MhRFBg1pPagbNcUR2RIde8nUtZjJkAkOyh
         MzlaVYOaPJQn1TyvNq2vZbLuBgPUO6eFalayPlLq9DymCrXzATus53Q/rA9Olo3bI3ws
         lA2ml1vMRxn0ucId6RA5Jn9cnGFru+ZWttBcbgVpXYiCZHrftIabwulkQraM2wvrv2es
         KuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164083; x=1785768883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKaEQZIQPMdPO6UTKBRGpr3T8o+KrcRClYBwgH8RUsc=;
        b=e1T7MYpCx3Tr/R5cLvfQXaHcCu0c7XwITl8pK+yYTG/YEbVQvYz5EkcRrSSybu/xuo
         gUK8w2dLpDJyIAf+yknif3j7TauzwshXa3i29+5SX/tQF2A9q7H1FDPupzsNTdDz6S02
         Cah+cC7FnZryGaQyXJ/ym/8x02SsnK5GC6wpvWnWt11q0TZMAmrpznKVggjOsOyk9/8w
         BDzyT3Zol7B33yiiHry9Z6L16A/LcxFj4Ssh3NNhZDqGaV3GGAtfA0lyJTTUK2ud4aHN
         Q5DHB5fg4+yOFyogy7LyLwvgvxToAM1gEVireG2a/m0TwrAJN8sSR6jWSVXk1jk/hm7R
         rZnw==
X-Gm-Message-State: AOJu0YwgdcbG5NxZez+LaBQErYAoMvBYnqEUJcf9ZWAWLVX8Z/LcSERN
	du2NjsS3n1kfCCfJRBWzkextraJfCElS9uu8JYYX7XsP11TfcwL72HTfgPhGSrVXINt4PWbDXy8
	b1407M7CWIsQqp1mkqKdReU6mHyq7ep/AvV2x7fd32a8ecD91o3zC9YnqRHfv2cFr
X-Gm-Gg: AR+sD13Ju8Yh9ndnvUNH1it4N6j11zWFJUNXA3xHiU+78ZoPowreJh8IbCNE7ng2oSR
	df54DSUe2DkLnfRLXd1LqZa5HYpoFy0PYi2C5GX3TekmvP8Ejjl8SVk6e1Nikw9EQXMuPG61ay2
	b6DVjD+64BECoZmSJq40bXmFNZCcF4O7r46GR/WYBfkhpm3yJ3vkKCIJa39JbMLQ0Rs8408W2IU
	R7G7VE+axRnfgEyg0tpCWIh5opZZVcxcKpvQMeNOhhIGpnVoeCB/8MsHC13wMmvQcxA8jHDqAn6
	oJQTzSJ96qEXX7R2t73n5oWhCFh+4zuHyBbWpPaFqQkqV/T2RnJHQX+xD4e24LBLw4usspPcdyZ
	bTlI/rMFh22Pvzn7ylEzp1Shi+O1h6BRhse+bbAwmBu2ZqWK45q9A14r4S8dSarOk7g7N8mkgO2
	vPUEVktTeFHHpZuQ8uFBjR8KHRDj1B4dKoVNDhGR8yHWF/T5IG1MlX
X-Received: by 2002:ac8:5cc9:0:b0:517:5b2c:6aae with SMTP id d75a77b69052e-529ccb0c3camr12391271cf.13.1785164083519;
        Mon, 27 Jul 2026 07:54:43 -0700 (PDT)
X-Received: by 2002:ac8:5cc9:0:b0:517:5b2c:6aae with SMTP id d75a77b69052e-529ccb0c3camr12391011cf.13.1785164083047;
        Mon, 27 Jul 2026 07:54:43 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:42 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:54:36 +0200
Subject: [PATCH v8 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-monza-leds-v8-4-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX7Ew3Mzt032z4
 cf208UEWdK6s1pzEstOgb82b+zbGLnLTb1ErLt6iB8+dEqgcF0twMGhb/C1Ffj0GXte93uIsMVm
 FwXRyBZDv8cswmzEzajui/Gt/NjR7bA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX/jia1SNNsIaD
 EEvnZ3MZlSpAyDLDu9Oi4r2SFmK4oKR3M7BoPheFuyrk9IRolgBgktteA/KYgtVcOAWY+XNnfAY
 2xi139w1QN0QeaRypkIW0V50SE6ayKH+bDdvtczlUnAJC/CDf8QKCOkscTefOHKxVjPSASIaiG/
 3OZt9TQh+6xNRn8FFdZ/DDgPBl0dnVbkj7EI+uiBnjCoHp9tEbT71mHzwman54ra7rqKQSkLI8g
 t/bxe2xnY8qLKod/EI1sU+MNUthV9l7qfMPDcQp0Uu0J5Ui+q6O4XMEv8rNPGe8obJ/YYcIDtBN
 8U9fg/Kojd7z5qUJFFq8za0/VIH1wQoYEMl6PrQ2qH95B0boH8qVpghWLdiccq8y0L4trjOiXIf
 jyC8H1MHPVd7JsvIw8CvGU8l4uTLO+h1ljSkbGvePBKcwNpKIdR7uCiorRhQOJ+gIWh60sIk7XX
 9e2tn5TXamFuZVUS2qw==
X-Proofpoint-GUID: 8OGqNEj0bKmL0MFj-thKaN5TmVodkkiV
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a677134 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 8OGqNEj0bKmL0MFj-thKaN5TmVodkkiV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

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

