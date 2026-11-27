Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769388;
	b=nUXE54TnecGe4bJS9Me0ISmysug0TLS3jkIOO+Y3hZJe6Nu8vrxqiqcAPhu2l/tB+fpj
	 30HBmD0xghkfFaSHmrWJlbfIex59sd+bxWg8G4uy7hFYlaiGLggOP7KUQzjJpy2IDAv+s
	 QSOA1PgVTL2TAX84JsN6fapx4IqjRjtjsd/vsQdNRp8A56RbkWw4wuisxLpnUacorZ+P2
	 47DZQwiPtc07ATDt0oBhyTjAXaT0l+5WxuJwl+Y51RHtkxJUC1PMPVwhSOiSA1FpDg19z
	 iqrUVQnYau54CW/4W679attVpMZzUG1SGjY1hRl9A5uGdid8juwgcmU/ECFocHMBqTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769388;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
	b=FaY/FTgYo50PYl4k7BieHHZnvoHnElvzMnJlZvh2P4UBZL69U6YX+KyewCOuf8h0Ei4P
	 IXESAb0flrFrAHz7Aq4Pm41GU+cQq8sM+McyJ+KzGeH/u7BufZFlDnRwycBNzvcY3vL5m
	 dLVMKdGB+eDVN/j7O26TzTf9UgUVaczPV3UpoMC3Hm+UG2gM+lxN3H+SARfomI+hJbpGm
	 n7zTfoTyvADajJKy3tEJujQ9GKeXDn+MNgAea1E80YzktvsQVddoNiI+DSOmEQH6ZuvXT
	 NCEPXDP7aqeDPHpIl/bfUYM+VEUsfxrQgwlZOuwuVFrmEriwbxDcxyeMi7aUJhfIUrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QO9LVXL8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcQaJtIU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B6D606A68D
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B6D606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QO9LVXL8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PcQaJtIU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GsXS560551
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=; b=QO9LVXL8lI2UO3KM
	S8vrRG+zfm7q7q+JngG0NUb3g5/s0LTM9G3AQb3amKtc+3v88nmHuTVB8Am6TkHr
	btFSmwFUGg8mrmCi2Gd9trnN4XuP3AVBCtDwqjyDUDmMAfivmFw6dEmCrSsRSMg6
	uxsW8GzspO/WRuR1iN9gunlXJyBL9mg4aMxK3/O7qBUbPZDIKdbCop5NKz4L+rpX
	wZ4zu43l8foYPbPUsJ93tnbEaHT8FI/UcqIUgNLGpaF4LmtT4Z32/+VLf3o+DQRq
	ga8PMs+qAAsa4Kh3kCbJEIuXDjAc68Vcr42bx+RQdnwqWMRCZHS9BZBahCESeSqd
	IXqTkw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk39n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdeb1f93b63so117010a12.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 00:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769387; x=1796374187; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
        b=PcQaJtIU+RXGsTH4YeB75suNDpdEzZ0pA9CWQBg3ORIQUENm67HkvYTn84bmTKTyU8
         bwg847nRKa27Tf0d6j3KWtUVu4wjUrUz9Jg5EaLImRSY24DwPUcmi8GEMwtHcBD9dAbi
         L0QNYpklOdnVNMZVBxC63ac3bFVjAld3Do7bKTxq5yiN4ejqFAi801C1IjoQA6ldqt6m
         C+SVjSP8KnvhOx6R05FX5JpBIbZLp5GIDgfVIPIt6J+y6CMF4IrwIj4+LfUIirgCn+r+
         QTYrjBkF+yti40NpJknYF1pEadilSjRWs0DapgU5SF5crNMt+GpAcQtB3H6t10ta+AUB
         23BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769387; x=1796374187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETpoavU/etKeFx8+GQOxJ4MGBcCWacI3Dg1a6QFBM88=;
        b=wjVfkaRxvYsWybVfdhm3hjKiafZxVWpd4HllvCslVNHYbo1zrxsQOQbLRC/6nttjh0
         ETbySKXxSzp3gF85qWjlIABjTIEoBNRqAD632WAl0OkR01NEaXCxW17KX1x9kF5Td5YX
         GvBUVxMZe4OZwogdlyn+hN5CFZIp5uUpavScCIUSs9Vt4c93WWd+yFLnQrGp1NodP7Ai
         4fFmJSpl5wpfW+YwMpMFf5P5OL+CC/akpNyjtMa3hc8JjEBsN6XlNT1HH5wfAuCBW5yi
         mHaB7+gs8O37G+0rcDTYhMU4DXDQ98NHPhfcCFE6y3ps0v6rEjS7MuOKJNhIO9VwI+iJ
         C6nA==
X-Forwarded-Encrypted: i=1; AL+hErEbw3lCh8w4W8eJz+oAyoKM8Gf6s4/9l+X2lohXu9qgAnQey4Q63bvD3t0YQVoznhrm9e+BfTcNh64/@vger.kernel.org
X-Gm-Message-State: APuU4Z9vYnY6L0OTC5W10RUQUq0wuhMXu17/O3I876hBEKXwK70BjYJa
	7kLqztKnv4dGpZSEKVPH7gz/1VmxI3GcpCVHeBLBCkCLea0kHPOgGVcCXRInmkaFmhhiiZ1caLX
	RYrVaxpQ6iXrBqUzXjWipaXCAMdne5U0zp8ytD4NHEUIRR69/ofaN6yYcNzeIWsIJ
X-Gm-Gg: AZFdTZdBKriHhZeWhVCm++H+vQi17A+Yx+I2AmEvbHV7F3oD8SR2o92qzeHvKVpX2kk
	t8TFaK5TB2SW4o0XuUpl1dJzR/0qYNuDByy9zJw4SD18rB4ldmReonkngsXYSbirsZRiOrm9JPN
	maVibayxiqxK2LKGIhWUS6GxmgXPvUvHYlV9hhmQL9w19cEO/CvQjJD9bD753Jw4WsjABb4CPBS
	JYHl3ixrSq7iuTSSsicEWqBmayI6fx9fdeoEWcqr92FY4jaLo/KB2uUezeEJMTq0eT2o0G7pFL1
	xHJDWTJcOFlcsp/xLWABTPr9QiwE/7oI5POAiFijxcnIx7blZWnepH2KT7ESEaGTJ9dW51lja0a
	e5g4TWAGcwiJLq1uXGpsr9aHyzzZOP4B/eyL/QBNtKux811GZYKZFOmb/JM7gWU8FhUSHjoWIeK
	eUSKFDos8cEEUFi6gNFVm6Uhy5RjFhkVN00L4IlownCf3ocwtmGrAveu+O42Hc6F+yr154o2w+h
	bmsRcwE01jJ8H47ctViZBGCm2PWdA==
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr369166255ad.0.1795769386798;
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
X-Received: by 2002:a17:902:ef45:b0:2ef:d8ce:83e6 with SMTP id d9443c01a7336-2f03edf6f5cmr369165895ad.0.1795769386371;
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:46 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:24 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0 overlay
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
Message-Id: <20261127-eliza_disp_all-v1-2-a18be7f65fd4@oss.qualcomm.com>
References: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
In-Reply-To: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3326;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=CzV2NA3Bg5CPsEbK0KJqhj/lR8zMyH4dHyWHv1oppsE=;
 b=DzAGilp1UoW6gYasb7Apa/INX2kErSd3QqawKYCFBfNn5AmPJg4oOISmgnCR+sJTNLpkXuA6H
 7VWQfOt99CdD5NyF85SjBo+VltbdntcZa/kUAvFEs2aeWuQIsRqRE92
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: 4SifW4A0jsRfukzyk2OafMNpMpkRto0Z
X-Proofpoint-ORIG-GUID: 4SifW4A0jsRfukzyk2OafMNpMpkRto0Z
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09442b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XfV8FL5vlgqiq40GVOYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX7qkUfTiW53yE
 wILkvXQR5kvG1Nona5b72B5AlURlIXCHnqNaU2D69WpQJbrxPmcJi/mW7P6fbbhDEFkg0nLotjf
 MYoYDFtwjQQdmrCY8qy6FOsBTXaCYLE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX63KIVo2f6vMi
 MSG8XEreG47L3s9J1FXsiTo2dd8GGQd5qPb6t1UK+6tjyFKbWPy1rJROj4ug82dpgcnMxQL8kxI
 SQcLDNjuh0kHLRo1VUh4X09rc3swFR3/oC9xiJdi6e88zA1oP1VSr+5q0Yh9rldGftT+aCNY4+t
 XYaZFr7++OdkbxSXPjsirGhTWNtfhpbgBdFrLimx3rtQi/ECZhIo7LwK2VH2Hm52YD/cayn8wS3
 uWAx8BZQX/nmIQRmuRd3u3rSm9GwuWTnHpeHVtqANz8zicPBm3QXjPg6KYWTl1AeprlvN0qvLMy
 U9Qjfm6X6jQIXcNLvca+Z2dW1CfTMjrjRBXnzMK0P8wJn92uiG7FLUr8Vbk0f7GLOcJhC/K8LOM
 SQ/0SdxoEaYABZqw3ZxwK4DD5lx0zhpmSIaL10oGc/vaEzz5FieSkqU8kn1UmY1pGrEBoOsQEP4
 90mTzook9DfSwbeuq+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the DLC0697 panel on
the DSI0 B2B connector.

The overlay disables the default HDMI bridge path and connects DSI0 to the
DLC panel. It also describes the panel reset, TE and backlight GPIOs and
uses the display bias and VDDIO supplies provided by the base board.

The DLC0697 DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso      | 75 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..64c61aa9cd8c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,7 +14,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
new file mode 100644
index 000000000000..a0a68d397663
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight_dlc: backlight-dlc {
+		compatible = "gpio-backlight";
+		gpios = <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&hdmi_bridge {
+	status = "disabled";
+};
+
+&hdmi_0_connector {
+	status = "disabled";
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+		backlight = <&backlight_dlc>;
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_disp_3p3>;
+		avee-supply = <&vreg_disp_3p3>;
+		vddi-supply = <&vreg_l8b>;
+		pinctrl-0 = <&dlc_panel_rst_n>, <&dlc_panel_te_pin>;
+		pinctrl-1 = <&dlc_panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in_dlc: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_dlc>;
+};
+
+&tlmm {
+	dlc_panel_rst_n: dlc-panel-rst-n-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	dlc_panel_rst_n_suspend: dlc-panel-rst-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	dlc_panel_te_pin: dlc-panel-te-state {
+		pins = "gpio17";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1

