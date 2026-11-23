Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417336;
	b=VEzvgHJt8PImLSY4sHEg0LzGFVA3sURKHfwYRxJXwxKjkZnI6jBwzQRVWhMSNANopSaE
	 LdBKc56QACVipHYXbDweAo6lw00vIJpYZPzezTnhA1tKV6ghAlPKh+WgY/6JODH3d9p56
	 qHOHwUB6QElNfCcA+FqHtqxYANRH1z4i5Alg73sYKk5uWI73oClTMUJ+BnouSULsgDrii
	 iIh74lQ5hhNy+6SaVIi0Jw4Vaeu3DfxyN6Ym0ENTbVaCmI+CjmaqadskTdZOj783hy/s8
	 8etC9eDNuZWqDgb3FK1ITGVzq8v/AUeLPNcRbB4ayro1T0wPmKg2VKUn/+4BLqoml1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
	b=Tr5FEh27afoDrqRuyNC4fwEe+TrfNcg1eRZan9KJg3XOuwlyH6j1vf7SIs5B+XEU4cOz
	 aIdtJ6WMApKQuZAyAITww4QdJ1CA4wu92qQMEPHv3C7qKad71F+Ya0cMHPJ4ghVp2JmJD
	 Iti/Y5sCtbdqzj7hlHftmgnzF8b55uwIQ4tVWPsRHw3veuLHTuHb/+gmKfMNJng0eQnvh
	 V9XkOdLA9xPk6KmEj6zC410pmhXZ2pNmpki/kFYeYDjzYzMXaIFNVt8hrGWOeOHZCLXU8
	 c+OOAz7ZRV3dv6gLNQnaTX6xpYbh/WWu5nIAp3OBkzbaNDjCRyfadqSr+w/VpzRiftA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pyEvdx8T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XcDDrPgv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739FB606A699
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 07:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739FB606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pyEvdx8T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XcDDrPgv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN510lR1961032
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 07:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=; b=pyEvdx8TkAh/8ger
	ZxjsoxlIAuuAaXkGtM4sz4BZxg9A2nUbz8LVl8reFZLc4odKnOq9xwwneriE91wU
	gtg4Edua1WKbOp+iBDd8abAYCULQYHMDGozVGbS8x0TkMl+uMnKfSgCFly+j6vBf
	VFhsqUCFQafzCJze24GqRKfVCBoIEU34/aTG5+FjIPrWCsSg8oLUs9zymP9VyUl0
	KGlA2ye2JQQlubljzcl5f8yAcTnC1Z8Zbwl5Da+cJK5RsHCP6Edvm/lGP4djbpfN
	fabsOIoPm0n0H2cUVfoPP46UUUVF9EeYpWmw8oDOtZbzZByKmhcGoAuEEQjXPBKb
	Eojj/w==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6npht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 07:02:15 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4db3db8687fso3972179b6e.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 23:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795417334; x=1796022134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
        b=XcDDrPgvYbRjH+bLPE/TPb5MVKmSIOSnzqsn2XZNFi8nyMkDl9MSiQS2auPyyXojs3
         OGVyBYJNq1VjHuZ6ApeNaeUJRJbP+0ThaT6Bo/OsrfjFsD+DBSWpXheKTWiivpJ23X5t
         d+LYqGcY1/667okOVvH7RkqwByi9DIxPsoPN8qau2SXPQVwCBnBNx9RmAddJNMXoWzFa
         f4mnx0tEUSostDgRsd1FBZtjEFXuXFEepWu6TyhznhD89Wzm/OIpzAe6ZWqVvk7k85Br
         TG/33z7NKDwD26PuTXmjSMWIN3VDfNuRlMViZsCzQAbeWXOOBFF6LNvoAvpD7BDxMtCw
         8L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417334; x=1796022134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsRPgW9mQ21aSAVZKJ+ymHnZ9DWbLkBxYrEyO4B5rA8=;
        b=NXP2jwauSufEIlI8Gz42t1ZOyecYgSW+F3JMe32lnkvYOKEE6ku7MRYymYbI8SGY+l
         TxBMIiCt4YYVjXCBCwN37S+qfmYlS9Xz24fWqxdP6pWijEIyOF54L/oniXU+iMdY4J2F
         nGDJvdTpmWQul5o0ji+dCwd7ZcRinb5YtSrD26+8U+QQnQZ8QII1CM6E48iqV6pZOpdF
         h4SJJO8KH2BW9L5OkY2WjP+VSC0h3pIYchHSR8M5sJ2x3zmo1YmKANl6oLg6ogbpUwo9
         qawX7I9EPdIAwclNett1bm9u2aIgVQZPP5OYPMedgj6107pz5TQja0NBhS9h/66xvoZQ
         G1xA==
X-Forwarded-Encrypted: i=1; AL+hErFC5PHckAz0snpqoNka/ZXF7SZNNkgVeV8hvUmLkls2nRYoxHWYqPfAtKUM8SW8GDf+b9OOhPeYbx2N@vger.kernel.org
X-Gm-Message-State: APuU4Z/KiDg0b4fWNy7mcE2GQ8goG96Jte3j5o9g54778jpnSvX0yt75
	PAf74IoVwV+Ws1KdYK0xPw5Y/AoGnwhVq6KE7Jk4V7yLu1hOieZxfdHQ3QCvgB94/kLyuVN1Flg
	9U36m+6Vuot5ID9gfXluNHyCnpEt5lASRiN1FwYFD6JwP1Tf7fMtyvzuxigo6yKmb
X-Gm-Gg: AZFdTZftsqlu8tCzxEN67BtQh6dRB/v2VwqBnfY190Ni88wwx0V2S8a0IVmUHOJ4vQ1
	bfOx6XBCkdPUXx1oNyYewp85OhzV1kbzt+kZLpbQiMBwXkIjf9IJdBEif0CKwgWV4DbltW+8AE5
	ZMJm0Cl0DrrkMspzTE0fZLvi8Ko01Vjau8/AmPWRhsj//ad8oTodH9ejy6lkrvD5m4VeWMnC5yG
	auMzMco/GuJn0toqGsSdoMZHdM8ef7W2z/3ru2QZFF9dgEQKIpNFExL7JE7h7M1ksT2nOwA4zaU
	9klbRzS+z3XwjjYqqndAfo8XzR+zI17ci0HCkf/Ebqa7wrwoBrjYlN02mzsYryxFz/xAdNlJ3Mm
	O0BrnxAH2a8eEDTTA1meO1lDUsvyqqFKKDlytM1uBnY2oM0fimncgWAMAZgsPArKK2zjallbLbY
	4mt7+UyqL9iK1RIYllSe1enHNOVw==
X-Received: by 2002:a05:6808:199e:b0:572:f8ec:532d with SMTP id 5614622812f47-57a0a927e28mr11458631b6e.23.1795417334527;
        Sun, 22 Nov 2026 23:02:14 -0800 (PST)
X-Received: by 2002:a05:6808:199e:b0:572:f8ec:532d with SMTP id 5614622812f47-57a0a927e28mr11458602b6e.23.1795417334124;
        Sun, 22 Nov 2026 23:02:14 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8817213b6e.17.2026.11.22.23.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:02:13 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 23:02:05 -0800
Subject: [PATCH v3 3/4] leds: rgb: leds-qcom-lpg: Add mutex lock in
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-3-f911edd40a31@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v3-0-f911edd40a31@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795417325; l=812;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=Bnb2so3/IwoLbKEtelemwhyUAsH+oEhrfqUv3ro2zRk=;
 b=BWcOshcISQpzbqHudIE5kDAuvxuIyaC3/EeLxUN1kmCnDJUgGZ1U5To2CRAeVXdNzlWsPeS3X
 0ysWKD+WCQZB6eDMl5Tk/3ZcOyDsxRKl1Lzd3t6cOAnduEBFnaUAKod
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: Yfkc2f4DhwFu9hOINTUjGfeNikRp55Zo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX6Uz+IbERo9+D
 t/0jDIOcNGkZiBVpuyWXJF9piDG9W5jQnq9yPCX2RC+6HGvrW1q1bhVzkBfyxSQh1Z2OcQ406Un
 QEFSekq+MY+v4hXX7B+x8bCRRZbRFcc=
X-Proofpoint-ORIG-GUID: Yfkc2f4DhwFu9hOINTUjGfeNikRp55Zo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNyBTYWx0ZWRfX7iWFcpJ5+Z+T
 NY8RY3o3KWOQveizLK/B7gXC5Myu9SpoRZq6cZzJmDwXlngbTJETAPgNr9Xp+3S+n9PyVcg8r1Y
 3SRE1uI2CZUWa35OOM6xH0rL0t80nbtpIsunW1PkywTP7UYi3j0dm4fTAG4bCinBHEECiq5To8p
 lGYQX6h22GGgAdyHlPhUGrpZbwu2QlCClvbefahLj+VHKcvRtDHEKXIBOOZegIttSNzqFAI/3WU
 mEn4YvSurr9NLWnkxDNe64Al50UJcHrQkykQelYnfmbfAH0VG4tpkr5gtvXGTcqmnmYSWbrINnL
 B+977psNvR7l7t9iSHFFayXZb/Y/63a2BpZBpHDs6Pu5uy1ptwW8FfrMCDJdfI71dUINx4+5YcP
 /j3bi+yznkWOrBpxYDMdYRmAQeCrzr9eDgQ6y98IpycD6ukZTSRJARPX4M9Cr9bi4jck27BfOmY
 qBamiq6vil5ngtGV4lA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b03e4f7 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230027

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in LED callbacks.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index eec942f2af6c..06588cd0b3ae 100644
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

