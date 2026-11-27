Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769382;
	b=0X2qI+od2gd2UGc8Annl/0OPIOFldAKUoVsRsxca4viorweymStLHKxTzRH/2rFZYwm2
	 2aPAa69TA9c3N4cXkbYDjMrNvhjlFwyW95bRwwTHoOwrRHxHPuWZZ38fW4+pYLi5bcZlt
	 +8j9cv/YlEv5r5LImOwK0yaC1YLVcAC3tCVX/hpMTsaWj2lcnTgTY/yACugc0oBQhii+E
	 05cR77D8D7J+tXAwGyzN5lbJBctDztFsulrG5wWwiYgUrDBoTUfjQeYmNSvvLRYoStLvM
	 2WBznEZXhwzo/NPm3XP9mbhMWMT056DNzCZpmuY+wxHs/66ftP3QaZPHsNpzk5KHTtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
	b=vLK7wYeP8BXO90Xwuf4lgJ8TYtiZXtuy54deVUKA7t1jAtxTlOHwUwjUk4THjTXW42n1
	 G1WrPy+w6YWTQobpjdWQrRPDCJsWYYhI76YlvdTYmVMckaCpjjjXHorulPi5I23uy+f95
	 Jm/BDDXzCb8N15SHIoINHttMDw+rWbTOvJp6+73Iifqfvz6DgSxyjEYKCTv9dHpY5wbMI
	 Qn/ma64YFdMxFs0qhdDrSNKrDFOyBzKBG4A6WoeXyNfogKHibZtJEFLpDAl3TUtOX8Kv+
	 8Z6UZh2B36LHnecbnNMv1TTjnjxLed9/ox023oyOBEB55wDxhPaa77d+k9FalSMz02Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fiocv4r3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="E/qqubfd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D63606A6B6
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D63606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fiocv4r3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E/qqubfd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GpE9560431
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=; b=Fiocv4r3+WrYzRgR
	ylvaa1j1Y4nn0x5m4z/PrPipQnhkhVj8NrAj12ZxAAM1UOzTmymp06SQluXMUIHB
	bsTUA6DD4E1dhSORqk9vKqN9mymsi2/f1rPiFWtJ3vDY4tTwSQKmYuYhu8HipMBK
	oq5VTyYcUtoOgHAJJ9qRMISBtSvCj952DB/T7TPoU+pXlSoO1yWNUqIzZ/jVXaSf
	QSBXXkaQJ8aR75rpZUXqNmrt/DxEl+bT8kvBDO/Rw4PeK3FHZm37MKuusnV2uCeV
	N/D/yQEOp2vZoCJhC7VXdEVPCAZrjHqC4YwuAjkXfBJVdn7nv5da05fvhXK8VUNm
	ldCS/g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqk395-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd84379223so242579a12.1
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 00:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769380; x=1796374180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=E/qqubfd6luEFv+hCkwXI+88Mra6+6zyqGRezhVyv+Mv3nkA1cYAWeJXg1gQgAHyIH
         vWuV8qKjQkkwZXhRa+cpDHb1Oyo+C1Zdc69bnZu5FRfT6+0uqo/Rsp8d4Iq3DYncG1bC
         Bg+dGKR3U7liTAVA02O0o954MvTbWvxHIYIJSiwF9APjgS8MvtRb9nzy+GV3picm7AH6
         JjSlRnBnY2Uiu8vRzOJv4ssgePuY1MFphvOpaHxVJa3CLYIe3bieBi6CJlfFXhYWinRA
         TbEufGTcBmpAbu2RohU5IC5pNuYRsjEhKZFWNDVvwtL3gdEQa+xf7eWLYUBxKkqsBreq
         h/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769380; x=1796374180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGbAE/320GNzPEcrHnbIjRGXx1fYivBklJt4FL24AF0=;
        b=hgFlQBt6w6BhQTwFrEhJ5W9UklVti4VISPA2kZ08oUnlbAvXVZC1wvmrRWuOLNFVQH
         siD3xPHpqGV4zWyR0NWX6rw660Xbhoern76M6oFRVSwcYqHjdshWMIQqMWfeqq9oExEo
         DwFbqBm7kYe4mrJI3qOez8H4DgIRru89HpWU43F+w1h3Jkjsgf6eNakvZywWuM9aoziV
         WdXXbL0hu0MBBQ6SskcPJeCLQMqRpZMtdSeIzDXLjl2WWzGw+3y7AHlZi1Ldii9ZB8qv
         buD68lB40nXnuL3JuHHCXI2g1gPWT/mXtUF8ODom3/q5MniITYHqF0Mkr9OchRl6Rfbv
         khvg==
X-Forwarded-Encrypted: i=1; AL+hErFl8/OILv2jDGZuuBgZq7CdWvnHGdBQeuHTsVIf8tZAL13k6OYmtQphDipuyp8kkbrSQjtzFTSfHcd3@vger.kernel.org
X-Gm-Message-State: APuU4Z9StZxAEBtkcBjaCdyGMsJ6Ce6JfRWAC46nKW5wE9kCtNtJr4o5
	qIAKW4NSgP+KHE/YWdFZVSvIrr4+lyFXF2L2Zn77tDeAnPAyR5cPjy5m8U7Tnrwwf7ZXJPVSV+c
	aSIm+OJza0GT16BPkRQ3fCBNQtr7A3EMW5xjGuPgb5Uzj3d9z4o10c6Mpx1EnXqWa7K0cg0nO
X-Gm-Gg: AZFdTZc7XmNp7T+rqS5h5OOuM/1/TpKiWus4MH62qk1pmJiD2VA/v3FJhDILB/XJjwk
	Mk8GM+fsmpAXyeRSYHS2yQYIdbC/gQM77Vb0btBiZVmEfiOFjuhQXYUAYlesBHRXEh/IGgipWbR
	zC9YMq2SQD9GLewo+SS9ECevPBTIBWJU3TJ8MCwq2UokkdLu8YKERXhM6H/uXm3jAgbBzb/o6jW
	8fuNERkDnkmblD4VVjPL8KKZ+uTOj1lthzMC2wF2gKS+L9WHTAwD/GZXMKiLzVkKQAtTAQ658ln
	IS94ynvJGUY6nCFfDq6X8E140ZNsKTdPhVqnFhOhe5jxPd18FyVn+Uooi3klyjsW71SmXxAcaPK
	2edoOwIXUWLAg0SV8bmC7hFPfcY2OcplgQVSBi/8fAbvIMb2Va3xZlozEhCU+Z7aUf4S0klX13u
	5svFzQwNfdyD2fas57Fw3x06NudfQLQ1+HeSdXNtdq/IhkeZVvOiBVojr8HHLa7zmlJm+SI6Q3l
	J4hP+A7q8cg5N8zw1+zW9s9nhqNmg==
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869825ad.4.1795769380476;
        Fri, 27 Nov 2026 00:49:40 -0800 (PST)
X-Received: by 2002:a17:902:e38b:b0:2f0:7707:227c with SMTP id d9443c01a7336-2f0770728c8mr194869475ad.4.1795769379993;
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:39 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:23 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: eliza-evk: Enable HDMI output
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
Message-Id: <20261127-eliza_disp_all-v1-1-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3172;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=Tc4IF8QhApcJLjNKZX1uGI6mMT6TCVFK65N6fccSJGI=;
 b=DUR+qCC7na9KJSaIm53BA7ckVADIAExITbGXHQEnEBNeAp+YuPPK0eKm5sSQEhyYEb8hfMPF/
 QiVLFhHJBQwC4r1tpMLczv3Dk0BKy5sTxaza0+wpFI5uU0WbesBAbK1
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: PsZslBcEa6sodWa5gmfbmi52PKoTj9hj
X-Proofpoint-ORIG-GUID: PsZslBcEa6sodWa5gmfbmi52PKoTj9hj
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b094425 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sRTJwmOA1GI60g-zRKgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX9j7FhDvol0DI
 331/+NWEqYveEEWe3Bgr888DBB/yQZ89MBDq66tOxGhZgDSz6DC5I5QowZUDDUlvRpNswpaY+Ep
 ySmB9v5278ZaF3y3Q1OMhp3Ztbt7NCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXzPu9ynwN8Uw9
 autr90gQmlLaD1gPIB+5SDNorpH+JIH2B35MMNEM3B15KrZXNvtjkM9rVomJ3ImISKz2I16kk3a
 JAbFnn476udal2TeIlfskgiuDVVWCSszMM6JIfXTX5HTswFJ910UKFHqur3hSDdebn/7DR3WFZj
 i31AL5Ap8DK0LUEoOSs+LSmCovK69g55KzGce+wA152h8h5F4CcLxL7gcS1LatRFqXXU6XUl7DB
 6SG+5UHF3ZMYrtq/QbznRWysZaCwUGJgMIJblpSZ+kXS3vHYORivst4wD2/4TAMEeA2WkgEmSQw
 gKd/N9FdwQ962CZQDrdYokG/Vf4V2HsqX2JHVYF3xvDlZy3DItSuOHJlriX0GjVrikZdFP8Mr4s
 g6hBmAL4RFH7JD1Uz0WlU922/sHllbrgRp1yEZ0yo94/i0b/8qz9MIb8lAlIMDA0EZYlPT0WpjF
 W1OA0YWCBBvvoiaMbaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Enable HDMI output on Qualcomm Eliza EVK through the LT9611UXD
DSI-to-HDMI bridge connected to the DSI0 B2B connector. The bridge is on
I2C8, with reset and interrupt lines wired to TLMM GPIO16 and GPIO13.

Add the HDMI connector, fixed 3.3 V display regulator, bridge node and
DSI0 endpoint wiring needed for the HDMI DSI0 B2B connector path.

The HDMI DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 90 +++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 8c663ef6718d..734bea47855c 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
 
@@ -220,6 +221,27 @@ m2_e_uart_ep: endpoint@0 {
 			};
 		};
 	};
+
+	hdmi_0_connector: hdmi-0-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_0_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8550vs_g_gpios 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
 };
 
 &i2c4 {
@@ -238,6 +260,45 @@ gpio_expander1: gpio@3c {
 	};
 };
 
+&i2c8 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_l8b>;
+
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		hdmi_bridge_ports: ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_0_connector_out>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>,
 		    <&dmic45_default>, <&dmic67_default>;
@@ -514,6 +575,18 @@ m2_w_disable2: m2-w-disable2-state {
 };
 
 &tlmm {
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio13";
+		function = "gpio";
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-disable;
+	};
+
 	m2_w_disable1: m2-w-disable1-state {
 		pins = "gpio35";
 		function = "gpio";
@@ -541,3 +614,20 @@ &mdss {
 &mdss_dp0 {
 	status = "okay";
 };
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};

-- 
2.34.1

