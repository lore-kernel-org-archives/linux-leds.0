Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795633532;
	b=lEDszVUVPzi5xDT304p3uHviKCjc+m0y6fHVZ6kEEOJ0ftyUs60Q1V/UTRrZf8wtozNF
	 5xoh6p5xioS0yQsh45wLFACO9x5BbB6ik/pL71r6FNzbdMhmNMA7vJKjOK+Cx0MYbw+dO
	 bV1UYj0mxhby36X/w/ZB130ieahNZbRWw7SiLW7tVO/MRwu0Oa7ofv+iKseQMv+KlhSEN
	 ZabIRN8BTSJuneteXv7HrvgIWQ+i25K8iSs8MpWEBRyPKqG2JtwjkPE4k2icNupfezYOX
	 cEoV6cw7l22LoAPVUcj56UDtIfOySwJCx5FNGAN1e+ACdVA/aiOOCYhg73NeYKQPqCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633532;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=jqebKEg1feCnphN5CObC34DEFG5Z/zzvear+wR9jObc=;
	b=2oOziUxHyCmRqX/spGL3rZcwcXOfLSOUZNS0A36cKsDd+4JZIoebZcJdGAymbjJSzHop
	 eylOJLZltGw5k8PUYZ1qeNz0f97rRY4C5BO02Yw/91oIEffez8Xp2trCF99tPjO/5r+He
	 qwy1DA/IHK4wOfXDcLN8QGyPayhG9WIVR5NhQ8KbvDbhMW/CWcm3g8xNbRu0FwV+uOPh1
	 22XWztdmc7C7BW4YeZo7Zfz88eQMFO2QC+MH6wbcDhjVfC3/Ec7iVCzOw5oOIAcNz/f/J
	 tseKJ1/DWPyEFpHK4eQXAYY3YUSviPHK1wGXAiIoN8MrfNoQjVL2hFOt6XxjkJzDQRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=hs4NZCAT;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=phNy6UK8;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE7606A321
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 19:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DAE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=hs4NZCAT;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=phNy6UK8
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 84DF47A065E
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 14:05:31 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 25 Nov 2026 14:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795633531;
	 x=1795719931; bh=jqebKEg1feCnphN5CObC34DEFG5Z/zzvear+wR9jObc=; b=
	hs4NZCATCk7Ibn9ZpsJVPYKBrlUJOVGvg/c6N3qvglKHt5yPItSvgtNLmGsaeuED
	ag92XC2oTWIxKGWwadbyLKd3XFeJI6yiCnU25KP5YsvVlr7vgy+LGUnzZ4F/Bdus
	S6iFCdVOyPyXIm2zAxSvJo3I8whAEdXKKjLD6yEaLuPMGPTolKxxFthG2SF2lNPq
	AEl4157NVN1X1ILZ1y6+T3aZvRxAHzjAf3e//ONfJpq2i2jmdxlo4vdzGi6Zt9BJ
	s3MwW12y3C+hcROLBRwpZUk6R7xNJi96BPIWyhpwzeU1SK7A7WmF/dyEidx6hAy9
	HNpnx/dHrCn8ryFUmBa9gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795633531; x=
	1795719931; bh=jqebKEg1feCnphN5CObC34DEFG5Z/zzvear+wR9jObc=; b=p
	hNy6UK8d2pH+ZkbjjnPghZeqkUIpw5CkVsfWmkQjtdodsx2vjzVLCZLi5Q/lrl8h
	F047RJGNR8xV8M8xqFlEF7/l8/XT0c0wSU9SmYfyIY91O7cfng/GACHl5StaXWDh
	b10gA0jhApIiaRHp1DSTFMLtHAUC4XN3gkfig3I3xtRmqlGipcFJhpvLpYfVv7O2
	av3neX5PpV0+TH5a0mm/FU4ZzkZOssRbdyMGJEdYgKZ9AWjW7o7BcJH2J5Yzmz/E
	uSMkzlYVmLo7szU6oYxZ4VIYyFmXTAwITlZ5ROpU8ZZ8ktv4kn0oR+YEYJQr+WGD
	hefxfDWp1rCN1DasxiDTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795633531; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:CgcWPJsgU7bprHqKHCHbU99gCd7rkq+xicOMpLD+HVs60ap
	/piX+qMF6b/noo0F4P/g8IXIpSykmhdk0BryO2TcZCKs8HZ2zo4wJIbnHwRKXvZQ
	nX36ntY9aCDHFtZfZOSwGbpKXRNYRo1ELj2Z7FEmX6iHN/U6E72eRoDt43XA729s
	59F0FZRHntcbibxc/E18TPimQjLmfiRgvQ/4Lc88uFKnFiSk+rCHE2sWsoCeKHe5
	8zr1bmt8WPWBe733F1F7xGg2dbpn3HCUbClLUzWZc+rTvB8++xced+80iBKqLauG
	969NE1ZSKlSorEcMiDBcBPA4vGVUv29mYEe3M7g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Fpb1wAMmxS/YZZO10doLsUJkJPBxWsqLY8y7HyomUpA=:s1OcFzzBfDO4sMcBDmIrvzPAXv8jy5dxrSlOzfNugNM=;
X-ME-Sender: <xms:ejEHa42m4Y1LXCqP6aLBBIRhMf3gXgT99kLAg97Wtv4JgF3m6LM5pQ>
    <xme:ejEHa95rQdCTFiq-uF7nsDKKQbZDIzVO7XoCEomOvNamaPG_la-HLsPks0ZtXR5r9
    UMWJ0M-hNSvWpfuWQ9frACIyQI82y5w3gWR3jT1T0RgIAgCDLmK00sT>
X-ME-Proxy-Cause: dmFkZTEPIE+b08sZQCMpCORU0B8x7ICkt/aAWJgPx8Ojwi+FutQSLIfRVEy0GbILDnq0xX
    D+Q5LSiz1I99aw7XGloY1yt/WTJh8adGMf8o8x61lE4/ouo1cGovbObhbn8poLxr/uuPZ+
    1vSFG1mE6pDiILlwYAgwA3ixk66XONcRN0Wy8xYukDHs4CtZw1ufU99LEJMjNhBKhEGD7y
    G18e2u8HWr10dDyJQoMCx34JQ36jK+uPJasX0MD0iey07dYDrwkc+voRgHVwdoDKsxJoYI
    i6i+2flCw0YsNc5YW/aXPEeGSTE/d/nHcEod0S/OtpiguBxjv8csqkhZR1GqQDdwmBUwDD
    0FCFC6nmRbcTA3miOXshRgpAtCtxubb9TyX/Jf4uFthtfdVFH6Fzqy5THNm+667+B8OatY
    88mVIuYgnirY9e/mhNU3tX8x5sOAxXZ4v10bxQl622kzTAyB+wHgdrxWknVdBNjVRbBg9N
    6eiXqshAAj5X91NELU60Ck1qgnh2gtFzYtJK6Sf472nMY4zPrcTCdi1qz9z7DnLeRfmFrP
    QG2zYtbU2DmbgJiXZZNOApk2792nrAg56207nizQEJ9KCy9gLrzH07vZ6MIYLmk2yyvFmw
    oLNuDmrzS4rWgMloSFMljbY0qc7w9f4ZpHwq/xUhYVuqXL2U3bIQcwUNgRdA
X-ME-Proxy: <xmx:ejEHa7UKIx8YnbD709RzwAt9rd-Utpxg9PsOTvioOYVJ7_3NXWGNFw>
    <xmx:ejEHa_725z9qyahMwycbXHGrmnHOpt0KsWPPGIGRsnkiNXy28xyr2g>
    <xmx:ejEHa5AAyk0s8s9OHO_aX8gPtfdARz9fIeC38skhGQbHw1l2LlUKEA>
    <xmx:ejEHazdciEmZJ7UKyjTgxk6EGgIKWwsJa83pJS7wdMA3FUVsY3s_ng>
    <xmx:ezEHayn3LcMXglLTHm-eWpn_a_YXZYBnmprLv3Y8eUQrtucs4YBe4UCn>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 681102C00085; Wed, 25 Nov 2026 14:05:30 -0500 (EST)
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
X-ThreadId: A0BCXEfO0Ufc
Date: Wed, 25 Nov 2026 14:05:10 -0500
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
Message-Id: <2d83dea5-7751-473e-bc59-903eb6809ef6@app.fastmail.com>
In-Reply-To: <20261125084644.137506-2-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
 <20261125084644.137506-2-kmatzkaczor244@gmail.com>
Subject: Re: [PATCH v4 1/6] platform/x86: thinkpad_acpi: Report auto keyboard backlight
 mode as off
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, Nov 25, 2026, at 3:46 AM, Qiling Zhu wrote:
> The EC keyboard backlight level 3, which selects the auto mode, is
> passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
> then reports a brightness of 3 with max_brightness 2, both through the
> brightness sysfs attribute and through brightness_hw_changed
> notifications.
>
> This is not only cosmetic.  According to a report on a ThinkPad X9-14
> Gen 1, UPower 1.91.x treats the out-of-range value as invalid and stops
> watching brightness_hw_changed, so the desktop no longer follows the
> Fn+Space hotkey after auto mode has been entered.
>
> The auto mode is not a brightness level.  Report it as 0, which is
> within the exported brightness range, in a new helper,
> kbdlight_level_to_brightness(), as ideapad-laptop does for its auto
> mode.
>
> Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard 
> backlight")
> Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
> Closes: 
> https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> Reviewed-by: Rong Zhang <i@rong.moe>
>
> ---
> Mark Pearson's Reviewed-by was given on the v3 version of this patch,
> which did the mapping inline in kbdlight_sysfs_get().  The helper was
> added at Rong's request, so the tag is not carried over.
>
> With this patch on its own, on kernels that still use the LED core
> suspend/resume path, a backlight that went to sleep in auto mode comes
> back off after resume; before, it came back in auto mode, since that
> path wrote the unmapped value back.  The rest of this series restores
> the level the EC had.
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad..31d3721bb 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data = {
>   * Keyboard backlight subdriver
>   */
> 
> +/* EC level that selects the auto mode for the keyboard backlight */
> +#define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
> +
>  static enum led_brightness kbdlight_brightness;
>  static DEFINE_MUTEX(kbdlight_mutex);
> 
> @@ -5135,6 +5138,15 @@ static int kbdlight_get_level(void)
>  	return status & 0x3;
>  }
> 
> +static int kbdlight_level_to_brightness(int level)
> +{
> +	/* Auto mode is not a brightness level; report it as off. */
> +	if (level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
> +		return 0;
> +
> +	return level;
> +}
> +
>  static bool kbdlight_is_supported(void)
>  {
>  	int status = 0;
> @@ -5194,7 +5206,7 @@ static enum led_brightness 
> kbdlight_sysfs_get(struct led_classdev *led_cdev)
>  	if (level < 0)
>  		return 0;
> 
> -	return level;
> +	return kbdlight_level_to_brightness(level);
>  }
> 
>  static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
> -- 

Still looks good :)
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
