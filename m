Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636363;
	b=UdSWBkty0KiyxIq1af2eIWkC05H5vRdRFz4+bas7CQD17748Zm0ptU2AXRyXeaPXQwPU
	 1Z0jhaS1xPF5BCuoEldw4yHLvJGtKwEterscoOw1ET6yW/uTDOq1FRRLbgbg+mKV/S5h0
	 7ChJeMMGJokK4VVZSzjAV/k6rM+HvuGDySlcQe22djUANnP/hMT1glsWJIdp99kK0d17k
	 zegwQ4WhTiMp2hXwCn83O30HouSPk6THI8Wbg0vumgr0vVjsY1et7ij/wU8Jfg6w7bqTX
	 kVhRtpCLWeMxcGd8OU1KNy7OsKSiQVneSXgTDlWFzb+K2Xw7pjtcXLF2v+7yhWwmFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
	b=m4iT8qGhhekP2jqWZSG4noYBrO9fJ+ztvvnLla+dOODJo5z5xZuAPxVvqZgf2+Jo2A18
	 cTUcQT1NBn1Pk/CWxrJcvq2fjeiv9DLgxXKOHv7/L/GlpIQj0VjhQGFDNvKOZs882OqbD
	 jDrSVSUe5yDDUkVCdiwsg4t6ThbSq/8rkW7GkaYkjP0Lpct5qkNU4fff6vbqZmWvFkt1S
	 zSuJny/QRu62YjdyZiUTdxZcgG43+c0hyGuuJ6DZ7DGPFsGMx08+aFCuTI9gwmvK5W+jP
	 LClxPq4BB19FayrHWAVnOafD6eQauk8gNTp5B9mfvQUQF8qB1b1ETadVHq5Pc3iKV7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35975606A332
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35975606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHu1ZAnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZErE6gHy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJBBrS2734328
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+yTEKtv1a9
	mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=; b=XHu1ZAnbmrEJWrA8grrqU8YU+Hl
	ANFhDJVso+pHirUX0Lv+kVvDJrucArnsRoj3jnAdKI/l0TpCJZU2gugn5w1iwElU
	iKNwxTSH5R9uauP2UeDVCN4GajNN559nYDbTIynZb7htPrUE0Tofso93rJcaRVpU
	R1vis4vDH5SzwmoONAgdIJBDBr6PaotxJ9cTrpz/147/etvPtzstOQPNuoFe9r5H
	9VQ+HsMeC6jWOv8D5ZDEBaPLM7gTUXTGy+b5UU3ev8T/lXvBgWET+669ogYhEWgW
	hk/WDe2lS4inZ23gYv2P7nbc6hrrx2TlrhKTb662BxB2/vGfGEEgSSIqCTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arhbap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92111028a03so113895176d6.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636361; x=1796241161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=ZErE6gHyPmcexilO6LYBBM2sDxoB3MDsQ6L025EJZSaepEIlw2ibMAOXf8+p06q3Dr
         3MEQiBrWbF166rpcj6PTF3HNAgM1DpAJmxg61GDtVvTLZrlakDlC29Y8kM9R3qLQzsc3
         YSOqi/IT9fZuQs1rLMwPFILR3RBjrNVKD8q2JcwnpnTORmYWc3qH/GwfCbj26Sp3lK3t
         h2rgqd9QRTX2w6XQnFgLJiIzNBCv8K8UeH7togiMhKHO4T5+COiBR6nyRxb+3XTn2gvm
         +GdSMPuXBxuWjpcoXnry+eYA6E3hsN4Ego2JGGX4vmhG2RMeuX6y7z3ayQ37ozXmL3dF
         j5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636361; x=1796241161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+yTEKtv1a9mW5bSl/QtfRWCYhcI6C9rhqegmsyvKbs=;
        b=P1XZcu4fKAMmx99L2A/7qXK858anQQ3t2KXC8JjGdQet9GFpWZUtcMTh9ZBh5oPhYA
         ixyB6eMhvMmZk0t+lQJt1qdGceFMmoJHn7+n3cHrDGZ9yFQ1WXfbqao8PvjrYzPQ2iPJ
         dso91+ivnqDlFeHGdF6rNn0HPgXBQ/jbHb0w1xTXkC2lc4/JDPgtTQVT97zDI0NIHVxn
         RlHQQct+4Ese9fdJ4uV3hT+WpLIiom6CPn2BkaPgDxQKB5MTrekIwz8PFd7FkE1Ff71S
         zuHlvmSYCqMd/MY5o/nJbSqkbg7kJATGuXaqG1r/WXwxKCzQBtQDXwF4F6LaFU3c/2ZS
         vhdw==
X-Forwarded-Encrypted: i=1; AL+hErEoGNfBc/BaHIq7vEusCNE9eFSG8NNC+jOewQCYID7UfKKe00C0N/RZN67cDKbg7AV7/WrUFvE+K2bl@vger.kernel.org
X-Gm-Message-State: APuU4Z9mTtaREX6AdMheJmOfFOuhHTkX3Ale31rdBL9WZaI8ipjyOWRx
	mNOAlTbz63bcZjtarPei37e0kjEgUHxt2gSg0HbAfGjJx4Uye8J0BVo5PZTIq7wsbGcL0Pnn5OJ
	OENwY7OH+42CL58wk90v4XLiwCFHp4akSqP5l8U4mr0mJRIaL56PmzsNXhEP629Hl
X-Gm-Gg: AZFdTZcv6kYap0XAGwnIBXeIKtRYmcwJ39TAZ7g0Z/2i4KfbimKqw4Go+SgeD6taNAh
	TYSCgowyDix1dueib+X8L28J3Hi1L+ePcyVZs/qks2c1aAuS6liSOZCYyWIcTKhUIdaknGLdjdy
	IK9bzqd2hay9Y4f8MbGHeqPuc8Sx2HNlBogEYCMZHTXEDRJfDPMrz6a2MMNbKwllLdt8bhNZXqM
	jm0lmRNoOF49ucJC7+5Bbu/LfwARvzqTnJujR85y+mxkHQJVF/dE5TmELkQPrLj5ykKqbIBFQ19
	76v0bVSf34+i1P2SjG6aqu2Z6MH0RrtjRKsJQpFObBDKSj2LRcDUBVyjcxUBHvAMvs+TiItUFz2
	m7bqdRXSZoPF15BetJQT94QoGmSC68MQBI+0FGMYBMmKt0xGWueWBvrdAYb7EVtY3
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67454485a.55.1795636361376;
        Wed, 25 Nov 2026 11:52:41 -0800 (PST)
X-Received: by 2002:a05:620a:688a:b0:94a:10f3:869c with SMTP id af79cd13be357-94a10f3879dmr67451685a.55.1795636360999;
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:40 -0800 (PST)
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
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: pmk8850: add PWM node
Date: Wed, 25 Nov 2026 19:52:25 +0000
Message-ID: <20261125195226.1563577-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125195226.1563577-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: N-7LODG7cSF6C1PwOC8EuavP-HgARqkw
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b073c8a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=mO8_gwkcAAAA:8 a=zgIjqA5jzSmhAMQQ9ZAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-ORIG-GUID: N-7LODG7cSF6C1PwOC8EuavP-HgARqkw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfXxtlKKDPgxc+W
 sp9zZvdVwidxu03H/3J3VL7S/Gpm5orl9+43yhJmwtFqK0R4Z4u4wtxUC9ltIVVSSmkd6gq+7Tw
 L4v5Aevd5FYj4No1Pw/MvW2u0uufS1U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX+be7vdVdWRM+
 /0F+N/7yq4P22WH9rjSzgQL3NU07FvieEoMjhVSXX90bb1VrLNpSrCFmxjqmqvnTyM31HAkTdDv
 Y2xVyAF3Gz8d9uOPhORTGmOYBFaopr88+TVdIi6GqM1EzdovzcaDVs95URkpTu0yajss14Y4Rjy
 bNZ77wPFiPh7LGwHt3pen1ySK6HwppRy5EcpbC9VNjBCEoIkcY8pTJx15Jorac40A8uOwDvLNLy
 DP70Dw8T39ufILhBPoc6yGKkDdP/MXEEN1imV8PlrXVCORcZLQFjoYDqjcdMQBWtER1TTR6l6FM
 kAdC+W9OEqLr6Dh2+dvyKbY4Zqz+0C2UV5vs/uodsDG3JEJ2wAIvOjCK1+Id8ZOY4erSWbCKH1w
 3243cWhOpNgMbhKAIjvAqcZP26ixliSx/SNWAtMoscmdzM3GpeffTdfDk7CbDACSJjY28a0JJIH
 I++Z4/CV+kcFbangM0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
disabled at the SoC level; boards enable it and reference the channel
that drives their backlight or LED.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmk8850.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmk8850.dtsi b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
index c7ba72fd48bc..053ae42ef0fb 100644
--- a/arch/arm64/boot/dts/qcom/pmk8850.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmk8850.dtsi
@@ -66,5 +66,15 @@ reboot_reason: reboot-reason@48 {
 				bits = <1 7>;
 			};
 		};
+
+		pmk8850_pwm: pwm {
+			compatible = "qcom,pmk8850-pwm", "qcom,pmk8550-pwm";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#pwm-cells = <2>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.53.0

