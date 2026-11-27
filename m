Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769376;
	b=GIkPIBBLJxVqH2WIyuEgmi5ccWch95Ao2pATBBXfelIu2L0/JD3rX5XlvcJEKW9xVtbM
	 MecXBeEnlKwvmRlKuCq9B3z7EyJH/g0/ypJ3/VN8VH7WbA2ToBi4ZQXLC8GcOwHHGgurL
	 /UMPlHTWrbgom2ulVEjGW5Wwlo01s4Pwl/4FszTw64ls2cayjjxS3m8sk864AjvEchfsa
	 dKugUcEKfDOd02qfNcCyPUwHxUKpsxLd5fjx2HfvJQJQNksJwMcFH9K5SQXNkvCueb+Qt
	 F2zzi39KEJHgT55MYoaCgUzH6a4akTufjhZVAL1+kIedEbCkF+GjOzGKlQMn9Hf4HQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UCKdLvtYF+l2s45zdbmihw9ylq8RB+NI5sUQqtc5uaw=;
	b=P4sr9Huub2NHGAKWxBbdlzbu+iKePPmg6jqX+t7tRzLpJQwt6h7GCnrJm2KRwzcQg/3l
	 ZwVhBggwtT731SyAvXAe/8Mqk8AfSJkv0cuxZeQ/4OuPrSjcP+0OVvOJBTnwf4Mhf2Ya5
	 W0SF3Ww7qwJLy5j+WMxPJtIq1XoNmZD37/12lLk7Tk+PA30v0mEUPYkzk9UbhRbiV6VKt
	 262Sk3UW7zhjV987vBXhJeS3I6VMPfO1AwnBvEWacQ6Fgtuwti8yCkgKaPAcwiQ4j+gRi
	 A/AMjDpWGFi6bktU9d2HtRRIiPmdCsIdcgLyak2n4lqvubiNW9+lycrlf1R3UBbj8Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClcZVYzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYw1wIVI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B6606A6A6
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48B6606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ClcZVYzf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BYw1wIVI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Gbs73983850
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UCKdLvtYF+l2s45zdbmihw
	9ylq8RB+NI5sUQqtc5uaw=; b=ClcZVYzfTAmK0pxKS80A2unURtcIZ5ZvcGvezP
	VMCagDnxqulfh5vIEQz0EUhQS8pAGoxVHKx6OhoiXh6pmvMU3oOo85BHoSpdQ5Ed
	rKtTWIbdOMOEzyJBU0/uJjGMNsptHXW+Vcv6zHavLeJlaoBmPqZLqaCu7XwA44yL
	sTgFe9c1Uzqf/3+bWvvQXQ0C7CkLCPuszubG3jHDcdQCSBp85FP7BBJufo7IRMU0
	ZsXDbXobWAPsL2TgfCQy0bkK29YxVIJh2XVtE+d940HJUg8hWrKkHzA7lwlCJ6tR
	9S1J/+TbMl2jHMVfn4lyK1cWVue0lvZ9EuO999TVZbGd5gHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49a4fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed557c462aso16210495ad.0
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 00:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769374; x=1796374174; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UCKdLvtYF+l2s45zdbmihw9ylq8RB+NI5sUQqtc5uaw=;
        b=BYw1wIVIj9HmToDU8NEC6NVdzj0ThlSJQWVMK2HAqOUdmTjZiSjqqHmfT6HmWvyNQe
         fg+Vs3zXejd0+RVG/mp8mHy5IhS8UZkMQhhQj7yQlly7e0Ie8xRnv+M0iudI4XCzxq68
         zN3ifEfgPc4R0BZQXDCHrJ07MFdt2Bs6p256p5e9f3kF6XakWv1orJfZnZ0bv9gNBmWA
         tS0r4/1sekXNOJXgW4ibZrLzTu15BOHU8pc7Bl9h7UhHImJ1I6xA3HTjoOaw7dpT7GRM
         WMHomZ/rxDaSz0ULLJlG3ovPTPwWfbxVL5PpaBHZr9KIoUlcGE+yl5s+evfELN34nm+p
         jTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769374; x=1796374174;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UCKdLvtYF+l2s45zdbmihw9ylq8RB+NI5sUQqtc5uaw=;
        b=1YeYu8rQdHeDw9FEcADXvDlYoC/Fc0Hp2q+iFsQyco6wGbgv/kIHZ0GgCCvcesABpY
         M/GJbq3UUJjQoG3wyv4jBHZToOzkHeNxeZL3o3V165cjVmW+aQGzFtpCLpYelaiRSFWi
         A+YkhUb0T/Tq/lIr+mjgbxb5xuw8O5wz6wCZsu1S0nrgYRsTRqjkzvdL0BA3piBayPVF
         l/bRhJ+MzyiZ2WmI8USd3aImwvOD24Q49p8HNmUiQcArHvpzFfrQ/xsP4kFClAzLgl1g
         s4a6YyyVoi6bFwtdAlQjo7kk7cnsKSTHKbs9pIJb7OiBxGFfXMNOcWwWGKFaIzBXt3gk
         UBQg==
X-Forwarded-Encrypted: i=1; AL+hErEME57s8kfAQdCgaI7v017to8jz50zXiAAy+GPXAg0S1CC9hXR1UFq0qG559gwmJU4zjjOkvjlQ+lEW@vger.kernel.org
X-Gm-Message-State: APuU4Z/vNlwcpb5p0SJc6/UroeVC19w1iWqBjGXBxq0+R/hLpT49g3Ql
	xnG+0QFsbiy6i+zgq5hATOi4NsDiFJrygFwOYo5M2ZGaPvQEoZeyZkf3P/w1++5aD56kDe1JsyO
	VWUd9p8yUoe64CoGbq2naWBxVUeMLhobGo688Q+dHeTELRpiwPdIQG64k/xq+rjT6
X-Gm-Gg: AZFdTZfRVOYrOarHZAYFOJ6rW2HYuWmrVrwUlrg79qflo89Cxb2bBvTMTLttDcAVksN
	M9eS3Acd6qIwKBJRwzsU1rEtmMSO10JCc3bAt/7F7zc86IV1BhUwvvXBanZzm1Z00lWHLmG8uEh
	oVfQF1qJAn1tZAkv99zas/jAhcP7LqirZkRoY6Re8HHv5sAYPyHiyw8zmQZLQwllqJ7psT3Q51k
	IyYe5n8+dpXfGX8C9ZM1JWn2kCIsJk3V/3RilR1oibQ9ASmpKxljRq4ZGtM5C7QwE4LM3BYswUT
	/1E7a4ZhkoPzefxY7roYrv/e3JEfvMYW6K8WdzXTUnm1WrdzOmzYi5arZ5FYN/zSVRhIcNl8y19
	ADUthXaQLrkHMwxqzEOJRJBChegiU1iYzt1U+0OESgp709C/I+sknopSpeZ+6OQX0hB9BT30+Up
	XLFcIftYQFoao4ic3XVu1UADiQe4sYKpuaHk1fjgCPw5YonFKg8EMyU85o8qdDNhPvcLNC/4R9c
	xphwQO8sbZ0HXdBgA2ySEzi6e7C2Q==
X-Received: by 2002:a17:902:f70f:b0:2f0:3956:3a67 with SMTP id d9443c01a7336-2f03f113631mr382995005ad.1.1795769374146;
        Fri, 27 Nov 2026 00:49:34 -0800 (PST)
X-Received: by 2002:a17:902:f70f:b0:2f0:3956:3a67 with SMTP id d9443c01a7336-2f03f113631mr382994715ad.1.1795769373681;
        Fri, 27 Nov 2026 00:49:33 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:33 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Subject: [PATCH 0/7] arm64: dts: qcom: eliza-evk: Add display support
Date: Fri, 27 Nov 2026 14:19:22 +0530
Message-Id: <20261127-eliza_disp_all-v1-0-a18be7f65fd4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABNECWsC/3WOy07DMBBFfyXyGlceP5sIIf4DVZUfY7BwmjZOL
 aDqv+OmXcJmNPdKc+ZcSME5YSFDdyEz1lTSdGgBnjriP+zhHWkKLRPOuAbgmmJOP3YfUjnubc4
 UcWuckH3UKEg7Os4Y09cKfNvd84ync+Mu95I4W5D6aRzTMnQCemBaaNkHF41ngTmjtwhRaKVQe
 hW9xuDUDT1iKXYVGrrnh495+GD9XJ2y/aaVU0ZRci60kNZy/zqVsjmdbb593bTx8h9O0Lz0bfG
 0GlqhbyCIDrkzTnGAP0C76/UXXPnJN0QBAAA=
X-Change-ID: 20261126-eliza_disp_all-ee87b349f6e3
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=3470;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=iTyOANYERgzLPI3cYOnGb33tCzPP/UpXYUtL/Tdax88=;
 b=+vxA2jBLA0nnLk3uG5jbE2Q2y3+oK4d7JKuf1OyIoKNFllimtcO7rSvPQZyotz1zbyfkcAMRM
 aqcSQ2JUDA0CMOJtkz5ESkJrgJMDm53yUKeqwCWL4FWPayFqRBqDm47
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: _IvaUv_wyoDz7ajrmYtS46F8Thcl-u64
X-Proofpoint-ORIG-GUID: _IvaUv_wyoDz7ajrmYtS46F8Thcl-u64
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0uCtnhSwZNXZ
 RmDfYasrKKkkgWzVGCIwJiDCFARKHw8qd0XA8fB3dfXo3fS72tjz4ziXAJ2ghVoo8gzd7bOq45s
 xIQ+c2NnsPyCV/diH4fLEy8WH/cmi/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX/uLzq0RmaWKh
 yNZ4VGG7oWAVXbrNhXdEycxMq8oFacYFKSgrEBGM732YVjfMM0F5yV0JxzuAwnBwv8BDNrSRWgB
 zTufv3GdxiUQ9ncBNpoGm8jEYW5VAm580Xk3cgwrBSTjLH9NPCz5+rteBbvwUgt7hfMNGx32eKj
 GeJIBovsGIwF8pT5jUbme1gJ20CAt9EizW+oN3uJ0bpKCD9Hu57MWs0mmCjE7fHV+0Ld99qzBhu
 E78fw+KX7bdU8V1/V72Rv6aBpQtGZdoYAyyTrm2Hf80+p82hvut28JDKZE/dWoE1qKFymX9o4P6
 yg9LPtY+4lf3FsZd84nKlAEt6F6xwSm2QEOAJG53Uz+vbYS2XDem0kN3iqX1+ZRlZBVgOROlw+r
 Ac1z5ll1LcpFxMAmpGX7YZTHwR4idaV7Hn+dkAkQ9PmtsckVbMPd44c3/Exw2rYA8QMPbVji1sc
 1BOSfpzVk0CDYI8gNnw==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09441e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=etoB_AOsishmf5gppmAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

Qualcomm Eliza EVK is using Lyra carrier card which supports multiple
display configurations through the DSI0 interface. The DSI0 signals can
be routed either to the DSI0 B2B connector or to the DSI0 22-pin
connector, selected by the SW3.5 hardware switch.

This series enables HDMI output on the base Eliza EVK DT using the
LT9611UXD DSI-to-HDMI bridge on the DSI0 B2B connector. It also adds
overlays for the DLC0697 DSI panel and AUO G133HAN01 LVDS daughter cards
on the DSI0 B2B connector, and for Raspberry Pi 7-inch and Waveshare
8-inch DSI touch panels on the DSI0 22-pin connector.

The HDMI, DLC0697 and LVDS DSI0 B2B connector paths expect SW3.5 to be
off. The Raspberry Pi and Waveshare DSI0 22-pin connector paths expect
SW3.5 to be on.

The LVDS overlay uses the PM7550 LPG block for backlight PWM, so this
series also adds the PM7550 compatible to the qcom-lpg binding and driver.

Eliza EVK DVT variants also have DSI1 22-pin connector, currently there
is i2C issue for SE6 SCL is low and dual HDMI using both DSI0 and DSI1
is not working as of now, will post them in subsequent revisions once the
remaining interfaces are verified.
DT nodes are named accordingly as DSI0 and DSI1 22-pin connecotrs are
expected to work concurrently.

This series depends on the Eliza EVK DisplayPort over USB Type-C patch
to enable mdss and the LT9611C(EX/UXD) v19 bridge driver series:

- Eliza EVK DisplayPort over USB Type-C:
  Link: https://lore.kernel.org/r/20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com
- LT9611C(EX/UXD) v19 bridge driver:
  Link: https://lore.kernel.org/r/20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
Vishnu Saini (7):
      arm64: dts: qcom: eliza-evk: Enable HDMI output
      arm64: dts: qcom: eliza-evk: Add DLC0697 DSI0 overlay
      dt-bindings: leds: qcom-lpg: Add PM7550 PWM compatible
      leds: qcom-lpg: Add PM7550 PWM compatible
      arm64: dts: qcom: eliza-evk: Add AUO G133HAN01 LVDS overlay
      arm64: dts: qcom: eliza-evk: Add RPi 7-inch DSI0 overlay
      arm64: dts: qcom: eliza-evk: Add Waveshare 8-inch DSI0 overlay

 .../devicetree/bindings/leds/leds-qcom-lpg.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |  12 ++
 .../boot/dts/qcom/eliza-evk-dlc0697-dsi0.dtso      |  75 ++++++++++++
 .../qcom/eliza-evk-lvds-auo,g133han01-dsi0.dtso    | 126 +++++++++++++++++++++
 .../dts/qcom/eliza-evk-raspberrypi-dsi0-7inch.dtso |  87 ++++++++++++++
 .../dts/qcom/eliza-evk-waveshare-dsi0-8inch.dtso   |  87 ++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  91 +++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi         |   7 ++
 drivers/leds/rgb/leds-qcom-lpg.c                   |   1 +
 9 files changed, 487 insertions(+)
---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261126-eliza_disp_all-ee87b349f6e3
prerequisite-message-id: <20261127-eliza_evk_display-v2-0-e4223634aa2c@oss.qualcomm.com>
prerequisite-patch-id: 3f53927ff7ab3b9c84cd22df9e13cb5ff2be5f90
prerequisite-patch-id: 4217c9079706a6ab9ffc657ad73c0fafdfb95f5b
prerequisite-message-id: <20261123-lt9611c-v7-v19-0-1fbe2b7b5211@oss.qualcomm.com>
prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
prerequisite-patch-id: ac9c419ccfd8b3816e05867d6b09ad49ccf12a24

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>

