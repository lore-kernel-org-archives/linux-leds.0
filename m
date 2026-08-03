Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971072EEE78
	for <linux-leds@vger.kernel.org>; Mon,  3 Aug 2026 01:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785721838; cv=none; b=Rv7E1Wgb2GbzvzAIfLXhnpv7928pgGbJHQNAtKu4K/aCSS0XLp3tje2n8LW1BWzOUBVDNsrIMmbZow0H3Va5OGZz3TrRlz6aqxAgITu+umYLKT+VmhUuJgzhL11yHuSqsMewF/7WTVz50xmKaeXIosu5n9P7Z5qcFeNK7NYsUYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785721838; c=relaxed/simple;
	bh=Ych7km7RzdMH+A8V9KC6uTYgA8GFtn3ofOlpfhw3vDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ctAJXk37PnGXxmuhYn+4vZXJ/Lq+4hxzqTg7VikupIKneJTGjvEhsN8cKQ+124XV8plDL2NCWKw8dRG6bRVOSb4B0ekhRgxmG+ZnM/DRZLjjqgjGc7zJ5c+isDGAzwo6Woc+uWYFZZaeUza+OFMjKBJk0vC1cx4wdbsXu6Kut2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9AwetZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBveNKPs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9AwetZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBveNKPs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWWUW3102705
	for <linux-leds@vger.kernel.org>; Mon, 3 Aug 2026 01:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIFd94f6C79s+yG6r78sDfN4bOnzyywCIv/Jsn+QDnk=; b=d9AwetZ8/fOTLIiY
	j6iAnBCBv8kYHvnrZAYwo4H4nrQkV5V0q4XK2DcvPHsPbJkYQcmRYyXBm/kN7eaK
	Ra4QCcn1JLDlctnuA1PCScn7eCTk9zDhH5xDZYvX0uzhxeTOfPQMxusJIfrHyZw+
	El/cMF8vxUye1reD53tp7MC9gaIgibXXwmbnaWQt8FtBgjEzMDjcdCUumB7Qs0MJ
	xqP6R3HgS4LBAyNgYPuTZQdDd2lktWOPdTWGFjmVrl1KlufBoqs0FFMMaM0fZhTW
	/OliSamIcS20swslH260VNY/drV+RZRdhdp5Alcx9KMsIAC572qYUcZP9hxMACMd
	0JBCQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q543r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 03 Aug 2026 01:50:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so689867a91.3
        for <linux-leds@vger.kernel.org>; Sun, 02 Aug 2026 18:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785721834; x=1786326634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIFd94f6C79s+yG6r78sDfN4bOnzyywCIv/Jsn+QDnk=;
        b=SBveNKPsq6H9Y9rPjdTIWdSIFofuegrKouOZc8vdSXXQkU0WeQ3puLGx9aMZY2qh+N
         NgcZxs16cz739Q7BcXBv3N/bRLa6Quyx2fFCL60tXV03dyHwD4O3XUz1VnyFjtOu4dnw
         j46NxBJTLNjF0p+0N6IqJN+9I3DyaR3x7srnPxbb5bIiZgqYky3cVqjmSk+NE2jxtGKh
         4TPMKjyNjHET3nHdoRvQVhnSBu8T/FdxE4ra2unS+sj0I4AdRHdrejPgq+LGDEMCKKBM
         4BeW86/f38l/UNPPFBvxVcNQafpbTR0SuSNk9PXMmTQ4UccMvgA8tPVGwVEeTSSbibyD
         g39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785721834; x=1786326634;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIFd94f6C79s+yG6r78sDfN4bOnzyywCIv/Jsn+QDnk=;
        b=iKqC7s9n+hMqF8HBDpUGsQw6K9UJtU97b7GDqX7HTpSHWb4o5Lt+xKCwh9lQE4mb26
         vyPX6BDAqiHf/Fyp6hDXa3RGz4F6uC9Xv4sjBtdTNiIQDz9b8eLtTsaUWtwexQHNFogx
         cEg+sZ595QaTCyG7O6H9dN+3AW5M1WAc1ElEw7zOmWLR6OcljZIXGmDuX8K09OqAgptD
         wfHm0CjavRI3L8mKOIe+MOvBcTLU1jg9Is6wm1A/TraGC44xUHbg+oNuJ4gOpPoT+3Nz
         gQ52f4gPIuI79Z/3i85yzvaOBwRzJoM7opr4Ag6lXckfLB1dgGXiICUah98tV4Bcd310
         k8RQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqrbfq9pSzpdQm6XhPz8ruX65WNDDywYe0nY5o8L6dXWY83A0LKUmJ2RwTYCcdlo9WlL5+hYhBmgpG7@vger.kernel.org
X-Gm-Message-State: AOJu0YyyONFgWeQhNNrBtwLJmhjhPbYvXRWO1nsP1MprRY6NVN+WT++w
	jqGcs+cfd4QfPs8VYVkQE0NVxbg3lxi37nSzXKtb3NskDemxEmj7UNR/UH4TaaI6CemoWFsFrDz
	C4HfsdDzQL+PBnbB8vcvQvO/IsCKLdVyR5OrIDF84vfSNiaoXvg5B0T77RwTajbzW
X-Gm-Gg: AR+sD1178cs93yNApLOFiIsr5OGjsRQbYHkAUyB/06LhsiyhD1w+x6F2nNz8cdppbbC
	4LP8Z4YR39eHG3Qe0SvXTOs4neMtsin2HVkJN2SQcw6bDfGpqj+DD3YLL/k+BtYiJxSSnmbmbYo
	ppBLw93G2y31cOolUPp6TOYdfwroxYCHZxuV7PvQGxOE6SJOjtIzZsWv5gDHXKwF722YhyH6Vai
	JDd9nvnf/TLHKzrefWNGeKcS3B/6VocjZZTlcvRq/QImyinfz9Q5S9rriVA/5TwYpIH1cd3FJ41
	mMUtsiVahWaoC6n4jKwMSk8d86gumjzkCBku7faq6jv42/EwXNKJX8rUv3w70rjUhvDKBynpKi2
	WoFPGg7alL6T6gxFiOi4uDeeiqZ62HezfiC/y/ToNptj3JE2840ktF1AG6NdUBOTOLOBT
X-Received: by 2002:a17:90b:3c05:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38fbc4896afmr7526786a91.18.1785721834353;
        Sun, 02 Aug 2026 18:50:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3c05:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-38fbc4896afmr7526760a91.18.1785721833849;
        Sun, 02 Aug 2026 18:50:33 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2575819sm3263683a91.0.2026.08.02.18.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 18:50:33 -0700 (PDT)
Message-ID: <25e0797b-fdb3-44b2-8ea5-df0bc3355648@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:50:29 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: rgb: leds-qcom-lpg: Add PWM frequency mode support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260729-lpg-pwm-fm-support-v1-1-16d3c72a9921@oss.qualcomm.com>
 <7a0c4a70-b838-4c7c-9f16-d394ffef95ba@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <7a0c4a70-b838-4c7c-9f16-d394ffef95ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAxMiBTYWx0ZWRfX0C1+BIWoNiqT
 s6VI7UtwgmUBnYppmM7PkQdYJ7wdt9STLGtAUDG07CUwfwc7ju1sIlHyWsNo/ix1IjH5k/LXt7S
 qJx/1Sd2iP++ndYtyw3oTEP7uQ2A3e4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAxMiBTYWx0ZWRfXxZt+adr/n9kS
 lUZd2i5W+4C9B6px5H9CFh8AofwK34APsqjIF2tjsWoT3Nd8tYn9fOgAhmLspHAJZDh9qPZ5oCP
 5ECrMz0iJyvO5LaRVZHRRAI93BgA/Qto06zPll1iDvlt5JbksP8T5oW7C+aV7xwK4mpvWZpndsk
 HbIgIjalOkoVLtitcGU+59HePzw0o1EJTq+LhTlJsgTS83d3UfQ3JnNDDdVXbDN6xKLHOnCJiCI
 52TNxW6Hpw7bYztgT/53XfnAuQZ179DCRUMDk+RHeL1tP1je8tVOwovFWlgMe8dhJvdqvuXYssv
 +NvLOvjo9T7JS1oOu0TBC5TzFeghYjCeUVHOWyoj3KNv97gHSiYA96O+Do/pEBNBWdDdICp49g3
 jb6HHxx6qGEkYFhIjFkF8fR4RmMv+e2Wv+quHf+TF9A+3Lnexy+PFAZjZvCmxaimbyjAxmgq30C
 1ovFfes0Zizz9qqmNmA==
X-Proofpoint-GUID: iumnbcOfNQRLVsRy6Jy5cyeNoMhZ2dFw
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6ff3eb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Jk1indnoN2tpaKD3vp0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: iumnbcOfNQRLVsRy6Jy5cyeNoMhZ2dFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030012



On 7/31/2026 10:20 PM, Konrad Dybcio wrote:
>>  		regmap_read(lpg->map, chan->base + LPG_SUBTYPE_REG, &chan->subtype);
>> +		if (data->channels[i].fm_capable) {
>> +			ret = regmap_read(lpg->map, chan->base + PWM_STATUS1_REG, &status);
>> +			if (ret < 0)
>> +				return ret;
>> +
>> +			chan->fm_capable = !!(status & PWM_FM_PRESENT);
> Can we read this register blindly by chance and drop the match data?

It would result unnecessary read for the PWM channels which don't
support frequency mode. The register read here is actually just for
differentiating the HW revisions for pm8350c, where only the V2 support
frequency mode. And the newer variants of pm8350c PWM4 channel could
support frequency mode by default.

Thanks
Fenglin
