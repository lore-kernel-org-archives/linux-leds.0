Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779903;
	b=VRkOA7FHDMluRLWtsdD9SGO9mVvAVQNUk06vLWLiha0eTH71Aw++p9RcYRrG/20OgSYS
	 sVW1GDW/0YxgASCOmj/kmgMtvwEHWHEFc7hmKAZ5whCh/hNluo7q4I19+67Cx1Imda+AB
	 Sg0uNgTtuWaiL3lmlDOOMv4CGVB4H4Adp6SPoZ4uh/nKCZrGsBtoPZUwYOSzw5hfiV7wo
	 pejXEc82LruXgbTAsULjtsZvIn5eoiSmg05q383md+7TKEeFO9QKv/1f7n3KHnu9wKC3Y
	 sHi3vfMsayU7QC/n5i9GOaVByUfSwDAbb8SayUCjlwo4/znu92NkxHO6cQlP4f0ngyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779903;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=omemX1lEWnfDDXO42qPUhNXOBFAKGZAy0xUrDaXsUY8=;
	b=448PJPfN432hEkmA00K9DnxSqeaseriiNunkwPkTzjgYR3nZipaO1C3a/1c4U/KQZzOT
	 UQxDKSQ7M/g+Jm8trIjvg1+SClYJTHl5VoTzH5VwPFpTI8AKYkOvLPZrIlhXA6gUAy9Mm
	 Dyt3EWex9OCbPa7k8ziAxiO7jEoP4QqxkZEgC4XmFHHU5uddqurNcPlm1taGyZQVyPrRB
	 lis6oRl8uwsICFE49Xt5N785U74/cPAt7EHkNeriw7m+cTUNZXKd/VhFZ5P8IlphZiJdR
	 m94K1V/NGXinr+YxBXs8ug6PhiZ5JX0D0J2TBv1Y48iYElH0O0SiVR4jLNLLRwPfveA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=WEErMtaU;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dJ4Zyajo;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D4A606A332
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 21:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D4A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=WEErMtaU;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dJ4Zyajo
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 897CF7A0120
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 16:58:22 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 16:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794779902;
	 x=1794866302; bh=omemX1lEWnfDDXO42qPUhNXOBFAKGZAy0xUrDaXsUY8=; b=
	WEErMtaUqeQAvKf6Yp8PWn8UBJNZVYpcGwHfOsWikMaP5mxPmPLbxxvlT8pVtLjJ
	nSS9OgtMvm+Y+kcvw5Wq2zmJohgnlQxtNo7f6vxY4I2k/Rym9ADVXHFHgaLn5Iwx
	QrTl+huJ99OCYEjKdHI8SSiwOarf1YNM2DflBDidSjQj12YYTcOTtNswbK2JIkdB
	641sFkZBo3AXBTzT406auQFscTIbmE9lCMUK2GF//ZBS3zJwao5LwGtWprcdv6Zr
	uWhNXCIJGxAQHmIHOh672J+0yrvcUeKRW6ySYUp1LT3lksMYDFj+sWqQYXIKJEkI
	MZaID1IZ2Wu9YhXoOrNaSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794779902; x=
	1794866302; bh=omemX1lEWnfDDXO42qPUhNXOBFAKGZAy0xUrDaXsUY8=; b=d
	J4ZyajogEFpilkDbhmqCgmlwrt7qKpLQQ0mxAic5emsijZZmvHQNuqoYSo+vQqts
	Sd8DCzKrp0XWRyk6hgsdWJRK2YBsGFUjGaTY6zQc9uQVFMxepp9OBrRdmTyIdBpQ
	edXg9lkKK7/IFhF8vUu1jptQ3odWFQuopkvDsFYcOTtIbWoMv2oDm+HCVov6q4gP
	OPs6IC1i7N3+DncuL0kQnz1FQdTLIR2HkLuQdyA2UpjaXtiraEORpnkEqBZEbAZA
	PVHlLoMD14ue+nlHcUBtA7/OCcfPR2BhbiUDSON6QAagA3JNhDMNcj4/zl94gOOw
	U4vtZkyMYl1gJo5p1RwOA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794779902; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:L3+Ka5eSZqY8Fyhyz/3Hrtiem8eZAnfZLyJ8nFucvRff/3H
	1dRKirYa/POSi3tleiU7zUV7JvL88STUqLEV6acvksBIyNMEJLk3LHc7xLhq9IJj
	wjnimcrAwFBsKT52kgZ7pGrJZQdXFBOiN6pYfGVttdLmFD9y7CFy197CNk/9RMAj
	K24lnh2QG9H0kylP1IuZuOrD19rjLgMcT8ZnJrW8SqF4PNfq5n5lekMS2DdFo7de
	hrjttpYDtlh+6lcxeVwOPsadCapRKefDtOE201hpr/31MRbwL7hXjRss/hr9i3Gc
	gssxLZOAkTfOP7NoKyqOYuCqA7L85lBwQpcwXAA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hy4kCm7rEcW1x2k8CCtDuRbOCBVxwxxXtw84rHG5ZvU=:ZfHLVqPQyUu91y0xuPm+KeHdUeMYrUpfFxJgHf2U/p4=;
X-ME-Sender: <xms:_Sr6arFeD3UWfiHtgjrUU7NfOnoRcYrFHO6Mz32z4Wl_H0OBolB6_Q>
    <xme:_Sr6ajIrWUvpcSN4s3gXA1p75NLSQMQEzoJqit4AGxYI7dnG_PxLYWhpzA-G0c530
    LSj8CpkKkmZ_EqDFy-VzKNCm6ioDQtPYK06HRcB6TR1zRP7hbmaXSZV>
X-ME-Proxy-Cause: dmFkZTGxVtkuemJOOutN4FdlbA+YFcEEVkgzLoncpn576eBZBAV7P3UgWrOD13fw7PiOqb
    vAU3pWCwQ7jFRa9S+u7adtz7YeoLm/4JpxLzmfhu7I5C3HxyEHigXMcn5zk4f6BWkkFzQe
    a6rQZCJ99zmyV/9XMOwMv0F98JrE7bTugN2+8ylTKG6aLK3Uu9+g8HynlP0heVKB6s4evh
    id35K8pT2Xnx6jCHIAJsBP1iBCvbO+JH9SokySQI3i34oa3laBSNsTVoZYBkEKTFcZzxqx
    tXK96JnUqnhQOn92TguRc0f1QAAugBQoQ78y5IVqBiVCj6KleTSDiR/FB/saMlHL75nOR8
    ocYmDtlu4z3skyexI/Euj0HgbnffQnQ7OHG0hghXGnFSboj+2fOezWDL8/0ZlvSn2Aq8Cj
    CbfbS//ibgl7J9CBWxr2rCqonmqk/mX3q2s1YNKMyXWIKtJgaD1O+UGoQg6bPAp+6I98t2
    ZnsT04/WXPGwmVbUvSEBcR06npCA3VnWS2PxiSeZYa9koFoSDvDUqN5KpRRZln1tJcpKQB
    p7AmJ5N3G95+gmJ5U7sBpoqCWMX5vVdyvmKxLwb9p6PQgmmLYLC/d04KZJvcwjeakOfF1w
    AcXMOhZ+5ioaXsuXmnucUeJlPDyG/OEQFDTRaWHPhmZlNAfdUxzKCp1c550Q
X-ME-Proxy: <xmx:_Sr6ajk0QHz_xPSFSe6BL0pc8klZR3yspzKNQUQgSek-4gqyGWc5QA>
    <xmx:_Sr6ajI8T9acnMPKSpKbRaK0JAm6UotmRCGASpdB5hZmv2_d9X3qKQ>
    <xmx:_Sr6arQv3wNQLZdCYvQ0mzDAHopTNkfkl1ilU_WEE11qM2FR3BtIDg>
    <xmx:_Sr6aovGF4Z13iHTyE4bfcbTgV_nSbeNu6MGVuF6pKwIkp4K4cjTZw>
    <xmx:_ir6al2OoFtbvaKcL43WbSMFbxTX4_FDSaWsyYbGt5aZbqqRvdbqB2lg>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 9B0862C00085; Sun, 15 Nov 2026 16:58:21 -0500 (EST)
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
X-ThreadId: AoH_4y8sCjjc
Date: Sun, 15 Nov 2026 16:58:01 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Qiling Zhu" <kmatzkaczor244@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
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
Message-Id: <31d80e19-0330-4a87-abda-1e134e4c4b63@app.fastmail.com>
In-Reply-To: <64525e6fc8bd29dab836a5f6a4249523ef285012.camel@rong.moe>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-2-kmatzkaczor244@gmail.com>
 <64525e6fc8bd29dab836a5f6a4249523ef285012.camel@rong.moe>
Subject: Re: [PATCH v3 1/7] platform/x86: thinkpad_acpi: Report auto keyboard backlight
 mode as off
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sun, Nov 15, 2026, at 2:53 AM, Rong Zhang wrote:
> Hi Qiling,
>
> On Sun, 2026-11-15 at 01:48 +0800, Qiling Zhu wrote:
>> The EC keyboard backlight level 3, which selects the auto mode, is
>> passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
>> then reports a brightness of 3 with max_brightness 2, both through the
>> brightness sysfs attribute and through brightness_hw_changed
>> notifications.
>> 
>> This is not only cosmetic: UPower 1.91.x treats the out-of-range value as
>> invalid and stops watching brightness_hw_changed altogether, so the desktop
>> stops following the Fn+Space hotkey once auto mode has been entered.
>> 
>> The auto mode is not a brightness level.  Map it to 0, the value it is
>> reported as most of the time anyway, in line with what ideapad-laptop
>> already does for its auto mode.
>> 
>> Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
>> Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
>> Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
>
> Reviewed-by: Rong Zhang <i@rong.moe>
>
> Thanks,
> Rong
>
>> ---
>>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index 4f81855ad..2c3f8cf32 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data = {
>>   * Keyboard backlight subdriver
>>   */
>>  
>> +/* EC level that selects the auto mode for the keyboard backlight */
>> +#define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
>> +
>>  static enum led_brightness kbdlight_brightness;
>>  static DEFINE_MUTEX(kbdlight_mutex);
>>  
>> @@ -5191,7 +5194,8 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
>>  	int level;
>>  
>>  	level = kbdlight_get_level();
>> -	if (level < 0)
>> +	/* Auto mode is not a brightness level; report it as off. */
>> +	if (level < 0 || level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
>>  		return 0;
>>  
>>  	return level;

Looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
