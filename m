Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E125333F
	for <linux-leds@vger.kernel.org>; Tue,  8 Sep 2026 01:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830106; cv=none; b=ih6ju2wYlC6ud/ZI6FR862bwq43rLTt3s5t8Aexto6T2qqtBgU9Nupt2furArq5mSpBEXRouhEbS1jT26NffCxJ4p9s+/g3U+iYDItju/cnSY8v4DqLRGgZxAvwS6scAPqW82ge3Eqoe/7TJZXqzwJqHG041hiSSzjonrRv5j8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830106; c=relaxed/simple;
	bh=Df3c3pZAGbbibAIILTdBqxvWtZ4tbPD8pFTsseGh8OE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8KJiRhemBoNyXCpKD5l0L+MOdSCiozxNSscFZW5hCM26jIvQvNlLvllnvLjKCM0jVg6/mCBJlZA9z2o0Ci8TbwaFsXN8lOGzfU7r+OfK3NMKI5HaUFSSpIEpNp5jVoGf+JIG7CGyW6orCsWs9uxnQxUXdNoDnWyf9usGwWOZBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFFLl59q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Epv5FJbI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gFFLl59q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Epv5FJbI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687NlKEM637472
	for <linux-leds@vger.kernel.org>; Tue, 8 Sep 2026 01:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=; b=gFFLl59qdtXv1PBi
	LuXDnupIYXgbSW/PMEzRAbdnlkMK5xvBNgo0sS2x/4wbARDP3tPtKO3GWT+tOZLZ
	TV0zg52HstfOcskNBd4B8M028h8nbQlyw6dzvHuW9aNQWph5a1gazSPcZpuj758B
	XTiYfWn101zcuYS98c0cQ3atJ5OC4a4et0z5Nz4KXJ/MrDw08Te/8qRCAx7IQrB6
	H1Upz7QIa14Mjwm/hSuilIY9BNc5x4hjCOJTBsnNAko9IC1r/tiN7AouA2wZYJ1l
	uNrH4Mfz1gT9aM+n+JBY40XydlPuNFvZTPNxXpxdLEnfYMtXh5F4HLuAfRqse2g6
	AFauSQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw2312u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Tue, 08 Sep 2026 01:15:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8535cdc2433so2311329b3a.0
        for <linux-leds@vger.kernel.org>; Mon, 07 Sep 2026 18:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788830103; x=1789434903; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=;
        b=Epv5FJbIC7tV+qyp1wiubYPLqdnr6kKbyVsiHoQ9koZF8upWaW0oZRI87Cb+QtHuzR
         8T/Ilv1GxSEArlI6+/Z07w81MOMU3lv4Yv5ikBb0CxDXxKkVHxYp5k3pAccqfnCDNL/L
         PBx7NCzSb14sGS4eloByZ3jfSOLdkTHNqyfdB/ZECA47pOeA7JCxZeB1oMw4egY0JskY
         RsRxAanoSIkTmsShxP547UAYHctdkg8H96ruowebqPrMiciQpLOXHIW0vLyjiXfNebyZ
         3wHTkqAJx2mmoYp/Pid8zKJV6i+RIM+yTZTw/UsBpPoOPOc2U0E8xIlVAWG3ZxuCCN+g
         lvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830103; x=1789434903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEcHADNuKuYnH9fw11Zl/jFFKnuDKN2LRIq+47mzOBA=;
        b=PBXrPZ/TNdDSTcCUeXcnoe7M9NYl/FpQCtigLP+D+yvKILAsSZEbj02DAzd9mlKDfC
         3ryMkq8IY4uKeF5HnIttw0zNuXdUXcTWtpBNFPCPHxdA2ApC6zlfpi0jkzhe91czMHp2
         x4Cjh7D++c7QTyGWX16YvXGB7EU0ewpC9N9qeWfrQ8LZpiNLqLz9pTH2eF8CzbfOU34c
         qNjFWOuelNZ18kuaDsVdoDQaerETtGBq74SnOllSEALN+d0lCDmIK9IUxIwdyK7pkj7O
         NksFiemDm3xHlV9O5tf16dXX9kUun9YR0alUKIVaeQeWODauenj4C48CQsU+aXip0bDb
         qfNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4oK4pt+BXP1pOyYV4fwjQwQVTGfo//qu4hwNw/4SQ8r775oTSqoAxWKloEnBOzLpgkuPl4XDPFYSC@vger.kernel.org
X-Gm-Message-State: AFuF++kP6orxNxNeq6EEPuK1sJ0rY0WrooTdKExiuONqIKwSFvSWOXky
	9dEaST9CMpzerJ5FfkX0o2nekYBwdQ2mBCydrOBGxmhWNzT8NA8eov5EcqjWbnLygSs2Ck9doJh
	zJL+f7tpvWu5nsSvVEAFaVqBfBkBn5g3If3T8H3Ne7uNjZ00PWTZxtGiuoN4ZR3iw
X-Gm-Gg: AYBFou0yL6zZzrPjl7qF7Fqw/mgQ4vLm7FT8zlauWWEegyh+GDJCE8qmWPMOKVrzRk8
	e2TBUqvKaVV94J2M+K30EKmYLsTxa62G5csNhRVtlHmnq3eA3IxmbfbXq83TPmoWvnhr+WjzcbC
	f2Mvbw9mXZmT05Wiwbwy+c1zDck7BBzPjwM8Dzs63XJ3RM7Sojoxe+KQ0zHW0J0JoVmbtAgJ3qk
	94MdN5uD4SyzFTk8YlPJozkj36kCauQ5JodsoNC3+eyGRd6sFm5OGDhhIEqlWjqFpEg2GB6+1Zy
	UggvpVeVvkUO+8So/STYvLvUXlXvjSTJY1FhJZ/4tZqudT7kAZ2Waoc4B/6QmR4Js8hlAApgzYO
	d4QVLYJUM9oO3+3SqDex0XaWoCrv1Fc+v3m5TiK2Tj8TAfFXfWVtDAby0OsHF9FJhvIEM
X-Received: by 2002:a05:6a00:1d06:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-866980de33amr3740605b3a.1.1788830103518;
        Mon, 07 Sep 2026 18:15:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d06:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-866980de33amr3740563b3a.1.1788830102926;
        Mon, 07 Sep 2026 18:15:02 -0700 (PDT)
Received: from [10.133.33.11] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615204904fsm4838475b3a.19.2026.09.07.18.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 18:15:02 -0700 (PDT)
Message-ID: <ec3caf91-ac62-4d2b-8a70-f369a0c64e62@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:14:55 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] leds: rgb: leds-qcom-lpg: Fix LED color balancing in
 HW pattern mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com>
 <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <de251a59-1ace-4b9c-beb2-99fe6f3cb842@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JND5eQdlkQT3zwurDDY9Q5EclzKWLrQx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMCBTYWx0ZWRfX8qtTyrNt5KNk
 G8lU7meOHmzxZVGXvAzR8gYErI4UKUU3X/n01faQ04lgwoIk2cDmDZ2+BaE7hPiA8pMUhbDnGOV
 vUyKSQU7sqGY8MBnUDqOzMdcyCPUrAs=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9f6198 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=MF1PGFG3WILMoXgy2akA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMCBTYWx0ZWRfX4mxUAFax+VMZ
 pD5oVRqRJ7K/KPJc+cY8GlF0byb/BPoTKWUqtKOA1J0KZulIKKTGrez08KybbVwaGoN/iAZXFOZ
 e2CwZuDDXTCxY4aw4nbJsRr4R7AoCaUJq14NOo9rAsM5eM7xtA6fa3xupxLaqGxJ7OuFUgsg4ip
 XtyAWNmC1odpgYWZuAgW47lT7dDXM1iuJUkEDU8rRW4OVv+A8bZ4qR7Dda1cX7wpL8k/uhfQ2vU
 5VTLi4F6TorIUgYEOlWB4DyNpd5uACT+y6S5TMNKZ2EqiVior6ujnawWk8n4dm7vzmQrB6t8YPn
 DkjemGzxoDDDYsLXuIalB38B8zXN/rqDcDkwaKXnJmQ3XEpQjcJ5M39gdUylbVeXnk4OgWdYnE/
 nNsIoda0PqBC4StqhiTYZBsdk2GEIZtsqpJkV+bHS3F7mW97rCRhvGfpjGfe+CVonoATlhXhJY8
 X0cXpmeGCiI/4Cn2pyw==
X-Proofpoint-GUID: JND5eQdlkQT3zwurDDY9Q5EclzKWLrQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_07,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080010



On 9/3/2026 7:27 PM, Konrad Dybcio wrote:
> On 7/17/26 6:41 AM, Fenglin Wu wrote:
>> Currently, when the LED is configured as a RGB LED or a multi-color
>> LED device, the same pattern is programmed for all LED channels
>> regardless of the sub-led intensities when triggered by HW pattern.
>> It results that the LED device is always working in a white-balanced
>> mode regardless of the intensity settings.
>>
>> To fix this, scale the pattern data according to the sub-led intensity
>> and program the HW pattern separately for each LPG channel.
>>
>> Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
>> Fixes: 6ab1f766a80a ("leds: rgb: leds-qcom-lpg: Add support for PPG through single SDAM")
>> Fixes: 5e9ff626861a ("leds: rgb: leds-qcom-lpg: Include support for PPG with dedicated LUT SDAM")
>> Assisted-by: Claude:claude-4-6-sonnet
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
> 
> GPT came up with the following fixes/suggestions:
> 
> 1] This one makes sense at a glance:
> 
>     leds: rgb: leds-qcom-lpg: Skip LUT allocation for off colors
>     
>     Multicolor hardware pattern setup programs a separate LUT range for every
>     component. A component with zero calculated brightness is disabled before
>     the pattern is applied, so its all-zero range is never used.
>     
>     Skip allocating it to preserve the shared LUT capacity.
>     
>     Fixes: 2882fa0dc1cf ("leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode")
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 24b1f570f524..e32388a16537 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1219,6 +1219,13 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>                 chan = led->channels[i];
>                 scale = mc->subled_info[i].brightness;
>  
> +               /* An off component neither needs nor uses a LUT range. */
> +               if (!scale) {
> +                       chan->pattern_lo_idx = 0;
> +                       chan->pattern_hi_idx = 0;
> +                       continue;
> +               }
> +

Thanks. I can add this one even though it is not related with function
correctness; it does help save the LUT with a simple check on the
sub-LED brightness. The sub-LED would just be turned off by gating the
current sink so the setting of pulse generator doesn't matter in such case.

>                 for (j = 0; j < pattern.len; j++) {
>                         scaled[j].brightness = DIV_ROUND_CLOSEST(
>                                 (u32)prep_data[j].brightness * scale, LED_FULL);
> 
> 
> 2] This one.. I'm not convinced..
> 
>     leds: rgb: leds-qcom-lpg: Reuse LUT patterns for equal colors
>     
>     Multicolor hardware patterns with equal nonzero component brightnesses
>     produce identical LUT data. Reuse their LUT range instead of allocating
>     and programming duplicate data.
>     
>     Free each shared range once when clearing a pattern or unwinding a failed
>     allocation.
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index e32388a16537..1c4d550c1ed0 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1175,6 +1175,34 @@ static int lpg_pattern_single_set(struct led_classdev *cdev,
>  	return 0;
>  }
>  
> +static void lpg_pattern_free(struct lpg_led *led, unsigned int count)
> +{
> +	struct lpg_channel *chan;
> +	unsigned int i, j;
> +
> +	for (i = 0; i < count; i++) {
> +		chan = led->channels[i];
> +		if (chan->pattern_lo_idx == chan->pattern_hi_idx)
> +			continue;
> +
> +		for (j = 0; j < i; j++) {
> +			if (chan->pattern_lo_idx == led->channels[j]->pattern_lo_idx &&
> +			    chan->pattern_hi_idx == led->channels[j]->pattern_hi_idx)
> +				break;
> +		}
> +
> +		if (j == i)
> +			lpg_lut_free(chan->lpg, chan->pattern_lo_idx,
> +				     chan->pattern_hi_idx);
> +	}
> +
> +	for (i = 0; i < count; i++) {
> +		chan = led->channels[i];
> +		chan->pattern_lo_idx = 0;
> +		chan->pattern_hi_idx = 0;
> +	}
> +}
> +
>  static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			      struct led_pattern *led_pattern, u32 len,
>  			      int repeat)
> @@ -1226,6 +1254,17 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			continue;
>  		}
>  
> +		for (j = 0; j < i; j++) {
> +			if (scale == mc->subled_info[j].brightness) {
> +				chan->pattern_lo_idx = led->channels[j]->pattern_lo_idx;
> +				chan->pattern_hi_idx = led->channels[j]->pattern_hi_idx;
> +				break;
> +			}
> +		}
This is based on a wrong assumption that all sub-LEDs are using the same
pattern, so this is not correct.
> +
> +		if (j != i)
> +			continue;
> +
>  		for (j = 0; j < pattern.len; j++) {
>  			scaled[j].brightness = DIV_ROUND_CLOSEST(
>  				(u32)prep_data[j].brightness * scale, LED_FULL);
> @@ -1238,14 +1277,7 @@ static int lpg_pattern_mc_set(struct led_classdev *cdev,
>  			ret = lpg_lut_store_sdam(lpg, scaled, pattern.len, &lo_idx, &hi_idx);
>  
>  		if (ret < 0) {
> -			/* Free LUT slots already allocated for previous channels */
> -			while (i-- > 0) {
> -				chan = led->channels[i];
> -				lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
> -				chan->pattern_lo_idx = 0;
> -				chan->pattern_hi_idx = 0;
> -			}
> -
> +			lpg_pattern_free(led, i);
>  			return ret;
>  		}
>  
> @@ -1271,13 +1303,12 @@ static int lpg_pattern_clear(struct lpg_led *led)
>  
>  	mutex_lock(&lpg->lock);
>  
> +	lpg_pattern_free(led, led->num_channels);
> +
>  	for (i = 0; i < led->num_channels; i++) {
>  		chan = led->channels[i];
> -		lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
>  		lpg_sdam_configure_triggers(chan, 0);
>  		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
> -		chan->pattern_lo_idx = 0;
> -		chan->pattern_hi_idx = 0;
>  	}
>  
>  	mutex_unlock(&lpg->lock);

