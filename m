Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56A446EC95
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392562; cv=none; b=NyrQPUYRNRXJZMzA2Malz6rdYXGFnM273LizSLa/pXyH4OybAjgmJq2XmiBZvTeamLq+dR6AQ+xH0oP1foUKSAM/HjOtUaSYEWFMQjXrn34+mFOR3c1Oym0vOe9t92l+NqeNtLCHq2qnNOIFzIvYYFUaZHJvyoLL36ie27Biu4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392562; c=relaxed/simple;
	bh=qg/RBhESd51ajr8WDi37wRKO0z5KsP/UjDdEMv+gNuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5ckyMNDFjNSX00UOBsiYeQsHawmCM/6DUw3DtoIrNZ0pjd1Qee8+rYScDop/+v1L32uqPGZy0JP3mTzAk/8TlQF0ivYqAuhJFLYWf0LBUnL7d34KXj1mi87uZJlGPQr8XaUNM6RsHaXGZlb7ohlAwbu2kbQ9DDsqmX3HnJk4b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdYADE78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1aLWJWt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdYADE78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1aLWJWt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0dRa1200591
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=; b=CdYADE78z/zH8CyG
	FRA32jzDGmlkiHgOcX90VEsNibqKg/uouUN9JLiWmCTe8cYgWKsizhKfQukbbUsq
	LLZx+/1Qi+Dh//KFH6kJwoOOFdS1heOaaKFHktKpOLdNugLgGTIksinRlhfJ6fM+
	m6KAKvmQsb8NadTRgzZ7Okrwi1LvB/bSttjNBdMc/jJM/oscOCjSc7ndzJBhz76K
	uBB0+EGKpZ8GUJ6lg/OnGguFMWCpNfHLMSWOq4UgNBS8kIAPWhCTRgAzDargEb0/
	Ly51XRROf1cLP+1/UDZQukfmlDs3dW5Q1JUlkAYYLyiQnsst1o1h/FFfKQKudN1Z
	4+66BQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevs1ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 13:29:19 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-79014f0b44cso3024952137.3
        for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789392558; x=1789997358; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=;
        b=d1aLWJWt55cLMxt8PvstfPgip3MC57q8Eme6zEjGGPNjYwwxpk0DGAKlF/95HBx5zi
         lTTP542hXhv8VjWH0a7OWA2732wcArVRB4C+VDeUJffDUDlCIfROFTL7RYVR3sjPGNNZ
         B5CoHWfTO89igDxoU6UwhuIuORf9kQUTdiNCfLqtkykInCVD0l5ZegJF89WF5/WysY/t
         6bwTQRujgfnuyZKMEyg44PFWlRiKBavG1nq5Xn5O66vVyl3b/8jeZirSu+cHzp14Jdfm
         x1cBnrQkgn6E8p+LOkmUe+sXVJd8R+oCqGWeY7Gl4z5t83wR5YblbwwPSE0UBMqzuYn5
         EY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392558; x=1789997358;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2oe9WYaH4TAkTlCFmhnHizk5lGknQxaw0iqFnj0J8k=;
        b=XKAbVjy1S4Vu+rv48wEP4qvzg35DIgLlCTuua/WSKIUgjA1Ixj66JQmI8AU/qyWZPN
         smBJDImW1IVhOAAISIjt4cN0MxZMmmWjNAIWe5awtYi1V7/kYWGLRFbckeNE5X9Q6dC7
         PTWXt9eRbF6ookGnygAOJmrbT9gJcrZVsVZCP4lFgyd52M0E7qQdNcHOnIj1RDh6r2nI
         5HDkvfEaiZ/EKmKwWJtUVrM7HsFb/FracI6PsFKuzS0wmumNAKZn/CgLWN2Lj5RteYMD
         lDEY+EWoiFE5cdqNJxcw4ojc03we5s9TYPYyVK/+0WhT/o/VCQVHWIKny90itndwcsqf
         uU5g==
X-Forwarded-Encrypted: i=1; AKwUvBxLyWSOfRKx6T2+Mo0ZQvDeCPyuxWs8xu+WUdvZ8d8zB9gyF0RsxbTIS3N2l4gaut2sqvM+yzG5p5UE@vger.kernel.org
X-Gm-Message-State: AFuF++kYp9xKWm+7z2HZiMVNgxGudh5VqjMjUfv0tZMiYT/CHShNQwpc
	aOsPFOp3k+MOmzOHqEsxr9ac9b8kwIqqLCm2URZhs+akMBcfqfKesPxn8j6v8nhRof284uYuje6
	EPich0lr0qgBKBzhxkOxYEmn/+uFPfuls11gIwsqBUbnFP7ydL5gJKgoMWLNrtRJ2
X-Gm-Gg: AYBFou1haDU5dxkPAnj1xMycWF3kAN4q/y76luefxJXy4vOeGBC7tGB9d6VoOHstB3r
	qxiaGBX6Zs775eVPcpWTmSKeBDf9DeZqLzjm1RvqENdDg61VOXnH3JJx/bW6nb24ACUfVd0ouxo
	XU7civr3jnyglyKCUt0FCkTo/UhKMqaeHxzi/LyCXcQCYJhNJiZTFWjBk9r7emHqu13qaXqUOGB
	mQ6S7ibtIvzg0vigepwHDUXAN9XjupMqJYsxfwsdfTjPk7vI5r0A4qsk0dWCbaauXW5C39CLSu0
	1MV2ITq2TtIN22nx1HEUY3bdUTcKmtN/VTGITRflOuxjEaMtuBVj5dEJk5qOG8YZmksjFtNGZqk
	vB+fB+rTsnfTsaflfsZ/yXRe1dcjcpoH/Kk7rgRb4xoE1pkvAqpQpKEyx3TWPomS0Jni2Y9piO8
	IMZCjmvi8HRR2i
X-Received: by 2002:a05:6102:512c:b0:778:f972:32eb with SMTP id ada2fe7eead31-79b5c515679mr1850380137.12.1789392558295;
        Mon, 14 Sep 2026 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:6102:512c:b0:778:f972:32eb with SMTP id ada2fe7eead31-79b5c515679mr1850285137.12.1789392557779;
        Mon, 14 Sep 2026 06:29:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3144a4esm26968051fa.0.2026.09.14.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:29:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:29:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: kavakliyigitcan@gmail.com
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
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
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 09/10] drm/msm/dsi: separate host link enable from
 video stream enable
Message-ID: <2wj3y5o5edya4uifambdpzh2jkpo7xpxtjgrmtvdxk3z76uty6@tuoe2vkh7p6u>
References: <20260911-ginkgo-submission-final-v1-0-0e68e63a18d4@gmail.com>
 <20260911-ginkgo-submission-final-v1-9-0e68e63a18d4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-ginkgo-submission-final-v1-9-0e68e63a18d4@gmail.com>
X-Proofpoint-ORIG-GUID: b04NmBvCqIiIFN_grRPqDU8fKdE1Lwkj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5MyBTYWx0ZWRfXy865knZFG5oB
 hFevY7E8vQ7UW4GD8xt+OKAx3QQrzr2a7V2TM4g+b0CQ1jX9Uzx0jfX92BhWrBpW3WrcvvRI3bE
 hT0f7jE0bGNahlXDNoxucnSPywLM/c0=
X-Proofpoint-GUID: b04NmBvCqIiIFN_grRPqDU8fKdE1Lwkj
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7f6af cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=4I8C5fWqZRg8XWo767wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5MyBTYWx0ZWRfX9dhQYZRrONmL
 Lg/Zc1XzbokSo5Uhpt1qj/Hu7MFIY6BFWrsXHJ/14EfrYbTd9TJyczrBQLERonQHiIdyZJgeFR+
 fRxN3167icY/bkRjpM/CyUGP5u8M7DAHNS5i0965CwkC14QNxmwmvw9t3RWDO/dT0TnYmN90VxH
 E6lxaS571PagqppR2uSd15PDDCffh2axe3kNR6o4r1XB9yAOpDZVeQ1xzuUntIJUYw0uq4T8ZeH
 UyE9+71MioSfY0lcKevqmhZxQ0uRys1kGSh8Tr0+szhrwZCeEfFBgMInK/ZBAaZwjDfer9/9hjm
 lQU1+kqhMsCGEAiJandJ9EsP40THNwL6R07HatGvtOvUMeHBxpHNx++Afv+Nl2jINUXVGsxmzHc
 rxmMSGqXlhUBjMOn1YnBJ6rH7ub8izWSQp7TWEAJPln5Cw+20XkrsA+p+9oqDYw7pucBQAJNUZy
 gohTuRbAejIN13qQY2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140193

On Fri, Sep 11, 2026 at 11:51:06AM +0300, YİĞİTCAN KAVAKLI via B4 Relay wrote:
> From: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> 
> In video mode DSI displays, enabling the host previously engaged the
> hardware video engine immediately during atomic_pre_enable. When panel
> prepare routines transmit initial DCS sleep-out and setup commands,
> concurrent active video transmission causes DMA timeouts (-110).
> 
> Keep the DSI host in command mode during atomic_pre_enable to permit
> clean panel preparation, and start video streaming in atomic_enable
> after the panel has completed initialization.

I've not seen this kind of issue with the DSI mode panels. Do you have a
more exact issue description or a downstream reference? Is it the case
that the bootloader has configured the DSI host for the command mode
transfers and you are reconfiguring it for the video mode?

> 
> Signed-off-by: YİĞİTCAN KAVAKLI <kavakliyigitcan@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 23 ++++++++++++-----------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 20 ++++++++++++++++++++
>  3 files changed, 33 insertions(+), 11 deletions(-)

> 
> +	/* Keep DSI host in command mode (VID_MODE_EN = 0) during panel init
> +	 * to allow clean DCS communication without premature video engine startup.
>  	 */
> +	dsi_op_mode_config(msm_host, false, true);

This sounds plausible, but I'd like to check it out.

> +
>  	msm_host->enabled = true;
>  	return 0;
>  }
>  

-- 
With best wishes
Dmitry
