Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769409;
	b=skllpxForySD7tyERkyP2s7T1zlsfW4A81jZG4VEPZbFSKd1zOEWC/b5ijdbnu5DV+Fw
	 u/Z3bPPXxrvCW5gbbGmtoYR99bGkbUqAEK2YZkje9wbxEnK5NYwTMf7JuhRZmsHc9kfY8
	 Ii3ccYDmcpTpC0NiXLmTvgD7Lfhwezrj9Yxdw9q1+eHFyCAmSBG0ojZ+RlnmN/dPlt3EQ
	 RpBNu7Um7kcJdI5IZetoaS5k/4Vf2ibMpfVWklM3k2NQx/eo/kxtSLE3R2nn3QVCyKVoN
	 zZV8aS3zd9piWjuese280ULgkK0xx8CtYm57MydYyfr7oAkmxeoYBglLDSjevsVn6JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
	b=3mCOpFui9vTvAFjlgSL3OF+CAR8pSqVF2QfBXjjmNDg2qMaOm0H5hknNKG7ZcoFjlp6s
	 8DelGIOoax7qFW5DQByXyAEUdmu/vB8KmSCGWuMfd9KfzfyZEVQEf3nU2axtOgIO5/sxO
	 AdQBddu1f2okZ4jgIpPPTZJeCNueXszs+KteG3cxMrmr41SnwF2d5pRFXU2YlMG9mziZm
	 uasa6LfpI3sGvWRANHuw01moiUunftEl4U/OUPxadQVdlBM9OIgG+tKpaeWc+WgpWto5I
	 bkJLSSwSdx0cu6u2BeXrzk/gm5fVAYrLorHb4GJy3JVwmSqEbYYgNts5oB+fuz5921Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV3Y+o1n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSh07ua6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839BB606A323
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 839BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PV3Y+o1n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eSh07ua6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7I1QW3118313
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=; b=PV3Y+o1n5z2Gf2Wt
	AiYgFCVzspVXaVobnxxnOC19ws5FF4dRYulmU14K2gImSh4LcalWw4NhAUDPUYz+
	L+Gq9fqTN71Yb0uxXun4OLQ3YzSZCnvRyU75J4wexECRMMKYwzOZyeeGUNrXeUGG
	fFpRWjDWb48OYm+qFaGAgZgOWkKJU1hX9ILbGxiOOFUtpJTJsJiUj8nWlStmgooW
	qVH+QKCNpSjQ1V1tvT6q86HfbK7yh6N+OOJteGt0USAjPVEK3kle4Qf6xRHCv2py
	u/0oE2FFuYlLy9EjcOGB1AxV5qm3KRkBcXY0U/yfYp68oTK1hPOB8l2jAIhs783T
	y4jdhg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8s5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:50:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb5a7c5665so211568a12.2
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 00:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769406; x=1796374206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=eSh07ua6xRWJmBFlPzyDILu5KXorkgDZWved3HtwxpDM7fur+jBPxx/ng0irm7NNeJ
         JkxYrOeN0FIdCa23XMVi14ejcillw/zeK+T/U8lCxJBghLOFrCSp8AUns9e+1+BKk+H+
         I5XKv9xUbtC4O+0qw8l398GMAuclIrOs6lt8riniTgEHRIx6BT3sySmbjl/P0Gz4bv98
         hc4WGOyrBcnWKU+IVYY3Rpe1YPaz0uO/eBeRMbQoUB/uCTrh5xO6dv9fL2fyUxDRfMDM
         3PHbZQGq7S5G2KCYsRSvtu/zJHYvi2o5svfUPTDlRzkdNoVjakmtLf+O5oCCFrhltHvj
         DkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769406; x=1796374206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/C0LqnSjcFwHR9wZhUlOB6p3A2W1rdv7Pn2rc2Yz34=;
        b=N6/Bx4OXjiCQ7UXJ4+w76bArMMQCJCWe5VT/85VYJW98LWPtbwqmP+jUbq7CEmA9T1
         /569zDu9O11RaLAvMwHcr123/LkGKObD3EFtRjbFzbMCVpnprG3u843aIpIWtqMKW63v
         H9WK0qA6s1vYiL59N0R+mdKkUXg0ZTzb2bbgBharH/NoBbJ9466uSpZrmnd6Paiooc35
         Ylu8Okmmkp759+w9H8CZgsxLwCOggtJnwytIHWwIRmJsLE6e4RpyIhWnMUI+9C/qBCaZ
         vzUF2FaDUG35nvMkHU4gYEF1jr7B/0vJvTw4AhpR3l8fRqAQT5/7WBpCcfaJhJ8o8KGM
         BKDg==
X-Forwarded-Encrypted: i=1; AL+hErF3Qm/NgK/HIsiIu/8paLJnOcjJgA14jQXFVc+/Ie+aGGhsi49mB9cC2WIiH/3nzSZuP0WIKPJEhGbT@vger.kernel.org
X-Gm-Message-State: APuU4Z+HQ0RR6hpg5iUoJQ4T7neUk4WumxtkfegND1RdliTXolPfq6ZC
	tuCoJccnYAlRX9RKXhMMvQhjVs/2BFNO/cM+kKv2Ao2+Id51NQ08fFULgLDZbmmMAu2vkWfHvAJ
	Le/tJHhPey9aCtnhfLRaJFlwWNGivjmMlMRenvIhqKNCnLzaEGx0bhA4PNXk7g+NL
X-Gm-Gg: AZFdTZcjlVek7vdcZ5/03RRZqdpPSAxyJ7zIphqSUwkkCca35ZyS/p2n0T4UUG6Zk7b
	QaVy0UyEcyf6M0DvBd5WEZxG+PrqZs9rEW1xfYjOKMoU1E7UOwrNuojykGTkuSlwkPFJqZKj2aY
	0lhM2R2XZWsFkpMHmDI8hvS3PTnGuDW31MOm2LWP8NtgcKhY3Rhr5ox/WP6vBz398qIry/UxvPe
	zc5ffQ0GWeaGgi7o5N/gVLk2tLZe+QCw+1Mh3uLrxnOHmTA+mT2VyBk8JC+EFxVIuYYJ9hHBr11
	Crk9VyUCXwuIMb9FlE3KV4+ErIyZbQ/Dfr6v+JMoabbk6EpaglgtW8F5uFKcstD6aIy4OdUcAkN
	1t4Pc1LX36i9IJue4CQ/Acea3BWuorOT1V/sOBmDQoJ0OTk0XEY3m8X3mMKn+Bv2mqcAV3OP5sk
	9ccuEs+Nwtjb0qwmE5Jf7554SDLRGd+4BGawOf2P+zn7SphOZYE0+Bu3Vog/1GPmaL5RdAqh73B
	XtzROsWNUtNu1KoIVUaokWgg7j/IQ==
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398245455ad.0.1795769405983;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
X-Received: by 2002:a17:903:1c9:b0:2e9:5714:607b with SMTP id d9443c01a7336-2f03ee6aec7mr398244895ad.0.1795769405440;
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:50:05 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:27 +0530
Subject: [PATCH 5/7] arm64: dts: qcom: eliza-evk: Add AUO G133HAN01 LVDS
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
Message-Id: <20261127-eliza_disp_all-v1-5-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=5655;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=eIY48vZ7AT+BiCP/Hi//wkMEMZbw2o96jA/Lj+/JdQs=;
 b=3Wx5o30bdmAjMhLK581iqYyYklmpBDQPPsWobX4h/zj9x0twIQ0DBQVdmRIXJ9nSZUQKbIA5m
 g6neDUhEPFlBgOD1GaNZnDRaNDZ2j29kSLRcZGNm5zkaO19aQXh5BHZ
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX+uugKMBsxH+h
 bc31KJLCvKjU0pOe4NrcaP6wcEiUvOQeQHaf/qo2ciF/tbY65DE+9cIBCmHxSfM88oFbKL/jhxB
 KKBSl2fgD8uw3jKNFuoKi0kwJ44zhG5sPtntaZr1aNx05YIF/S8mhb5GkumQjFHq/2iSNWPRZIz
 ESV+piEAYBKYn1d7rKicx+vs2/uH0R5fsMnYvMvIVBVe5uQZozdl8vRgb20Vhqb/bqfegMd9yLG
 EiMLrCfRG7k4vJHMGJtosobbJOUEI+LsmeMUrCUfSLeTZG+IxDVib2C1M7apKcHrevxvW3xbRlU
 r4zDi0JmDwphRv+EVpJtyjwLc0V/Zx0E2slQArG+Vui7jr0KJE7jSYsoXxM3Us0RZCTxNFsrF7A
 mvBAyMERipSzOYya2pQVSUlRj7+L8yP0QlqSmhnj0RLKLbhSz7neyPPBn0vuIbmBlGViMYjayfA
 wJ0jTFauANJaQit1Wbg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfXzDtdIlycJB0P
 qCD/8WhPonGxa01LxD+1y56vWHKeV8vCrg7zgT6hR94ZrjbwLAh5At/JjMDQ1Vqc+8dYUlKun1J
 XEttzmCxiOh1tV/LiUi2IM0iuMrsN1Y=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b09443f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=X38TW9RF5Lljsf8P90YA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 8p4hSUzzDtH7CJpQ7EUgi65MJ9J2tMRu
X-Proofpoint-ORIG-GUID: 8p4hSUzzDtH7CJpQ7EUgi65MJ9J2tMRu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270034

Add a DT overlay for Qualcomm Eliza EVK to enable the AUO G133HAN01
LVDS panel on the DSI0 B2B connector.

The LVDS daughter card uses an SN65DSI84 DSI-to-LVDS bridge on I2C4 and
shares the display bias, reset and interrupt lines with the base HDMI
path, so the overlay disables HDMI and connects DSI0 to the bridge.

Add the PM7550 PWM node used for the LVDS backlight PWM output.

The LVDS DSI0 B2B connector path expects SW3.5 to be off.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   3 +
 .../qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso    | 126 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |   1 +
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   7 ++
 4 files changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 64c61aa9cd8c..d8cac5322a19 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -15,9 +15,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 eliza-cqs-evk-emmc-dlc0697-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-dlc0697-dsi0.dtbo
+eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0-dtbs := eliza-cqs-evk-emmc.dtb eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-dlc0697-dsi0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-emmc-lvds-auo,g133han01-dsi0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-dlc0697-dsi0.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-evk-lvds-auo,g133han01-dsi0.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk-ufs.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
new file mode 100644
index 000000000000..3da0dc3c0de8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		pwms = <&pm7550_pwm 3 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <153>;
+		enable-gpios = <&pm7550_gpios 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lvds_bl_pwm>;
+	};
+
+	panel_lvds: panel-lvds {
+		compatible = "auo,g133han01";
+		backlight = <&backlight_lvds>;
+		power-supply = <&vreg_disp_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_lvds_in_odd: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_a>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+				panel_lvds_in_even: endpoint {
+					remote-endpoint = <&sn65dsi84_lvds_b>;
+				};
+			};
+		};
+	};
+
+	vreg_lvds_1p8: regulator-lvds-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_lvds_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vreg_disp_3p3>;
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
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi84";
+		reg = <0x2c>;
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		interrupts-extended = <&tlmm 13 IRQ_TYPE_EDGE_FALLING>;
+		vcc-supply = <&vreg_lvds_1p8>;
+		pinctrl-0 = <&bridge_irq_pin>, <&bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi84_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				sn65dsi84_lvds_a: endpoint {
+					remote-endpoint = <&panel_lvds_in_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				sn65dsi84_lvds_b: endpoint {
+					remote-endpoint = <&panel_lvds_in_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi84_in>;
+};
+
+&pm7550_gpios {
+	lvds_bl_pwm: lvds-bl-pwm-state {
+		pins = "gpio9";
+		function = "func1";
+		bias-disable;
+		output-low;
+		power-source = <0>;
+	};
+};
+
+&pm7550_pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index 734bea47855c..e3f3e3aeb089 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -7,6 +7,7 @@
 
 / {
 	aliases {
+		i2c4 = &i2c4;
 		i2c8 = &i2c8;
 		serial0 = &uart13;
 	};
diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..3a7dc47ced5a 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -57,5 +57,12 @@ pm7550_gpios: gpio@8800 {
 			interrupt-controller;
 			#interrupt-cells = <2>;
 		};
+
+		pm7550_pwm: pwm {
+			compatible = "qcom,pm7550-pwm", "qcom,pm8350c-pwm";
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.34.1

