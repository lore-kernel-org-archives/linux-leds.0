Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769414;
	b=uzCzPtmNRG0eNF7ciPn64GvqN+0+sH/ggpTedfLwANpH5JrjvOoPES9GVQjPon/TX/yr
	 S0RbzMq5LhzJMe0DzQz13R7oG4ZMsD8qJ7dBfmGbEzuJ9fizOk0oMs1YT5c0Djwd9s7JZ
	 P6DDHjAp53EJCMqU+tlSkti2XVF6VlxUe5euVy1nKz2Wo7Io5CiO6aMuWN8zaPVgYBRsm
	 pFWH1sM/JSooOq9LY+1d2a4KIkapiK+KfxnTX+k1hQRF1xnxbt4tLM8TwtocTmeFcxf8M
	 P4NnNQ2u3DgHxFzzy+ZgF+JbNh2S7uZLZ/lgyyEWk4ZezlkIjcJpUSntWXlNu0y6uyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769414;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
	b=rhyQUBj7QkBCpik1aN0x6K0N3GgBMKIwkq9JZ0fvDaPWuGGzShNaG+lTv7F/8WYqfwWF
	 zwp8R+pLrChWFxmL2cREO7DijPXo/iUBf662mSuHPAmSL7KLR4A8GqK0czlC+mk5saqY5
	 YG9mEaP8i+FENTzUZt0zWmW5AZkCJ60feD0L/C+4CgX0rF+fjMRN4Ltse+qzhIW9QxKWM
	 gS9lsX8PU4kK6niKk+cgL4OP37LxBTJewo9QdCDVL+rgwpnIj4LYBbY+DxnVidNyidgOO
	 3cJsE/tKiP7U63XLIK6Un0mbA4qyKpQm21kX5i9vL22P9gTA15OO4Wk6P/r+icYcijg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbNxvnWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcO7gyJo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE8C60A3828
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCE8C60A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XbNxvnWh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcO7gyJo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GbG93983840
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=; b=XbNxvnWhk/MWVuzp
	RMhH+S6HgWWmPceiFqprC5hnUSrMXnUtQDzWw/QvliurzXrrQ9fu7Ov62v1I5PPN
	3BOlYDjrDqIXfnhXQTl6p/SFqk54PHdgilW9VQty29ZClP3OoN2+vrHgJMMWxWo6
	78t6DbvvCYBQLVWxxoZOeFSCQCPVfUFIesKBMXFIYNBn2bv3+DyiFujv1jPVHdp1
	b6C6oxyKebjH3NkuNd1Q04Fk7Z6H5hW5ylKAoou5PvWKHEq+gg6rCKeRx+4PhX0f
	yvWwwLB2q/LOsNfD6xIbpKF/7XAEmBWpkGDf7mgBM1YAH7rc30OiDqWKgpUHkfwC
	TxibyQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb53f8aab8so257770a12.3
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769412; x=1796374212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
        b=RcO7gyJoSToQoLZAh3/3dnusglURZVvmPtWTVojzIWTAsG3irJu3HR2i0USWfzXMjF
         /U2WGv5b7nmQyFpj7z8VIk0jBgtZEHozH4BE5A/dskjkLqV0OVeW88oTWtwzGEH05AOZ
         i1anjzqHI6DeqwouJW6biTXc1vRuZgHYOTc4pOYwsOrRC2/0/OmYqvVAsucoCzni4woG
         ORHvKoQG4XlnVTPl60N9ykXmYdwqNyt9uHdAnzctDYmoq5ULk4PaBuoRfuFWJCsaYMw3
         foNSusuJEyxsmtIpFJi14YPmIqpJYdVwGl6DBBNOGMPIuLjX+COuY6kjqT6d8AwiAMAN
         zZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769412; x=1796374212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROlTQJTZQ9QnDDl9LWG3ZjMqcYuTf5tNI8Ms1jzAQAM=;
        b=K8XMKde7a1LYqprLXflZhTp/o3UrC3SndkfAvpVsszNYj4Ui+0O5xEZvlNa6SwwFZF
         190uAuWvrDtrk8Bod3FUVLLmqp321DQbMo8Ars8knXk2nQT/gIOzeYyY6OiScIjxl1eb
         vS9IPKAeop8ZvoaHgStk/PWcRwy8Le0cBV1bStFmmFmBhJVcVR8Cm22eYqgeOYulLl4J
         8O40Lats1h5gsSIMu6SCmsWROs2iiqM/eBt+S6aRIPwqB/9sThAybHVJZfUbnwxLY+Qm
         WDXigjET6gtNTfBJAuhtUYri2/8O6rGgen/GhUEC/OLUWh2j1B8Z7MUajUsk1fowN9/j
         yvXQ==
X-Forwarded-Encrypted: i=1; AL+hErF/6RFxpJybyow/dGgOQA0eXg05pHGjZDvuR47vv1t7aDPQ6+BlndwS4k9+9DEa2cAt9YJWbHHtTnks@vger.kernel.org
X-Gm-Message-State: APuU4Z/s94k3nfFEscXdtDgrv0oqEaIBKUbJ6L6SQ+zgM2UYl+Czpt/V
	O2uRU+g04CGK7/ADi3Xvaqk9Ax+SHVJu3I1cfu/ordx60xXBjTsyTPBREoUOwohwCHTralXes55
	Chdl0Bz4lpxG30JpQKDQNPI93Jyh4Ihtje/zh5+9bm7ysN9OXyYhluJLqgC5jr4Y/
X-Gm-Gg: AZFdTZefh0Oj1//y72eOUrq+Vslv5Qd/TrWV8sY1JywN3RuARkPR7Gf4T24Ifpi9n4p
	ixGKlxX9OQD+WE/8YCEY2DUSsn++7MBMLQV9vChwPUsXkYIs3O2WiLZMI0i5hmZ8r8q+u+OWhJf
	azpcnRL5w81lyHtc48cZq6fgUz8PlyX9LsHRH0Nf118dF48RVfbJ1f5PIcfWFLJniEJqrzveCYR
	yozmwBmZz2WJQ7Ndvnov6oSKeMNZkWvCSk7ygsb63fVLTRbGJqEhQ26eGKMHaNnp5fICevC9HE0
	Ew8cE6Bfr8xyNR4fpNdjgyefyyhCrzoHbD2Vw4pRMLMewR4SuH7ujXFYssYjUZ6m8bBPqqNWQTe
	04/WANrXzMBVnipkqbnhkAaLe91fM85sxGABsT6vrarWQ171eiCRBAwGIuSLKb2L5Flyl1xenzB
	YmszLLX9Fi7PE8y8p3W45b2CO9cozVRJIgzdEtgsFUA32vWYchUkJ+yQMunfc5GpX5YZ5JRKrnZ
	Mnfww89WDDd41xs5j95Dasq1en0oQ==
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr379202575ad.2.1795769412470;
        Fri, 27 Nov 2026 00:50:12 -0800 (PST)
X-Received: by 2002:a17:902:e847:b0:2e9:6468:2005 with SMTP id d9443c01a7336-2f03f117acfmr379201855ad.2.1795769411765;
        Fri, 27 Nov 2026 00:50:11 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:11 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:28 +0530
Subject: [PATCH 6/7] arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0
 overlay
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
Message-Id: <20261127-eliza_disp_all-v1-6-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=4093;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=ozVFPvwCToClH6aGgrZS4PFCY5hY/HUAi50iI0h5UIU=;
 b=bcCqAp1av8GYBVUZt3ZQMJaV/hca+QKvXb7Ri69R/DLBEYBMQewIoYf3EAnc1BRkZkfgKj1sO
 RQoycvFYi60BdhzoBEqIzQlx9FqEX1KYH2t9RE1uUJ/+ov0lylpTqSg
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: uPV5d5PFaxFCX5ofnW915k2jgq3QCzvU
X-Proofpoint-ORIG-GUID: uPV5d5PFaxFCX5ofnW915k2jgq3QCzvU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX9AS1IZ3NdWe3
 rC01XIjItgtdFZuz4IJBzTzOmKq/JgxP8ob7BK9EiscK7/XfAJHtlFPPoM1FYWud4hINE2usc66
 86vo576Zfsjq9uwKbZf242M2A/ytCoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+1eLtsHyh2aJ
 qiFeO5p+0UXpEj+3UyHurc9R5wsAJ8kX/ArKF5JfzVj2zedFm/nfzEUIjp+7OyAp04mZi+JUArC
 mneQNJgUT6L2NysIZe7eKLkIKtCfJkIGxvNegpDArpwXNotL9/jhXZszyNyR66IX4HPqMmz7/Um
 NEtTj5SpuSmNnNYJbZIXv5F1Xb6KPYaPALAjODJ4HMiceDe482wo6tl5XfpQs+gJz0fM1UjNcKJ
 RFBca4P5MWeg935iCjjvbXF9/vModiawg0UPueRkIX664cCslUXkNp4Cc2iXH/jSjrzKZu9ju42
 qz01BoCb2s/lOJYrbT6QL9Y3mrlEeNImHPNr4V2dGHamD4SNgphy6cH/0KH7iep7rwC1WvnvUy+
 Np5/RPX1AQenbwzFx/2zgeWRUp9ZJse9PvoF2xSCfWHsFkvQYaAD0BR4T+6dO4K5yz5o28z9AvP
 CbNEhP7eQp9feWfHwRw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b094445 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fr-BqTdB3QoRZjYE0SAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the Raspberry Pi
7-inch DSI panel on the DSI0 22-pin connector.

The overlay disables the default HDMI bridge path, routes DSI0 to the
panel and describes the panel regulator/backlight controller and Goodix
touch controller on I2C8.

The Raspberry Pi DSI0 22-pin connector path expects SW3.5 to be on.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +
 .../dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso | 87 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d8cac5322a19..9183f7c608c2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,11 +16,14 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
 eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
+eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-raspberrypi-dsi0-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-raspberrypi-dsi0-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-raspberrypi-dsi0-7inch.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
new file mode 100644
index 000000000000..33cb9947f463
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso
@@ -0,0 +1,87 @@
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
+	display_bl_dsi0: backlight-dsi0 {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_display_dsi0>;
+		pwms = <&rpi_mcu_dsi0 0 255 0>;
+	};
+
+	reg_display_dsi0: regulator-display-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display-dsi0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_touch_dsi0: regulator-touch-dsi0 {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch-dsi0";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&rpi_mcu_dsi0 1 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <50000>;
+		enable-active-high;
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
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	rpi_mcu_dsi0: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen0@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_touch_dsi0>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&mdss_dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		reset-gpios = <&rpi_mcu_dsi0 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_display_dsi0>;
+		backlight = <&display_bl_dsi0>;
+
+		port {
+			panel_in_dsi0: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in_dsi0>;
+	data-lanes = <0 1>;
+};

-- 
2.34.1

