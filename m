Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780516;
	b=LmY9sBMneJwYARUz3KutmSzOMS9akb9Gt3E/XkSc0frk7kXvhPb+8pryKB5Vai6B1CMs
	 tWEby/SuDuZY6MJWZAYqZu/bgn7NHvkI/HoV6DmQrowjvrfsVzDRPB32UmvL+oVdTvD+b
	 I9lufvG/ud99cFTYk0m6SJqo5W80K2PjTH1MvuuPVHC+HzVaXxO1mEsd1ygCXOSvUT1Hd
	 gkZh9MfLWJBTWQOb8RYXyYI0Ze0Tph/GHJV+a6k6sfl08xR+a/73Yf2p8/ai2Xt4q2WEi
	 DOl1hfbuGHP3k1nohhQihT9roW2N1BM0OZCHLkoNWoKbKmh6ThMhDHUCqBBgXvWGCLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780516;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=QxbiuGqe2fePqSvT/epoYPbabuneSeNB4wpm+AMD6xs=;
	b=MVg82Cu+c/2aQQ/bBKkvjGiAcvH0y72SrMIoKAObA6S22O4HewO6rbHa6qeRmLwXnFsE
	 l5sEdjuRwoGhJzgeb0FMWVs8KHns8PuOSo10EpiRAlaE6SVUhHMHkLor4PXJ5bhwxfjAK
	 52AnNIpm9jm6WgYWG0fwnFcSA5/0Fv10/vYZ84Jpbq1Mf+QbjWVydj4B+CrEekzzOxTvZ
	 hwCOkXUx8bAsZ00Q07hyT2GxR5qzGwmNzKYOTAxku0J7u4OfhTglNrUZjx+0Qao7cOcDi
	 cw+jE3nxIYfEdpCRO+Shc/oPWUKc9Swt1szojf+/pW2LjHzWyfZCW44NksPSyn3BBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=eI6xU4Ik;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eenQBNRe;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF896606A32F
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 22:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF896606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=eI6xU4Ik;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=eenQBNRe
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 578FC1D0011A
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 17:08:35 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 17:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794780515;
	 x=1794866915; bh=QxbiuGqe2fePqSvT/epoYPbabuneSeNB4wpm+AMD6xs=; b=
	eI6xU4IkPXJ6E2MKmzorEvBzCwd3ZZ+wXkYxY+Cxf5Y3yblqy8sOmq5GMKzWjyVB
	tdVn58LTYKsp9El1Oy94MFjaeyMLnjrqIJI9pkPQ1VqZc1yTPhB2M9i2fA9arfoP
	1YqfwvmqHqZDct5Hz9A4PFnjlrXE+xeMsaS0kcdf9Zz+cvGyXYu3O1+qpcL8F8ZD
	yrlWcdnLnmucFzS6Q8bmDdPMlnF41n4bSPhWNk7zgBY/USXaafF74n6AjYOk/SVY
	AnhuFmRWGqqkSUjIH6k7BDNHxFSoEFAV7qK3HT3ghS5EqEfCY1AKxuqC92JtUSv3
	JIfrvlcZhS5u6VUvR7aafA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794780515; x=
	1794866915; bh=QxbiuGqe2fePqSvT/epoYPbabuneSeNB4wpm+AMD6xs=; b=e
	enQBNRes2BANRSwWV7XjBcgj164uBLBnz5MzG3yrn1+BOrdflkrItjDiA2cCbi7K
	hJhaweTrw8KtpJ5sap+HoX93AukeA9NHeWu5mEAQ+IMTl20zjPXf1+LJ0c6vAr85
	FVNwPAoEpfXS4k3p01sVWGS+Fk3GitbnJrhwoA/bJIeg3JbINhm7t1q2J3k0rPqn
	Adp6y28cLrQrwxHax2LWXdN9OqCyM7xJpwVSZ/a7rHLGNqkffwog23zXPOWxv+q+
	oOgEc07W+zRJJ+oOMzm7QavVy5Zi0wttZ4Oar75H8fGpUqTQ16J8orbM7zWPja+9
	I17pwRDfhDTCLEYiJyGww==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794780515; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:bZEEkU8ft3XTAQcQcpyJ4SG2vG1RB9K59B1QqAV4jjHIoP3
	VX9LJnBvZPm1NcMzquOePWXEk20r6HPjNbXabaioWgf1fWIexJuSi9dhpSe+eysu
	lGy1eJ7DrFsZHtFAm6huKyQdEe7UX7Wyz5ewp001RJUF2Jx8Wi2o/UrKgtLOMhSh
	oAg1dCnx+hJIJ0uB2GtyD6ymlsJ//GahXZkT+oZsPimyBNYAClt3+2kW+Hwo1UFF
	Nj0n5Dt9f4Nr1R1Femo4ZoJruOPowQPmgy30G3XaDnDOiiMSjnN2H71EwvL2+d27
	beAvdiZA82us4JwOJ29wifXx9XqOgsEvMjuCPcA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:CzVWJmpsLmyyrS9aBGDABEaTIN2LDQOlku2cPIdYnpY=:zEUhPIrjTSkojHrzpvMqXAO10oHJmaZnHwr0M+4LGlU=;
X-ME-Sender: <xms:Yy36anepCDhpf410gAIM0IjLV7tSiuN2ijVOBpFvfZQJAHIGD2Ii0Q>
    <xme:Yy36aoDlM-sqkQ1YQL4QccKcFGcDyVuGcpMyHL0LWrCInAQA0yKC3Zq9hgN-Q32W1
    DeRRj8C-7v_JepBgM_a-XiYLm24WljzR8BvajsjWZDGKMjjVmOu0ag>
X-ME-Proxy-Cause: dmFkZTEpZWTQkPBu4pRt2xILBjD3GRaRNfRYcF7k/pIBq3KDYlIE17PViRtCqJCtePz4db
    VQSvt6AuqjU6EsOjYUQWPjbnHqpEFmu1Ch0h28h1+yF/U5uVFk+vQjHwkqpbw847Q+nGWJ
    zWbIBosBi0kZ4272LW0lHikIu3GEgV+CTcgmNLgSepnz69tbYEhMkWIcUYHAPFDlgFsVWk
    pBqk6kQBigRoNqnzOmfeKDRDYLqa7sIbgzlm6BFB3njkQn+nZqfYTwOzMhmwn8HzBgGa6K
    jlm6LAfd5WViwUBp7cm2HClwQZookb/Amr4anjYjqZ1nepkLVfBN1g8Fq+dOyUyIdPM6la
    InKGPzwML0inkkCiem304z2DX41oCKHqezeslHWlcYL8MRMXiEBPkGCX8Q4ysSAEF8rfVH
    y/DaoI5Pf292782Z6Xg4c/6fy45Vmu6IbaOh6ww3agk5txM7+HcLgjUGJp14utGnQNrEjw
    M2IyHCRQW/C/UG9o8KAnLgQ/wIZi9eRISYw/4SyHUW2SkR6LEHJgSgAbzIQa7GTDwZwJ05
    xJIw+ATXsAW1SEDTWzSRbqGTeZv+nlOGIOukfF2zs15B5uCptMZEe2xHuSGzmKV3qIkzUR
    Gz4DFxR7uSoKlV1w58aO9g7bMHIBmIYxTDo68Nb0Jf9IgTbjVRh0FK1bWm/w
X-ME-Proxy: <xmx:Yy36atAmc6bB7oro8fZnScQo5T4TxAp-MMaEq7QUpCPkAiiapZSd6g>
    <xmx:Yy36avoInDWn-9rRfaMdtPP4AmC1h-Vm1yv4taX-luAXTqLht9uQfw>
    <xmx:Yy36alktPV_1W5B3f4miPZaKSNQoyskTO9Xe7c7J0gvBTCsqrobCAQ>
    <xmx:Yy36aiXht0LKrpH4PTdod9-6M4YzuMXnajq5X9TnWtB_ksnd5_zhcg>
    <xmx:Yy36aoqgGQYq0Da0NMevq9wCyVMm1uelaiGvN4HBKrku4Drv_VsFUI8w>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id EF47D2C00085; Sun, 15 Nov 2026 17:08:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A0yD11L880sc
Date: Sun, 15 Nov 2026 17:08:14 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Andrea Rabbaglietti" <rabbagliettiandrea@gmail.com>,
 "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>,
 "Griffin Kroah-Hartman" <griffin@kroah.com>,
 "Vishnu Sankar" <vishnuocv@gmail.com>, "Vishnu Sankar" <vsankar@lenovo.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <5025d16c-9d9c-4319-bb83-4762ba174221@app.fastmail.com>
In-Reply-To: <20261114174814.62153-6-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-6-kmatzkaczor244@gmail.com>
Subject: Re: [PATCH v3 5/7] platform/x86: thinkpad_acpi: Skip LED suspend/resume on
 auto-mode machines
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Nov 14, 2026, at 12:48 PM, Qiling Zhu wrote:
> On machines whose EC supports the auto mode (MLCG bit 20) the firmware
> takes care of the keyboard backlight across suspend by itself: on a
> ThinkPad X1 Carbon Gen 14 it turns the backlight off on suspend and
> restores the previous level on resume for the manual levels, and keeps
> auto mode across suspend; after hibernation from auto mode the
> backlight comes back off.
>
> Skip led_classdev_suspend() and led_classdev_resume() entirely on those
> machines: the LED core no longer enters the suspended state, which also
> removes the window in which userspace writes and pending
> set_brightness work would race against a suspended LED.
>
> Machines without auto-mode support keep the existing behavior.
>
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 681b340a1..f9e2d324d 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5317,6 +5317,14 @@ static void kbdlight_suspend(void)
>  	if (!tp_features.kbdlight)
>  		return;
> 
> +	/*
> +	 * On machines with auto-mode support the firmware takes care of
> +	 * the keyboard backlight across suspend by itself; keep the LED
> +	 * core out of it.
> +	 */
> +	if (tp_features.kbdlight_auto)
> +		return;
> +
>  	led_cdev = &tpacpi_led_kbdlight.led_classdev;
>  	led_update_brightness(led_cdev);
>  	led_classdev_suspend(led_cdev);
> @@ -5327,6 +5335,9 @@ static void kbdlight_resume(void)
>  	if (!tp_features.kbdlight)
>  		return;
> 
> +	if (tp_features.kbdlight_auto)
> +		return;
> +
>  	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
>  }
> 
> -- 
> 2.56.1
Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
