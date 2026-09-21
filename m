Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB9F4349BB
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 11:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990016; cv=none; b=jyUyr/YgI+XC4T/tBk0egJRyywwvNRFB1QWVRPa11h+013JBCdLkNpZke9t6m7fAaXSGhS8h2DT+c6yxLGtdmvyLbZaStaaO5jK35UdwIwJLREYyVyKHQs0CdOr+n7CcqpViFnjweqWqqtNFkeB8rTYcVG64VDJJ4/RwTxjqTjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990016; c=relaxed/simple;
	bh=NyFEyYupsQqC9FmnuAyHOciufETAcPql7I1A4fZ++VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RD2MS40BiscXqbNuFskJyeNeDY5gEwbhJFv69AqZjKIw36H6BoqI0VMU4W9wh0tITgV11fb+h/PD4gkbxfjhHE36mxa1w0mF5SCI4bKCky67TD5krLgdVgCbQo0eJX756j15F+aUv/XdozHCkj1g3Dvri8zpLE9tMfX4g6SohAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPzYissF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KLHOiX6U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPzYissF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLHOiX6U"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAe7QB934527
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 11:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KkPM1XLiUoLDcoILla1/Ubfzxgq/Q7SN/cfaDwrB3vU=; b=hPzYissFujvFvApm
	LTP03tiCFFSqKHF5DMo/Z89gQ8u97eoJajej1x/qCIKrjh6a4t6xL1a+GHt7y77T
	yIxb9GgmgkKVyXheCd+ex11XzOutJf9ajnurggZFzCL5GLd2lGQMc7WXeU8D4YVq
	QD68YT9t+GxhE3RiPQTBg5YYesDefbcOJoV+/amkUi+hYjK/w+Z9rkS45/E23KRR
	U5KGw1OSqr853cyBqb24F769Yrf51AIHvtAD4GRVXUxSkrIlnHCFkQzDq/hIRnjN
	ihJ36tBIWgX6qmHDbVGOZ4byTWjZw4w8Tk+/SVnpXdufzx2qqN9K160tP/LXy4/i
	8hdk7g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bac48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 11:26:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90cd500ad0aso4785296d6.2
        for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 04:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789990013; x=1790594813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkPM1XLiUoLDcoILla1/Ubfzxgq/Q7SN/cfaDwrB3vU=;
        b=KLHOiX6UBloNzvebpjXur2UCpKy8nTrSXxYaViHmAwjlw45scH75TgLu2PhAocq0qw
         l2jzkbvPWSLvdzVM2TBhT4U/CvImHaNUPU5kaszc3MyQaBlPDmxKntTxhkasUdnr0RAY
         IF+08JizjiRXOHYx0LKFRgKFp/zLfSlHrhQK/tnq34foYwtbaZkw6VUe/Be8dGzlDeAA
         bNRMUSnQyeMhy4Xr+J3fwKHGtYB1JSmLj/3AhNiLxNXjpNqoqk9Jh5TM6fd9YEDLcJEq
         0EooBoMoivmt13tWggMxjUzdK+6j4GwWcF+UesiZx7r1aug5yjnS7kmEospgCUUEYrcY
         22hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990013; x=1790594813;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkPM1XLiUoLDcoILla1/Ubfzxgq/Q7SN/cfaDwrB3vU=;
        b=WTJjS5eLmqTU4yuZkC61u2x5JawN7cJymF8YO1iJ/FF5d9q1KDZ6oTiNtYBzf78CXc
         rmVTL3Xe/nslnmwBEknMmvIo0KNKUiON3PorVHZiqkaygBXRnvsuQmu/cGRxvU0x5DfO
         dfDmFLBHe03I57J+SvKjd8g70HOlfUWyW2iGn9Qe/As1ozsEEphbfZdSkCw8Pb7pwsyD
         bw6GOd0DWj+jZxQSkrJVPyZnAskVxLX+/9DWZvEMYsGB3PplnJg7DrTZ0yFc2XAOYurZ
         bUL0xdaG4+oxsIZkcrNdZJZ/9vYmlSaT1zDbn0/awryxDsy8fX+LA4Wsa7GKPbjMoHP/
         0rgg==
X-Forwarded-Encrypted: i=1; AKwUvBxu838Pn2hdcU7aR75U/pTf34RcL8h6t2xkQPjQ7EZnIe9UeNRz9LmgZkQScs4B05sZX4UTGuI9oza3@vger.kernel.org
X-Gm-Message-State: AFuF++kNsBU+bbBBcjSfueUW/pH8Q36idl8hWH0N6P6XMDNPjKcDur2l
	B3cuYzPD+fLwkwH0xtbN9Dq8HfI1hz0m7e9qkMs/2EaXJ/TUGHgymxLYcKgh7JyL0wvZJ4k4qyS
	1u6/b6O+Wa1ORZyGeaxyqhrheRHYYeGNDffAuaQjBs1rn6qlZW9aHQIR/r8eoYyOI
X-Gm-Gg: AYBFou3fGAnQRZq8w4vqcyr0R4qYLQJZRKTfgh8GHzmsD8IRZWye7vvzuwImAY9AK7O
	BSHyeVCLHp3ye5mY9eVdY+hotiCxBrxUkHi9YOnVAYjl99/6HNPgSLs+UEu8QLsAloOE8sucXPz
	GBZbCIpy0zr9VByn34Gpm2R9YK8awopejRpII/sA0I1sTegexofv5y/tf+HXY4i40Q7ZqK70kki
	TyMHDm/XuP7GZ/TA4uEtsWRl6gHUi9S7soflTyVwI01alsgVhirt1w1ayzCllYluvGzX4LSqyMv
	wDSp+AhCBnldBFoMedUVyYtbjxZsOHLYPffRR0S0j2yZdSP4NbbTZTFmp7R6W8WUiVeRhEIYICP
	wKhn5ElN3kdGBdI8bC7m09g==
X-Received: by 2002:a05:6214:4b0d:b0:90e:969d:6ea1 with SMTP id 6a1803df08f44-913fc8a2523mr1004306d6.1.1789990012668;
        Mon, 21 Sep 2026 04:26:52 -0700 (PDT)
X-Received: by 2002:a05:6214:4b0d:b0:90e:969d:6ea1 with SMTP id 6a1803df08f44-913fc8a2523mr1003796d6.1.1789990012168;
        Mon, 21 Sep 2026 04:26:52 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3523a063sm282442566b.8.2026.09.21.04.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:26:51 -0700 (PDT)
Message-ID: <fe437142-eb1e-49d3-ad3f-704066bea53b@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:26:46 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/10] arm64: dts: qcom: sm6125-xiaomi-ginkgo: enable
 display, backlight and touchscreen
To: kavakliyigitcan@gmail.com, Lee Jones <lee@kernel.org>,
        Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260911-ginkgo-submission-final-v1-0-0e68e63a18d4@gmail.com>
 <20260911-ginkgo-submission-final-v1-10-0e68e63a18d4@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-ginkgo-submission-final-v1-10-0e68e63a18d4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2NSBTYWx0ZWRfXz8LCfQHNE8xV
 F7QnpsKWavxliqLQ55EqErd8Wq3JiK6PgTMgkLkOeIkZaMmlp0Gv/mi79XkLFnL+woOB7AatDD8
 ZTLkPv4G9XZnQ+F9vufcIWUol++D0UO9ADd53TV4Fsl265no6Wf5H5U5NZyaY6AjEZ3QhmtsLX+
 u8Hz4MhqUgIRYoB9rshd7KMnuJsFrUURHUPrLjPjLGyjMss2FxrFvg/GO7AyT1emc9Y7ipDow4m
 bpx0lS+4iI0ArtyS1egMAkMKbBL2L3UeJIMzGQcif7lGz7xzadmr6j2cY1vPOhtkWzCEnmLZpoy
 cWSF22Q3pinJH/8DKvIwhy0rU2JB8ZzGCxYNqYs+TGrWJC/YIQWSqN9rypPoWVsqRppSyVEA3Sd
 b0MzXqsAArRGsjSbM50aqmAh0KGvCJyBNXBoySrzdfcuHUsan1eKL+qXfa9GRsTCNkzRePgqTil
 xy0DbN5GBjlzMYp1XmA==
X-Proofpoint-GUID: yG98aYLxsMbxMCo11_hnF7LVMfw5uCdi
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab1147d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=1o3L4E6L0XnED3g1xlMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: yG98aYLxsMbxMCo11_hnF7LVMfw5uCdi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2NSBTYWx0ZWRfX5+VvebfCYf/P
 otoScbQr6lUhuxazl6CMXIjMWTWmucE8jdDYoLTPoGNsjc2hmyF2kkYdu2OpfcikoICE5D/tjPC
 A1Pfs5Srj3hgqRKGwgV+2NQrsaBSdiY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210165

On 9/11/26 10:51 AM, YİĞİTCAN KAVAKLI via B4 Relay wrote:
> From: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> 
> Enable the display subsystem (MDSS/MDP/DSI0), Kinetic KTD3136 backlight,
> and Novatek NT36672A SPI touchscreen on the Xiaomi Redmi Note 8 (ginkgo).
> 
> Hardware nodes added:
> - Fixed LCDB regulators (lcdb_lab and lcdb_ibb at +/- 5.5V)
> - MDSS and DSI0 with Tianma 1080x2340 FHD+ video panel
> - I2C1 backlight node at 0x36 with PMI632 GPIO 6 hardware enable
> - SPI2 touchscreen node at CS0 with GPIO 88 interrupt and panel follower
>   reference
> - Touchscreen active pinctrl definition on GPIO 88
> 
> Signed-off-by: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> index 59042a5937535c4acda064fa0f865f4f5a52d01b..f4b9e2092a814e56cdc23218025cb4166dec110a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> @@ -26,11 +26,30 @@ / {
>  	chassis-type = "handset";
>  
>  	qcom,msm-id = <QCOM_ID_SM6125 0x10000>;
> +	qcom,board-id = <34 0>, <34 1>, <34 2>, <34 3>, <34 4>, <0 0>;

This should be a separate patch with the reasoning for the change

>  
>  	aliases {
>  		serial0 = &uart4;
>  	};
>  
> +	lcdb_lab: regulator-lcdb-lab {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lcdb_lab";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	lcdb_ibb: regulator-lcdb-ibb {
> +		compatible = "regulator-fixed";
> +		regulator-name = "lcdb_ibb";
> +		regulator-min-microvolt = <5500000>;
> +		regulator-max-microvolt = <5500000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

LAB/IBB and LCDB are separate hardware blocks, only LCDB is
present on PMI632. It provides a pair of pos/neg bias
voltages. Looks like downstream has a driver for controlling
this block.

Konrad
