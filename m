Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907952;
	b=msCBjgIHXygn8OAfyX560NVdkHFU4MB8Hi6Mu0OTSWSwVM9W4DXiKD0XdyKqQhnA6xf9
	 BKI3qXIpTh1+c9FPNo7emLkF1OQxdcBewixHduhn0gFAiOwu2Nx+MauhPZbZe73SgGhgv
	 oxFif8Kph2tIYOMG8ZYlrUc0HgCVhIytM6x9+dxIzsF9J6RdHZyPQUgEwcwuiDHEMjQRK
	 iml62SRXnYbsVA32XYtGc7RJjPUIW78lDR2dj3VGi7vwDpM0yy4/FLe9z4ptVY2D7f+Nc
	 fFV2UJXD3T2dLtXxLQBUVfmKK8DWQdIdTkQEYp7/UiC9D1QLSP5BsuI/TmptesJ8AqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7C/Oh2qf22t97UvAJSPDBdguvzEAFhAp3zxPE4qLodQ=;
	b=XP8FpqofT1F5XIZXECOsNkboPn7s79JV9bup+p9EqKTZsU3mQ/SdF0RAwgX8nUpMWplE
	 fOnUShhp2b2zNpqAgHsxGlf6qZZlWhZrq8xB48yDuDFEzo1rzTh62ngscMPb44l7IFxQ2
	 sWBM0YdK3t7QwFCit7IwAMXp/iuBWJOP3iFWH9apxLBKc4dTu2CDzWBYMdC5AGZToZUMY
	 jrRP5XJd+s4H48xkkpS4tMyBiguDieT3PFmZJjKYaKEv/HL7Xlaakl07Y0MqNANuagafk
	 2EfKr70WkPp9UZ3auX+EftJI9iXV15c3a+JbYz2ewK3d8kFSrUUWLNUbcca+mzXKs9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nR9yABHM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5y93Mj5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FFA606A336
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FFA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nR9yABHM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5y93Mj5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8Ur8q3624120
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7C/Oh2qf22t97UvAJSPDBd
	guvzEAFhAp3zxPE4qLodQ=; b=nR9yABHMfzSmZmqLcJddGH5GQ5dbN1wx5/5WPQ
	D1ghVT/+9ScGKQtj/A2fHmTfLaiUa4itv8LXFJGZ6Y3o18yOjQgFt8fFBR04cQsY
	IhT+0LymkO1bltd4jyxUvdKUdRC5QSnokTWcGJmuHww6ub643N52zcYLifMaWdGN
	dgd/d9UzrsgBRlOvpDFnxlFs2VwPsBo1QZqqM2ApVjBePXqV+mekpA0f0RIy+INp
	oRwQAWYS+CzLnnUd/0+RKDR7DU8dFviZb9xZIZjOwFoucBpe016PXrjy9/fFr71P
	3gw60I2vxFkN8iH7kQVVKVtJ+LjSh5v8tcUuttkMML6anwYQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejvm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 09:32:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45eb9967696so760224fac.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907950; x=1795512750; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7C/Oh2qf22t97UvAJSPDBdguvzEAFhAp3zxPE4qLodQ=;
        b=C5y93Mj5WRY/BGJUQQWIHLYfC+f/P/GyxOao4/yrdIqSaCvqPI4f/JGec/efXNbVmR
         goZP6E11uwLn9n+tCJoj+KhaLLw2egztjpDM9TpqMOcZOUWXdl4lBbrwbhHj4NTN04jw
         7n2Hn/bwYy5F1qdK3Xy88E2F3mg0J7bvLj0N0LEfnEVCp1cI7UkRQxwpUtRJW4nxJw/9
         0xCm5MYXtuuTbzuSpYo9Ii09Wi0fI1aUziS2KfiwMZoHlDJJnEQozILq+aAV9JW0aYVj
         wfQeNYxF+J42NH3xtnC8Rv7qochh0kJTJ4ZBLl5VQd6nbGJhrLwlEkOLpGkBeU1vxBVV
         tpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907950; x=1795512750;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7C/Oh2qf22t97UvAJSPDBdguvzEAFhAp3zxPE4qLodQ=;
        b=z4BTEGEChOiRq+vY2ejbFIy/v8OQUVhtAwtlT1XUlKqQKlrQbl8jFCtHVqVsEgJyUq
         EtrI5ez8MT1TteKsnD6crZW1//Av/9OnOoBuyT5zA6lats73/8qo51s8YhdVlRLVNomL
         nqs7idkYsYJtRfYiYl9vLfzlms5Sk2ZbAGrrNslC9wUrBkrg4hYZECwyfvRNe5fpHV13
         pk0OHnzNop83epuDTQArFjI9za/CheBk+Vt9RHLGqYk77KWk3zJ50QI9GICSkmRfUenu
         FuFrN2NV5lt9iZEUOnQ94FKiJs8Jk+jP/KpS5hicjgOnL2B1alNPQLfclLIKlwj8upBY
         z6AA==
X-Forwarded-Encrypted: i=1; AL+hErE/QvqX9yeWOgjX+zM4ekkPrqI7pP0CZUyDooJpM4EOaZnrIZ5jp6CdW4NaKH41En+irgawbR6GHzV3@vger.kernel.org
X-Gm-Message-State: APuU4Z9oWlB3jJ2dDe2jtlPFE1QMOP4D3hIItcZq41vwsz05471yVyuW
	14R9ZMRZEm5YW2QP4Y/YtbVyhE47c/ziJ74bdWmh3W4kNntXKQCkE75/1vB1rFGHYtU+SL1YvZE
	UuNgGPbMxXrBdeUIFGNw7qlwSYFtNi9MfMn+5+CwTMlLYsqm4hFldM8dJFzul4hFr
X-Gm-Gg: AYBFou2wFAG/U/18ANIsoxC7T9jG394RioYRcESWqiwdVuNSuF+Uu0saXj175C+p9Lx
	ITwj0yRGgVTt/7els4sn1nNMCh6sysJqVnnTPwJvP186flBx4/GBxW9gw9RWmngy0nClcQwf87j
	gADPQ4IBDDYad5Vtv4p4nnw4iGwPWcvTvSqheue8kaVKJMIAVx2IzVEh228GKlLn2p4q/LaMbAt
	6UPqCq0WF4opDDtbliCtWiMl742cG4cTY9Mzby3zanNG5AHMrcXUyuWSmyLrsbFxFf4nNzq/zJI
	1/jCoZeP/NRD2tBMV/3X06+10cgiRWOt7U7yrOdcyfdXTANTGcfeFAStk7TXLTE0jMNKtzE1cGD
	xDZO4w/BwE7v+U61Vzn/TwQ9PSOJ6G2i90Q1rJJEl3i31FSosp1Hx8WM3v2DEGMivxXOQCV2pgH
	um52elKU5ufh+6Fyw8CDk0Nn9d
X-Received: by 2002:a05:687c:22cb:20b0:4a6:d645:94a9 with SMTP id 586e51a60fabf-4b40afe2b06mr888997fac.4.1794907949938;
        Tue, 17 Nov 2026 01:32:29 -0800 (PST)
X-Received: by 2002:a05:687c:22cb:20b0:4a6:d645:94a9 with SMTP id 586e51a60fabf-4b40afe2b06mr888989fac.4.1794907949550;
        Tue, 17 Nov 2026 01:32:29 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2206dc0sm8678928fac.5.2026.11.17.01.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:32:29 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/4] leds: leds-qcom-lpg: Add several fixes and the PWM
 frequency mode support
Date: Tue, 17 Nov 2026 01:31:32 -0800
Message-Id: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPUe/GoC/yWNQQ7CIBBFr9LM2kmg1Ua9inFBYVAMUGRATZreX
 aq7/5Kf9xZgyo4Yzt0CmV6O3RwbyF0H+q7ijdCZxtCLfpRSDOjJ4FPPYRuMofrikie07kOMKhp
 M74A2INeU5lxwUGJvjwc9iukEzZoy/b5Nern+mev0IF22DKzrF202NFWTAAAA
X-Change-ID: 20261103-led-qcom-leds-multiple-fixes-and-pwm-fm-support-3a04f85c60b9
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907947; l=2405;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=J0/bhp9E9zVhqWsPDFGrCuBfATDpSj5KVBkOOJecmCI=;
 b=B8VIMmvdX0xmus9xtTLOjvBL8GpGgCg9KLaGyJl3DYIe2Csl7x+vjlPejRKLGw32UV7AkFFGw
 x3nbtPfbtYFAl7U6LbY1Jz+ibAdN/uRZRe7fGQnO+NlTKDTXsdhVFTL
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX2s9BTQ1FM8/A
 rJHyoUw6GIDZttC6O2UvY+LzOZcnmiFwJBq9FTvX0cVSPnsjRQZqv63xIOE9kinJF2YleixjtG7
 1popnH687F9T1m9SPB0Mp7ieXWuzJuE=
X-Proofpoint-ORIG-GUID: g109XGP-CaFrfdnlbL-GJ1mHik2TVwaH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX8QWkKiCfCSki
 PS58V2/+NOcEccLjnJ9umM0fcmKQlm2R5K38AD6FDasygcGtL7vhfaLHM+i+7Ckseqikys+24ef
 YsI/wkyPmJrwQqUNSWiFkpddVsjy9Jd2xldYEdolSAG87psLHYql7Kzc1dc/Xnolmg+9CO+w2hS
 lTbbI/o3eATcV/Kp0NvdINe6hvDcfOPG0m7wIm51p+iM6ayFQ8yzGVOZo9FtO2whKtMN5kHjK7u
 EZgLeTWZKbjt1XHxOAxMY8dtnnDmatex7v9E9V9iRXjcoEVLFvyYqMSKKkMiLzurqgkMOGlPBwM
 h5omy9p2F92tsxxNJcEzmNDSFq+NhQq3kYLJf50/87JsqLhjxgZYBzIm10u9h0c33aPbYKreoDs
 d1azooVdtyJqqJ0gcVZ5hNk4T3yAy9+3TvupYBsZTE3RuzRiaNmR54cwzCbi3hn7mrwyBPk9SCm
 8Fc9tidDZBGnpy2ZEyw==
X-Proofpoint-GUID: g109XGP-CaFrfdnlbL-GJ1mHik2TVwaH
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc1f2f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=UvHhfY28hrIE04vzKvkA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170037

This series of changes combines and rebased these 2 series as they were
changing the same driver file. It is easier to send them together to handle
the dependency:

https://lore.kernel.org/linux-leds/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/
https://lore.kernel.org/linux-leds/20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com/

Also, a new change is added to close the discussion in here:
https://lore.kernel.org/linux-leds/20260827133753.GM770273@google.com/

Following are the Changes in this series after the combination:

- Added changes to scale the pattern when the brightness and
  multi_intensity is updated while the pattern is active.
- Added a new change for explicit LUT ownership tracking to fix single-entry
  LUT leaks during pattern cleanup.
- Skipped LUT allocation for zero-intensity multicolor channels to fix
  comments from Konrad.
- Renamed Frequency Mode identifiers consistently from `fm_*`/`frequency_mode`
  to `freq_mode_*', and clean up the code and fix the naming issues to address
  the review comments from Lee.
- Added logic to compare the timing accuracy between standard pwm mode and
  frequency mode and select the better one.

The change series was tested on Maili QRD device with pmh0101 in these scenarios:
1. Tested the RGB LEDs by randomly adjusting the brightness, hw_pattern, and
   multi_intensity when it is working in HW pattern mode, and the LED pattern
   and color were confirmed to update correctly every time.
2. Exercised the PWM4 channel on pmh0101 by requesting it at different periods
   with a 50% duty cycle, confirming that the frequency mode could be configured
   correctly.
 

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (4):
      leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
      leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
      leds: rgb: leds-qcom-lpg: add mutex lock in lpg_pwm_get_state()
      leds: rgb: leds-qcom-lpg: Add PWM frequency mode support

 drivers/leds/rgb/leds-qcom-lpg.c | 643 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 562 insertions(+), 81 deletions(-)
---
base-commit: 4e88404a72e5e26720539e5555c383069cefb486
change-id: 20261103-led-qcom-leds-multiple-fixes-and-pwm-fm-support-3a04f85c60b9

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

