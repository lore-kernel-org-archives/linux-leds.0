Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C023A562
	for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 14:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507658; cv=none; b=YubIDYeLjb+hxwPS6vCfTfsBvICWl/zZQmu7kzcboz7eUCeDeybN1sDYfoS4FdhMIiLULW0UjL1WXykrh3wLdMe624Cv7Ne2dM2Q/3wqjzjojzY86R2YGkJMnqjFHd+zV1YEN3ogqH336I3GW+aWRWdDZNkg5Uia+sTRxo1d5DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507658; c=relaxed/simple;
	bh=QQbrQC64DOKFrs81hP2K6iVbP4JhcL9Ejso6A8dmgtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODusTjL6NzJnQ9AKupTmKLPVeZFRytph/ByZ4EDkyKKVVfZfw5PwC+ehgJ/02QawYTNsBG/7BzNlANJvygOk9rH3ZFrSXTuheM2wlseiwIypl0QlZuuci1UPu9XoYH2IXm42ibKfG+jb7vP6xJB7gvwZTzMgeEpWbWJlkSh0VI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRcolZea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaYBA2X7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRcolZea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaYBA2X7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBeVZQ188818
	for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 14:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FjpPkOD7u5iityBLQ910RqkrcCltlUnYQsWx6dR7ODA=; b=gRcolZeaIYazIXsq
	TCw97cGNBVdYWyJbPFliK0KBnPmUt2eILaOnkA1CadKuCGqtMBD+GboVYzm/15ke
	dTglQeRB88EgdudWx9bwwnXFJg/g6zx/TUcFx9177KhVBd4AtrV+Rj0mBaDQ9piM
	ugJj2zpzhame7/0u01kT2dw9gkgDt57BhltwUBkHO3qmEQtL5GmQ8SE+ey9KmxyJ
	kjGBL7PxZVMBoSv9XDtcybLXfj1tT45UiXy/vvWN9AFjGjxXXV/zwlqUB73Eq8fR
	YV0j5uegJiWLLp8mrLjnkHzBNlp7nKmsk3UKrMIXjp6ggsjYtcmDL2Pkl+i7ZQpI
	4+jvkA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u0na4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 14:20:55 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7386e55c63cso33352137.3
        for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785507654; x=1786112454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjpPkOD7u5iityBLQ910RqkrcCltlUnYQsWx6dR7ODA=;
        b=iaYBA2X7Z9mX2fbIQpBttWq/y/xGUKRJpY2Gr3Imy0oaqTk0ak6VBKd7LwpmLCb2lc
         Z7y4lqXmb/59CVWyNDv78DZZQAxjzdalGTlxl3XPIzjSa4/Q0nb5Na9SksyRMKsA9h2o
         FDcTf/JZ42aoDGJkEJLlnWSEatTZ1DlvlDdpJvVNV2mwVKXPPkbl8zK/hGZpUZSyv8Yj
         bD70SiJbCGegz2HhrYblwuFAKyy0WZxRJE2OBW9uVZZHbCGxJLF2dgEkfFoGlV9E9IbB
         Bo1FR7ou6vPlwxGtmeR5qTuZI2p6Dt7COUS9OyEtNygzuXiHQ2w70rNAbDwMyfsZBmPm
         joDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507654; x=1786112454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjpPkOD7u5iityBLQ910RqkrcCltlUnYQsWx6dR7ODA=;
        b=Q4ODjbgZ0urQNa6Ylg+qfNfPRpHJLQZTOAjRqEUZJWpVyjr9jbB1DgxDItXRlBvcaD
         qhKHzP+LbEhwzjKBQQtGBKvqzFbmLkLWmgySYwJG3fXru7YXal8jYjMPxS3gTvrXoLh1
         NPKTVbm7emlrEcFlbxfspT6xPUvEciSpcrLsbBJcnIyYTw4pKZfo37nErun4773sFmL7
         POnzfEAOgnKLFNmJFXQze0gKD4yjanIdLQcTNgRHL33h3cqYproqd1eBO+mmK5rm+sGw
         ILMAI95SR29iFVQ4H9csGd8+4R2IeZ2jbxDZErNtsDUoRaJg6plv/E/6zxBqShWiABts
         UElQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr05Suw0VtckPP7ntDsgY+AeMreGvXT9ZmHRBNwze15Q5uhySqsUGNcvFLmJ6lzlrcT7V6HFeM8ThMc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd5Vw/OaJGurqsYs8IJZuG7cHSvNIOAVzDp1AN2wgoUtH+IgxT
	bpKcjARsk+ZDoZDbTPfyv4LseHwTEZdkmimQuf2i2pZb+9ec+j36avkIRU/idR0lyDVna0sEoPv
	eiq7l3MA3IiO4YaUkf0Ru3o51Ua2z8P861ASawwyfTvilIORUsJIaxF1zjdSeEv8R
X-Gm-Gg: AR+sD11InhQenf1Xe584G/T/0Xj3NBPNo7hZKqJwQnM8Q4VmqcPzLxck+dHBetoxZFc
	gzb75od3QIyQbwD+p7pmXqU80H4tRGPbyQxjECiim1vvRMJdwaM0z/9IFyXOeQ7BbK6xz1n513K
	JbFTajOHAwOsFyW3e5RWoTVwlOmmiT1CQypfCPNmT1yOXp2Ru1RVlxpZtCEpAZEyrQMA5e9/VRv
	jlMnHDq47eqP61C+oKxwjvw2zf6MuH+w26caJJqdhOmgLEPQsNevQeTbnr4wWyaho7cEdHPUonn
	v+xG1nIrpuSYRuSGt1GZG138BbYnyTIuzNG+9zXglGk9HxbMY2/cvrzBvjcJlJIndYzeSXDKk1B
	nfIYhfs1huh0E4FNlVQdoYS1q
X-Received: by 2002:a05:6102:5249:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75b2498305bmr147232137.4.1785507654214;
        Fri, 31 Jul 2026 07:20:54 -0700 (PDT)
X-Received: by 2002:a05:6102:5249:b0:745:17b0:10cc with SMTP id ada2fe7eead31-75b2498305bmr147200137.4.1785507653674;
        Fri, 31 Jul 2026 07:20:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm1609212a12.27.2026.07.31.07.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:20:52 -0700 (PDT)
Message-ID: <7a0c4a70-b838-4c7c-9f16-d394ffef95ba@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:20:50 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6caf47 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AUv8OMIDIaVCD8xAqLQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX7V7CPyi7SaWG
 nqZq86M1v/J+5/443A6+YeCOSfQLrHjfg+081B3Y/0Wf2PQvPcM/Keq2b0LUqIKhPsAB/n5e/EQ
 mdr8rCWnAYtBePMhztDyWFqhYAiE+c/c8o+UH4TFmauJ2PZj1SJ8qQRH2iPWWe0Uzg89yvUtC/F
 6F3/KX0N4sVQMmsOHulkYfh56J2DUvAt79pBvz44v1jhqC4GF1fytel0eAJiahfn17lHWaVyC8o
 h4G/9INnodhS8cyMyUR8wJ7AuYC+GysDd4/34ZYd+QpWnWDEAp+pHudcJufRMNNlwpIPyrZbxHO
 u+bt/QF7c4LFfUt1DjNW2Cg4dJRoHzOzEj3xmogw1oRyr3b2D6o/KIXD09IF+aLPf01wUnfpnoO
 9eJJY+sB0oMzSlQ7yrJNonvSJxJOc1ZIVtQ3hvbQMIPxQDRoC5bWmDknNlcHzVIYyebRnyKx5sX
 p51DJPcF3uOPVrgOHMA==
X-Proofpoint-GUID: 2y6KkjXuLgXRctnkpHMO4tz5n7mmLc90
X-Proofpoint-ORIG-GUID: 2y6KkjXuLgXRctnkpHMO4tz5n7mmLc90
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX/e847JW5U+fm
 4UeU3MYv2yLrW9wsLgSymY7JMSvznpptUdWqpZwPqW/ARwXV3hrPL5aANcarQeBRUDf0Q6R6YfY
 O1CxwcipuxBKtjOx1ApDYtptTJBnEck=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310109

On 7/29/26 11:48 AM, Fenglin Wu wrote:
> Certain PWM channels on a PMIC (e.g. PM8350C PWM4) support a Frequency
> Mode (FM) that can generate waveforms with more frequency points than
> the standard LPG PWM mode. The trade-off is that the duty cycle can
> only be fixed at 50%. Add the FM support. When the PWM channel is
> requested to set a duty cycle to exactly 50%, use FM mode by default
> as it provides a finer-grained frequency resolution in that case.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +	for (clk = 1; clk < clk_len; clk++) {
> +		last_err = U64_MAX;
> +
> +		for (exp = 0; exp <= LPG_MAX_M; exp++) {
> +			/* Calculate pwm_value_lsb for this (clk, exp) pair */
> +			lsb_tmp = period_ns;
> +			lsb_tmp = div64_u64(lsb_tmp, clk_period_arr[clk]);
> +			lsb_tmp >>= (exp + 1);
> +
> +			if (lsb_tmp == 0 || lsb_tmp - 1 > U8_MAX)
> +				continue;
> +
> +			lsb = lsb_tmp - 1;
> +
> +			period_actual = (u64)(lsb + 1);

Did you mean `(u64)(lsb) + 1` here?

[...]

> +	/* Calculate actual period for reference */
> +	period_actual = (u64)(best_lsb + 1);

And here too?

In general, I think there's nothing that prevents you from
turning all of these variables into u64s

[...]


>  		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
> +		if (data->channels[i].fm_capable) {
> +			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
> +			if (ret < 0)
> +				return ret;
> +
> +			chan->fm_capable = !!(status & PWM_FM_PRESENT);

Can we read this register blindly by chance and drop the match data?

Konrad
