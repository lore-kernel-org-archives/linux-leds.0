Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907956;
	b=fgXQ80dv7HN6t2i0bOhHr7YxG/URAFx8zbBWwJ6e6jWKY6FVv6+socQurQjAl1X1f7Ga
	 4Lu1757NAb10yyCoqJS8Xew/82DhjzWwNPc43vYtiQAkJHjYjPU/dg2cCCiFfmB7t69C1
	 2oOTeQLuaV9Qco9g0AAclxbf5hLzIzSUvU/VwKydZbi/6hiRbBKRzRviw957SvQ+M1b3X
	 5bP3sSg6QFHfNV99/TmNWKkVfT4a2qkAffpcjCzXo2e1mxA9xSalU5vGnlnyPpijcBLtE
	 SFNBS19HPYVdA0ENV61XFGZnbxIbGVtSznApBaziVRa+IAbnEU7CY5fPyebJStuqx0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907956;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=;
	b=1bBKVrumFczyQGzWEZcyM7QUCFB0WjCki8Utoad/6d5MO0AfHduOfSBAW1v2DN+7Sy8p
	 8D1iSnQRCIVBLKCJg8LZ4OlwbkXjbaBf1Woq2EAx/PSMSALiLwJi3Ii9DHIgRazqkxlh/
	 Jas5ZarkR1Z5wYh/YkTuCUgIUqNF3fISPTehjmE/P6WMYp6LpBpL3MJ8iOD/CagNTU9TX
	 voiRolmIPSxpqyYDc+EWSR8VE5FXmV+TDgYhn7r/edFATKAryi3K/JJvCGnD5RIKjTBkx
	 2H/8qWwKauHYiRa8V6rRSpNC9BuZeiFZLyXVvJJmkYfirNWQfkJMtCgmSuWBp5Ivrzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Evso+/sJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hLr4iMd3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201D9606A8BD
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 201D9606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Evso+/sJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hLr4iMd3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8wMlb2935699
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=; b=Evso+/sJcdVYDmRw
	Fr1FJhuFcUPL1gRGk6yRsPkXKo4aBEJz5laFGNPRVF97il4T0f4lKHxlzKP2MFGU
	UQUYF0IJ4TDJP5qVGGKACqSOY6leY/m/cj/TH1uPpmmh5HOE9bbHuud3BJdbembn
	mAt/PuymZWY5khHDh1udIIrPZS5pon5Kbpntk90gaThSkYheC1bWDGPlyB7uyH/O
	SDIz6YIrBPAPlKQUEjORIz9OsqVZnMBkkAv2fILCr0QoLCG1BVP4X8xP83GUyDmi
	sRT+sPXV3qSkF0GjHT6s5dBokg6pctHrJq1rrNJsgh2HVmEUHXWGCZQGxA/vtRRJ
	hEhG7w==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0ad7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:35 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6f538c3453fso651133eaf.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 01:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907955; x=1795512755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=;
        b=hLr4iMd3D1duxtNOTbl1eJ3Tn6E20l0hFVK65GHe440Wu0R5pdg9Q0rDPSWPvbf+BW
         OYF9sVpln6BajSqDo5IC/bPhI8hVcgQ5QDeuikcyXUciBrDRR1+Hig62HTfjemubXdTA
         CWnSF2DjYvbiVCEYooq+OEUULXP6G+gONUcGMMvyleSz/9sxodvppJEcASclskfaFWUV
         tlO6TcoGcDiRLNj5gs6PKqTAsnHpjypK3DQvH8wLEbp0UENuzYuttAPnDoOkXkq9Z71/
         WVOcf+EntZs6p9c9B8kLJMSW00Lwe2kvB6sdMV5GKHJgqbOm96sskHDqgC7i8b4yRSQN
         3XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907955; x=1795512755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnflasjgAFjotaDQqEyA4/p8xi/qVGkxIP9nL0N6bYI=;
        b=ffPyaaCWT3npLbgo5Ct1XpZLSa+m+j2DOWICoLnIAwefLmKWKIeSeivmlB6m43Zwx5
         McGlnb1b2Y9vYWktZcmDndfzxC2P1JwUlFLWqEPhORbQkBbIKJ0R3d6ZA0aeAfGTjcDt
         5tH2BFgj/Pn6GO05yhomWP90d+eSZmZ+l6/6hBiA9iQgUsf7MOVQzc77W0mPlhGc+Cig
         jAR+kzCKru9nmxBMWqscc2kq+Y6sukuHa0RhmbbZQ9eIoDY0vme7WThKPkS/maeMbZ58
         BxmwJiSz4cAX/7lAiu+IZVoDVUPmM/jEDyMqHfzekkkgIrQ+hrCyajF/MFmTMB/MUdnv
         hM8Q==
X-Forwarded-Encrypted: i=1; AL+hErF323H3ZTB1hnxukEW5gBt9is8mMZNn9xM//NWrgSXsEfRtTL6nRLcfY5UxJt4keEYcDuw3x+Bo5A85@vger.kernel.org
X-Gm-Message-State: APuU4Z9il/uMnzq4zlnuz7hu1pLf5cAIchQOEqUEos9lok5dynuNB5y6
	YQ+LE+fAprkarSemVsih0wreFHgrrxkV9CwhBbVCc1G4/zRGcR7RChH2EMcKuE6ecoPQfJDTQG4
	XeDk4l1MP4u9uMlUZL7d54tXKrir9j4ZCji3BGfjUq8l3jzchiQBZs9b9QRf9mP3O
X-Gm-Gg: AYBFou2PS7GQm/U6JuXtlbiGrRGOkZxVBzy7HSbyb0185VjCsea118mSbuJSlbKWlXS
	vkF5L5iYONh78DLyyLcFt/EHuT69I8vvht/sYWn49XhqoXJiXQPVHImUD5mR3lSsaR75m1TCxE6
	Ut486FnlR1bT8prU8j8wADHkSsnxH/V+B7J3qcyj/vyGw0y5YaUsQzf6M0jbu8bzyIwtWyjGj9v
	xhDHoPk1c8zBKw/jqGVMgzjNOrAzbx3XhbB/WxsEY6dwjGVV6QkKy2XMQIAZPVBjCo9l6M98Sl+
	9Xrz421bgf0OXVNxVHZBQ3yOMM8D/l51h7TE4shX2BfZumXKeN23Nw9Rl3SOBO94Sjk4NzbZDVi
	R0DDzz0c5A1t33vHLkAfVRaNwiHw/uQf/Gtj153gWfYl2dlAFLnjMAl5yA08U/NWpBv+cVoLV4s
	Db2BGZj2ry5kZZ6nimc/mYy4Av
X-Received: by 2002:a05:6820:1908:b0:71a:ed44:18b with SMTP id 006d021491bc7-71b024f1588mr1482576eaf.1.1794907954759;
        Tue, 17 Nov 2026 01:32:34 -0800 (PST)
X-Received: by 2002:a05:6820:1908:b0:71a:ed44:18b with SMTP id 006d021491bc7-71b024f1588mr1482550eaf.1.1794907954166;
        Tue, 17 Nov 2026 01:32:34 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2206dc0sm8678928fac.5.2026.11.17.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:32:33 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 01:31:35 -0800
Subject: [PATCH 3/4] leds: rgb: leds-qcom-lpg: add mutex lock in
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
Message-Id: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-3-7a862240683f@oss.qualcomm.com>
References: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
In-Reply-To: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907947; l=814;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=5eJRVgibwxyaZg2NtEGplKeEYP5chIPBpI0Kdh3stDg=;
 b=Scy+zu91VxFdrh8IFbguc1SsFdfGNcpXXmuPo0ivwEPYow4yX2bP6irzC5dnDhIL85ixkDCMX
 qBFF/fayGYHCWMYRyWyRzhCcBzr3pKk/6L9iPPKxueOxy7oGNrxiQeU
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX4z87zwlQUuIk
 9ZfVirJnH+902ExZmSsXle0crdYuH2eqas2lnvLNUV9IFXXBKMEeaSVh5ptD4ixUUZsjPBmFAiI
 gsxp02OVHkZ4tF2dOiC28xdCBTA0ko0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX7RxJ89elGoL7
 YxjfqEYBfof7pWYwQ0hHRC8hYSwQtOisnxJplI9K6O7IR7YXJVUH/M9FFSPXXdO1hTs4KkVWi0X
 7raRdpKMfuNQMh6OidCpyh6zmIsso+x3HgfBhYt6xyzf4dA5Q3lQkTa4hD3v5/+OY4LeWPGZDB1
 zjzSjSLu818i4ypNLkuWvJi5ElOGf2GH/V0LeqRiQ5ISuC3UQ8LvYBEjxS3QOF0xf7Hufv7fUx+
 muZpSgpAKzV61GYh+gDMhV4+is4/YP8Vtgo7i1JS9FxwqzW4BYYnhWBMMNG6wkI1SYtRxuOQnMe
 wt2O2+Z1UlKJpiGIXyiUdkaDR5S746JdZWHEoFg0sFxV/qqAIkhqLvn/ss7EnaViTiuY3yWgGGw
 K8+huj34zcYmWXPyKdE56iVPuNF16o5gyxq4JW7tt1XdfTFJXo7piacAcuzxwHVWJ/0EKIqV7D3
 OUMC/995xgpiTXodJvA==
X-Proofpoint-GUID: 9CS2pdlJ4m_zI5qVv0sMshlD2Jk3b8jq
X-Proofpoint-ORIG-GUID: 9CS2pdlJ4m_zI5qVv0sMshlD2Jk3b8jq
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc1f33 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170037

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in lpg_pwm_apply().

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 175b3680766f..971f92911606 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1425,6 +1425,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

