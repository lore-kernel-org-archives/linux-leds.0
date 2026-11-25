Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633790;
	b=WOq6oi6EljYQwM54SKYeWx6r5oz9zNVJ4KBIk5jpt2MR3S6p27RuArySEExIwvSo7qeb
	 jOPkHso2g1YXf1cYbft8P9cuInTySwPQucaKCZTxCQH9ZqlgzkyBABdMbudYaPwNgAmzl
	 M7etcBnU9tlHr2qfVxYLl9ylTiwg1xXopF6IRL7/qKRH1nPoPpviPGK7F4TFrIT7VvllK
	 ERgEkbAfXUeWpIifzGDvQ/pIT5SJUbsoqYNInax0fqY2lnTYWdfTS20JVM5uQKhttsnFd
	 dIEkfsIhb4e/G2zjle8BAljpbWATr9ATaj1aXmzdgtuG8FbxCOXYIyUlOH1oagmOxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633790;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=j66RKb5l2l5mpAtY8HXgIUDK8pcSYZliet/rKrMgG/A=;
	b=HcYe5j7RPrVMsrUhkxdZ0DpN/dsyyPflDmIJpMWKulPF/4pFrv3b8sP4p/BXb7CCD0Vd
	 Z2AOMlIDKLtYleBAHmUXpSYKsb8DIDIheKgawxAoCmLH7PrcEzKAtXSNKPfQlWQU2Bu78
	 DR4P+03Cp7c0eRlQPqkLODatu2IlwvNTxRprEGMsFmMm090bG+q6a0jbTUm3RYY87fbcF
	 l4nwGwhgXfkbMHom6Dfl2MYpXEZc6Xy/6bM6R26h7dY3wEj6ngyAF2YS0JWyddcvQPxx9
	 PUCU8HtukJ8XzUsJq4jZsqQ1a+vl/bwG1LV/rLnithZWN8Hy5bfQDxfBgBgzmbFKXKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=CuOaT4KK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="I/OulOiy";
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E030A606A323
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E030A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=CuOaT4KK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=I/OulOiy
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5B6197A05A4
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 14:09:48 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 25 Nov 2026 14:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795633788;
	 x=1795720188; bh=j66RKb5l2l5mpAtY8HXgIUDK8pcSYZliet/rKrMgG/A=; b=
	CuOaT4KKTqlIOPru7/uoGPENJDMQb5GSnTAkfzeSYI/sug4i9G1YjV22O0io7aW6
	SOaFOxYMUFOd4qnyXA3TNb3UB0uiqBm46hy1Ka/9ALaPf4KfuMOug5X4MlVGwZre
	+Ptswu151wTOTt4lLGOdIUHu5ac/FEXqP276TjMj6z9WVi3ixS8Vymn0W7gRzPER
	pdWK4RUc07yjp3G4FRNhl6dm4q0lSxOB1WJGDjDlkoJ/Fd2zT0ydluzD0NN/UEr3
	DCiLIKem8hemBIaPHEbGNdXSl2p8wGeK28cEfva1CIdFDvxSKqbaq/31kIbbGIa/
	msl2BkE//j5+9G/ztxce8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795633788; x=
	1795720188; bh=j66RKb5l2l5mpAtY8HXgIUDK8pcSYZliet/rKrMgG/A=; b=I
	/OulOiyatYVPhKL1fmm+ClcF3feVeR5/A0Mq5Rjsbqu1buVNTZsLMw8Xq0LLgVkE
	BjNlnQ0IqY9LEOoTF76LY2qDEJqJqe9ADvim24Sa7uHRPBbIk+fRPsnMNPdyTjD3
	/43UvDfslveRy9J6eWNVEbLcsFN3iePqCHK1rjAELr2BuPB/+BsOATGb9uH8sFU2
	d8odCIsBKRgWYfRIQnl1bFeqESw+x/EOJ0lNbk58Ly5PU9inTBUY5YT3ZRpWXvQu
	mmCBDajnF890Wse8vzdl6YNwDz998FZTD5ssIqkPplDG7d9Yjk2GIS2KSXvtmKGv
	znlFLle15b0+bbD7zhsFw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795633788; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:eN125p7/3xSVbxZfh+okPUs2PbxZtBPgsouPrtK86Tu2f3o
	my8a1q0GtlMcYsgzASM5mMF3mLk9mGeegoiAfziYbU6czqllP5gPg55Webj73pi8
	RFoOQ/MHUORPZPOWBTbUyAAIc5bwuCpxK6oXflOiALwcpF4389cTIjMTRw+YPOOh
	qBIwN4YNHynx8ryYXWIXBozDiSyC0vdcIXllM3FPGI+26jVXf/nHcOFog7pzhhs8
	TkJcNqDf64w+psehf8JALtn0GLuiZl+2uaPodYXcai+FOv4tGWKCba49FtY5o2Tl
	A2l4z9syI/58urpvMfv2na6LwgskA1WBJjlkTBQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:yfuBIi7hVYPol6wkIi7AhdvxOOzxGOf95xvy7CATZ2U=:cDOxVkY4CKLQwsW+7YbuB/+Y4dELsoW9itMN7kM1y4s=;
X-ME-Sender: <xms:ezIHa4FBndDCl-r6GtGB67uDLGutDP9I-b8yfPqFF_N6y5XbY4rAYA>
    <xme:ezIHa8KdSTgDeIYjgp1mw5UEBRe_kQ9tMWyzCQn52w1AkFx-wozB9HXzlt60yOV0T
    TjTuJILaXtPN7XBqU29oLIXfByKYNx17_6YRFC8YaQGzhfVtDyGAs1y>
X-ME-Proxy-Cause: dmFkZTEAS9i35RwxKrEukZh+BUpLuXgL+MPQH1yJv3Iuj20lOBTFeojOWEwWkQHa+hR1db
    XR+t/qzQPuZIophWefuEorAkc4cSX9KB8DmDon57BLE1t9ENQkCYj1EqnqERu2nMu+4zHG
    /0x0dcH3sTbg9iwB1ylIHcJ9Q/hLDAC5XAnad6kRyw1vW/9oHrFm1mC3+5ipj2ZVVGGZcz
    G4Ky01Z0U4THkD6Jbxv0NmJ4BtQX86bkgc8a0LdLZksWcFUtczQPFI0HVW1TAQMrMsThyu
    b9oXHe/ODwvKIziL1zzUNF5Nb6N7HvxACQ6LeeuQ3jgZHsP0aCLWljhrMPI4TZTRGj81cg
    miP9Z9zx12w+UZlQ6GPoBvXiTa39Bc6Kg57keC47Mab2bFy1OD2fxiBrl+PI4t9YZY4hPS
    gvWl5bENP8jnXR+zb6T1zN4ReuxufWvTkAmq2xhZbX0aDo80qO2pXUr5MbSKm2g1l3BsVq
    iQ6+Dkl8t5RNSlJ4KmQGxSve7WlyTl7QynVg6Cum6XasCam+YIKY48i5k8PNwunvojAV15
    7FvWH26idSUlxig26BDH6DVvFqfcMLnbqgenERQ+A0EILFJupBsJnRV5BO89oIcY+biHTy
    p+8EcC4kZGY/hfhhe8o1/3OhZyGXJ21zHh96Sx/3NE6ttKnW78F5NHjrX1rg
X-ME-Proxy: <xmx:ezIHa4nyVui12v4JVG58PonCnRTDKzHYkALgCUodnucuzA6dHX16Sw>
    <xmx:ezIHa0IkuhwKdgpF8djMM3_hVcpXkV6e9eV-o8he4H1m080H4tAltw>
    <xmx:ezIHa4ReotrRg6Gk5T3pFCPD2MA2sY3t8A-QYNJnJtkfwZAcbe42Rw>
    <xmx:ezIHaxuVAdtLAoaZKTpXSVaCVMATyJez2WpkhwHZnTy6VrKUWrjU_g>
    <xmx:fDIHa23ereAQZwqItLv5vLTCeOxC61RFtVSHKWXyytc8kJi9yFvhNqet>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 59EB92C00085; Wed, 25 Nov 2026 14:09:47 -0500 (EST)
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
X-ThreadId: ACbI3-LYI2HV
Date: Wed, 25 Nov 2026 14:09:27 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>,
 "Griffin Kroah-Hartman" <griffin@kroah.com>, linux-leds@vger.kernel.org,
 "Vishnu Sankar" <vishnuocv@gmail.com>, "Vishnu Sankar" <vsankar@lenovo.com>,
 "Andrea Rabbaglietti" <rabbagliettiandrea@gmail.com>
Message-Id: <fa3ebfcf-ae2d-4075-b61a-93559f0e3e6c@app.fastmail.com>
In-Reply-To: <20261125084644.137506-3-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
 <20261125084644.137506-3-kmatzkaczor244@gmail.com>
Subject: Re: [PATCH v4 2/6] platform/x86: thinkpad_acpi: Extract kbdlight notify
 helpers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, Nov 25, 2026, at 3:46 AM, Qiling Zhu wrote:
> TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the
> brightness, compares it with the cached value and notifies the LED core
> inline.  Extract this block into two helpers: kbdlight_notify_level()
> takes a brightness, compares it with the cached value, updates the cache
> and notifies the LED core; kbdlight_notify_change() reads the brightness
> back and calls the former under kbdlight_mutex, like the original inline
> code did.
>
> kbdlight_notify_level() expects the caller to hold kbdlight_mutex, so
> that the proc write path can reuse it with the brightness it has just
> written in a subsequent change.
>
> No functional change intended.
>
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> Reviewed-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 42 +++++++++++++--------
>  1 file changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 31d3721bb..b4b3d7dcc 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5267,6 +5267,30 @@ static int kbdlight_set_level_and_update(int 
> level)
>  	return ret;
>  }
> 
> +static void kbdlight_notify_level(int level)
> +{
> +	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
> +
> +	lockdep_assert_held(&kbdlight_mutex);
> +
> +	/*
> +	 * Check the level actually changed, setting the level
> +	 * through kbdlight_set_level() also triggers this event.
> +	 */
> +	if (level == kbdlight_brightness)
> +		return;
> +
> +	kbdlight_brightness = level;
> +	led_classdev_notify_brightness_hw_changed(led_cdev, level);
> +}
> +
> +static void kbdlight_notify_change(void)
> +{
> +	guard(mutex)(&kbdlight_mutex);
> +
> +	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
> +}
> +
>  static int kbdlight_read(struct seq_file *m)
>  {
>  	int level;
> @@ -11593,22 +11617,8 @@ static bool tpacpi_driver_event(const unsigned 
> int hkey_event)
>  		/* Key events are suppressed by default hotkey_user_mask */
>  		return false;
>  	case TP_HKEY_EV_KBD_LIGHT:
> -		if (tp_features.kbdlight) {
> -			enum led_brightness brightness;
> -
> -			guard(mutex)(&kbdlight_mutex);
> -
> -			/*
> -			 * Check the brightness actually changed, setting the brightness
> -			 * through kbdlight_set_level() also triggers this event.
> -			 */
> -			brightness = kbdlight_sysfs_get(NULL);
> -			if (kbdlight_brightness != brightness) {
> -				kbdlight_brightness = brightness;
> -				led_classdev_notify_brightness_hw_changed(
> -					&tpacpi_led_kbdlight.led_classdev, brightness);
> -			}
> -		}
> +		if (tp_features.kbdlight)
> +			kbdlight_notify_change();
>  		/* Key events are suppressed by default hotkey_user_mask */
>  		return false;
>  	case TP_HKEY_EV_DFR_CHANGE_ROW:
> -- 
> 2.56.1

Looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
