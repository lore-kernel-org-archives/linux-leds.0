Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31E93101A0
	for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2026 04:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787633089; cv=none; b=MJ0ZnfpZzjExzqAU2XcgZNA+0WjuABl8ka1YfC+bFLLLMs2Ru2wmj+5v5EBfoiNN4ztnmV5jPI/NkrMPpWLUq1yH0GeNuKQmOAXY4JwByFgRYwrDl7moWj2FXIHTBGl4rQ8MWXGMqQy1HGPbzB+QEd9OLkuoRB7eeLdHDTVDFZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787633089; c=relaxed/simple;
	bh=z1SRqJwln6EdwYhvqV0Vix0eEd5rj7SXGKLr0mBnAGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFKwnj/MtCA+5OyvGkArpV0045fcAgtrh9Kk2G0C803qbml1OI5YAqyk/4fK7fFfMg/vXYYavVkDEBBwxZIHaZKH9sVYtk5jE55nuHBIwlPlX8taN60Nmd5PY3QHgB/SkyEreycK3ZC1P7SfNaSgzYCe++LiLpXMpSWsHKplevA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kq7PA9dT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHB22B0T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kq7PA9dT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bHB22B0T"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3vhZg1148993
	for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2026 04:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3FPUWhtIRBJh0juj9zIQAMLmr/XjapFy1xsKtm8WH4=; b=Kq7PA9dTGpKKNYWX
	swFXdZldQelaKNtuWqRUiOewGPDKlS3qki+JevGI/RHKtFsXqTieAajbsXDo+jMF
	RAGV+DspBPJSfSns0mbC2EezUgRO9UK4uulLLcJAyyPKipbWvOxJFZsBnVvph06h
	Vmw+1sd9PLdbjvzr2F7TkYFR/Iuz8VqmSBgJ5UFTh5Qf93VU7HxuHkVUr0MZ4AqU
	kMvuGMuGLlkw9CZX4461HMncvnbYTdZHbChTnWelaB49PaJ4sZrfB67Zgvynlxxh
	NWVG7BR+O/P/eGVZT80wSz0V/kApG0IQ74COdXDscGk2K4mO18xHJALhwaoU9ZKd
	2kVC6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvr45y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 25 Aug 2026 04:44:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso7620085a91.3
        for <linux-leds@vger.kernel.org>; Mon, 24 Aug 2026 21:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787633085; x=1788237885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q3FPUWhtIRBJh0juj9zIQAMLmr/XjapFy1xsKtm8WH4=;
        b=bHB22B0TI60ZH1ZCKh6TFeZt2R0zrHZJku/rFGvPThKjNx8iL/+ss22iGSDBCDFAJ9
         ntYQNYppmValFRWQmHIq2+Jvoeb8r3BwKDnkQzGMVS6aiKNA2d8KGQXilwrcEB9f0B3P
         GC4ox3KdfxqHPzYQdKCnEsXFABooTnEJ23RqFOOCg1kfeBeDexecQ9KAC68wDiu3ihk6
         Nr98Y9iNueyULTbxbGNodhTPeFB4gdsH5sV3iSGj/8ZjNyykqJsQzDCnOw/NZuFfUXBd
         LLAjJBGMPpvDFAbRWhCAnj/VzJaxAUvfXHz+dQ3IxisVZnvzSL4hxQpTwoKQ0QF5E4OF
         RhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787633085; x=1788237885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q3FPUWhtIRBJh0juj9zIQAMLmr/XjapFy1xsKtm8WH4=;
        b=hkM0UPqtEqtYVgUsOMOr0LWKy2aHxdxXeVERO8u8IIP7BUN/mFA0MqRcmbPBC+Y1bj
         Hx7sXzLrg/VAOb5fKabYoteZ9RA3kpAsfs4581rdG/eoDGWqsU4idwXt75Iz2aJ0nT96
         gDt2gRG4VtEuUzMjkuFJi5ZKt/WtmUZfVPwtBlCNzUHEYpqszps9F8azNHKuoqv8TSfz
         FB4VGcuLFBDGVELgOoKiWg2woF4eyTNmxSMUeil/MVVSWodJowDY/pjNfEtfqRUVcBAi
         Qx1wP8SaWdi1DRQOGnsGJTjxUmkAOkCFgvI94m1vKTkSojLEFyBdTMicqXsFnB/BEyeK
         mD/w==
X-Forwarded-Encrypted: i=1; AHgh+RoXcE2WNZggeME93MsRJi9Ipt2nIsdTQK8w2yzd5JSYDGaNCd/Dyddu3zPp6bu0JGU/rRgvc40L6Ou8@vger.kernel.org
X-Gm-Message-State: AFuF++kP0+fe1o+EiAbDD4fEgSRy40VllAi9/Pxw86N2j1YA1e0qapZ+
	GaJfRC0bsRMPJciD+S/IlPFGHvf2ytdaABzCxPYM+cqOdO/3q87lSV5VuOqZwpmJiB4qxDJcVAf
	kJLxvQnhr3ozeQpbrb+DFgeDV6GKeF5b3wlFziKtp1UrGmpKPx532YsR3DBojCsUyMumBt/JT
X-Gm-Gg: AR+sD128zbM5EEMq/f5MvjiaMxiHipoMJLGpie0YfG1adwHpnvbw081upp+RBpOPT6w
	nLWtWxAo01S42Y1YOUkNTSHckh8GtfnhmLFf5fz6JivTZygtDgMslskmJgoSPfXpPZP5LooU/g7
	tjSxEiuo0uHj9HmhKlTo1wqLUm1FG12Vhb9Il5BEoClGHjgpcuBxRniJ2ZAhM8/jHlv/YK+StWl
	m9duXlhkyYKoyPgE9Y2BBHduMIZfY2T/DxSLcXxEAv95CYNtA7B6dxdGhw4cAtaddlCd129nKZ+
	moIApRU65vR52awYu3B8IwWCzchmUP8xuAScjChb0EpWMt3zJCJsgA7Ph/pAfyV78zM89Yb1w8f
	dgT06ciccWAt9VBEz04eQi53Kpm7GRpAyoHQhALeOZNTWVb1GWqt74HUj/wSqeFc+cKBT
X-Received: by 2002:a17:90a:100f:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39640e6f6d9mr7351105a91.3.1787633085428;
        Mon, 24 Aug 2026 21:44:45 -0700 (PDT)
X-Received: by 2002:a17:90a:100f:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39640e6f6d9mr7351059a91.3.1787633084946;
        Mon, 24 Aug 2026 21:44:44 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b7ff6dsm2137851a91.10.2026.08.24.21.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 21:44:44 -0700 (PDT)
Message-ID: <7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:44:42 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, linux-leds@vger.kernel.org
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
 <20260717045523.A762B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260717045523.A762B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAzNyBTYWx0ZWRfX1iVe3O0CVpSG
 2FtrTJ/ec3vdhawJHMVstSa7jXA8mL9Cthcm4aSzW65cRMPwPf6ZABtRh0LxrZXOgWYUJJPMA8i
 uMxIrEaW+dzFq52a/7Ip5fpBQq1L+zGUXfkomKPNsWaLgjC3JMpXWQ+bXi597IYAk/njyyIZkIf
 Q6gR67K/QGzcTyoyR/BHsn8++aSp4gXrzWBBjF8XoIFeXybWWa/ZQ36WBVzK7qdo3Kayh4+2FNG
 VP7YYmBuMFRWqKbApTbdfxNR1P6hEy+xk/CVi4ZvKsdFWnbpGxH/vnoHwXGz8hfBJkhjBmCelWR
 sE82HIu+RL0l8jr8HFQyucadZGrFrkV4Y0laFZ0K9SaE2OZsPsNvGKRYSlDJiqzzxYRvsXKpieY
 TOwOhJ2G1GLPKsR2S4SjBN/a+nYoIVf8iCoLXmy/hmrXXRbWb2n5QUsnzi5O5PBMM9dUmS2jC0Y
 O2t2IRT6G8fWT1xlvJw==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d1dbe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fTKdFPA47RI9VHlxeigA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAzNyBTYWx0ZWRfX1pve6i5XlOVu
 olC+0Vpnea8KJ39D7QXgtWK5oLtVflV9X1uM8lDGGyDTYKs/tCrH3y+WpRYPRCPEadrSwj4y5q2
 RZNvzrBtam6e5OBv3icruh5jopQYPRc=
X-Proofpoint-ORIG-GUID: GD_LTXfbpg7xD7vbYnMUaaypVtcMXGoL
X-Proofpoint-GUID: GD_LTXfbpg7xD7vbYnMUaaypVtcMXGoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250037



On 7/17/2026 12:55 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The driver permanently leaks a hardware LUT slot and fails to trigger patterns when a 2-step palindrome pattern evaluates to an `actual_len` of 1.
> --
> 
> --- Patch [1]: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode ---
> commit c5b003f7bc9326bf3784a70ad883c39b215ae496
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> Subject: leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
> 
> This commit splits out pattern preparation into lpg_prepare_pattern() and
> adds support for per-channel scaling so the hardware pattern respects
> multi-color LED balances. It also updates the LUT storage paths to handle
> the dynamically allocated scaled patterns.
> 
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index d7d6518de30f2..24b1f570f5244 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> 
> [ ... ]
> 
>> @@ -1087,43 +1098,64 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
>>  	 * duration of all steps.
>>  	 */
>>  	if (lpg->lut_base || lpg->lut_sdam) {
>> -		lo_pause = pattern[0].delta_t;
>> -		hi_pause = pattern[actual_len - 1].delta_t;
>> +		prep->lo_pause = pattern[0].delta_t;
>> +		prep->hi_pause = pattern[actual_len - 1].delta_t;
>>  	} else {
>>  		if (delta_t != pattern[0].delta_t || delta_t != pattern[actual_len - 1].delta_t)
>> -			goto out_free_pattern;
>> +			return -EINVAL;
>> +		prep->lo_pause = 0;
>> +		prep->hi_pause = 0;
>>  	}
>>  
>> +	prep->data = no_free_ptr(pattern);
>> +	prep->len = actual_len;
> 
> [Severity: High]
> This is a pre-existing issue, but does this logic permanently leak a
> hardware LUT slot if a 2-step palindrome pattern is provided?
> 
> If a user-space process provides a 2-step pattern where both steps have the
> same brightness, the ping_pong logic earlier in lpg_prepare_pattern() will
> calculate actual_len = (2 + 1) / 2, which evaluates to 1.
> 
> When this length-1 pattern is subsequently stored, it allocates 1 slot where
> lo_idx and hi_idx are equal. Because they are equal, lpg_brightness_set()
> treats the configuration as a static brightness instead of playing the
> pattern.
> 
> Later, when the pattern is cleared and lpg_lut_free() is called with this
> lo_idx and hi_idx, it hits this early return:
> 
> static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
> {
> 	int len;
> 
> 	len = hi_idx - lo_idx + 1;
> 	if (len == 1)
> 		return;
> 
> 	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
> }
> 
> Does this early return bypass bitmap_clear() and permanently leak the LUT
> slot for the remainder of the device lifecycle?
> 

I think this should go into a separate patch, since it isn’t introduced
by this change. On the fix itself, rather than checking "(len == 1)" to
clear the bitmap, we should add a new flag to track whether the bitmap
has been allocated and only free it when that flag is true.

@Jones, what do you think? Would you prefer that I include this fix in
the current change, or should I push a separate fix after this one?

Thanks
Fenglin

