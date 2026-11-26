Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700217;
	b=GEkRbBL64yQnf7iFkowDKdx5hWJjNeJkxPPCT93fIPOkrNULQwwqM0b2gTbi+y7U+YFg
	 +FOkBYI00zJryCqADXZ/2sDU0J/NgMal1zSnsK0T9aA3ABDQTnax0QuQP6hHCam59934P
	 6qNsloOUAgZwZxrvD32TIpZcvpTy/ZFO51qi22ac7WFRV0LfzxW8+Pezg5bTQi9jlWZmG
	 KtjdVuPO4JNZWh5sOMZpoftMZXrPNknXZydmcknDTGrHqCLKH2ibUJ6lctatjvfsu52Zi
	 s+D8DE+9ekmscbl1DgZ5zbPC8c+xLthlQwONt0vCyOHyFcd6Qna76a1ecy6uPnM5EDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=;
	b=Ue7Zb/cjlic/ni2qlhsduydFamyYlLeNL6RRIxaRVft/VzXA/XfWiZqfMq5WI+PAMoKp
	 HPEolEJ6R5RslbZrXrq1h7RIwD0fVADwNuDf89Y73sWulBrTEH5YjkEW96LyCG1uQ7gWj
	 XJ3V6LJE/7V8a0QBDMx2YY3icM4Bux9E/N4g+WYksO13S1OoK71yFfJCybbQHLUPIYmdX
	 7jcfxZsmzts11i99dFMi/oj7kCeBlmw3ju+GqUD7Fuof//M+oxZ83wP576vx3GvQwSYzw
	 wgrd8CSPATSDK/M9EFr/bBXmE0WA4oTYND2VOpg22EEmdWVwbKI6Bn8/1f57n+uv1bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDYaZlkL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eKr/vnGW";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE75606A31E
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 13:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eDYaZlkL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKr/vnGW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVc3W2758861
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 13:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=; b=eDYaZlkLt+GKawtZ
	B4g2+os+1cxJ6C/BGXQMp3Lj1Z5E0Oj0Fryp30LyK46OchlmxqXj8/ryXHGGYbEV
	DHyudmJqpshqNnuwIxjk1fYUdJfZnW4nqMQEmjHAALWUv84s5DprEJKtqGWVfq2H
	SmBNT30gDXRMggI8Ppfdg8Wm8Wybx/B/sJHdlC4Y/5brrKG3VOULjD1jFzr8yuXv
	hlXk//8c0zVKRzAx6aQXPvbHpJ/GZI6qc4/58zF0eI+WQfoTDQFgisBMn0nyENjg
	3gKiuXhPFm5UFiVUs11mIwkR+hgzYLgNPVixBvQS8WCMPfyaPy8OE26JCThR4TD+
	GbF7kA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahvkuk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 13:36:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so795276985a.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795700216; x=1796305016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=;
        b=eKr/vnGWqn/kH6s6pjWjj2hRP0q8BrZbBjxYKu0UyQQChKg51kK2BWH8ta/IN5ySTJ
         zvQjtW1tqo0nMAyFQepwpBX8yAEt737zEaXH+KGXetQW7pRpHqqJC/wh0puojl/p5Xwj
         1fFLTSBV7P6ZOsJHQvb2v7C9OFrq4fUG9KpBKRmirHtaiS7HmY/TSmS4Z8Rfj376oYaU
         DPaRo+FnXSsFaH3niTIVzuAsZJAa6X0vYPQX6MirS+MR4E1Hr12ZXTdYHDf3vWgG0S20
         E9wv0/gLpa/fY7izjVTAss/uxLyqzAG4hx69mFCeSyIacQsxXwcVuBy39/RrlVmcSwO9
         H3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700216; x=1796305016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ceB4cgpS2thm2HUVX9spFX6C785VTleaXqIGczbl/g=;
        b=VclYjm8TujJvrADBAcD+m9gMJtR1jymc5KwXG3G49PF8CIHvczHCxMNQy2a09RcXKT
         A4mDFo/q45+IvyHlVzN1jFCS8KNqey2IegkwCCpR4iTEi8sL7NlInwQX0Pduf3ifjrEG
         Ggfj8PdR/Ol27T9g+S4fEPcUzzLaP6ZbsLmxVBpUCHNO5RCgMROhylWIcZHAbXUMi6b8
         Rddd7vnO2JVEtCYRf33dFJmI8kwWpwihzFHBsF3aHvSUVG2t8CXKpnyiHWJTFHqsj7N7
         wBFhwPZxM4zDU3H7fTYHpXrFNWfkMyjErQfq6SbgZss47akj3YcF8RiFH7lT0DiiB5cY
         VhbQ==
X-Forwarded-Encrypted: i=1; AL+hErFB2LTfzUsczXsbZNwr0LZRaepC51Pc2+NphFXkdWhJlXtjDqXqo7biB4jwNoWaTpDOQovmSmjh9vqN@vger.kernel.org
X-Gm-Message-State: APuU4Z+sFUo926nWu72gKLgD1gdFcv//pGmWg9+43RjYNUrMP5koIkdp
	JtyroIiyf9C3iModaEMW10NroA48O08UBieOHt0uUktoNfPIuKjJBX+LpWWRkflx5veBcCyLl+f
	zfdRP3uDQyhtUcGbNqMmv3oX6uCvBhMqunlmxawmcEIuvSFQRd/KopYxYADFyvKC2
X-Gm-Gg: AZFdTZdfI3swLpM7NoHdjkfiSm6fcgcYosyBe8/GVX2FNlmV14/FtK+0Me95uKwHreb
	dIm/A5i49Tlqgu1g2rq6DAOdIF0ZPr0PhZYO/PeQA0XGn/P83w2qkBRGkjyqJTo8+id/09sSwmh
	1kcm429/YVcPU8jVY3ZSjIN/GBF9OzGKO/7m+zQy5DmB3o9Dn3M6PQ4PAJ//6WeM9v88ZgtXv12
	SNiskXf1zNU/fYZxmGWKhePcza6SgPUEqUw/XFwcUBiKnkX6JBZPRPRa36CVH+rXeHD7y0y2mTL
	rJFEozeV0n+g94Klqdi7UayN8dUOfpkDm8TpHZCGgQx5lqdEv75m9Wdk7X7kJkV6MBJIDz7FlE7
	pnPbbloDeWuQDrKNihxpg8cdMLdZGEAZx2yBonPtrgtWKaEVf6XUmUdXYhEK6P8gWQwnvTcaVMU
	Je93icELp42vE6cW9qcASdnsd5MCLhC8KdTEprlnhGPsrpEyU/X23b9eoxkuCHSg==
X-Received: by 2002:a05:620a:a012:b0:949:e60b:e0ea with SMTP id af79cd13be357-949e60be137mr1872242385a.16.1795700215426;
        Thu, 26 Nov 2026 05:36:55 -0800 (PST)
X-Received: by 2002:a05:620a:a012:b0:949:e60b:e0ea with SMTP id af79cd13be357-949e60be137mr1872239385a.16.1795700214944;
        Thu, 26 Nov 2026 05:36:54 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm547828705e9.9.2026.11.26.05.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:36:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Christer Weinigel <christer@weinigel.se>,
        Jim Cromie <jim.cromie@gmail.com>, x86@kernel.org,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/3] Convert National Semiconductor GPIO drivers to gpiolib
Date: Thu, 26 Nov 2026 14:36:52 +0100
Message-ID: <179570020768.19257.6131446330584583033.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
References: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yeK_4_h0vwE0zq5Egn2HmW0vpZ1oFvPp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MyBTYWx0ZWRfXxwOdckHAGyM3
 y+sDDOCGxS42UFM8dlrdAoZS7xGBXyJJTrw7c9/Tvu1pyFvT0TJtt9zMTLt2uO8EUSQzGSvuiD8
 wuSlrPp0Bui5oqvFSb3MUNi/2bbSuA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MyBTYWx0ZWRfX8qC0FXHA2RxE
 VqZoT9bCiWUH8pc9Ai6Ecv40ovpHGHO/gODGtlD3Xa5TBHIHx/MtOq5geUambyeETIXMhEhROiK
 SLzeDr/eje5a+xoUC0MlGyRuHmtk5mKSIqcPY2SsZrkQXIcWfWnkEp1XQLplCRE2RQWkNJKDu8z
 Yt77ZI1hpjrturRkgd2Yz/VTHsF7s8IoMWrbs3YFG2YAi7KKAYZX54ijdFn25U+OcQlu43T+9AF
 h6npMSQBTTjKFzSoGTEtPj+9sEmOrDaOR11MAEdwc9Kt/7bPorg7/QDwRmvxBTMeMdzW9BRk9pr
 FcEpwFJpv1SdImPbKVNOpTfhdh4y5dRNAgQLC+3xYHV91RfTWNnRs94Jn8Qz1mGyDyg66i0KlVv
 z+r9QIhdKHtmR1/Xnv6Mbx2Vtdv1zdspXRhLlwCoaZvdLA06BFfG29Y4qy/EFyu7+pVEtT69IKl
 f79xswwUOd4TsfVnYzQ==
X-Proofpoint-ORIG-GUID: yeK_4_h0vwE0zq5Egn2HmW0vpZ1oFvPp
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0835f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WzfH6FfdUaIZdCNYEXQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260053


On Mon, 23 Nov 2026 13:29:52 +0100, Linus Walleij wrote:
> This is an obvious attack patch to see if anyone is really using
> the custom API from these deviant drivers/char/* GPIO drivers
> from the early 2000s.
> 
> Probe PC8736x through the ISA bus API and create the SCx200 GPIO device
> from its PCI bridge. Register both controllers with gpiolib using port
> I/O. Describe the net48xx and WRAP LED GPIOs with software nodes and
> switch both LED drivers to descriptors.
> 
> [...]

Applied, thanks!

[1/3] gpio: convert PC8736x to gpiolib
      https://git.kernel.org/brgl/c/e17ad94aae09b7a3ad7b2f6886c77e38a7259990
[2/3] gpio: convert SCx200 to gpiolib and use descriptors for board LEDs
      https://git.kernel.org/brgl/c/7ac0d49a17245a044fe7a7bb9d26231279006a6b
[3/3] gpio: remove the legacy NSC GPIO API
      https://git.kernel.org/brgl/c/b1e22d55d4a87dc48b3ec74cc7a07c5b91450388

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
