Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769395;
	b=2h0FxJopb4Lb6XRqBQs7Mssm6JLCb3TskSLFU4numKaDLgxDvWoSDM2rEMc8o29sxsrO
	 QZ71XuEX5d1QdPchDcQKqMT9QvsjMV7JdAOC0HF63A46qwyxFSEhColYeEGJ8aJbW4tjy
	 1ttBJrM0Nm2qEc8eSH3VhoSkTLqLDhotSyDFZQbfJ0vNohCzydkDhiSorHn+ifIDcW6jq
	 m/KslP83M6Za18o7PkBNhmRXx5wQwZRejP9Kt7ANuHNlq5Hz2wAvCj4nGxOtUUkaxP5tR
	 8ELiR0GmmMSCz33PvttoIGbswTCn86hsNniZAe60Ub9Lc9MDW5rTgC7AgBPIy3Gfz1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
	b=x/WgzbIjbdtim3QsT+RJAT6tfPSH17RobY//J7al62d9HG4pmCmaU2gzqESYEdH/OGHB
	 imiv7nf8SWGbnzGmGFJ24THNoPV2Ihlx3FuAKuPEY4E8tPhzAWNS/M9pjvd18XneH4OoC
	 2wnGtcFp+02JO181d2dVRF2xMrmaWB5d14rw2KOmoVlGvECI9Gg+FiVqD/EvTfp8AqJto
	 IVfypl/c51Th4c8zcb5El/wU08I/WjC1SkiBDLcbRH4ifzKZ4lyiSTJxCAg0n1s3hKI5b
	 ZWaFAj+U+Eu1/mdLKFg/ezUyGDL0adT1dLZJSx+ih0CU5wLtA8dK8AZeMkhtyMUpqvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255E60A262B
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1255E60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E3KkDh8K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E2uVrMKB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7Ghj01565331
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=; b=E3KkDh8Kv8+fEIH+
	UCG+LFrtxkEQWCdVW1J64XarWIJvApM+yo7SEzI/Bh7VE97IsIu9BZ59bu9t/xlg
	pnw/Tl0b1U/07AR175T1RkPCuPf/6Tx3Ob7lGb9yHQkXrE9/W7UIu5ZhwFJKVDbk
	0jwjdJyvPGz05/GtQnBYItYBHimZjhlnwvP1Z8ZVu2DL14Loef90v+aaeZKLr7Xj
	E6ztXA4KML253nuH3RgcyC0dGgTwWEsxrjaz3h04OoB1Oz536Te0LmTuYoTWJBA8
	l/dxONWQ+7bBXyGAlqNTvhDrRpQ+UUr0vYZ//PqDXEmpCYZKJh2iVHjCs9TvMWxl
	T+UmMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74garjpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 08:49:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f09775bd77so7352215ad.3
        for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 00:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795769393; x=1796374193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=E2uVrMKBQ6BMDr3jJyGWJdftIBpLANmbXbZvJU3hkRbUSjmQQfu+KOooral3oWIVfN
         sVNg2N0F9x4GLSnxqMAzkJXKC2tq+ALLv56OHo4a6xZ/RTCPtJE8KXIsJcTJ3yuSe3ft
         8iJPAMC9y2KRkPTpawS9Kqf67Fe5/vzUsJAsTM/OZtl5YKmt7CzLSNO6iZgyGzk/HDsf
         9GWe7ujd0Wk9QRXVCoKukolCVdMwc9ktHeKV2oPZjNIT4E+cF+3jl3yExEbRnajtdJGl
         AT4PySH6f5FLhPygD+dWoFrI/c+LDI+n6ERNF6KYfBqovFJJJRbSTlfQeIyH8b7RzAyQ
         yA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769393; x=1796374193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RoPFzrgKsW3WulHCcvr633Y4VHom+la+B5kUszZsF4=;
        b=Snns5udhctp/Fwqi7fYkQx86gKlCforGbzFo9A8U6ytgCxW9vVUGFw1g/dNOxn+V2N
         vdUi8tpIb4Hc6FonPwJyFHgZ99zGX0oK52re12FmaqJsc/7zNlrJWZhUX9v883HarxkG
         r7f9XtMFDowHUC5W/vzqLpFiQ1xRYf+KeELWZTlMgFWCdugtWtl2GCgF4r8XbSzZZkqU
         swPAaWyIzEhqKzwkVtz1dB7jBKPNukTkXV8Bs1xDbkrYSlI7aZIMkrcD2Z8EGE5lLTbQ
         9bYdN7I8WZOan4fX0/DcwVFuvAutabzdorvgGY5vjKEsw3nStC5S47xeT+S48tGnI7cB
         QSNA==
X-Forwarded-Encrypted: i=1; AL+hErGWwhTu6JeAXlYtsLBip5wHAXhAnx6tROMDSxunuZ6WZ6WoLGcIa+GWfuMMCNUobtphpaGiG0uoTqNe@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vzz5hUBQEa12GM6FDyDnmz1uyDldfHnikTX5TBjo/P8PcjBaN
	uD7qkZDEKb+ZdO18JfO2kc+B0C752tcWptHcAI5ld4Dz3jYqMiFkfDlTDn1WzJMxXO/5XRzi1YF
	8783uzrFxWU4jGzY4uUdLOStoEbSmzXBNG2g0sNPXgNxyc1CGPD44m2OylU9DoF1X
X-Gm-Gg: AZFdTZeex2DTm/RIBipQ2GHN5DkX2uG18uFDI4Tf5jPCi6iSlcQ625ik2hcuAIzmjUx
	oSOiWiu7ABBGmuRbN2waIoJzMCa/H2gH1WFkJ4Ov9hxUIDTC67qYh77+c4Y0ay02TitLf8ZrB8h
	V+GXJFjTTHQC3HaPNpFHkKnKP2IkY7RoQTwMHeHEidS8rxy68IEsBYZMDPvNmGqVkuq4ZOY+jga
	uHW6you2V6+CKFqxCIDiOJTXnLqH53DEqAx6krw+eYONo+zE8yA6s+DqmitkaRpkbeV4IWrH1QJ
	ekBRezb8MMTOQ8XsVXvjPXWpr7gwKK35OEhTRDFYrUHsCsKY/JAjrP22ztwCUysK1cIpVeO4Vyp
	rJsZG+fNM55bJVwp/GqmRRrtWHOLo5DKCsRBhNXXUgZbKcUJsg7fYvDDU3g0XdtuCgK6MWJa1jJ
	C/uoRn/Zg5+FIjdSU2BMxHW4/3Fi4woP0ZXmyk31OS04sGdcUTXkDsjfF7EhVW5EJ3CcvtxH0Nm
	2AoYD3OdF0rXcaT1IH5vHWMfqaQSg==
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538615ad.0.1795769393119;
        Fri, 27 Nov 2026 00:49:53 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr373538175ad.0.1795769392692;
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm114360555ad.9.2026.11.27.00.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:49:52 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:19:25 +0530
Subject: [PATCH 3/7] dt-bindings: leds: qcom-lpg: Add PM7550 PWM compatible
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
Message-Id: <20261127-eliza_disp_all-v1-3-a18be7f65fd4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795769367; l=968;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=td6QK7QkN9RdMGuNpRMBkvBsbxEVpka2RCJEN8QUWSE=;
 b=nqIn1yBnMRkPS85K1WKxZXXJYyHpSwtecI770QSW4rbu2xlg02bRk6lSpqsyDLejO1ZElnfZp
 PoRcejJxhjVBerkKVpJWrllXzJQlVNSK+T8iWspoPucUjkmijwcm4J7
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: ks3gCUHyEC-bF9l_c11kSeBYZXbhi4qC
X-Proofpoint-GUID: ks3gCUHyEC-bF9l_c11kSeBYZXbhi4qC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX82s7ZFyW+Y4w
 7u6h25QHkkkM/+hgOpm/GnjaPOwy7O26pt9mZrfoAFVie/W4v3V95z5+JRxH49C6ubfR4qfOyAF
 t48qMBm78x5RD9K/ldk7Bz0RrRGtr1E/+HOw85wAiZi9D6zo1idmr0MjBb8ewCaQtZFNdtOjEh0
 JDKgZMWlUI2DM9okMhAKmI+pVqphy9aDdq/aQO03ZpO8yC/LhKLQPfqPFPFyUEmvxEmzTB2kQhs
 JDt+bifRX75pjpoE4XPUHLSkVGLhf8uQRH55oX1y3LnSa1SAhn0nWPE4OqyMdxVhRgtZl2MjSSt
 1SD3CdirPggEQzDpY/VjKa15aF+OU7xMfsUxO7nSZ5aOjPy7RFJuXaxluPhRybJMmsCMI1LCZ1o
 REsnzcwIldLrQrLJ4zWgwtwgdoq1sQK+ROMpqCgkCdp0ss1k7t0dmAJhlRYRIdDWf2ZpbMA13mZ
 3seOBifzCtOzdjjDGuA==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b094432 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=0GMz1rgL7QW-eojhWosA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNCBTYWx0ZWRfX0b5kzj9Y/7PV
 r8nFP8hFMjMllPjQKQLRiEKvEHMUHO0FNv/aJz8OiWB/MQlZEcme/mTSrQ6XwfI8cj/GFVga0bq
 TShhNUMhrq9Eepji24HmeyUxkRSS9Y4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270034

PM7550 provides an LPG block that can be used as a PWM controller for
display backlight control on Qualcomm Eliza EVK boards.

Add the PM7550 PWM compatible with the PM8350C PWM fallback so board DTs
can describe the controller.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..cf2c78f7f6c5 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -42,6 +42,7 @@ properties:
           - const: qcom,pm8150l-lpg
       - items:
           - enum:
+              - qcom,pm7550-pwm
               - qcom,pm8550-pwm
               - qcom,pmh0101-pwm
           - const: qcom,pm8350c-pwm

-- 
2.34.1

