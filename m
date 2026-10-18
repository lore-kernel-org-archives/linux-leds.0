Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E1F4C2240;
	Sun, 18 Oct 2026 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331642; cv=none; b=FZBLMXufpy9uzukdGbT6zobxGFcpzl+uLDw6c3qHB8C8lUOVn+WgbNrIO3PogMlo32s0eL5UZY4pE1LECK/mu5+hq6lRF5tByYImTtPReYE4LeZL15sptC3m2sSJYnMQcX6rEY1NSrXnTXANsE0h1dTub5hUty7MPWS39PLFXno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331642; c=relaxed/simple;
	bh=WnYFt1XMduRUchlRLDZsf+haDhlGJ468p8QWbvTIv0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjAJIDnamhCwEer0oXo1c0lXLkJlMF6eD7wJILrELO5Lnu15VvQLOhwQ7ZN9oeO0jCI4evigIKLDOmRW+ENP02BqbJ5rcR3bdc/Vz0v0ibks+qXCug3uHAN9Ot9ORKnK4f2mCQloJO1+Ni87pNQufaZZBtJExIVGodiQH4EBrc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=mHL1dgee; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="mHL1dgee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331635; x=1792936435; i=w_armin@gmx.de;
	bh=H0G/RmepEU51NehljR1Bu6ws2StYzJIT99+xq0t99Tk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mHL1dgeefWoW934YYA/s86wDUGLz8o8mwf+4c4L/p12A9eoZV/6MoQJyDZf9GVuO
	 WbzO5083pStHKSDHZ6rm/8kl/H+GI369aj+iaNwG0ayZ+LKsu+Ll5URHYuO1ng5mU
	 Jvx1RUMYIu8KhFbbFn9xIxLxp174A0T+DxzID+L0wm/2ywxWD93wyIhMI+KKJxGfU
	 /owIxgJYBnz4ma1iU1KHDGugGV6xP8+sQapPAkgoZ+muu4VEznHm7aCL0Xjkyh833
	 5TgQ/aJ1NLPwx5qVOoIuwt080LJw8RCWJblGab73YHH05u+I1AUlf7FQZNkEGBSYJ
	 Xh8D4VfcRnIFOZA4Rw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1wqZM81a95-00n6ZH; Sun, 18
 Oct 2026 15:53:55 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] leds: class: Constify sysfs attributes
Date: Sun, 18 Oct 2026 15:46:20 +0200
Message-ID: <20261018135339.1109271-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018135339.1109271-1-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9U5gvtOibXaJNc+czIKJenS4In7FTAexHEqZR7Zk19rj+/CDw8G
 xIGJ1j1iIVg3fmQ1P/FAhRGXIH7F0w5dfPfvOi+/Q+DmHad2gB9sGQeXwmNnKidrIh26eDJ
 EKKNxh/MIu64KRAZo10jTBbS/rPxQBHYaavxlUZbVUfT/+WFiknYymcFGhmSM34ME5Fg5U3
 0ABR0mxu74JwxdAHDNAAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uwSRFNZen6M=;GgkP2Kx8KwXhdLGugN/wdPBf3sE
 2Z4IG1dlIw84/LBkrbjltnk56FWvvRF1rYytQxkN8W1fMprWcsuExkGOxpqW1ECuyw7be2vM4
 fXQk4yaJGR4WZYIrdWpR97pL+oN4PyTdPuTtoEgI6YTg7fDGIW22YLcplg4mzBLOByEPKIy8e
 EY2EJ4N5n7f4BBMSn07XcujjUlzNZjcZQ1tBwN5PrZfVhMRdIdwJgCQHN8LE22qk5GD2hUurj
 BTX118+/uiBhXq70tMdy4F9CCOfrJBh+oYAQ3cCb0BL1xoRm+MbrqvOqDobuoF0tnphY38lzZ
 uFeAuGMCLwzpp+3T8qiX6rcUlxRaep/fxfftTf0Ie5cJEeiItuBEKh+CTIh72A/9XGQNQQLoj
 SKP3sf8sbBOwcYIpJ5NBTt5QqG5fSLkqwvt6+JuelzR88SPDfxmk58fpHNofJ25UhtFTiepd6
 r2f5lZZIopXv6kUfK/B40bSqSHLLotsuoCJaEHNDzlIFb34+CRwZ6wfvExrHfwH2fq8eGupXa
 0KA2cTWeidN2DCGckRGzrItI78kafshLohuKkzDV+z+zgv90R1xDB6g1bX+8iskTQ16v6w0s9
 ztWkwkUCbZY2vNqu2gIPrJX154Sak2JGNBD9r0MwHINyrgIoPALlDUgyjkT8tYcpBMzV46KXH
 Di5Tn6LsnnCBrEMQo299oHu+zfmVeiLbt/CYACXiL6RaQMYr10Qv0ZrtwpRTyuidr1H9Twq1N
 1CVtaQ80YQ0XZzdWIuVzJ0qcV12/MJfymbWtQElFYQW+uBIB5GWxntJRv2tGyYOqvlHAl9bes
 QetNCEqZ++ZdH55k0/3wh85szaRXZkELHj7u74iHtVmousz3Rqq5aXlelHMSG2SURIK31jje2
 d1ew9yLVYq0JQSRsBXFrmP+hjW4hDB54KuBLhgqzvUHnCHTAm4ocx90A6goS3hc8UFU1+T/h6
 vB2rfXGBm/rcl1tLXRoaq26PbBNalf81L6UZuz0YWLf0WcGN8pmyEtDwqCvS+mSg0AQNgIk15
 cOYFLbMDOi8dimpoPb7p2nDgtdP04WeUiX2Ek4gd1vlz11FiEiMJsOTlDnhXk4IRY9jLsNcVh
 4VGaK9w2KpZFhIzssb98vdCMm5z1WrfhBvOeVmUd4MLM98j7feP3tT1DwI/1evwNaA24dy5aV
 bXz8tIV6PC1PrQ5zE5qgcG3Efprl12LU563JXn6jgLmmafIm2CeBkmpHkUyjhiKKTtNWMAuNB
 aTv8U2TVzZLpJ+YcmylmqN+84g2ErsCFxUaLOWzqUbHAgpJ5guOrCNMnIFGyd0A03jMQU/7IQ
 lT4+eJN2Pg2b7jWAgWReTgZ0cJdX/Lw6yl3LuLeMpENbmBwceeYBQL7P7ZYf08S5U0t5ECtzn
 LYzK1dABwUlKtlYVbdoNcNXLhQyqTxkkHKKGXn009SkfNwrl6/jKX8ra12gZhtWGJMS6/p9dB
 yB6qKHc8kh3jqIiKbLjjehTDMmBTnzMlIRlYFCHYKGSqaSWMd1pcQkCCHjFkrtm/LAMg/GLew
 kyk+6VWscId8Eav2Dlht+RsIamOQhj+5Vexd7wwA3UX980sWwdAb5pa8zbNyZ7J/YWN/JNWgR
 Py7xwrRRAp68CtGrlYJxkX2rluhaWNdRYFH1F8YeqJLCXaBAFEf1KFTB5e959g1odcEv8ZHi3
 fv8foUJWlVr3j9Zr26GfOPYd2/Cx9wAsj7hLMB81fSqa1NFDyfb7MT94aqv9EN3TFYsQ09D34
 dcPMjHskjKY2VDSebLCMUitdBmiXEjEPTrCUyJi4LGomsyt1Kd4bIBikP5M3g0votDush5k1L
 OIEosJTwdHRNRHzutLJ8jUusO0VTyRJfHFQbTxYrkIRYT9KZRbWWHRZT8TPpvQNl59Lqv16iR
 rrwY+sgzUQ2MpD2/hhClFFtq2gGtiunh3uMZWbfuFsn26dSmKphjHczaNsmlXjsWYmLW3br2s
 MfSfcc4OYgHTv93C/D395yObJcUAz94/yU3kwxRx45GvV0doIO9WYKMKh3ORGWC0N487hUt92
 VLYOwfx5eNLkDd8gxCplmS9fpnB+fMTsoFu5Ua1L6pzgs+9LQYLSuuKE0hJF/fBceESszsCE1
 BAgbtUKfZM2Mdm94GZaBObbAPFLKGYeeuLQb5wGMnfIJ7GquNBXZr+8RezcmMMhJUgKcXUjhj
 OIf119d0PkKRlsSVwroeWqXOmbzWpdlVZifAHeyt4RqxtgYYy1HDWU31nB/kzO+9cqjJhUf1Z
 fcXTTNot70C31BUqlBip1TmrT138D6XYNPWc8hB3NsjF9fann1sSw7NDt/9LKGysZOwxvPQs6
 X1jhy42mrTXYmZYErFvJSLQrgYdLQ+gPkd64+0LommMXx1+VfafxIPbWU5HSwzPJuB3/L83ET
 oWkr36wfR9ZWkzsAXWo6yh/Z9BGZ3HNUAhnhq/6LFtNjR+9MtqkAu5gyFIWjT3WcFGDpzjVVK
 KLs/Umna+3p6b4Nd5u7jVsrnEtLVh6DDV2rqIbQdo5+77VE3dBv9VdlwKlmkuX/ycKIBsi8Ix
 yzSVErMVFoPTfnbwAuXOxTxOh4Wvm3j5QiOzeALwyCTuR3JjjgfTJ3vPH3yQcJvW/hzZhL/DW
 4Z9nCpH6WUq9rv2up8kbz1lqDT6u+hMY4Aiu94my2qsJJ0wPz+iZvqpT+Hg8Pr4basxQJaVUr
 l0kTLFFmhQB+gKZ81mswsqGOab7k/HPa9PpOvroPXcCYXfdB9KuYCH+4pXXBUiKZcRd++/UIg
 s6ipwNAiEt6xh25oCAibP74MMFv6a0YnGFHgysSaKucXbqdcbfdN+j94IryrKETbwF5QKTMkE
 7/9ScQl/NnSsXNnJjSgUQQ95kgfQg0MsFbkX0sg+j3VinslthhmFA+fuf+5fNay9doTa1cUTJ
 7KHNNay4B1Ci1SPk07kAdPUFprrIEVYLR8AwZJYbHqMVN6euSWR0dfa841V+a3pKm4HWELqVc
 QyyLYgTNQriLk6qJO8ahKik7Lf7gSVxQ+YFLjtpEe5iavSCUXm9Cj+TeOrAF659kLQKHUt4xn
 uc7+yPoWueqyPh/n9gr/7nI4biObOdkf+e/f6OIi9EgYke2yBV6gaIsQyFqBHmUZaxcOWKa93
 lz+D2bvbRvJrxCAlzB+T+zpCt8g8HvLoP9FDawoePqPqnfFJLPxI1gapL0QSCHNm9h/S+fgBz
 mfOEHAAndhcoR3Cf50VATskJtlFmpLNaUnbcV1ZtFjTO2hSGmsjqvlfLpDP+sa1zi3N/cuMIS
 U23yE+722Ppt05bEgf7tZG7SVRxo936V37k2poQBeOnMv2HIgthD3AjeeBEq6Rk8VAX1QuDOx
 rYlU1U8lS6Ij/oZTN/aYwokkVYeQoKM3iSgLjD/25D6v3s7rQIAIZnKTYVcqITWKICl9PdZFX
 FJloeyBUqaX4RmqAIwVQ5nYLirBncYpUmYyymtzPSxlGc210tplFYMKPsOdcIZmrk0Iebojhb
 Dj5+3p9ObghCsQkKOEc46/Z0qH6AhLRXD1hN8ySbHjLwHgK+TGUpOQS54Q8MnGkTcMgqMreHb
 X4S6qbicI4kKnspy1Z77H8ZczxZEuWloELB6VUYxFW8jkH7tzuZHr3Zbu8GBKFVDyyc6zMLqO
 lx9+qcGZe5GmUxUDT5QOXpKiZuHHGymfKIGdF72hB3pOaNcfR4+CD/TatJeHiR7mJW1tkAgZ3
 +8Yk778Yq1fNSxLiVdt7WfgNhm32/vLrnoRkNG5wxR4E6/2sx4tYs2HRN1gSVp37MNw7TgL/a
 onFR58fu7hOO4uSdHTbeyLvqNm30Jg7zSfWiodBfOlY12BFrItiCGJ1NDoZiomQ4U8erw+xbv
 gk89Pk0IJavSVa4mKxupllsmXIWX9YEUcgqv4A3M4wJGkEp/AZMbcn2Mk7k39TuPGU7e0lHi0
 4vQPhHUYOsLKQE0pHzNE45R32zrJ2kGdiCcro7SwECSjvcZUZN1p+AAhI/evovbz8AJrjrrkH
 yHhe1pdRHUwSq/lWG65aOfX+ZDNxMNCjI8hj/D/VDiXyb8bpEwBwCmNe09DCdW7+6Zk4+Sagr
 2gM5C10oBTrPmFJ1S448gs6kufQQA4Weulsh+tTg0PdvLxNKx/fL9hcE6ctqooO62o8/hTbh8
 7O6iWsQZL4dbZOiYsSwwZFI5lxl+l40XtRySfo/j9SJiPJfynGqdKDdAq/1SGjGr2nGmFdtNV
 DKYTVNEo2S6Jp34y71U5dd6A7pMai3Q/vKSqFM8vm5pz1unlelnmn18eOxtaaZdxOCsNUafm8
 s6qOP4+IKn/LHyIsrX95HofetCJdHHQ069tzyk76P3i+votw5U9WhZ+FnLNT8MjJTf7PokHJK
 tGUnfL/Sc3LOBOIX5U221h9+HpotsQMRGG7q5bDWWk++vaYVqvXSyZttIEXCwCcq+8BgUMsNz
 cB85MVEvVkNaHIxGqPLTbt5ap2zT8JuvtMsucSOm97FC2i3He7Hfgnr3FySt9i3cM6j5zjpJt
 wIzvYd6sHGA6uqiw0MSriaCQ1wfopQmIj5EtMNC4GqRdz+ihgd8xqJ2kIVR9rWakClSY2uuWi
 mdTA156nNqsPhFwUInfclMUXj5rA6J3gyemarI5kxDqLV10jXduVhhfQg+Dguvv7MclZRhkrZ
 4cT2pLbAFeu+sVXt/RqMM6H6/nerzVPRNSLIw9WTBij2nH57Q8r15PsgYQRBYR3Ie3I9/VYLT
 pDm2bo3gSmrCHfH+PRC58kBw/kifQtu1UvwPlCJtpzqdI4Uy2uhb6QSCEBncB+KWiaswcAUJu
 3jLtqEZinuj3VqSUXjEouW7fuueuLQWMhja9JVH+ycq4mHdTPbof/50EwWbf9WxNCCP5Xyktt
 pbPGaE2fC0bo01e2iCMCDwh/aZqu1Ca7dNazdSKaXWRcGsH3CyneS9spek+tp8d8y2C7KynHQ
 KFwV5BFpjmj0InE4RjsvTQ4ZOPWSUIkIVbd10Hxvo2Tt3L+9oh5mvYFOT5oO/Xh/vfb2i7p1v
 CnVx2f7sw+aCWwgog08cpcAZor8CWdYRS527QWDpq1/hYv6YgL5HBWOO3BAvyCdcTxA9SKvII
 6B0wyA19bLYm7HrYizs0Ht3UA7bYo4CPdhMii2KBKnSd7QjhzegJ2xkEc2yomjNqvNQ86ET8i
 AK46EndmbDOJD9rV1WLWEX5cqa8gN6oyBy8b5DspcEzOJUuNoBBRUBLplQrSpeza4OY48vQgx
 VWSEc7SLBtNV4Spw1156qMObLN8PI1w4Qozi2UIlbxnumk7oazBNRfuUJfHHEJcr4f9hU0hUp
 XEbrUGkdtFLezAvZTtM9lap3dPez8saWluIrOYhsy122HaqRSgSf6tbbPDGo4I9o37bvIq+qT
 4LejIJtbTRzPVu1lss9715Oc0M2+IftyJTduVrp9ClOrVrYZs9z8noojcjWxrHJ/K4+KnwPmr
 FEVb3S0BLGDL6xkTHxXksSQ2n16viYFtirCoMoCZ6JkcCH0sgummldbk2YmdcS6cgzJSU5C6G
 8OIH7g8qCLNgRt/MwU3VR2c0MfF6/bTDTm6ak1VxzWOhmw/cnz/y0TZSetah//Da0bX3u8+44
 L8aR3s17BzBzH2DzmBB2ToIecgDNU+avXEiJPK3OjtP/mu0d5iIOpKGKj0m86Ankr42HP56AB
 fs97C1nmQxJBXnccO5EkDYlRQ5rtRDHXZOE14H+TggrUobB8UU93M+OENWWj6lgkczVah9LjP
 UvkipvuO7XljPTz/7nktCPTR5fkvr1Vt8fC0y6fSYpLtWL6d+/RsUarHiTikLx33Sr4SGNZsG
 +novHj/mr803exnM1BY5ldTP+mc8PzHWlJ06aA4uWeF9w7UJnz7aWVHyNp33q5r8BmiebVq55
 VezYkGz1lCSaBhV02FJZpoUFB+flAezd+vYCUvf4LHh4GRPNSbHYpwa6U146g5KD3tqAUkpOG
 XNHqQWdbWx4u3HKv7OYpdwWUuvRc8R0I1SM81T8CeSfuhacXDd4WrXopEqT7SnT2OxKwclQD9
 NXEMA218U/RWaA29T9CmGMR6WqY64vZSFdBDLyAHXBy4LMKu0IcNY1hxOBON3zAQqfLvB2cIP
 El44JI+XVVgcgAPb3nG30kXg9TnlIuPm2zhqfsU6+ULviBQCh/F8WIj2FLaMiU08aoSzdbOmq
 Mnk4Fs21Ew+xFSZY2+fIKHT3h/2F5J0mZ4WMPCQBr+RgYs8ak7rmvwJWHxNm4yDyTty5RSsFb
 3Z1zfIF7ouBEGwSzyEUij6NMFfYhkOgyuabpLWrY1yJvNy1L7ETNMmPoefNBJzgGFrnxyimBU
 B1j2hb/+HVbwIF4vr/V9eRXd+ybdSn7DyjqYjxBwGBqYzTesiA7IFtWMNJQI8TWsglsGeRmHT
 fMkSgCzLg7DX/seo4PIMR3S44EpCJP95RBu/o2pG1hThA14Hs2J8FWE7A3U3hoyFX+A9XiGyM
 mcmfh/Qjp6dyVoL5fK/XfYmMkeTmCMimoai+TCemBxioFhxYlcrf5BtBRnGXbmuj78cFav4NZ
 TnjexxkbWVLM66MUg5O4gzd3jtDAEGGeMA4xmhGninjbfYCcknSrv86KHmTd8Bicrc2ba9coC
 hv4Jxy1DaGpXd8rmgCAtkhtpqRl00U8+teqz9DgCtOuXSoMVGGhGkwpgSDxopRiLPy2BFJ5Q=
 =

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 00be3cb96c00..3775ad13762f 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -27,8 +27,7 @@ static LIST_HEAD(leds_lookup_list);
=20
 static struct workqueue_struct *leds_wq;
=20
-static ssize_t brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t brightness_show(struct device *dev, const struct device_at=
tribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned int brightness;
@@ -44,8 +43,8 @@ static ssize_t brightness_show(struct device *dev,
 	return sysfs_emit(buf, "%u\n", brightness);
 }
=20
-static ssize_t brightness_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t brightness_store(struct device *dev, const struct device_a=
ttribute *attr,
+				const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned long state;
@@ -74,10 +73,11 @@ static ssize_t brightness_store(struct device *dev,
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
-static DEVICE_ATTR_RW(brightness);
=20
-static ssize_t max_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static const DEVICE_ATTR_RW(brightness);
+
+static ssize_t max_brightness_show(struct device *dev, const struct devic=
e_attribute *attr,
+				   char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned int max_brightness;
@@ -88,19 +88,20 @@ static ssize_t max_brightness_show(struct device *dev,
=20
 	return sysfs_emit(buf, "%u\n", max_brightness);
 }
-static DEVICE_ATTR_RO(max_brightness);
=20
-static struct attribute *led_class_attrs[] =3D {
+static const DEVICE_ATTR_RO(max_brightness);
+
+static const struct attribute *const led_class_attrs[] =3D {
 	&dev_attr_brightness.attr,
 	&dev_attr_max_brightness.attr,
 	NULL,
 };
=20
 static const struct attribute_group led_group =3D {
-	.attrs =3D led_class_attrs,
+	.attrs_const =3D led_class_attrs,
 };
=20
-static const struct attribute_group *led_groups[] =3D {
+static const struct attribute_group *const led_groups[] =3D {
 	&led_group,
 #ifdef CONFIG_LEDS_TRIGGERS
 	&led_trigger_group,
@@ -109,8 +110,8 @@ static const struct attribute_group *led_groups[] =3D =
{
 };
=20
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-static ssize_t brightness_hw_changed_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t brightness_hw_changed_show(struct device *dev, const struc=
t device_attribute *attr,
+					  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
=20
@@ -120,7 +121,7 @@ static ssize_t brightness_hw_changed_show(struct devic=
e *dev,
 	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
 }
=20
-static DEVICE_ATTR_RO(brightness_hw_changed);
+static const DEVICE_ATTR_RO(brightness_hw_changed);
=20
 static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
 {
=2D-=20
2.56.0

