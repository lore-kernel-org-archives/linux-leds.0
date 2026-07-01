Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54922367B6D
	for <linux-leds@vger.kernel.org>; Wed,  1 Jul 2026 16:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922562; cv=none; b=HmyLWvreybpIM+dIkGJuVX6qTNg+h9pyjb6xW1fJLfMgokHnlQCXeLdGHmJUaJHq9ZHdGx2Uno15GhsF29GeaFQ2v+zU1CAsrIMGsEZsZim7giMKwljCw9Ua4BoT1zKk7oLlFDtUtLm4Cw8FEefstJcr5lcF89bjeG81+SpJWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922562; c=relaxed/simple;
	bh=Ka3/2OHVRu69bdJbzsEw+il1OYy6CeM/zE+4zTE+Oq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYSJVoSbWjYANmALZjm43VR4HnYEPVCbSD8JNSaqtcLDVDbHBsw+/bSulLSmO2pcROAYOQlJtzEAH/bmvting07U4sag1Vs4ELCjFwLxA6lt7YHzYOim54W1u0vo6VxnxJbX1wFPJs8tAJlO9e2aSlXoQ26IS+9Zz7u0YTYHvu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDHhyXK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELySaIth; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDHhyXK9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELySaIth"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoAVw1552738
	for <linux-leds@vger.kernel.org>; Wed, 1 Jul 2026 16:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWGipK49nXtgoFExH/hwT+pS9Iok0V+C34bfYKTHbb0=; b=dDHhyXK9A0tPDieX
	fQo3kEK3FVmfyJtxzuOR24R5YUPxmOSKStZPUw5shvr8mCNWMI2mVVVzRTsjNUgF
	CXGbcpYlsN8TySeVX1dOOGt6pYv6DXBSeRCJ51FpkKHWxB+1QRoqJv1X/BRXqbSy
	eAGadOezovG9mZ1XP2MmUknTyN2OlNXFEtX76P0nZ9DwoYzlB8hzoHDCWFyDbCYt
	XeZXFxd5GPguyEb16uVi/Y8OhPOD80InTZtYgw40U3VKaEzN8k4+46eUkuLgiubP
	o5eE8zqfoP6sZ9rw89jkjsDXISb/uRWXzkR/MA+4N3r4f1p4d758ONfvSnXlqJ/6
	wAFXhw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1jce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 01 Jul 2026 16:16:00 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e94dffa918so1093118a34.1
        for <linux-leds@vger.kernel.org>; Wed, 01 Jul 2026 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922560; x=1783527360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWGipK49nXtgoFExH/hwT+pS9Iok0V+C34bfYKTHbb0=;
        b=ELySaIthmUH5mV0W9XW+irVokOIMdmI8348+88CRRGy2yBVcnB8og5uCYn2jsXlcap
         rY83EdcLImELejXjbtgcayGINOKUZxWzcsUqMFigBrsH7UnfZET9Pm1Z5UmyIQFkPEoN
         iLlNGRFi4atZ8iQM0IcUOhr/Igqd4NbP/Q7tRL2vropDwfasusGS/7BygkAm+ZLv59qc
         nVtwSrpnDlwhDSmylhyiUwf+nhD/xfiQt5vqMgaGKsRpuXBxR0IlapcVlajDIFNJibuQ
         DTIvTnwywi57VY39I3QCBOeRHLWtr0w6CL3bTeuqvYLDEJ7wLIpC8lYtI1wxDXp3P2K7
         NQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922560; x=1783527360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWGipK49nXtgoFExH/hwT+pS9Iok0V+C34bfYKTHbb0=;
        b=C6WOP/drWCFY13QWsjXD/0AAFxCk/zGzYLuBwYqEQG39VwoCYB/AV557kYXjSYENFm
         HxxzVwYH0bUIYlA93kguPKiu2Q2jtgLTxnTNbb0BPkuhOM1CMh+7086aP7fxku8UDj/U
         BfpaB2DbXU5Pnmcm+mHySF/B7abCqbhNFELXcRAupuRtsZlPhRex+oYsBZsE8Oh0jfPT
         W2KMOq7luUaUvtqvFV3Zw0v/wptdmpo0QzL+FHMB4YTzROfF4QatdbXzSrg+zpEUI7BQ
         CWctunOLlu5p3jscWXgsEbjknXge2KMP6pYDPHDj6uDhvIT0Y3BIxD7xQrh5G/KxbkLW
         Tshw==
X-Gm-Message-State: AOJu0YzmAn/nkdoIRgBtWa7ITo4Zn/oA5/bIdeq2vp5v+uAgZItIucXY
	zd7+IXKpoVUq577H13TLdoQc1lDggEbgi7wGyM7Fti4kXXHcRgP5KDHthJt4qMLkNIXfTyAnvHt
	sNqAlk05TIfYBPRIbP340m8o92eZ0vp3zMuc6J87HDnxoXzLFfAw3FqWFrx7gx2EP
X-Gm-Gg: AfdE7ckMDi3KgeLcvQxrp0/7zdJkV8Fat+PJN4mUpALDu/CRGDKiBC8f9nF3BXaUm64
	inUaIWkvb8CKPOnc1HiwTT+MpWY/5vBQQb6ZGDs7hKQbhP1xcJT1PrsTzAZoegqZNXaTJJpLj+I
	rPcgrc7vjeupvkMP3BgMrENDSTKSh8kVVByTuSG1Lpjs4/esZn0WBtmwz7ySkUIFNP+LeZrb+Gl
	L4POxQUgh4rR63KuaOATgE7A4TMflVwiLB43cTKIbrfORw2t5gxi472wD5OtlR4xSUxCoeocNRU
	DWtQ3vPUkgdWiiK5RXud8Q+att3/fa1DBjAYx0erIC13rhnThd7WM5Wcdg4PQ2cuAAV4Pzg/qlD
	qqTS7LKC56hbrBcNN+9IDGdnnYxo4DyeIJ1UrwMUOpvKujEdgQudh0st46Pi2FYQ3kCyOZN17vc
	Y0xiNFYK/eTvEWfCYSWVRkNxuNI4a/5Yk44rnp72Q+7vrwMV/hHoDXa+5I1gLy2PM=
X-Received: by 2002:a05:6820:150c:b0:69d:f8c2:387 with SMTP id 006d021491bc7-6a309a11c20mr1267443eaf.17.1782922559894;
        Wed, 01 Jul 2026 09:15:59 -0700 (PDT)
X-Received: by 2002:a05:6820:150c:b0:69d:f8c2:387 with SMTP id 006d021491bc7-6a309a11c20mr1267384eaf.17.1782922559258;
        Wed, 01 Jul 2026 09:15:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:15:53 +0200
Subject: [PATCH v2 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
In-Reply-To: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a453d40 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: ZfbVjCerJWMIZ9ImToA_2JfOsRy8wFGX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX5F+UiK0bqOvZ
 Hsa9rZovYyfZ0+LLSrqJDdcgGd+ycyvbWvXB25MjwyAW+UJIHt/C8rUl2izc7ut3vSIgeqozaMx
 5lphUOOV6p66WXZdEEf119QfvtjBoK0=
X-Proofpoint-GUID: ZfbVjCerJWMIZ9ImToA_2JfOsRy8wFGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfXzVnFe083HQ2t
 3FAxFhrFVM3zAAOhw9CTfuL+9j+DbHhqVCU+Qh5qGV+KoErVRySk/HHpMJajBXk3Yt1WZ9KxbIK
 nWs8TQFMCAX4R06t9mKdiRwSulNVyrb16PbXC3dpPn2tjdn1jGxc9DijJTPOeJ6y9TUryyQNe+/
 jFrgxq2Kab9db/cS1ioUejLsBu6F4oMEQw07TQFjwhEWOHTII36JS8YLI52AFbjnITR/RsumH7H
 UFaFywOXz/Jf7uwFZAbVTBvjE627voBCNaWeNw2TTdiG66t9eNe4YZh213aiZwbxACkKnpz3NrB
 k/2TTTHJOsXU3F0USoWu6NfbTTuC4NZb0PbxDaUYnPmVR6BVM8DWfsl1/kGxx58lp9/CK/OgfoQ
 4Lh/HYcxcbYyWCbo8XBrGl7e51EYhEjpLmLnvp5WpuWo/ysY46+n/LcMYoUrg+QyUvc2NkDMaoF
 q9mw/d+qBic45GJzVGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..83ccc4eec342328c78be37d4642b772d74a8ed37 100644
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
+			label = "stm-led-1";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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
+			label = "stm-led-2";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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
+			label = "stm-led-3";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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
+			label = "stm-led-4";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
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

