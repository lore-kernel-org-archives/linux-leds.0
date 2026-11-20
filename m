Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209896;
	b=WSR3QCGOzN1IyN0zJtLGKaoxkXC95Yz2/dD2oWa9MkKsIcaBKKCQcbZ4ABLXu2Y89NBa
	 I6eKxzgoyBxSiKxYjzpka/stdSZc1RuK4scnSOptPcDyS4AVj2uhWMVD74FoIxMDt8tPt
	 DDObwEBZptwA3BM0F4S7tI2SifLcImUUuuNv0IweSBLJrZFGDKRSbfHN2htoj/Rbvptzt
	 zItcpxQ08DXN0GTsVIKDtva97VZ/7Mhb0Sygl2JLXeN6EImo8sNSiqx5MXG1bFgWRqG2q
	 X4ST3uP2deJ/Qj0r0aE1ZgElPn4fLe3cUDfnfihB6oOyioN9lBZ/aKe77ECS04AyGLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209896;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Orog7m6TOQKEyMMEMq5a9QTXkEyeDSNBXEAS54S/OTY=;
	b=3RaNAcOTOGcxfrbohw9EsDWlR/BfR8KXh61mn2XH0lc4UE3nIP5vGoAiTvzMIudSDILx
	 RdBa2S7ndiUrypdYkGUjhlFKmSiN9FAbC5z0F06RE38v+15FXG1zNZ8PREvDuTBF+xkuq
	 9baPFLLG7ViGVTqe9PYVaGv0hoAdXjLi28HlB7KftkK0axnGcpMB+mdEk8dXavf4furIp
	 udPR02UEOO5qxA4kQsG3H9kqcpqORlaWhDQdwRcdNf6ZjdkvN/tTzbk2ZeovpKX+3InMy
	 ni+uSPF0Y7ru8AuhJtJGMXsnPE0PA3ere0jbQRXapCUv4u4FgD7B1L8MZVto9tA/HdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Y8YESUED;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB04606A69F
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB04606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Y8YESUED
DKIM2-Signature:  i=1; m=1; t=1795209889;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:mpNUoaH33cAG4lAKiMP5waR6VAiT
   9qkyRaS9ED2IZh1arv8SS5gr0RPkJgwfmZoXKlOd322BmqGvEWmo/mZQQnXauefa3WnhZhFBJcy
   VttE98RngqNlsNZosJK/CQepxVZMgW3vHZMYu45ABjQJdZAFgG0J0J34B5kopzcFOhL3HsRGR8P
   seAv9hLUa5pu2Dlo1U9OrnQH9peJzCkamjINtMyT2uYtdy5pB24sO3MQYK7A/kFdhIjQNIBj2OV
   sG3VUKMiEnMC5HHZxodkyiCYqSWxuaRSLYJlc3IMyAYh8rBs19VZ1qlkbgmiA7xWxdFW2Vm3GU8
   HvvSYb/bY8+9xg==;
Message-Instance:  m=1;
 h=sha256:
   w/dglnXmm1wBhEZN33a1EMIg0RAK4+OItElVQ+XPKXA=:
   xTGGlCO+n2+p7F2sKqld0/McoACE7MVGxt86pyq1e40=,
  sha512:
   RJJmZZTvEQLjLdYCy8KxHO6czg6sY+K96S4VrV0Iwh9GgXFI44ONHguoxUcMQIUL5bxAD8+0pMPNZL70CQFMhw==:
   hAWRNxHdYmLbJtQbTGVt048yHT14aJhqXvHSDWYwIjeRt929cunANWu5Gxk4FKpUS+MyvpuVMn7vExvjrLQEJw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209881; x=1795814681; i=w_armin@gmx.de;
	bh=Orog7m6TOQKEyMMEMq5a9QTXkEyeDSNBXEAS54S/OTY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y8YESUEDBGpy/x8LxBg6/+nTyBHoItGN6onfN6GWb5MEp15syzvSPzwkDCfVGFO6
	 potfqC5usSCJqO0H5Ky3Igma8+va1J1323P7qZKYi1cVjseX2ZH+Fu6+pNFMCrsyE
	 GnTQ8cnceB9oaWYwZPGN0Xxmr+S0SlLHZVaOY94LFeCdvzTYBOMHUria6ynNpAb5y
	 ztBjLfYNCJIKAmvMVTCz9A5McGllmDdcsxgrL5rLHYiBqnLVR/2VFe1cFtTRkLX/M
	 K/6jqvZKVQiJ9nIOsbTMZ/MWORG+RwHpeI3yhrXsSF9IReZ6E/ZtDwtlWhLU3VEXY
	 ssRQd5XX1rPRfoJKgw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwUm-1yOXWn2Vp6-014QB0; Fri, 20
 Nov 2026 22:24:41 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 03/11] leds: flash: Constify sysfs attributes
Date: Fri, 20 Nov 2026 22:22:20 +0100
Message-ID: <20261120212431.152081-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120212431.152081-1-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RAhMzK9n/dd8AqWlMUJ+kfqJ/PcnXXt0MWAq6URpLKh8IdC3zDN
 hQ0haYQKwc4ODbIflOxyzcZ05JDCpMx2K4mVEXl+AcavOo4YeeDFr0x9pnDczlfJOlTfffH
 P6tSRWSS9ag6wSa6YGhZ1wKnh6jsU1AtojGyz+uvZeCZwOTjhmKQ91tDniArEqiVmXwVxYS
 0ZXVEb6+on03X+xCuKvlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:78senGpjauk=;nIL8Xhu1srToKeIWP77FGGCDe0D
 fnfdk9JcThtXZjhXJIH/Q8kR7pTGcICOw02kgxUqySTs1pjwNEa4TjQIoT2M69h/ObgdNTh/Z
 qpgzlYSXuTwPjvn5Y36Qs/IPgmE1CrDxXIfXQNx1HrbB/WkyWL28PyJU5z3D26Aq1EmIHJ6aM
 Ct+wOo1KDlQ/uWfBkgLiu3yn1H+ZCFz4kEnXtFHxOYWmPQf3Itr7mlIilCmUr6Vy0cyHJQeNv
 rDzM7dKve2i1QafJc2IkkxdRBDaC5fO6RiaejXeUOaaSAwx5lfe6qm9YVZYMzac3D21oP+8ce
 bQrANzZMGXAv9PO7O/N9+njP46ZsKZWUqO8hZzaKE8NNGr+/Y+fVT7ju35iZ2olf6rP4X7q7G
 rZzqQ+ZtRoreI3U3ORNFGclF7oqGBHqnO1Zkhrnvi46VCmvRvRQDoVVUmRSozav5qTUCj21cB
 mPSB0dkhNFaMAuW9uFxR1HwojA+T/oZN78D0RUJRLPSqJgKWPYqDu6DMFiRrz+VOKYr1sI5Db
 8HHQLF1YAe2KLXVvo01t8G2+bh5LjEaLogZt2mSKsdbjYWfA7TC15KgVz7atfKa+2vX4lFSfO
 02sN4UxoYkXp66RC33AffrI3SA2UFRcoCAoAMUBnybsQpa2W6Kr9K9aIMAmliyDe0CZSOOe9U
 BL3lOWPiJKwTdgG9kM3vJ76SI7vmWF3RTBOzoglU/76uZVOmN+B22mv6T1RyWIsd9dmE0Wvpa
 3+M8qHdAfd2mv75PJCr/70j8qKpkWVieLpY1SYHkrIbnhM/tEklxABSdtfKzoz9VaOyIf31KH
 Ra37p9970Z8TqDYS1J9CRfdG7ZgjS3ut9Cmw3HsydXwLoZNTN6Bk/gzgQJ3CoSxL7WlibeD0D
 W6Rjg1AmtaSbkErF7lPCb8JTxf9UYjJEgZKCbBJrMshR1HFT+APW6cenwGtE8Ki6C/6oxF+/h
 x0LT3+qvlbEjcG+2MzRjLjT0/5H7ZEswQG+a58p7LoDfw7cVYdntTsYhHIl0EP4AibArqRhVg
 /9SrWADCYKUboWyFjcVMJMzhclc5DcT5D3ZMkHJ5NkF+nWuwVoM8io5tuMQ1OIZbSES3OudUk
 u9FeapcmO4aV59+rak6y4EhzpKfrm4ErN0CxEP8bz9KwokUBWdwslpP8wYoGMd5kY0ZNQI1gO
 BWQQMkXl0JeeS6O4o4zpHh9XVi1VkOd+wJLfDg/7fxnp6h5njghFCSvdIP9tIcckBh/4W1hmo
 km5yTydvwlAA0dgFmgSxyrn1carc/u+uBXx8I1fc2y6nodXr1nVsQvDbyb7ndyI7JJSNUc3oi
 VyJgkvlaiqSHJRZEi9U9biVV5JldXxMc/fw9NmG8nxfY+CfKl2xvl6hrwrjdWUOOrZbeFyRF5
 6CSKv4bwU70wrmMjvgl/MFdOsq2a+ZtuSomDfY+yfo7E5M6ABeL+PpdcsrRIs+1ImBqJ3raDk
 jOmKYXUoRYFXqm/v9gWnuzLsexslYZG6hKeYct0wDoNCK5gpd/P/B4rXvWI7HgT0ZG7Yt3Jt8
 AqCwPiR6avWi5kJFUj+lQasD9sCpVNZ5gSB3XClLlmdkRgGTlsdFbrN0B7XQKbm/ecQjqmGMy
 S7QoOoDS7ceUm5AP598ECQekqlqNCmWIti4N2H/ZZttQ2Y6aLpjSKmBrsSpPcXx+JDb1MAqmY
 vs8y2xBlfe+v89StC8NTRYtkkA0hibcCR1P1i77OfnEsfObpf7BOaaX9ulzxGiM3W3pIHBQSv
 hGr3ncOIFkiBNFfGB/JIZV8VOYNqJZxtXDxIYQXC3SUrhdR0xPgP7meXC+Dw0wyvkmlrhhl2R
 T1pnE9huVIj7LplnPDMVIi2TWpa5G8Oz07r85PANDr1aPUwbe3FdOSrvKpIju7/fOxR7WPI6W
 bd1BZahC8hSTr3QRGcxt4w8DOPsq506KJkxA65AhY7/3COcmDMZoWfqKK1SKT3HkqTAEhY/Mz
 RM2Ue4lq63bs3I0OaSVi2tEtXYpxjsFBywTLlu/W5x18jE1AJzviwJoB4QkZWKuJlraTlCMoi
 2vqln0VIjQ7Z9BwC+zjXz9c3e4wx9YKpx2rcH6b0iTr6ct1km3IUvptktJmC5NBHkL+cpZNze
 pboUS64wbXYEhC0RHyyiF51Q0ThQ3ApxIONYC+SsBk3bZoWe8WHfPurAFdOLaPrppPXwcW2TK
 b0fFgQpmXj+v1Fb9Aici8j3/KRYNEE7ZGuU7amqhViOqc0kZ8W0PSlWeGzCQmGX6owAjHH/Et
 lIn2xriyw1ld3jjISAmQ22hquqTUTJpPON6nE7UYeZwIvGbtokrhBBfkM29bK5FlJVWXeawyx
 p56Dp/tuHikCLVgV3r5Uym5KRanqAWzZ6Q5zIEiDi2SV+1W7VHa3rs/SQJJhciShHAme8Ccjz
 tVZ2X9QvfmRVIO5D0N0HULO07XYGb+tXHP6tkZi63rCOP+JNebxBC02xlUeXmdf73fgbZWwm6
 4OVRzvccbRmUPFvkLzVnpMai3ANHiKCMvB+3cH2Sk3hzpr2hELxwIsnRrUzo2aK+FX3Rhl28d
 vU2rD3EgMVM/4bAemufX4f2GiMniqdCuSe/ruBOgO2kELfUf9i+D37CmiYTCweKiV9YR/lUCq
 QZN4oU4tHaojByZaAWSFnRF8KHTW3BvcADXRzL+fYIYGJt32P0dJr1IgceZajGuHbWc3kxN9T
 K3Hub0pm6RSUDT4tlPfH176kOvnw3P3g3av5mZjGAJSBCKMrzH2XVRDB+NOERjwK6wEPnXkc6
 8CZkJf8OC1k07wMtJpPT3LKtrCRZJQjDa1GUVQBFmdY1brB9y8LsoKOm2BtnhApHEKYITEm8c
 llTR8tf7cSK7zVu7ppP3EdfYbF6xaO0Tz/4aypUItcnvnM+OiEwBBKUdc7MSfv4CpHT2WeWzW
 huYD2RuDHibQvACBHjhV43dm4aXyqOL7ZWnv1QIZQt/LXb9G+iUVl7VEHz8YmEzGkK4c9YpRj
 lfsnNh9LAVnW0hU2scVrZKkd43AOjvgiQ9QARvqCQBBIPHyIkRaOL2gsQwqtvsqHUNP1GKJag
 l8i/ziNIvINwBvdDbHfqPqZdhnoMM1ze6oJ5c2B4P8KC4yOMH9lloyjIzoH0VW6ou4jwGpe9f
 NW1yHmlG/KwFCIaIlc+icUsjRfQR0xr2NvjaHCjahdKEQAykdZbEKCOvqWpm9CQ4MuFdIT1mo
 wTynFzXFf8wonwVIa3KOgL7k7ZulPvuWgwf97GREBoH3IwXsk4uRzoHjiacBrdWLtOPPY0n+u
 8iMj9m82FvMYcPIy+yZ0Y1G5TjEx4bxLERGJjnwSP+huD6OlV+7e/WlBOH/rXiHO2nEZjX624
 vqWHkiIb5ZQn8kOWM01a1Z1BxDSdD6FnA3O+/wGF/jc/zhhEUCEsOx0NcKr31f+PYiSROb+0e
 tbXYL3kbROlIZgUJnZManm2GsgyglorNXd2djRRVlLJ1c3HPpTyNMbo3jq3Se6+HDrch7Qkej
 oOKzTGlp4F02R20rsUNbe92ZUXZ8WSr+Fok17shHD0XhIR1ksrmmKrqTjsJ5cVh4JBHrtClHa
 LJ76FKdWWL72q7vf8boxqPsKQPTpzavtxzhWcuW0JvBrJdfiGkTTaL73QXrPdPPhyrPzzspls
 /+DvW4w5COik/sxh3coZ5/oE+GLlPyZw3AL+J/p8lV+OPkyYUwCH5eEq+w+iZ2f2urXaILa4R
 wHnHdSRElpiYb6aj/ZE+4AopMugdIBGymt3fP+zAEmmsAxtNRpHCdoQpBASmVC6PtkHgDp0rI
 C/y/N4X0D6YCR/CLjiPTH1XtVChj2pgv+vs+x8y+oVA4jjSBhaezY/mbCMApr1CNK6Uh3y7ep
 Kg521qltX6JPFZxsUtPwXePONt0EnwkFVzGI1LUSayzlg4eqObzrJwSDqP9n/xYUWyT1gOrKu
 iVD8KUzZ7eDR+bCwZPeG5e5EUsOCiRumoEa68ZVjOEUeU+AAmBeveBY8lb/LB1WBwa29CLT2G
 O1GT8VNLg7zUQko7iXnEyjtBcBU17oAbsB3xJnt2ZB0D5ZeQ3TDpjjxYlvGhJKNU2ghXM3bJT
 T/t18EmBtwFq+kpLm62Ws+b5LQS1tK/mDQsnX79uy1K+dZK756M1+e/kda/FeMlo5c2DzTnVJ
 +k2l8Ra5S4On5nRO5V1Z453scyUaGI5s+EIxcHwLIlVzJVwvcvMq2k1E2GrjDlPPxd/g3n0vh
 7KmiSrBao3W1lp+uubqff0qaD3mo5VLpHgTvcbQyagVEc7CyEdMQJTrETiRp5yasNZOz1vE4p
 cE4OOjZTwowQwb6IjQMrbTeABSezn9V9+1FnxofsYsOywXKHt2VJ3Hqf5lOXbqyHEpC2z9rhm
 cVN278xrt7em7hnHYkqkVQMpOlNiqJzBedxTmyFnCX3wgWNKYoHhmITw65mIRvkQlKJn/ZrjX
 nj3eX743qkkZFTom66pZNCYCEJpakQiM0kCcK1CkB7tjmxQnCaVwm515GbzWyMupEiIjg7HHx
 ioatJ3L0yB5w5vdL9AcWnXb8ZK3semtb0VOWm+avYvM9hd8Ua/fGSdigxu7wKZCaTKj2ebFdW
 KxvCxwtyT0qghqtfteY0SpG7IFD/IoayNx88MAAP1ga3PFvCfcs0pJVwniUZHlTaF5Z1rQYpd
 g8DZ/sC4wkbFrfLMH6i9kgXwYFxjwkVJoDE7EhAfHLFEX2bt8XnzCd0oVnoUGu6GsRmctA+eK
 mb539IEomqkGMOnrYoQxViBzoPgPh65ipfaIcZd7OL123ubGT2KStjc71F3K0dG9gxLbzOPG2
 U4/pKLqsdTH6xZ4+kW8qV70GXkI2hrXpFKZH6AEJln20z6CPzjTDFafGbIlzzuyBpLDcXhVyo
 sxODBrNdUlZaw0Z/MyHJZB9euQkJlpsc2snw0PFPqr7Z5/ja7fk1omxpmTYWudHBlrykR8OuQ
 ZxYt0vo9Xp7PAzlMyWdxmkGu4qL4/9TVVG2gTy3XTLuOFgNdkvLzoYKKeeNZsQa+kImx656jF
 1jpe26Pct1hu/rfpUaVUMk12TL+uUWcChEWGtf2sqTGxEVX6mN6464pfF8xp5VeStWOGBnDXu
 yrYXTAykyXEt1XgjJjUVJvp089os4Q5H3oc3pxP9A7A0ba1vqMafQnuRPPF1Qr1jS5Y66LeES
 5fT/tSxIZ3M+wvveBtDMHkGuBD6HxsMsBzSKwY9O1KN7aMgf7AEkKLeZue4KkFIQ/85/k81KB
 sTxDgAXupPjLi09EbTLTgwIrqDL7X/DHovY7gm8zez8tgAnghK1wO/QDCDw44sr319ysGyyNU
 xaNxIknimjP79aYPd3LeSlom4ghx6+UKRkuwxEWSJj+NrKqSu1AX3oUftWaBMj+b3DoLi6zb3
 m1kV1EyYhHziJyQW0aD3nIVUcW0HPSML6SM9AqWlJeOKScXtxOdXamvpkaVWzk0I1gLGWrHeZ
 piZIZTorZ/SDNTB9RU1X/HRt1YNPUwU2I2pQuH2EW1SDgHbn7Zf+sPDJJ6OeClQKK/xG5GEY4
 SD6PDm2E1hfIVP32ZHALuG6lOswcEgyGcdJq+q1v6QRag4y/pgsHJCqzxaKxtfaazA7c/gVXT
 dgh1eCv6Q6mdSVZX48FLtNIbABYs+OrDBaiVNe7CD2xMdT08wQSVa+t4F2h6nPpj435X+e4V6
 ikMi3+ialsbAP3n5pWg1JTeMxP9xoEVzcBB6NIa111BtlpJaRtECWPsjPaxPY8qUvXv6/Zdyh
 jEQ8U0pIPvQfYh0aOSR5APxCzfFxOtFJI4VL2I2LzqkgmeWRJk0EVelVn8KsSUBQirlxa/MDO
 HvU8n7Zj22XtH+rB/SnlPLeG4+3XiB52Gwkem/UsxtjfwpSlB3lT+KkhqKtDVGLrLiFUU+iFe
 orrmV5SDdTn4S+vOacBQaG4NfA+Tpq96aBSSIAQPGeJryHjKk8Y2Wrv6MSXIjCb0JHFQxEMgc
 w8BozghlXH17Axu0Pd6QhNhqRxp3/7TMnwhkEw6z/S4Wda4oznmt7ap1KrnDZRWbdV3JFVjfz
 BW/H95B3OH6XYGV/jt97vDPGpbBZGnQi9SjukqUoWRMqgdNRI2L3khOV67hjz00HlZlM5T9WL
 SD6ClSA3PyOpiEaZFOstm+dqF3GXEMzazCtnZFvyTjctMfCI5WwwtG3TJN+XKUt+KOuKuFyBz
 stVwqeojYpE0ErGLOqUvcn+m1hYJZgk6ISy/NzCWwstGdnPkWMU7RxVnIlr0jdBtoouqcxD9U
 Igy5KbEcYqvrg1WiHai/LPAfCM9zT2K7bLMLgmeJAVSXaFnElAOfID2cZgP7jD23v3dzAErcY
 htQQZAglvJbzgratkWtn6I0ivrCO+VeSqbWXeV2JaljnuEZgag/6Wj52fpnnrxyiGkRnvL4Ha
 /5IKrxGDAtTmWpsV85MvyKda/brOXW5F8d94Bk/y9/5k+Tq5bP003melZVKSpYIzSZavCDtmm
 CaeF0Nm/4NHZi0CNX//2rMl62VF9/o8Nh/bznlGciryBzDG1KHxfteI+gFuECbVlFM33mAa34
 aO93LXUCOTa+rt7rjk9KKYACpjlmFsl6mxa1IGpHqX47Vw6r7tI01H37yo/DQ5qhEJXRavb8a
 wKz8gvME4XnnVY9I73vOVh3xoK7Pcv5Thg+la4izo4Uym1k/TdAZsXokyLY+7TCWGxmjqvKCi
 lE+nXYIOhbAq9hkaRT+w964cPthvz8tbkuNobYBj83PVq1N46fcRpwZI/VYkW1NjFFNgVHIXh
 2E9gwHlFGQ2rgL9u1DxoUHTislQ2y6Jy+ID4zsss6KJlvuHphQmie0tLg2AxupIZL+mnlPrVj
 71rw5QgOyuLL7Sh39iNQXYtR2iOUjVgG2ilvGsL1p/pA14BPkZhGTdhUzSxscrIsgw1g5tQz2
 tKrji7qskDo/tLYObwvIIZ5eUUPluU1BpJoKaDeu/3Af7t7KVsd/Ol0AbesjR7wLKxajU1Zm3
 y4isRqmHeD0s+f0YtBY4bUjoTKolFBcw+ItAcaX9m+HRLUrK4bSE885Q9cXHzwzvsGuBE10+G
 osn1hsQjXKhmQ0udCCf1Zo0fsi6NrxxLR+oR4CvcQPY3h9/mhe70hMoGQG1GSHSIRyLGgpIG2
 UwPW/N1FGRiRLi1PNz/UpVSRAlXawLLvWBvqM/d+a7KGTNXbLHM5zIXp6h04BE1GaJyBG0tH8
 m07QLDYW9w4pSPrRlNzQBW6nGmV1+LJucSp3dBl4YDTTirk0uyrMnDL4z2M6oATTloA7mTD6t
 5d0dtMisMB+H4rmMfYzt1pGHPVBdh2CyF8htxko9RzCgc/tbsBwk6ZZK1J/FsRsUFrwEHHk+d
 B/gDw1yZ15LTcY//prGHDn4gMMAra9AslhCjyweAfc1hYrNxNAggyRssZU8NxDQw6KA/P38/9
 KfVC0OTS0uYXpi0RzBVO1ViruVk+sevEfH8N2UkcZJB+ZJVKqoyMFXHI5s=

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-flash.c | 62 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash=
.c
index b641788c5a28..33cfc5d082c1 100644
=2D-- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -12,6 +12,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
=20
 #define has_flash_op(fled_cdev, op)				\
 	(fled_cdev && fled_cdev->ops->op)
@@ -34,7 +35,8 @@ static const char * const led_flash_fault_names[] =3D {
 };
=20
 static ssize_t flash_brightness_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+				      const struct device_attribute *attr, const char *buf,
+				      size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -62,8 +64,8 @@ static ssize_t flash_brightness_store(struct device *dev=
,
 	return ret;
 }
=20
-static ssize_t flash_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_brightness_show(struct device *dev, const struct dev=
ice_attribute *attr,
+				     char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -73,20 +75,20 @@ static ssize_t flash_brightness_show(struct device *de=
v,
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.val);
 }
-static DEVICE_ATTR_RW(flash_brightness);
+static const DEVICE_ATTR_RW(flash_brightness);
=20
-static ssize_t max_flash_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t max_flash_brightness_show(struct device *dev, const struct=
 device_attribute *attr,
+					 char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.max);
 }
-static DEVICE_ATTR_RO(max_flash_brightness);
+static const DEVICE_ATTR_RO(max_flash_brightness);
=20
-static ssize_t flash_strobe_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t flash_strobe_store(struct device *dev, const struct device=
_attribute *attr,
+				  const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -116,8 +118,7 @@ static ssize_t flash_strobe_store(struct device *dev,
 	return ret;
 }
=20
-static ssize_t flash_strobe_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_strobe_show(struct device *dev, const struct device_=
attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -131,10 +132,10 @@ static ssize_t flash_strobe_show(struct device *dev,
=20
 	return sysfs_emit(buf, "%u\n", state);
 }
-static DEVICE_ATTR_RW(flash_strobe);
+static const DEVICE_ATTR_RW(flash_strobe);
=20
-static ssize_t flash_timeout_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t flash_timeout_store(struct device *dev, const struct devic=
e_attribute *attr,
+				   const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -162,28 +163,27 @@ static ssize_t flash_timeout_store(struct device *de=
v,
 	return ret;
 }
=20
-static ssize_t flash_timeout_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_timeout_show(struct device *dev, const struct device=
_attribute *attr,
+				  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.val);
 }
-static DEVICE_ATTR_RW(flash_timeout);
+static const DEVICE_ATTR_RW(flash_timeout);
=20
-static ssize_t max_flash_timeout_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t max_flash_timeout_show(struct device *dev, const struct de=
vice_attribute *attr,
+				      char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.max);
 }
-static DEVICE_ATTR_RO(max_flash_timeout);
+static const DEVICE_ATTR_RO(max_flash_timeout);
=20
-static ssize_t flash_fault_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_fault_show(struct device *dev, const struct device_a=
ttribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -205,44 +205,44 @@ static ssize_t flash_fault_show(struct device *dev,
 	ret +=3D sysfs_emit_at(buf, ret, "\n");
 	return ret;
 }
-static DEVICE_ATTR_RO(flash_fault);
+static const DEVICE_ATTR_RO(flash_fault);
=20
-static struct attribute *led_flash_strobe_attrs[] =3D {
+static const struct attribute *const led_flash_strobe_attrs[] =3D {
 	&dev_attr_flash_strobe.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_timeout_attrs[] =3D {
+static const struct attribute *const led_flash_timeout_attrs[] =3D {
 	&dev_attr_flash_timeout.attr,
 	&dev_attr_max_flash_timeout.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_brightness_attrs[] =3D {
+static const struct attribute *const led_flash_brightness_attrs[] =3D {
 	&dev_attr_flash_brightness.attr,
 	&dev_attr_max_flash_brightness.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_fault_attrs[] =3D {
+static const struct attribute *const led_flash_fault_attrs[] =3D {
 	&dev_attr_flash_fault.attr,
 	NULL,
 };
=20
 static const struct attribute_group led_flash_strobe_group =3D {
-	.attrs =3D led_flash_strobe_attrs,
+	.attrs_const =3D led_flash_strobe_attrs,
 };
=20
 static const struct attribute_group led_flash_timeout_group =3D {
-	.attrs =3D led_flash_timeout_attrs,
+	.attrs_const =3D led_flash_timeout_attrs,
 };
=20
 static const struct attribute_group led_flash_brightness_group =3D {
-	.attrs =3D led_flash_brightness_attrs,
+	.attrs_const =3D led_flash_brightness_attrs,
 };
=20
 static const struct attribute_group led_flash_fault_group =3D {
-	.attrs =3D led_flash_fault_attrs,
+	.attrs_const =3D led_flash_fault_attrs,
 };
=20
 static void led_flash_resume(struct led_classdev *led_cdev)
=2D-=20
2.56.1

