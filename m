Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6B131F983
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258627; cv=none; b=hOEa0ZJpHKXfKsbFelZvpnyMp5bdDGjCW6x5EG+qEakePQMVTkAqgVHoa97BIrMsz0zwGbTpZQAnt26uWfKveC2xl3ZATSe3kgqOiHFZ23bz73jyuqbHKavBDdtaU7FI5IvSmh27K1Hab6I+TdXaXXjiU7gR0yk6bdXVK6ViLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258627; c=relaxed/simple;
	bh=7Eqw+UANy8ZmD5J35oxC7mY1QMeVLVeLuHMKwxXbdhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utRfLuiTAtRQdk2cQm2cAsubJya2crbj4YukcUIakGTuRqz49TTJFVYGWZU+sp/irNRpK6vKpTKBbA4BFCYubn+oNFXt6BGhryBTExta+fkCBwBzFVmSTjl1IFNakJm5ZrgTpolQ6yAc54Y+fB+Z9rwsAn/PIF9MQDhmL8aW6iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBjFOCIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CinMgiVk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBjFOCIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CinMgiVk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H3427g534604
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 03:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fcnuXBSRbMxyYq/r18DW90RqJgdaTDM5lwjetPpSSzI=; b=gBjFOCIpDOUgkrQY
	cqHQfB96RMEEeHc4k7ISnQ2+uAFs5EZWZhZD9cWSPj/SgpED4jBY6t1LnPIXdhXB
	uYaLgxJvKPZ1EiSD2ADuLOoDjMSiAjEaHebfhq51BlMJhGDOzVlHC0z00od6J1mR
	+6I8FzjowGiFMDWnFeIJ77ADXx5e7btNxYM9e+9zGGPXYJjPQ7UO8PW6dZhXG7np
	haYr5ZpClRtUz6EAEHxYZLHJ2esUf+x4kWdz0RsnQQV9ySiZW7g5cPbnwbVwAEd0
	jdb8DiXGgHMJq+GNqQMGgUPE5NxL5iy33SXWu1H2wmktUs0SC/N1OhNp1BFs4/im
	yihsUw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1v5vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Fri, 17 Jul 2026 03:23:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848662cd2a1so4453346b3a.2
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 20:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784258622; x=1784863422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcnuXBSRbMxyYq/r18DW90RqJgdaTDM5lwjetPpSSzI=;
        b=CinMgiVkOgq3sLfmGjLK+RmZ+S6Ly1sqZ5jHwXYD6CZ9opXFsDM9bLbptjXjhu4JZE
         yEnd5/ZX7nzXsIXagC7Aixr/Evy20Qe9Svsn/t9uaj+8uUzaOcT62f8nulFmm3Gm3y4K
         9OBR4eZKVvvmzgiCXpeVxC51/ZkLPHW4QiXBMCJvk6GZJzx7skPpxbjjav2jkW1xm9qW
         grw8Vo+8CaC7f846y0vhjNF4eUBk/Gm8ifet+ax7Rp3SjdyG8+ieThqNspwqfAr7a1l9
         nPfNbGsYEYtYXyRmkI11n6tvEAvdopB8p/rG7RjNIWUMIFZQccREODyVO6qy30q1PRpV
         RP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784258622; x=1784863422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcnuXBSRbMxyYq/r18DW90RqJgdaTDM5lwjetPpSSzI=;
        b=Q00xZGND64wVipDhVwNZ1FxWmx3cefESSDCOT3XUSFIixf8UKpnIT3W7CqxY/VLUFK
         az+76L+t4cfa7vRLp7MJGfMxY+4VUoatMtJL/kh5z0tTK7itad0b+jR8sBaEy5aoEFwd
         LpUa3aSDJp2nKw4AZUB6teU0IWjRoLVNMALcXj0zutQ1YY/wkyx3Rbii+016DQRFAlYD
         6Vkya1VjmbAquEvf6DvSGJMEmehj4KyE1cBLNbWcyyKjJnNAoKuLR1W5mcIP/O6LqyQL
         Q58QLjnhuKy/Xskd4LyMZkV2gh7On+R71K69u8R6ZPbdjPGF26ueIvsGQRCSsVJzZpJr
         HOiA==
X-Gm-Message-State: AOJu0YzT6UQ9pvTulGpUu69A4KjFusqN3NGZWwvtJG7FIhF3mtC12Xmd
	4KjQMi1hM/CqPYzh/qOy8L3/Nr9PgZlnzXxkZbMilIA53ZpKvesCiuxi29vEWuxABV/gfHcydHa
	lGUJZgNEniEZ1yvSn2TfHkWZI1CkP1d0zSZesjlSe121h87Sa+NfHg0TsjXzXgUN5UMrhs/5Yb3
	Q=
X-Gm-Gg: AfdE7clGxTbdqF1wUsqc8Dox+jcLJbF6U7tynyw9EuUbw1xZWp9eMD2+T2SQYqPnLyt
	qpcce5YTHDAjAcOVN7DF6Czu7waPTyrwnVXm0P0j7QQpBdXSe3erxF8Eib9gKmAFF7X8mmKp0I+
	4T7vmvY3CMiDyyooDhYmIZo9CpSXTP6ovOP3U7LUDdQH9EOCXHu5YD1ZIaMvaoRGpPU85hN6Y+G
	syluO9Xdd+TDA3x+ptKztPJvqOh/QMJ74jXoV5GShhKLcZCPLhCE6YIeEBuv3QKGapIwJZ/kv94
	U72jtFYCvgKKWerxe/JSKuedOROXwwH10t6ppjUjkGsBJq4t36YwHXpy4NNl9OAet4L+9ATzE6N
	mLbWQMoFLQzIqNWWry2ifHPwjYhnwGoj9tj5ZyAZzdEgUkJKdT9Tx26DnjLwfKWNU9dFI
X-Received: by 2002:a05:6a00:179c:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84c29274827mr728777b3a.24.1784258622062;
        Thu, 16 Jul 2026 20:23:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:179c:b0:848:425a:4e31 with SMTP id d2e1a72fcca58-84c29274827mr728758b3a.24.1784258621559;
        Thu, 16 Jul 2026 20:23:41 -0700 (PDT)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfd0sm138573b3a.25.2026.07.16.20.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:23:40 -0700 (PDT)
Message-ID: <30956c63-1324-48a7-9543-2bda8d716bb5@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:23:37 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org
References: <20260707-lpg-rgb-color-balance-fix-v5-1-99e2d73084fc@oss.qualcomm.com>
 <20260708051716.3C4241F000E9@smtp.kernel.org>
 <20260716130721.GJ1260374@google.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260716130721.GJ1260374@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMCBTYWx0ZWRfX4pOHD+9iEB2s
 W33stU9MYv5LI9LzszqBWW31X2SRzTXyTjrRPqt7mYYGkn73vg+Fl2Ccbs5ppW56f6IYUmHMkyB
 wYDokFjO+fiLBiKOmK1j9qPdaOACt+36SdvnOjJPYTK3kBwe9UUy7x83ZjXyiT4g6VsbiwAhw8n
 hn+RXUiTropPhm2daemRylviMCxE5nRswQ1P3j2OQCt4xmMQypT0dK6/hz59cqGLFoWr9pj/PIv
 WMOPYq+JI9Uc/PkNoZx0D5Jd5bU9cDFzSfulqWoLAe4i6Q7sCtEJfUtlCojoUjYHpD716umMqAf
 sRaHiBG0WsWsBRNm9CjQSCFNnyEhjCtOKcitx7Mr7JVo1ZwMx0SLBgHFMhjQuJyShrN+iedjY2J
 INWCqsnl2Q6P+cQj+rI4tseD+OcE6AyY9LpBK5nXADvE0QQV/0XfotmOeWwGrGdpviFG63is2gM
 68ThzOByRcbJq5HXN5g==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a59a03f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=zfrkMIPrB1FTTd2ez9sA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: oydTbuiX0ot6lw44FlyDaWGQ3YJOaNif
X-Proofpoint-ORIG-GUID: oydTbuiX0ot6lw44FlyDaWGQ3YJOaNif
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMCBTYWx0ZWRfX2LzXdRWYWEI6
 Ne21H6Gasput/mxnQSJPrRLz9MBjMOtUMFYvz8Bc+6sHYOa0L53YtMf58Fuq1heLPvsQviX2oAc
 KkCuG14mQxINvB4b96XKxxDd3SwxO5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170030



On 7/16/2026 9:07 PM, Lee Jones wrote:
> On Wed, 08 Jul 2026, sashiko-bot@kernel.org wrote:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>
>> New issues:
>> - [Medium] Mixing goto-based error handling with scope-based cleanup (__free and guard) in the same function.
> 
> Either provide a good explanation or fix please.
> 
Okay. I will update and transfer 'pattern.data' to a '__free(kfree)'
local after 'lpg_prepare_pattern()', to get rid of the manual free and goto.


