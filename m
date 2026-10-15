Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEB542E419
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093677; cv=none; b=LSy6odFNIv0+3e/B7aSNTJA9iZ9xiC8xrCqvuKzkvgxpH7uAcNRwvoLjhcDaP6mK76rgqCTTYWmIF7I+LqHDVoGFlsSVJ7apgIHX0LVp7/RakVba+C5IR9io9KCjBhS7Wi0mrUnjQoTEWhlIvEGDBJjjmCP9tmRxD8xNWDXQLWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093677; c=relaxed/simple;
	bh=a2eCj0h2ijL6N+sNo19p+jwZRN2ssbDrAbTTPwAG0o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b/R/12FhhxOVM+YYJLmCZvv/6duGUw6sHcs2x4W8hmHelgmZF3axhsJfEg+LfcIFFFf+aiRRPTFQky8prnXZD3fIpeMWi9JzKV0Q1yC+1jmk6qZWAKh7GmowOagtyTfB3cRfR0fltT6YJRfrLeN4Ab0mhwexv25faMJXJxJlq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xe84cgqm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Su5RFUgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xe84cgqm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Su5RFUgF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FFDQOW4126369
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0
	plLYdHlE=; b=Xe84cgqmIjAfum+WB4q1jdGsKoBgc+8VwLX1fmsmmRH+4cLyzDz
	MbP3VJkihytT32yXZJAz2RSJxAlgClVHh6Q2j5vQWDtUPdSf+BwUnROTtn5fU+uh
	i2jtshv7+b24VXMm/rngyt1ZXoF8wVrXN3BkuTrHGAntBrE1hcOcGV7rcukQiVCh
	LE6FzwUdp6ZkrmjkUbjsKK2NfYy1Kae+V7JnLgEA/6Hif2vrLbJTj+zJJy0CqJWl
	vQJS/2N2ETAOwTVQLGpLughDUCsh9aLBTh8WHTXm5UIUCI4yHYO/tx7Ok966WlCX
	MbZAt+o+s8xqoZPJpp7TgBeP6PW0JGD67Og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m11nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:47:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so323865085a.2
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 12:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093673; x=1792698473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=Su5RFUgFChwoY8NV6KlLd9rvk7DNGYvj4ARqGvuvY4HalzMGSp3pcWVsZjcc3qR38m
         NbSJtyb5DjdfV4GmvqWh7FUBUY1bgjXyrUF26i+7pXTMXOZJar9ykVuRjYqjMnKSZ9C3
         yDItPrWt07N+CiiT2IKiNFEEqO5ns0q9VbTW6L2G3Bhal+SRt9eFM9V7RtF9WuCaK8Af
         H53u3DxZ4+cSI+dQsQKtORHrY8PeTAGT6dRs8s50qtpKvS5yu3q9hveJOFfv4f0svvUG
         sJGarjtceBQzyfs2g/YjvdBwqamGykF60NDBE9aevDbgdUqUPNSCLUuo0MUeqHNOqgzg
         oOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093673; x=1792698473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGe9ukRyogLXaSFIz9AterLL9ZxnrCl5Pp0plLYdHlE=;
        b=QNy8KwbI1MQQon2Wp8+0qAYscWRkLEdN3MF3bV5oEgvnGCBy4dVqNr3GJqiUHMqnNZ
         zYYw8pJtmuggHJBt0llV9KIHr3XNQE2jXYNjcbl0UX+Gg0L1ixIcw2e/OjxPf/qLEMDs
         a0aKPZ6oT/LHv3dLsfKHXHWRzJqibhHTon9A2CwSe7xqrJUPAceVEuQeHqAxb2vOWVlr
         iPKsTHzGFmjRy06qcvU3RSXIgwZRrGrMaxCXdzO8j5Qk1JwgwJQbelq18hRsgN/Il06u
         20if5hxFwkfpu/0zRF7fkHH4ijfTKIBouQhetoEWBFUF2rTWkmYfPNhkgVYYmMrtFo7A
         5cBg==
X-Forwarded-Encrypted: i=1; AKwUvBzledJSD0ZWdga4CLvH9WNYhAeqHag/ApL6bH4l782UP5yZBxLIeG/oMWFHmvmwQ3SNJX0rNGCekEG/@vger.kernel.org
X-Gm-Message-State: AFq9FYJEXbemmiRIMmv0lt3yXBPhhoNnwDFQadYhomhby7s3RsfvPEe2
	jjGsf2hfKIcTJDvAlol3WsOYHA3/AB5WzFnAzvBmiCxSG4Vl7aXjOb93XaXgpFVBcr5XV8hS2Xy
	yT6T+JaYdfwNZzQvR83dDF36JS2nnIm1fbVw+/nW01mASLHy//Tx/Fb1ACukbUvgZ
X-Gm-Gg: AYBFou1MswtsCkERsE/Cwe6A3vjXSYg5HAvEzCIcyVQC0oUPTEgr72VPQLcRobwx6ns
	BgNVvTPdHpXLxWgBOOiEy2211EwSeMTY4xdXftZp/9fFrLSPIVSccyFkO1D5sdIL3QwhMMi23a4
	xLtHc8pGvSaYM2OGGgiEH/KHwlXRhqugHbaZHt5AulzetiXzb259PtrAdJNhIwfYPP/+Da5Y9XE
	QTurIF1xXoHKUQ/bSiShhSPeBIVDqXIF9Eu7d5d47XObE/MhHG+Zd2sBp12uB2twe4nLCVRGD+E
	8S0svsRoQVRBA89T0R8jvd0MkoGEigsuSelJ6x+d6XPSy3vmwVWG9qHbmw/gzcOsad1XRzW+LZa
	m3xttBVF1D9oS
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181566085a.41.1792093672654;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:93a:1048:7d2f with SMTP id af79cd13be357-93ebd25a423mr3181562985a.41.1792093672234;
        Thu, 15 Oct 2026 12:47:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] Mahua T14s Gen 7 eDP backlight via PMK8850 LPG
Date: Thu, 15 Oct 2026 20:47:27 +0100
Message-ID: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad12de9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=6d4XDeVx90xq0oCfjTwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: x-1jWp6QO07UxdJ32s5Jg6Cl7L8UZfcz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfXza9uCnSxGPAi
 ntEEGQjRIR8YbS1n1iWPui7KSSFPcdsg78UWGHrMyt0vvZFhuKGc8QDjQkUMPHDRW8QDN6hvTNy
 SJoh58nmr/ftLR9/i0iQA9BNMpMKdf8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX5deaeLFl0LIc
 DODWsNL1zPITXV6zTcR4++8FW9AVO1Kbo72egVVF+/8wHf/0nRu6jn50MagacWhAu33ZkJgZdJN
 tq2o+cre51ELbfcV7Pad2ClFzY3iclkuE/rMsOeGkBKk4Xzb2EnApiX1XFGUrdr+ChQSGwoIVvS
 XVWjLTq2dfJkBvUmDRz3lzbSz/tpjBtO9VjA/0viwlNGSI7Z0pwBt2TtTCRQD7O2QpMDv4PJPai
 xNB/36rkYZPLlHj6qYw3P6H31YFJCUid/9mHjJ3k6p0m0kJxKF547ee1vHJB4Dm7JU0yzSYvQXQ
 IZQf6v744LLg5ZvReMkWg86Ns8ubAraSyomABgvQ+45cQLY41jzTVJxE/w9pdW8GnTO/VJEU3b7
 g2556uI+jx1G4JLCrkqnyVQ1K+LEn8sHoNSASYzlA3x2YN/jPFWpL6/mkXD/BefrHk6S/pYbScd
 qKHw7drc084kBhsuw0A==
X-Proofpoint-GUID: x-1jWp6QO07UxdJ32s5Jg6Cl7L8UZfcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

Enable brightness control for the Lenovo ThinkPad T14s Gen 7 (Mahua,
X2 Elite) eDP panel.

 - Add qcom,pmk8850-pwm to the LPG binding and driver; PMK8850 reuses
   the PMK8550 two-channel 0xe800/0xe900 layout.
 - Describe the PWM node in pmk8850.dtsi, left disabled.
 - Switch the Mahua T14s LCD overlay to a pwm-backlight.

Based on next-20261012. Tested on Lenovo ThinkPad T14s Gen 7.

Srinivas Kandagatla (4):
  dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
  leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
  arm64: dts: qcom: pmk8850: add PWM node
  arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm

 .../bindings/leds/leds-qcom-lpg.yaml          |  2 ++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++----
 arch/arm64/boot/dts/qcom/pmk8850.dtsi         | 10 +++++++++
 drivers/leds/rgb/leds-qcom-lpg.c              |  1 +
 4 files changed, 35 insertions(+), 4 deletions(-)


base-commit: f53c44783aacd8920469531e7c45f9f70afd291b
-- 
2.53.0

