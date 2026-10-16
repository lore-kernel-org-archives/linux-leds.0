Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BB0446BEA
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140835; cv=none; b=SQlPeIAhsZv7uVO34jNsLB6gLI8Y/0IvvaYaYV1yjCF4crUPT59uuS+ExcWSBLnblkCXAln3hYFbUHgbQZtmdQ0oCoPFDTfhseQ19JDa5cnvPDfw8RZvsZse9YKhZ4JNS7HNoXQVrOwlkmgT8Bm/cBrKohmEL4w+1Mv2u+O27Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140835; c=relaxed/simple;
	bh=puwzqlb8XSUh1RPgd8HEwfS5QcUnz4musm6Bbo/cdhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P4byCMch2DVjFf52PtS6Jmfip/uid41p64WRV7rqUJD68yusp3pLVhrMn6J7RP8x6a3OyLAXp2BqQ4NcCmH2kCPMfZy9MXzie5US82O2/GbuESRm03mv76njxTzsh75bGNwmyW2ONZD5JJTJIRDau2cw4Iu4LIp5hY62FLBXWls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CBLyguma; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INtn81F+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CBLyguma";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INtn81F+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8l8O31761321
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 08:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=; b=CBLygumaTboWfpqK
	gi75LdWvPi9jZFJIPy/2p9Kl8Z+4o5yB99e0ZiRIbJtgWFooRgY0zEb35yZmMgcu
	ATFuuFOMJuz/jGxJzF4O4n82BbYfMUHazGhG1TVBwa/NNFqVbFAf4kwXCKw/7f8B
	UJfGcEcuP7bxyqKpfHdwS3VV7pdMA792WFsMkzYd7JP7Sxpd8/hQb//ldYTxdLti
	scmTT1f6OeydJ4MEUjEEgGtSvRoe7/mJ18fSfpImzIpnzeXvKuz0qk3gM8dKfbox
	boxlxKUCzY/94CDhrdbQRO9I7tEnNMNx7xyB5Pau1IGtwr6SrMiUQmWNlC2Xtrb3
	0YtqJA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr5jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 08:53:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9106bb33cdfso15823466d6.2
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 01:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140831; x=1792745631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=INtn81F+EpFm24M1TrPklIL/IJU2p8jbKasi8+gvxGtvkoXe5U+dXE06vQoQDs9zT6
         7sP8XzS2EopJVHzW03mQWo1tQARysKKcPNCq02Vkd53wdX6RkI2I7UwzIGbgu9IqVLq8
         kiv82wjZFtGVHTLU52GZGY+Idot367YKNDzcTdAPndrdDSzWMzfme/3eYTaw1786Lyv1
         dxY0c/xEcmpyxgsfs1xtEBXIADGbN5BdioB65WMWN7qLM5W1X/1ItvROXIXkJ2x12yNh
         qI0dYW3xzz5n8OcAOeCVfs/l9cgDRqS0eO4BG4KdXXpZCaCJsgF+y0ESMvI7Xb0iSvFd
         TqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140831; x=1792745631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkBaoAyAk6VOagpI3vxj7Dav0JCGHN9t4FtCKhfX2oo=;
        b=f86FHVv9m4pSG6WvrBLyTmMhSA+OmR9InR+FLghq4/zQCDHwCNScnUxzc8S8PjvrFt
         06osbfLYoEVI4paehvtDrwu3/2GRM5uMJQzYu5NsO78bhrJoy+2Zy7VMOg2XIZd8rRka
         ogNR9/l3MOiVfTCxNqj+rpIajK+EKpyzjzCtpYXGLDpSAO6VMk8kASbLIvQqDQAh8K5H
         oxzh0rKRvAaOVvd4UtoEeNvD5843/uxB+FyRaPuHHNdSRSyhL2gsC0SpAhqxt9aEGs9N
         2LI9UARtkxYhV7HiD/bWdEssC2p1+Uesjoy7LvXRIgMnNvItsgYKGwdwTAMG0Z0syw7A
         KjZA==
X-Forwarded-Encrypted: i=1; AKwUvBzo5KG5LKD4R77UmW7RPkFZOZLeISE2juuigTn8SWj0fNv37wxvGrku5iiGdnY5FOouYaNHKLajVtpR@vger.kernel.org
X-Gm-Message-State: AFq9FYJicHJQs5ysK9ekZPs9/LvA2almKwhV49QIBHrjaMuZ+qq+VOQU
	A/Y4GwDHG/8TQY72IvaoMEOQCIEs+YpB9HpIVCodo2kmrJ4uZP8BHbOZ6UOney2Y6Od1Xw4MrNc
	Y1Y2eWpRAaRaIOnEltwow2MVz7Sp86eiCzmkoMJn4krDhiBXGlEBZOfNrS/VMyq/1
X-Gm-Gg: AYBFou0Hvp8CJ7z0JAkhJrC6oB/EoXPzrpBpxPXXpxekNFcxwbBIn+vT0XqbV/sOTMW
	DAzcA57jSHuHK61YsU0m03j/IuM3HnCWkwood4uk7di7NR8Sy7bRELFd3JLahKc28ga0p6MRyNP
	gVJW4zSZ/mh7YvF3Vw9wuBHAy0JEkueiEOS6kSqrmupMrEjHK/MzwHEs97TIJSWbmSFmjW6P77r
	DBgo2DaAasbsterHp5GrGOl3gHDTWv2aWeqpT9zIRThZ7ohqn+cgH+7LpVEUOAy29IrZMgYGEC9
	fDxMs3AEGQwky5p/FxGDEg7GGNZ9EQd9xK1FND+b+QwN+7s8dgswVMznUOmMCJjI0hUjn0rcKBa
	TzTgdCo7FTc6gGa/FTHotAg==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019878485a.6.1792140830667;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019873685a.6.1792140830092;
        Fri, 16 Oct 2026 01:53:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm648663a12.36.2026.10.16.01.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:53:49 -0700 (PDT)
Message-ID: <855a4603-f9ec-4887-89e5-c92a943212bc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:53:46 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pmk8850: add PWM node
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lvDrgf_gCphNfFuOlSS9mV3H7LGeHU_B
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1e61f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3cXBS7fYHA2BcZxrE1QA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX5HJRWVGrSksO
 FobIO1/dDzwIZMhX3BmCNneS89qq1aEeDlg7jT67NpVyjhKvaG0tYI+w9jUsjgDwkZMnlXtGI4Z
 LQlEoOUf2iCrDwymPsPVnuLBoriCRus=
X-Proofpoint-GUID: lvDrgf_gCphNfFuOlSS9mV3H7LGeHU_B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX5AKSsD8UB0Pw
 qM6z8m69TbX7lBv6iykw+OpQOyQgxUNuq/V60nElzZOXXVunZkpYM0U3n6LEgkRF+naji4uaa/t
 dATz0rqub84+Ztq54CVb1Y1sZ2x+XQyO8fdOPPAVBmR8uzGzyzJ55NBvmEJIMmgPtdsQWRBDBEf
 yk3FvqTowF+3HySFRyMKLfdwfxuPqyLFw/GR20zJyQ7RXp3TrI9hC2Wjba4m2dVH5Mdz5Bsb+H2
 mtdGb0ETO0HlvUO4cHZJrndYCAPtY52pyZ1HFe7eymQd25HUv3sa27SAsp7yjVj7mV+Nu17kCZ7
 kf50Q6Bwjpr5tQISKcLTVbTi2V0AXxisIjjcW92n+n38q5dL7DJn8n6Yyv8HB+46YHdMe2Vv1iP
 t+SNk4RSYuMAIazxFVEjaATosSqZfD0AZ6+sJ8BNLG3Rmy3Vhy3mVJVXWAqw7NYvAfQw2rhahnU
 z9h7MfX+3bgrlY/RcKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/15/26 9:47 PM, Srinivas Kandagatla wrote:
> Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
> disabled at the SoC level; boards enable it and reference the channel
> that drives their backlight or LED.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
