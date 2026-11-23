Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415320;
	b=U6705oUwRFogdhAA/XzojIDYmBW6kbfiriZLpT+MO5r617BnnjjKtJ/mIEql6BFV0gsF
	 5xSYIxkeLTfdAiVYPuhJTwakCKtUTBDY/kwnnqYLltQVhMxygpM+hWezbm0TQPLWIoNyV
	 92fsVTwxtT6iSM+vE49pp34tcj+ZdF3CHPZQQBYLNJQcTV5gg5nXYm5bgqdbqISumIZm2
	 omK1prs77FGqzupiMpxLRK5YbeJe3ZxcImwm6HdLvItJf15UvRwPmdDT2ilPC67W9lDgF
	 PeE9mWhULm4G69galmbbLlk+VUmUwW4MiOLHTihRMI2wVxwCbUlbKJT4eiYWL03kfBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
	b=quq27hKM0PA7MCmUtOyWA8L6RqYUY4dC6QnV5APNnJlR8p5D4DS2AS3zEKXo0u2SITtm
	 xHzSMg/6UCwj9Rf4h1Wm8PF4MFfOpqCF4cwkgv44vB/A1sSIZtbF9aJyJevqlf0th8mcq
	 6HVOnQFNgUvXiv0s/CJwo70nEwHGHKxaD5tjJ69tBzyzrioD/Rl3GS1vX8AVo1HXnBLHf
	 LYzq5Upqwk0hih7vnrQAIffBVfKSWj58ECweskNt2iypEfeB4w+ZyP58W2niurBUVPEP8
	 RwN3PGcEGhBvGNQjVe984+vk1Q/5o/9m+8szXESGHPLAdOs26GKpzbcD2706JdGiiWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021DA606A69D
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021DA606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6Dbc31490205
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=; b=kOJ5iFQxLqGnHt5G
	VtkhBb7vWjdmQUvSoffpIXHnPnT1xZc3pChrOPDCA8IM+j68rf8y9NmiLY7PM4NX
	ye4kDncIjSYqRLJ+pnGw+3PawUnq2AwR5aTP9GN0lx1R2IrqLt8pOVLY1+omkcLM
	AUGcXEXtFYaoGuCZ5bWGOzWOBcc4cQgtZQJrrWgCikz33L1JY7k1xegUtBmyjSpz
	xU1R06AqKUTKUTAld6nsi2KGtPHyAxWtGNeebnhxTxMftVP9f8WixUJUziJLn1uB
	9HzKl324iREdwY2iP9qdL+/THh8Lp1SvsGs7O9OAQRKAy3ndFgv6qCc7coEjEcTb
	WaluRQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k01hb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862b952fb06so2363897a34.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795415318; x=1796020118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=Zxtl5aDScmU6mMpS6Oz9R9LvEdGSf5DFyyd1bf1zg0LXccdY8bya2wvtiT/+/capkQ
         ETTNDb2W15+6Yp6QJhdFtYTq12/FS1De9g5gnoZzB9eiQDLFYQ3JA3MlyeXUwRBXkoGJ
         58l6Fsx7PpGXFpDiz6ZpKaZ9pZFva71gL4xiEksoirlCtXpZqOKUZ6Rk5wqLxYWgwOdO
         Qm6ru0i/0ktlzFvbl1SoEtnj9Nlz2UglDFOYMu8Hn0p8/LbaF4F5ye/Opq5S7hOgPYWS
         SVjKeBkvZBNZNPcEDjAQgzTItXcwBeE3tsKwusDVx10A+FWHK1rJrYnERDvbjBmRfskv
         x4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415318; x=1796020118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=qxA0o/Cq8G++guNN5YAe9ocRNIf0WZD7/WVPUcwTUGbNOCPy7Ksj+sCmyoEIwyfMGU
         U/VqaAF+bXwIZfkVRR2Vl62d97No+jHUMPTUlhB4Jmn6wtQFyLGRmOF6j9ICQptsK0b5
         yUheLbB458P5gr8SgHuIwKEYpXL+/LDG0PX5M+FFTIvX0OBemW0vHdcXkEcFllP3Ahsl
         m7z+cju+SkUmrEE+pOaSQV5Z70TpB4nbAsmYMGYFlxtiesH7JUq5iUL7HLKsAMgOX3Ip
         vLvLZsRsSn7HwSu02Bf11ncdt49xup65KZ9/0zNRIEKChhUgZzH1WeUdZHJyBvTXOJYP
         IBPw==
X-Forwarded-Encrypted: i=1; AL+hErGJ22wtluq7EGIwE7NHIpRFmoWGKYnTw8NKaFb0WAYKUYoMYU3za1RrePeLfVpaqNpb7LQTtwdVPjkD@vger.kernel.org
X-Gm-Message-State: APuU4Z8BFr99/lui812DVPMtyqvSZoDSzWr1DWG0pmdFliaZ3aKww63j
	rYZ/vyyhEZzCZLQz75fBzfWqeLqxAVsILCMRlGfXEiByvVTmKUlJYvzXLq0a0Tm37q5euJpPvxM
	gewn1ZI8zVqFETZn5Ux4sVwtpgIsBQh0MibGnYvv3i4+gWBKVZ6tGgEpMjZ8IwQS4
X-Gm-Gg: AZFdTZcJ8s4D9XFa9Je2S3ri0rQno5pC2JPoATLCGertzEJrh03peaNtllNUdGyC1lG
	yNHPU1wWwpt4Jtff6LRKastpFD29VW3NIOGdC/hnUNkNlJEKsB4J4mN4AErI2HR+9x4TE2wWG/d
	r94jCr6xc7y5uI928A5aQGLYJAG5KHz70Y4M7dm6dl+RwqIbJ3dtcGZOk3VKC3TPP5DoJhwS3GT
	OpNnoZs7zFb2sNULAx6ANGiZ4sskRa/vmGHaz0xl9puM9TUeILcRBhtIA28d3topgjsSdrOLdq4
	1XgJH4YoQYQBrR8c9IiI8Etyz1hNMftwlB0mROO/z5vycGbJbWbWg0YpILlB9eiJy/KOPvZZc5U
	AXZBZxhb+nOPL2IJBphKCa1/duJLaSs2xOPepWBZUSUb0F7OHLWzos/7oX3hZhh8JAqcxX9nvM3
	zzUP02sB+kQjt8y5ka51y5uHc52Q==
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305935b6e.48.1795415318467;
        Sun, 22 Nov 2026 22:28:38 -0800 (PST)
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305924b6e.48.1795415317985;
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8762533b6e.17.2026.11.22.22.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 22:28:09 -0800
Subject: [PATCH v2 3/4] leds: rgb: leds-qcom-lpg: Add mutex lock in
 lpg_pwm_get_state()
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-3-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795415311; l=812;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=E9cLjwDx5BK+zqMQtgOEwMzmeW7XdmjYZZoDgxpPWPY=;
 b=ehXU+osAStcKgvOmBX+U39c081WCbpCMsxGMgWGRC4JcPzKSYDLvwF00BsXf/XqO2HVbLJ1Ms
 Myww3XaRcV/AX9Kgqh1dmfCyAefHpUPgvwQzNxiIiL+uNoVHerQl8di
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX5G72AWTSUGSA
 5EBXUBuiUq8tuG68VWjW7x008/r4ItqP0Pswf2cX+GWHsacwXmEaazyeaKusWOMwchrNlMUvU2h
 IENNgvdJ8546eGvDGxlpPuZWtfNsPqQ=
X-Proofpoint-GUID: Dazf0S3MNU66X6jVLfVJiTl8rY_C36CM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX46CxoQkRDIPN
 Nl6ZP5TqQgwKHWxaa5BY92gXDDCdg0ZVOf8UmqdKVw7RNY5WmGpL4sQylgiREnpPNLRtEPbXWyA
 Q/1Po59lgt4/YcEPssKdilLqYTvugYR1PWNdsXaukmjeBFw/h9bsUlwo0Ofv0bJbbrGbfO3gx+S
 i/SkiOHjtRkIX4MV+pjW386nKiethKX41cJ8AFH4QI/kmpgWS4hMhBon/T288eU72RUXIpiJhoB
 QUS6Gatlhxqgr2fxpnOz3L3xyKKxSMKGOhOiYayVEujNM3SuIrB9+iYeOFtBkYzmHTvKuFlJDo2
 qTrlWUt4v1LoxsbnHHRjnyNnW/MaaG27wD1PduEh5YOF7KIYZNDoGazQ/d9fq6rQSNXRoYNo16b
 N4u1EQBxIR1DPkPBn12i4058TKnwKlfTLvDoc+AJIiKz6YHc92hu39DrEsihK107gXF1M5SjVMQ
 +4IM70fx+r5OUxzcfOA==
X-Proofpoint-ORIG-GUID: Dazf0S3MNU66X6jVLfVJiTl8rY_C36CM
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b03dd17 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230025

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in LED callbacks.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 763d6379bd2e..5d8f82ed228a 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1470,6 +1470,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

