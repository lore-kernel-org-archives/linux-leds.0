Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636362;
	b=x74lL/nWE33wP61N5XE7ns5YUXuJoRMWcFp7fRtskNDhmk1+bqVQDbwAkG/P60amvu36
	 1zVJqmTSUWOKlJ2SNutgNV5helFNPCbiG84mjgEs7qIylm/gnhgaPWiG0pTwogQciHGXz
	 GM9e8oiQk2onF4KbMe92Nhhf/i1ohTWAcnV8MI3Z4Ebbaf2n5yDHp9uNSmQ+IjO8VCjLc
	 xj47CrDxm0AmLiM5aa7ExvyEFmG89iiy/NE3yhYG4w+zU3IaF11RkEZuif3zSLedUzgEj
	 d0JaqcIjZ/klEak4jizz2k7h8Un0kMz7aQ9mb3sZL33tDl/NoMj1+T8JNL77dtn0BkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
	b=KsHAIY3gOytflXJTNTOFmTHArMaqIqI/zZag1DelvpG7E/JQbVE/JwSEmD3Tx202a053
	 KjNC2YhlBHvt1s3ilVNUznKP55Gf0Nq+TXhpjXhG8siZfX2biB97tzKu4Rncv12ljME7T
	 gQtZjtVZMAjFNZR32pTBMYu3W5Lt0F6E7CEn3qXrPUvZ0n4ZtsGCiCxo3kpKsAitLGZoi
	 4B+0tFeUXISUC6RKjMiMWG+Oo8GG83QN/kn+5YMryvyGJBW7qU78G6Qjnc/Y9Z1Qcl7+Z
	 u2DYtVoNTfLmb4EbHSlzjx+oVOhxsdlGDc4wrbBvefrvJ3AAWTp3VTDZJvvjvM5g71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCF606A330
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92FCF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GMgKYdXW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FDZ9GH6k
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJgtOY3661507
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s5Ba6vNo1bD
	vLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=; b=GMgKYdXWZ0gm+Ob3m02qRVB5PEC
	4KolNbAyyw/cqFfqySAd59iHE29pI4+EZaCQ68iR333XQGljNnQX6fGglPumAWXg
	hkyjeFTKwNNw5KgPZAXpJIKo+AWahgqVtXrJvZ4rQEvQStZag0Q9JTzCNY+Gotfi
	ttaN6cf1TEDBx7lFoS0KFzSapkFr3yD5Zfmeg1G3bIvVrTBNufy3HMXqXvK1OGhP
	4LVwRfuXy2fGg/3V3LfGmwoarjdKnVGiKbU9ObaOy++RuzCoQgH4YVBWFCnTLPID
	ezWEBjcqJi2NUHXFlaupGGtlFErTBPFroEaF2iOYIkJloiLGIIQ93zUAjfA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y011w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:52:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so1049855385a.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 11:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795636360; x=1796241160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=FDZ9GH6kamTMbugi6haXsezU3CeblbCvu4LGkN5ZoMlqf8SV+hB0jCQR0hvz3cUhUK
         vr8py4EkxqiY5R7b/aCBOt6+9R+Y/uOWgpp8L2qgU+Op4miMNrl6pd7So4xKwaNmnDT1
         U1/5Yx/gzfjeLFDfPESpMErqdp/s5j2dk6RN0epaXw+Nb6MlseBQg7E/+S/fg49CiKm5
         dWRphyNpD48KbYvQQ1FPrqgmL7Nq+Jw6rHDnpRInae1y5kUHq1nGIP7W+ZXaF5Ftrpcb
         wcWbyQWPr5aGNPtFZWKjNXX/wyfCj3kEIFtqjgGIcn5nSzGG7O8VbUxn0B3OiwQ4R1Ew
         Jt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636360; x=1796241160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5Ba6vNo1bDvLyrL+TUYTgaQ78+DeLtUHqSUd5UyCEE=;
        b=UY5q/E2zzTCgdxTWUzcPxEq0Ak2YPVKozZ0c3rJwxvGOvdTtGedUYWdVUjYD+nreCW
         x4ZWaIydrW+VOpKDkktTWrAmI+dxSN8afWP/Kb5ajv8dfGJLvtV1PKiXElXD1ekLQnJ0
         qq9U+wjBvRxUrc8/cyOUJXOhdPiQB+1z19pqbt0ofdTbfikWyfntYr8JGQRcHx0vPp9b
         JQoXXp2ZP5jv+Lqx1kRjdh80PVz0k41Kt5S7G5kjiCH+lsPykgBBmkUkJmRZuKf5Ggrh
         dpfICGFWYcIa7hm8cCeDYwm42NXkq2lmUeIvbvjbF1/4SPK6uWEsk91lpAg39v3e6Mr9
         DpUQ==
X-Forwarded-Encrypted: i=1; AL+hErGM/onXFTOUoBdxoR7W3OjdwAnb/TSI6gp6wSTdvNf9wmHcqAjKDWNebEG+At5wS8WsvsPIBWYaHZhQ@vger.kernel.org
X-Gm-Message-State: APuU4Z9ImAQathMo6M2ZNjTpl/W1qzQVXm0+0loWOOdY8i1ouh4Zc+w8
	tUTUW+k89/58h2hAYWY1+ORM4MO5bsocAsDE5BzEsjbcX4zNMe03Ji4yxZZxuuQdMoTIuccuXXl
	7HxJtTk4TbjQQqefAB3VWHzH1UTKPbW1vA1R2ZKBrU4IVLs0CDmOa3zdkFkUmfUjz
X-Gm-Gg: AZFdTZdbFPOSVbGMmtVgSXsb8iJ5OkqJtgE6vNy/1+ghlgMzMH4zEMx3Q3/9kTfPl4n
	gwZT7+YKcabpxUSwEJpHBmZq4sdO72d8UzhZX7CsSrFyOozTYwPW6WFH9NmdczQl/tsJNi7uI+y
	995xynOYijYtJ2G9dhxl7XDw+hLXMmwe860yIzE3nk2Y/NaWX9PNoT3KZj1QZ1cd8u4FO6NRZH4
	wcdiVgeFzYvPVHCwHL5aPYAVb+sM4cVvs4KXbi4HfUdizbVYP1wu+Om3y6gNlKx/7Ztah1NrK24
	FUdopsdWRkYN2AmXZnpqUci/fewZAzF5gCghdYIQD1/xrHYPejqes4iIabJk8wLHVlXPvqKtgaD
	zLEIfGlv6za7GgnG6uzWn3tjyiKNXUiVvfY1PN9HlwwU+GfDZ5psoq2b3NsqxudTk
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386852085a.30.1795636359841;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3386849885a.30.1795636359464;
        Wed, 25 Nov 2026 11:52:39 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm774316205e9.11.2026.11.25.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:52:38 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: leds: qcom-lpg: add qcom,pmk8850-pwm compatible
Date: Wed, 25 Nov 2026 19:52:24 +0000
Message-ID: <20261125195226.1563577-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfX/0ELh8hfxypS
 qzDeD6j30jG6v9Epm+qS6UgYV8vW2pZ4KfxJxh++1wisZ3sRVqls1XJyX3ZlL9D1zdeZracT1gf
 Ip46gXW7XnQxjZd1fcS+JQw90/nsVHgZC3TVENpUbzXiuoCIxK0RuT5VLu2/v03attvPoyj12h/
 OCkb/dmGVflBxxMe141DB45B18oqJZOp5pqhp6tV1T1OInu6VXRccLz7M4P9IYt+Pgkf9H+9YqS
 XltXIKitG/TpocfCipXPJh5jEhdessviS5RXN1m+qS9ORw4NaYI5fd8WagRlg2Ad9jHcEPAJutR
 9DRn96FxreEMO/PIzT2lETwthtx02U2DPD3IFxacAAHvKQuAfC2DF9be4c0HsB0cR16MPeMof+n
 x6bnnSfxrOKz3ydNCB8qISJh4en9V6Rnatfdk7gZgR0mjPzmoqtgJLYNRFReo3qTDCECGL6hZv9
 lsLMFh0xiaXeYTTTHfg==
X-Proofpoint-GUID: oElzPJOyothOMkOFL8b9NpBXFvrZH4uz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3OSBTYWx0ZWRfXzvUHmsf8FJwU
 gOzAo+XttEqUftjYUifuf4+ZKix4oaRH3sIX/jsNeh+YF2WPRb3PPhYeqPVEooYU4f2r8F4y02i
 KbTZlQsK1cG6wk/dhn7RFlSvrtYvXqc=
X-Proofpoint-ORIG-GUID: oElzPJOyothOMkOFL8b9NpBXFvrZH4uz
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b073c88 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=vMC6Bm_45Gru1Dc4I5QA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250079

The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
the same two-channel LPG/PWM block as PMK8550 and reuses the same
programming model, so list it with qcom,pmk8550-pwm as a fallback
compatible.

Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
(EDP_BL/PWMR_BV_PS).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
index 3da0fe532e74..e018f1f3532a 100644
--- a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml
@@ -49,6 +49,10 @@ properties:
           - enum:
               - qcom,pm8937-pwm
           - const: qcom,pm8916-pwm
+      - items:
+          - enum:
+              - qcom,pmk8850-pwm
+          - const: qcom,pmk8550-pwm
 
   "#pwm-cells":
     const: 2
-- 
2.53.0

