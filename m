Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792476863;
	b=27pj2INdw6dAPFQL8S7OUS2uQ7Rd4fEStzb1C3OrczvjxGZil34hrkxSK7KGAQ/eSeyA
	 KEzUtSbc9kAJmhFJ/mvKF3oj/mts2s36Sa4dlAGz+b4fxaYyS9BwvKAJh3bLnYgq2UvWq
	 msuni5W5Pz4D/F4F4FRpy+En3+fLE4lggd/H5jKtNnZHi6Y13DI5f3kmT6sIHHI6/T6g9
	 mbCDBDelxfntSx97uj7OqUt7A4gof8S/hxmujn5VY4DklI75/DO0zXxYOr/kBnJJzLufr
	 a3h1od1bz18LZ9+vMgcx468g/HxeQ4gZa56MWVxtXpugpw9Z7s839AuVWzgDdnYaHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792476863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
	b=UytxTKHMQF99DrCiysNfnZqO8posEs7mXkdjJAdqsmD9Rrge9b2z0Ui/k2pMftsXBHyT
	 RF8CmG/3hk5qm92HNgg3QcLfFxaAWbEkXu38XPaar136OLznzNtpq23LPJ+DwFZnWVPuR
	 V0523/kfI+Z2e4C9jnRLXqcuMw4FZ7HL1Vwt6MbTU05izAbCCDzKSfsfHdz7+r0P7+T1g
	 nhF6Wr2RtQIi9DCtDjlowY3HXpJ4cPCeyJkrVp2E7MRmngsCNnbL0vv5MeEqNOH+eTGey
	 AeAQMOg7wzh23qiri8wzYjH3SXyuOdQDnytMBmyOsu8CBHfXk4rz7Y1hFoyb4h/tqNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfKSDihK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOiV4n2e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23448606A31B
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 06:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23448606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfKSDihK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HOiV4n2e
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tTMF4178291
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 06:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=; b=ZfKSDihKFacIqpqS
	d2+KviIIWhZ2wrHxLy5ztQw7gBdTjQXQXvMIA9yBUS/2k9EgKzGeNcRGHTOUeaAV
	IgJM5M84kimu5wAu2mN/VVJEyXSErm8ksu/ZNtJKioVKCaJ6CJPDFF1SnLNZtZ8b
	s6Re+s5FmExW6AqeoacLL19yDIMr3KBi3KTLNcH98zPJyj39tBn6YJO5am/lVAgA
	e4SEQYzbMmIbpYtJt6Dh/N7oZ8aclFn7mtXjjj5ll9L7PAvGPk2iD7KW62Y+fsbh
	/YBm8H8YObw3Z/0G0zHhYJQoIvGfKEJ0bqizP1ASXqty5ouvbBuUEreZMRm4kqqt
	Dlx3kA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n13e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 06:14:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so625093385a.1
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792476861; x=1793081661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
        b=HOiV4n2exjuLkrjSPhWReDJKCI581JGKeqSEzq2JzamYrDDYUFRn587f+3OpvGEcYL
         VMVqCP9D1gRocl/qF36evYClOrtj8MBNHdR7BpTCQpuHXbpbNL72FjaoNskhSRPYSSbU
         vjlzDlDzYBVoz96r/gCRdhr2/maCjKBlLkCC7aldsFZVDFDfj71/AsTidDRZ/m8mTZ64
         5GjQR1pYwzQxQacp8VtaIV4KZ6fc6cM37IKM/IcL4yaZdBUTLG77WubJle/ziFA0/nyO
         mCAYSkVBXxzl7EyGp08Ac5AhCPQ0KRZK4KZXarXjxdt8IAngUSOXjVgeweysdWQjwwNH
         QBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792476861; x=1793081661;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hpn5/imhVLkyJfVtXA9ZyfLeHTm0l9wahpNmwyZ1iuY=;
        b=1AfCjbAr/t7I7g9+2vwHLPMC6XbgxGKLwYgw3/aXE/0uyedufa/EejAI8SN9Jm0BcL
         uDkmkkDBtoupeymWF7aVDxUVkifrO+BiezVOMCigFmWndYXCfA0KAWrB+PQp/3C/B7OK
         UX2a2rGGluJY15Yu89WUUNpvv2F6aby5+kQLMT+RUtEI/PZIqHGN+BY54BOJdJpg787X
         KkJtgbwuM+2WDfqChIdvgPSvGC4ckdPfsHi2L9vVzOJHr7v0ik6vWz0CRKdPJf7BzA9c
         I/ebyuqon0i5t3cUs9/qt1AGA+159BPZK1y/wR7+UjhHWyZ+ec39xV5IF2ZvGuIjkAhE
         31oA==
X-Forwarded-Encrypted: i=1; AKwUvByZZWtLFI4Szb4LS3wnWj9xE2w4AHhva3e4ay02KHIvHDR0wUKA4kcrMa0zJHAvGTZP93mgvzQ4ZBN9@vger.kernel.org
X-Gm-Message-State: AFq9FYKdzHNQZ8Bxnz8bWufF4nn5RdqbC6Q3DVdpJjSCMFywbfYjEZaL
	yko1rlwooxgqUxREY3HOcvsCoKCkxvtpkoyff0/9nd3DyFkbnTmitO0yFGayAMlfQit39XvGfnR
	dmdsEWM4PJTfEVg/aQfvPYvdNLPrD+UY0fhWRDCAKZDrpRt8lkjUM3qN0iemkdW0I
X-Gm-Gg: AYBFou3IEl6pFlxLUv1Yeu90yoNZTVqm3tQAoOh4L7WYrF0TwXR+Qct3eMq3kFR2SSe
	3EmiDMC0/bl0UdqGTWhpZsW9RbY5qkoBtXvPHYr9g5YoFWRuaVwjVSkdMwt0FvhGVD4Q6QmXqe2
	Am+PAEYzBVJ7lSbpH2QxO2FvZ0PLW+pd4n8PBnnylnW1q1AdtyR/kDOjKBWd2KeD5Yp+fMeQLqI
	D+1WWQ2MzVA7EUH3RCsPXSu7wcqoxfnz6wk/oKewlSEL09cTxx2c7IWXYAGOcJFzN+cM4K9Ljt2
	JdXDaYG+VgdWU718Qca1ZzSPArk2bkXHUiIbD6px2CsX7Ioi1tjpUxMxzvzksxvy8ZOjDc8wcxs
	mcpRBqomRvM+2j2w1Z83ucH1p9w==
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1621876285a.83.1792476861455;
        Mon, 19 Oct 2026 23:14:21 -0700 (PDT)
X-Received: by 2002:a05:620a:3715:b0:93e:c12c:9dd3 with SMTP id af79cd13be357-93f29e0afd2mr1621873885a.83.1792476860971;
        Mon, 19 Oct 2026 23:14:20 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm276350095e9.5.2026.10.19.23.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 23:14:20 -0700 (PDT)
Message-ID: <cdb55ed3-b19f-48c8-8803-dfa32000dc1b@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 07:14:17 +0100
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] leds: rgb: qcom-lpg: add qcom,pmk8850-pwm compatible
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-3-srinivas.kandagatla@oss.qualcomm.com>
 <179213351749.2581328.3338477962958404050@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <179213351749.2581328.3338477962958404050@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: e6jSIgKLeQyjcBhpWvhqrsTdGBQ62pTA
X-Proofpoint-ORIG-GUID: e6jSIgKLeQyjcBhpWvhqrsTdGBQ62pTA
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad706be cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VAR32ooWsMDrCBR8X2sA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX1WL3enL3/m+q
 uMT+FwZeET17cXW/PG+7s4zyV6qBWaxjykzEWFqtY0Qs1m0KRQC2QCGA2stJOCVATi9CYXxcFjx
 GO2Ees7LTUi5oglkUqVA3p9hgJdB8Sodg+kVvi1pY3Krmxv5gMNUD0G6LYGZhYWNvRPKwElT7pw
 AiIoyRjR/7DLVrqeVkebBqkTPwAHzKDoRcVAD4PxBFfAySzhMEXgczu+ZskSjWs+WhfS9dtwXNf
 hZErhyGhCc4yMZZ8xkJIIXmUhGDm2uLzQjye2iRSX/1RVPHSOQ2e5byeVtcndV3GVBxtP2tpf13
 5p1ZEm13Jg6NJuGI34VXWwvoeU5eERHm5TmKdJNRfz1mybUr20edzA1Jl0Tea1zaY+x8GI6hvzD
 Mfj0VYZMGUFifgmI4mdup/z4Ks1vhAe6ofgg0TrQv/DHN1dxNP5QKmN/UVBfDdJbfaIijpNfZzf
 BCWNooqaH7rtNM6P0Sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyNCBTYWx0ZWRfX2d4763sQeh6Q
 tcDaJNOhhycgZ1K3GIWp0Me2baKhdV7HQAjjzrCp9lCuIMmW+RWhzbVgs94T80IccM92vYY4ZHh
 NhAatnr6DhiA4KOLVrgOrHmloZ2eXeg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200024

On 10/19/26 3:34 PM, Lee Jones wrote:
> --- checkpatch.pl (1 issue) ---
> Line 23: WARNING: DT compatible string "qcom,pmk8850-pwm" appears un-documented -- check ./Documentation/devicetree/bindings/
this is in patch 1/4.
> ----------------------------------
> 
> On Thu, 15 Oct 2026, Srinivas Kandagatla wrote:
> 
>> The PMK8850 sleep-clock PMIC on Snapdragon X2 Elite (Mahua) exposes
>> the same two-channel LPG/PWM block as PMK8550 at 0xe800/0xe900, so
>> reuse pmk8550_pwm_data.
>>
>> Used on the Lenovo ThinkPad T14s Gen 7 to drive the eDP backlight
>> (EDP_BL/PWMR_BV_PS).
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  drivers/leds/rgb/leds-qcom-lpg.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
>> index 24ffe079f221..485fa2a7a848 100644
>> --- a/drivers/leds/rgb/leds-qcom-lpg.c
>> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
>> @@ -1837,6 +1837,7 @@ static const struct of_device_id lpg_of_table[] = {
>>  	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
>>  	{ .compatible = "qcom,pmc8180c-lpg", .data = &pm8150l_lpg_data },
>>  	{ .compatible = "qcom,pmk8550-pwm", .data = &pmk8550_pwm_data },
>> +	{ .compatible = "qcom,pmk8850-pwm", .data = &pmk8550_pwm_data },
> If PMK8850 is completely compatible with PMK8550, why are we adding a
> new match entry here instead of using 'qcom,pmk8550-pwm' as a fallback
> compatible?
Yep, will update dts in v2 and drop this patch.

--srini


> 

