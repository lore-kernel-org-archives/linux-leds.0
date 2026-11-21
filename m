Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264980;
	b=aq4uu0CIm06fySa1Fb+Ba0c0WyY7s6Fnpoeao8KM12Jxdsn4Q9oShom1WbCMeW5WozNz
	 tzUFI3KLIdfA5DYVty9aC8sphriCU0DPmOyR/6gUV7uOTOypfUXv5HGTbaNKZ0lU3T4Fc
	 j0HJsLNGMKdIYeLsw/552lDLW+AY34uc9IfL8VPeFFCdF6KxSFoSzweSJAKxEce7dIASB
	 h8+/MWJ0qyRpXvAq15nqFj2n4lJZPcyspC05hb/XjO4Sc/9QpbGssNbKMEU0QMio3RTlt
	 63xU3zWvOsK0Y1WVn6eJjOMTYBBBVJBCpJW+vxyJ71ks+64scksfXEZc+QMy8SKsxkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264980;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=1bbIhpgc2q/tt7gyTkozbhTPOCroiLTr6iidbtRdGvE=;
	b=POeFpJ4XNpek6DKdbKlhdnPxalJST64x6lalRsuh7MiXu6z8+svmSizRiOs3q0JQ55cB
	 rJGf+hA1KQqS2abOEogHmUvoOV7iz5Q7AfMC7xi2I559DLbWC4ldgViqXRz3dHozNrCzu
	 Fv4PrQdwqfUqyUF71pY+BceMWNkBy8PwCAH0e/luGahhNUttWsddC3o1ixjpikwyEuioh
	 mVpjTlUyMnTeXHsqXN8P6Cc7ZNp0JF4iFRusRKuJoKvto2150Nu0JTmDyFNTZX9jkZD3V
	 AQumyK9U1LVfR7+ki3OpHemgrNqHJXjms/mfTmuLE/K3SDOYkPimL2jyxqKITXQcqEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=J4QcKj6D;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980FC606A337
	for <linux-leds@vger.kernel.org>; Sat, 21 Nov 2026 12:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980FC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=J4QcKj6D
DKIM2-Signature:  i=1; m=1; t=1795264977;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:JWCGYvDzWHOl9jNOoxtpRiDRYs8R
   rrtqooaTJV1dQnvePwIfiRCW+VS/nMZM3Bs3vHDyLN3VjUXb5jdl9eFFGa5NhGlCg8yu1kmEWVn
   V6DvNbG8SM0M2s5aRkuOYNxhVa/0prYkvm9JhciQ4qo4fERuuc3Z/5UkBov+dt+E1cN5mfp6iiK
   P3Jr94uq770WhP+1icuUjRTZP8ICspCWkJjN/jHRFG5zMjSbf5X9I4B8Lnj+4oOICZXZpnO1Vp6
   EH+jc2SHxYEm6hsNicW0aNHBKG2WdMHr4m6iC+aZBJXQ1tIx4WtuGk60ph65tqww1oq8sLHU4cX
   aiKYDjbZDMAmQA==;
Message-Instance:  m=1;
 h=sha256:
   vgpT+/m1qFA8P3oMwF+vg4U/enDe565reLZn47BQ2cE=:
   Uq091gS1PHLOxlp4ss3pmDmU/Qzqk06Gwmx1kOqoeNQ=,
  sha512:
   vtxGIWhc7VAmZjBGXxntp2UXXTnqGpyH/cQ//24hM4pViVEesJnjas/kEQUMSfUlCkXZHao8ZjCZ5MWEiY/Ixw==:
   j8uecTkxQT9VsrMXj8XyMZ4B62H691lIjuR2SBWFy4TMezgMJphOnQZRSklkcVw6hj4yIjVeAZc64AwUDAm9Zg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795264973; x=1795869773; i=w_armin@gmx.de;
	bh=1bbIhpgc2q/tt7gyTkozbhTPOCroiLTr6iidbtRdGvE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J4QcKj6DeX7adiyICAXWic8ocgeBfHILg5h2OweMB8xl6ItlVIFRfDdLjATXb73Z
	 +Ensnof/ew4HA69nNv0PRUjuV3SfHfkhl9BcHivoxhvKQRsOR1CxfW7QtLelNdCVi
	 +YMkKzBo/esDIy2AvKiBm4ZpeWeHLkqX5Sz0YR7MOgTQuYjnmVsa2nUdLKI1zCgkm
	 TEQGcO7jaWIkXXeLLNdRP11s00n0xV6J6PTIhM2a3QSy49pEFnpu7IB8incYLEW2c
	 mpLpajrF4jqaEmdkWblCMmxQ00mnRaTGOPmTIg9bFD+J59wnx3C8JhgxQ+Ypsp/Ob
	 bl/MWHYI7QnLxF4gxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5rO-1xqnWf2BoO-00KdB3; Sat, 21
 Nov 2026 13:42:53 +0100
Message-ID: <9f83d934-9913-4101-b899-0c7c99fa39fc@gmx.de>
Date: Sat, 21 Nov 2026 13:42:52 +0100
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
Subject: Re: [PATCH v3 00/11] leds: class: Support custom sysfs groups on
 multicolor and flash LEDs
To: Rong Zhang <i@rong.moe>, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120212431.152081-1-W_Armin@gmx.de>
 <77c77dd13a1cc44416ceb28ee4dacfab51c7c220.camel@rong.moe>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <77c77dd13a1cc44416ceb28ee4dacfab51c7c220.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fzP/yYa8Aly5BWZqUJ7+n1HohZFGEH4pFWaGQ3lyK4XHRcsAguI
 M2aF/8qCqsOAzl1aXRVxEJESGL7Ij8D8TJfNiVaEqgRIotZHiwEEL4HyZdi2UsS9bvE2iGM
 cfIPkHJXLIwWxSygHSDBvfyq8bytGJIZsfjMZ3miPTJe4Ye/JyTQ4zaIqChMM8P/5bNLWi1
 znVzLy/QpoRt+xwisD8lA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XZ6ZDuwDzqo=;kjqW8NkTiXGyudBc6LdH01ifWHH
 Tnk8tZddnTNBc6WxQFlrjgb3GqnFkBPUZsyUzalW9evNJyeqQcKJjbb+SM3TpwejngyGbJcco
 hvZsM4090Wju2NeeMV27Ouiss1tUWZ2IQFU4H+FxvKhbg/06slw1SVRGqs5FFpdpkYuUzlalK
 gF/RG/yUCIJ0V3SVjhRnK4OGwdqj0JbpafaUyvKGIyxv7QwJUVdBxgzTJoM3pv59hM0WOU5GG
 chlYy/bCwijsmzNesYa1U3Q+DniZJVSM+kOjtfzl2UHEt9uM39oVpZmbgu5KrnZE0VJVWjGWP
 4HdpBTYV2aWzklabfAk5Bb1hW/SQc5+9mm7o29jrtg+i6pOc1cwUAk69LbKbRrR5rexihlsc0
 /mfZvjeOsnCEaF/h6xsV+k3KBa7OAf5DglQQXaCAEFZJwHR3H4DYHEpxCVoasqGUq7+T+yGHI
 BCoq1+3/xaWFn7zCxSDcK09dae6sCRCn4i5oYUL2TJQT3QMj3nkLXLW8wxBRZK5IZeELmcVgg
 l5BfRyTAK/NEMP3d/U2X36MpJ9lS8YyUO8lqzx0yiPLzekalRvnJbLfyt6VLmD+qtgEaFHwpf
 EIk4rTc2G8PmD4AkCcFI3ox5wYuJIPXi+1BTsiARqHyqF5T5Yv1kF2qaguZputsoQ4VNKK0wg
 Ld2qajpR8sVwYa1gppJK303DdICSMGWqZV2hKiGigEmkVfdHhle1xrqIl1dKZhmQ5e8HSh33V
 5T7JnrlVpA8F6Cm731MRHzDZ7VDSnwfphpC0tPh8WBlI9Iwdt9SFXkRMuj0LqtMMJzR+CGWZK
 hCYCCGFftKu8fv/i7zClzCTZGe/XXQQIZFZIok/nRgYfszQED40U30YJS57pZDbdC9kZQavec
 5OefY+T8RUinLjUzviVayqfU2ERCSfgjz5rNfL7bRnFqtX81pM6zRbuqd/ysK+kv2e2VbR2Ma
 UI6BNYT+IVueI4Vfcenq8B3ADc2y7ZnLFZ4ieBvwzCbgMhZOX+qQVeaD4AyDB0w4KI6MbFEka
 c4eM/t5lX7VT+4idm4d/WFQYmlEiIKtDCDMAYODfjRq5hAlFtYuf8iHYX0E44WMyXfQc2IJ6w
 Z64jznBJLopciYPhseg1zamjoiKrQfOUIyzAWUgSOhy7NrJE4HBYP8tCpEUWXderHrkZyrp3K
 e9WrUwAW1rZHylXjZDctqk4FfkVrIwC1oI6H8bDvfGpODwn0092/I/b6qVa9H6uL1mkD6gsFf
 L5qrIxw+sZZg7+4zHzZbaGoRKmxudQ6gMLHEHJHS356lTsBE2jF0LOEl16QS7BOhKof1rHHxn
 z7c6bsWTykctR2gR45ipF/q3E4QA7lsgzQG1zZ9m1KtBhCH4ijhclhbZVsB+xLCPynf63P1Rc
 r6PaB+RsxawPofVZUC5gLaTAU55ayYZN/5AKBgy4PPMzwwwHKvpREALUcOjESOfhX8c91fwzr
 th9ywmbIYPZgLceA89XM/r9g0X2m6ZSOI8XL6gv+4HZzrCtyvzfLc5lbTjY4AElKuhojW5rLb
 Byx24sjtVwTNtR8lAYXvrK72WNPrJKh+XXt2Hw+Mt7aNdBdV9bZ55W6KefDGrURqwuj2G0qsy
 UiPT4OID5hA6agclIR1Y8KyKpLhl2UdB1+ibFfJ7QuYHgnodaCPH2ELlqxd2W3ShmrwrkQmFh
 TsLrZaNZ6CZ9hT1xay++L9ENI6grXOgA3wMCGy+3/px+sB0zhzS3ywzuNU1GEieoOQmvU/JqX
 AkVUoCE+Lp3c8rN4AJT/oMzEh1kAfvkV2pYsZBTC5Uypl729+tEPOI558SFUP9p1gjL0K/dPf
 +BfpSgS/vCagj41uHXaCobgSmJNZZ3vFLz9xQn8ZliANP/AQcPH9TkFXeUwP6gCVSN/VPn+VS
 tyxBwy0FFFl/V//kujvHO/SkgkmbqZiFo5MhC2Avh+DIbOar/9okFChuNunURtM2sgT1VMihE
 6fnoi4qu4AylFOLbTAdKMqGZ7ZKNnaa/GSRsSFVeIOoYnknkCV8/4WpDfLkCy3YRjiP4MeXQl
 e21hon5kFcw/8v9r2XmuPQr2jtGyItI7cKf1jdnxckK+dWDdmk3tb6kpouWwB5lOBzNFedmFa
 Oec+nIeEfIVxXxWiPHsscFoEAJTvWbGdwrQHhAdnzkM+w7GLhguZQ9YoDBiS6U9OTGmxjojC9
 u00pVx2tx7QRSmZAuBVmv1gFuc5c5gLboRv4WweNHLQLdVbExY97qeVAaIi6iQ0lv3fQoIjtv
 3Z4MEDiGNL8lGS67+56th2FEeIdQ4/f3S+y30r++aoiIKnuxqObWGjHQorVdYOpucHo2W2ns9
 zPXCpZ8qRUsr1SRH3twtdZ+WSz0RjBvVQMKfyC++BDaSQzDZ/2Y+5GWJ+3DI8cG7MQl0tzZGt
 f9+6cp6JTuuz3cJIzPiRlqgQPbVy8Pu+YnrMSJrsuwCbY3//rx/PXZkQiuiZswiAL3nzBnRlp
 xL3dAeQ7qoYNS44AFrrImAg+hO0Tc8+UsEtxjnX9ctEmh+cHCo3JZ6ZRiblrPHUlRyZ8BR/vV
 22qTNEIhbnuGCpl7iBWAkegsVOis2pvA9vjM82Ji1VGH1osSqTVR6WXYOgOAq0jc/HE6WV1Fu
 vhIhqgPe182QGqzBUIH46sVg408XtI3668C2kqCjj/Ap0htgOuQn9T5bVM6kwqq/RIeQn3Xsa
 xq3r54SQbpoO+ZuvnAh5ZMpaFuf+acb1XYHhmTyoPOTiSA/yKBDquBOeHMU/GC0eSpkD4B1fz
 Rr+K1z96tfjZ88VnEiGNUQWGTJUupQqiUMnLOIdVE84pFw60Kl3iqyne2TgoYMiUFo7pqIV9I
 ATpA5KNCkqN7F9xsx6THQJqkrmjpkRBmutIZqRmrD+SnMOmtVlQn81EjOB2tgT6T4Hca2dkyo
 Qey7jqo8v2MBQ/fVaOYdoPGyNUb/1ths5qOmBYGzWQc70SW03dXPVIPPFxs58Q7jCzoX45x0m
 47KDaj3FEgaQdHHn8wgr0sIEzJDjBkUj+NtHgfmvNKvufaj9AaGLdWqovaiUombGjp467g+2P
 unRCvfZXQzm4KKU0cn4IRSOXTnxLPzU1beYvHZxO5OZ540frr4nrEFZn4hRVv8pfDgnuh4ox5
 XCxdKPGY4uc0I3E511PYfItfC8eiNM8G9EVbnt1YUI8fmJcKVyDxvpDS7da/9yOJhiK8nYC4h
 J+NDZ+L2ytaAdw7zmYZUAzcBysMvfqL5Cjc3yqVh2VzZfC+J72jxfq/JQoTzqF6kcb0DmjPvb
 xIlZtzUjZp3xDlqVGPXSCuSLs+jIuH9S6sxrDxEMZdvYRBqKubdKUyt3fP/rFMOzT/BSiFxKd
 WZaL3WwyL8bguVmoTtizqNhw9zluIUMVcSS4or2zBradtC56CvusF+qiKpBcvaQI8jeRTYlre
 cgPY7TBVW7/QxJU9G8gzuSijhhO9cOBfbSmhA/KvScw3+xOnvNfhPAX12+OWwRazzH7Hl7OoC
 f6xRoQ0BWytpQmpUtQpxKbIjNAJFHYZueSxFCHk+cF9ozV3MF1I7oUMTLqwB+iHQNBtihn3PS
 mvYlgfEdsuAJvnkxtF0Hq6KAvIKtP2ZN4Y1a5sKDj0rNDDk1oNAUfW0FyUM2ucp4g/TZEfOUf
 J1APEXVDg3cQJ02qtVumKxjW2ruOUk8tSwjG+i0i//SlR5MazcJZsQYMzYED4O0lkzmeBwQ+s
 YFw7/ZXJqobJA03v11VXTIAF2imhs2Jo5UBOsCQBz5wbIqSII5OACZNSmGYaz11zcyU7n7eg1
 t0dXL+SyLOYLuxrNNqhX35W+P3m+OC5oeW34UOUrzWtPJcybX1m6Tj5kLl+zNGGrLB40MtRuc
 0VCVNB0BMAAvFm5KsKReymI04tWd9/Ev2zPhhH7EmLJUkm6zPt+ulrIh3+y6dEBh3fAABx1YL
 E2aZxzJqj2N8mJGnRQm3rRi1e1um5KPMD2bOFWhVJmr61XBZF+19pkRvOoQv3M0o0631rkv8U
 lvHeqtuNuVmxif4RMDC9XL37UwjUshosLYF6hXNWyxwfE8HF/CENEr4jlCXm+jikNXeIYXXat
 gCEr4LT5sBnP5ibrSk4rrL9yTS4wGSBrFPFEh+kJwORel55ML5vcZP9nDBxEMukh56WJTxQp4
 WfusnhRs8RwdllF4b7Xpgy3wDXYuQkc7H3OjfX1ndmGCiVLBnOOCJeIxE4rSuYXJEDsav1R0i
 qUaGf89FOPRm1ntbz82EQTn+dEsURh3LAst2j3WQPxG8mF6QnF5NzM/gfNebndZrxFBxa/TP2
 VvH6Z/SGWA34TpHtZIuvmkP8AExZTnVyx08Juu4czwizFCa7GgVan3WnhlC47MIvkmjoXpJZR
 UsXLrv1QZNPWcQDH6TsPcdXZ15v84y7EGSssT68AMKPVPQYrJ7+Qfb2zkd/AykxrRYWBY+QVk
 svVY0FPDaZDoG71jAcaSWPZK1R06hLhSIhoQSCWBE5sZPLePn3NgI1nBjTA2fnm+xGn1MD3os
 q5Wm3B8tWmuKxHp3t/n8zx7iauoPZqwMzPBZzNa/ZbckRKjZunSeuIMEIXR1ZPnCvWOvxHWqb
 F/LVTqlrMbl6f9VUK1EkezKpPIIkIIxQIMvOR4mHC1S7VrPX7o7JMjtWCf5vpNPMFBKcSt1KV
 zvGPWcvDq5ru8mveQ2U6s+9ryGJcJzdYHvD+N85RLIFBN7fqzsUr/Os/qtjHPkG1o0NIaHKb0
 tX8hlQ2sC/XE1SrpRPrUXck0NQmr7XSIGs7nREftft2YVaWesp0+YudCDc0eeB2duLy4LsjHr
 XQLI7X2ZSJAFQbfL8sUjoTsHDbWPjzmtTqFyQq6czyau6/lWsxkA8LCEWYcWlh+4hdogYaYPH
 0zcSBAXX0Gh78fC59jgevSA/8/534eeXSvlBoqB3d3hgvPWKTpyM9uYvJQKbppiTwtodYNlyd
 8N2jaH4Dl3UABymTHRm4SzAKmOkcfwjz3LOdLR8s7AfLDlgkNsoax25q8FxkFTgQd/AHqxemH
 S2Gl+Zeahc5kaHmdEa71PKnuRoLPWTXOkTM5JqLmNwhHXWslKX/gqLc2h7rUm4f+T3tKdi/eN
 ZRHKnZbz1H9ZdNcn/bxGIcT8LnClF7IgTxKb0KsklMbbfxFqNE/CkagwW2K2ffQSwnsi5L3Mq
 1jdCriK8rUje1j6gQNoQijW4ng82FKORatVs7435RWKYR4CIMpYDp1avjVcy5/YxZiFv2RrLn
 WKkYr3/N7gSjGIn1IkuS956G2wyKUd1tZ8Lqbm8j+jPUZiLpCNytADc+CJWAoyMFfQDuGoYvt
 TGOOssaXOPIjHHFmYhbJhq/lSa1plmRaDMOqxqOoDYS2b/Osti2rsA6gdodneLiAzB93bCzBk
 uGKKkqp3jcvFz42MWIA6IXhgS63sRbK1NGBsfw5UqSANNRQ40rTn/pgQO7IzjEFMZ/qoXJoNx
 2HVb822VIO1UVv1zGNsmNgXpZaHk5GYp/rh9BQbbXFlWBvdUb1pOtKSPFUtz3xtIbY7Im5Fh8
 eLRdxjOVpzoVtNgcXg8i+wgQJh8UIMmW6YwqA+XJDrPhrxZFirgbMwLBtUSrOlKTwizeNHqeS
 loHCx1mqDiux/BF15m0nag+/LX3Vi9Ioj7Um1zddbjGEiuwiXBlLonGTEH0/XLbcxJi4EpZL5
 CwGrTkrrEbX277R9LFZNQkP4Yik+M8TLFEKwTrUHL/ff2+8fwCdrAi8mVPI2oGWRqLLXpmAC3
 VyNK4XtQYww8kvb4rzyaA2uAq/ybfYPizyCshd5bk5wz0SdExEKsUg2Koc6hJJrnZbZVoWm+h
 Fwi6lEWpx11F/JQTQtYhPEhQt090qwQozYKUg38cjT+GUg4oq4GcBIOST9oteCbPol7Suf4bW
 j6+Z0GrN5IoSM2+YjrAkTE+9ac8Nv8r0Xydqa4IrdfViEWe1jfiB6BzGoRYGgrJq6JSUVHgoV
 Fo7kU9IEoPvySEWNLqWet7LD7idb+ojIdLW1KTaTKaN3aipRCKCp9TQjvejhLd250qSvYSF2S
 jtMD2W+5E372qXYzaVzJCmhm5WNWr20Stw3c5TRqX9VjfVM4zsM92Sf6bp349qVJauLb9Y0Ag
 I3AGLL/sWIWdkvA0c4E1VorRnPgYl6AHZBumHNK1RoMb3qYltIWjUoApHBIMgF/KQm3GxPjfZ
 3B9Fyo5/zsT1ZGrcjwW2piEGpokGyJySzRzJsfERuzgOjLf8rfRnlraeDSB5PN8GIyIPrCl3h
 Fo0Nvn1xtlLFWb2oNha0D+MkWxjJViQq0G4g8cj2s3mzIzaO6xrbpWviBxT3fmYjVocqU4NpK
 YokEmJK3j3bKp9X9aJQUzik5SJumPcrlc0vz4nKG7P9c2a+wD5zLCCRxwTJFvw96WVY4lXWwg
 vZPtWFVdNeI2OmKRr70O55VMUX3emYrCGUSMokRbgLxqZ4jPYgkc55Hr4i8N7UHj5fpbpnh2c
 8BzFmloYJUWwbZf9YFWTeRmykfh34evSekk3zrxwbOgZYHUt04oOuAjg/RiYGhOXGbaIgC1i3
 ZVWpCKJfOPZH0UBYZ2DeGAXeiPUUzWCPcmuEL674i3zMZg4EbbXYdtN5qd7m0vhF3y5JzLuGa
 12JO2/P0dMGdjzLElQjoem/G2I9D0JEGXc1FbBU3YOO+Pv6J6ZhuRqxUbmrdXOHcrCV7jvsar
 UZFLVUqyPfneDJNz7GAtn3SSoDBhK4aIbr0HcD8uzHUc3ozpGh+8H0/2uJGYg+E2wdYtrs7eq
 LGBB7wowLSL7Bah6kewO+Ma5HAC+PBCNOeYbOgl/gYcIl+oIPo7f1SZlYmCvJHScZFMfiq6hT
 kClw8ZKAOutmnUD32xGwkQXvX5P+tH+IOIJguba0E0EX4uMuDqJlzgqYg+jptd6+Wv13nzgrx
 LmimW8Dunn91/EwAdP4H0Oc+DNg8RT+xV6k20eEqcEKjVeaa6JVdimJng=

Am 21.11.26 um 12:21 schrieb Rong Zhang:

> Hi Armin,
>
> On Fri, 2026-11-20 at 22:22 +0100, Armin Wolf wrote:
>> Until now drivers are unable to atomically register custom sysfs
>> groups below multicolor and flash LED class devices, because the
>> led_cdev->sysfs_groups field is being overwritten inside the
>> associated initialization functions. This patch series tries to
>> fix this.
>>
>> The first three patches constify the sysfs attributes of all three
>> LED flavors, while the next four patches fix various unrelated issues
>> affecting LED device initialization. The next two patches migrate
>> the multicolor and flash LEDs to use struct device_type for
>> registering their sysfs attributes, so that led_cdev->sysfs_groups is
>> not touched anymore. The last patch contains a minor optimization
>> for multicolor LEDs.
>>
>> All patches have been tested on real hardware, with the flash LED
>> interface being tested using a custom kernel module.
> The series looks good to me (except for PATCH 10, as I am not familiar
> with that driver).
>
> FWIW, for PATCH 1-9,11:
>
> Reviewed-by: Rong Zhang <i@rong.moe>
>
> Thanks,
> Rong

Thank you :)

>> Changes since v2:
>> - fix issue inside KTD202X driver
>>
>> Changes since v1:
>> - use READ_ONCE() inside brightness_hw_changed_show()
>> - fix possible deadlock in led_classdev_notify_brightness_hw_changed()
>> - set led_cdev->dev to NULL when initialization fails
>> - call device_set_node() after device_add()
>>
>> Armin Wolf (11):
>>    leds: class: Constify sysfs attributes
>>    leds: multicolor: Constify sysfs attributes
>>    leds: flash: Constify sysfs attributes
>>    leds: class: Create "brightness_hw_changed" attribute atomically
>>    leds: class: Fix race condition when creating the device
>>    leds: class: Access brightness_hw_changed exactly once
>>    leds: class: Use correct type for brightness_hw_changed field
>>    leds: class: Split led_classdev_register_ext()
>>    leds: Support custom sysfs groups on multicolor and flash LEDs
>>    leds: rgb: ktd202x: Initialize max_brightness before registering LED
>>    leds: multicolor: Adjust maximum subled intensity during
>>      initialization
>>
>>   drivers/leds/led-class-flash.c      | 153 +++++++++---------
>>   drivers/leds/led-class-multicolor.c |  76 ++++-----
>>   drivers/leds/led-class.c            | 233 +++++++++++++++++++---------
>>   drivers/leds/leds.h                 |   3 +
>>   drivers/leds/rgb/leds-ktd202x.c     |   4 +-
>>   include/linux/led-class-flash.h     |   5 -
>>   include/linux/leds.h                |   2 +-
>>   7 files changed, 278 insertions(+), 198 deletions(-)
