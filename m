Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636362;
	b=NvKyJ4nDQsB5pEmvNOxkK8q4qawdjpMJpggPjW2gwktGIHmlNLeiNYnI4ChTk3DZxe1O
	 10MJvUoB7WZQouv9dbmgt9qd6ayGDQq9GfUQccXV9Z/WvmMQaqbe4WZZpIVJg+GQlH+zL
	 WHQOphZAXdgTqkDwbpxh4maE06tuSYIz6zLaubvuowonrBpLHR7FiA0ZR0lkDc2Oyc1cB
	 5Lf9J2LJonZkZKojikZKHaNpRejrVlRcvG9LJECBAILSgV6qsG826GG8N49tEcNlu+4Lq
	 MIIgL7vcpFwZWbZuZ4glFEym3jqDR5dfpmeBN1WHd5O4d4pB5+CyEN/JRwnza8oRVvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
	b=fTBFLbQUwOjFKg9XSynA3yAD1k8ewvWp+BReC/n7/5nPiOvIzK1KcAsfpV7f0w1Zqae4
	 aJx7zGAis6CIREVdV/31Zylw3bXy0Su3NOT+JXvrp705ECwLnf9wXo/v6VoJptTnajKQ8
	 bD3RqBtHdD3kAHaI6xvmEAu7MGKCBOaR45spsc0kYWTrpDJ6qtrFEjK0O3SFNePftMIZm
	 7YTO8huLPgJME7NUfpW6i0MsC6NvNYpMADr/HGLqPln2Lh82Uazng+/5h7otfzwhYwnKk
	 ogGesH1x1CKIifMO70OqxvmvQXHooWfC7+qFZs94jn4BEhNaDEGlsLYy0KUL5JilpkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H/LTMWGw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB5C606A332
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB5C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H/LTMWGw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EDvZgpZP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJBH52689584
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYb
	gkcFxwMA=; b=H/LTMWGwpLj4JnzWOodswvm27tbYjNKHCSyk3agPibFXS44LUs/
	SLl2ElF0+fpNXQaCXxFEs2zZlPGR328IJSf1iRk4e74gNARICRzRUC9Dp08wh26b
	xpLeEKtHT4b713wC2YE3IZUahzLIXXA15+VyOT6qkbM39879E/u7K1vajUAOkqpF
	j2u/Bg7PKqnHKSCEt78iG++qT9PbmJwCBu0MbO5rIeS9S8ZU9+N1g2UZV+ODESpj
	beGBkB9DwhLkxJFcoqvkam1+6py1H9qhUSLAdZ+B9Hc4vx0bBWROYQ9d4TYpqLLX
	707wqksJm2IWlDddM/A8eVTBf0oOVzamM/w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2ck43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9211d51dcefso114722146d6.3
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 11:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636358; x=1796241158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=EDvZgpZP/8Wy2yKHCu/KzpebFeNF6c0ZFMzytVNHzSo49GNvDSNfJWWdNeHKvOsAWv
         gRXLElZVT4AcRc0yViP/C+cnFDm6WJeFLEZFzhDc5PyG9/1eEzZfrxr4RxrDGLZ0S6XA
         GYyCxbn96zqG12KiXMiaPPBaEA7csLpd5fqdbU2bXKD5yboGewGm0gSggDPC9seM+ikb
         s4DYamKaLqCCvbYFKkcxswoD0X4Q2hS7yM/wuI6gfuhul6oPtUAdt5rNFKLE2ERQuSoj
         T+xBpwirvTc8OBl+72bqCpEIU2SZTQ+6RQECRsLmPaDcZs2Z9bZfTtEbWnX4AjJ6RkoC
         VPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636358; x=1796241158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRl8a2c+F775fiXICpW/PScHe8VmAp8qGYbgkcFxwMA=;
        b=KZ480QsyuiNdu2k01PC6Dyxb4HezYGF0vQpOQv+5xR+llXRfzSIIUcfR1RG4cd5NUP
         sRjhS4pIC2oTU0v6lJara6BxGy64xIbFdBkL8qy8I93shDPJjyhgWBy3PUJcR8VpPhFP
         PeWFgxq5kcqRE9huTuxh1gLH6cATBS04tSwQeHt202j9se/iUj5YGJc60+h/PGbdSq/j
         POdnghK6pEG/6yC7Cz4Q5etqUiCXdvE1OmxWo3p+R+5x4S7tSsNTSZJX+ZSWvP5WgZz/
         ZkWgT1l6/MDe1sK6FqSK6hPoBiXaNJCvbdClPhR1gv3/tGL5GoSSE8XSmTuwMR4DyeAa
         U+6A==
X-Forwarded-Encrypted: i=1; AL+hErEdCYL0spqvxc+P6T74N7MfjVzzZ4KjMRTstTnt5PSewQcudAUYaWITAWK1+2LCR1AzV98R7rAFzavC@vger.kernel.org
X-Gm-Message-State: APuU4Z8iT7BecEVOTJWWuSLWMeD2o4iVzAoppORr6f9x+pKzlaBaX128
	0jgZqaeTlFj1orfMMB/fP0xosvtSK/k6dekBSLI0AdIFdH0+Vt+gtiNVRruCKSCe5ijfjkYHio6
	LEdjfND9qIKkTpH8qETTtrnKfjXbl4f8Py+DNkmX8t34J8gvHZbWbbsrEoaWFWQI+
X-Gm-Gg: AZFdTZfst1TS46lEclCESY4YSAgb++X8iWfo4niW/9irqJNwuG/9d3kfQTV4ZaT4Njr
	CGyoQjlrFRjRw0gxiPHObkERRVNYW4F5ZmneOr350bHFALDTnzrA7wB780IbL0wISuB6CadxKHX
	mrrr9JMGNJ4q8SSnc7nLYLCanXn53qOJanRaWoTISCM2K1tgjyXGG31hpjx30kBWchVXpNi8Jxh
	khdYf6vSbof24uWp8ykp6obOvoY/BW/38U/1XmcfsFT1+/T4KQeLUpH+5Pxpt8saJJBueGJmy4O
	YlfSagoZZd9QIk/BwFFRK2IoB61cQIXwqc2fbDvdQTuLeqh082BVQ8X2gwOM2rDa84gznorjdJm
	KY/z43gEdEr3ofBAxHpi6Ry+7NJPDaNdGTao/yhnZ1T6dmat5TY7pEsYoTZ9PkS71
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131218185a.18.1795636358449;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
X-Received: by 2002:a05:620a:260a:b0:947:7f5e:2b64 with SMTP id af79cd13be357-949ba969faemr3131214785a.18.1795636358031;
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>,
        Luke Macken <luke@phorex.org>, Srinivas Kandagatla <srini@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/3] qcom: PMK8850 LPG backlight on Mahua T14s
Date: Wed, 25 Nov 2026 19:52:23 +0000
Message-ID: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b073c88 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eNx2SGrOvgKyolGvBP8A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: j9CoA-CaGdonhNO12-a-ekWFsnPbUiVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX3G/+dJmEfsut
 R9tmscl6y7AU6/gDXO5H6KSdzx2zSPnizab+AUvH6FOjC6jxEhAnnlGGFD0Cmd5Ble6Vam/p0eN
 rvJyrq+6CqaVwqdJZAfALSPnYxeg2zOZmPhXQsaqIQx8uFIi2geVPYWvPMSfIoGXV78UUYJLWJa
 cI/iXTieRQTZ4A7+1HOmExhAUjZ/kCBGPqIC7zUrdrGReHOdUzagnU1508sc2SC4IuE60pTGTXu
 8RqG90nZ9NO5yFMdpiN2mZLmN9BknAl8IJlDczPQBLN0Aey+wugXebWLbSnyhHYhAVpydbx21k7
 RDMHTIXt38MSLLqTVnPhUJmA/eJdAeiha2yRK3ClmBjPurRNPYx2ZRgc1C3C8u6fTQGo+cGOd4K
 SOHl6g7BLIBUSdJeVq07jpwCnIKAPw93kac5uAbaCXbw3hYTSLVqtM4W4QqD3CNmnQPrAmikYab
 lhTIzGg68TKRnjkf96Q==
X-Proofpoint-ORIG-GUID: j9CoA-CaGdonhNO12-a-ekWFsnPbUiVb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX/KRjKx2ZfQtC
 JcrosolZ3uwF7DbfZdZIZMpESDkaaZfq72ufpdkto4oMtyfwNU5KiuEz21KkkqP4lCDJHoUbBXp
 /DxJE2/4UgxKkQD74Eky/IrktOnmB2E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250079

Wire the eDP backlight on the Lenovo ThinkPad T14s Gen 7 (Mahua) through
the LPG/PWM channel on the PMK8850 sleep-clock PMIC. The PMK8850 PWM
block is register-compatible with PMK8550, so list qcom,pmk8550-pwm as
a fallback compatible; no new driver match entry is needed.

Changes in v2:
- 1/3 binding: use qcom,pmk8550-pwm as a fallback compatible for
      qcom,pmk8850-pwm instead of listing it as a standalone compatible
      (Lee). Krzysztof's v1 Acked-by dropped since the compatible
      structure changed; re-requesting ack. Tested-by not applied
      here (bindings have nothing runtime to test).
- Drop the driver patch; the fallback compatible matches the existing
  qcom,pmk8550-pwm entry in lpg_of_table[] (Lee).
- 2/3 pmk8850 dtsi: use the two-string fallback form "qcom,pmk8850-pwm",
      "qcom,pmk8550-pwm"; pick up Reviewed-by from Konrad and Tested-by
      from Luke.
- 3/3 mahua-t14s: pick up Reviewed-by from Konrad and Tested-by from
      Luke.

v1: https://lore.kernel.org/all/20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  4 +++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         |  7 +++++
 3 files changed, 33 insertions(+), 4 deletions(-)


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

