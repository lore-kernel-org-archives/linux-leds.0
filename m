Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780706;
	b=pJgZM40bWjkurls8c5UxM2Mdwfvojv4QwkPOUvVIWyXwInpGGhfI7OhwWKIfGcD30Ujw
	 wUcX/jveidIqeklSvsyBRvZCd/a/OzFy4vSIMx2SAdKv/Xo+rlEvrlwEDSyz2Rji8uRzg
	 v2ZVGHCaLTdepwmFw958W4Uw86Zb3yBBgXf8XUeWZvmOOwQ5odrUIUBJFndSjnqQXSdzc
	 Kgv7FdMqYMRJh+WpoIEYMeOSxD0+WqSQuCqYMjTmXfFqEkX4BNcz2hb9z2B94mHqAmj59
	 Ca9vM6AZlOrNwxTWHeXR31/9ovbNKmkvmyCz80gAHrPcdwCXm48NkwDGG7xz67kb05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780706;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=O/nL3M7QYBQAodm3V+Vr2qZZcDJ4sjVU3UHjK9V9fTU=;
	b=BaqTEqt12YabVXn0XieRpmrAhEmyIw2J023Uxd8Ud2GhmyD2LzJCRMRwuzLp+MFqn1RQ
	 nBHSsUmkiI88S0cHw3Z2BKjk8Oi9ZYFQ0sx0WR99PzwW4dIzp5E0H8D6QZaYd0HEGqcyf
	 jTW48LekfwprVpq/0uPKrPlzAQpZZL92wdUkz22HYQUmEwT+XcSbEGS4iXHcrG4FVu6Zo
	 5Yn0idfW/JeLjaKQgTmYDydKO75MAXScEOoAhYqC+24W05Uurv5Q/ZTMuUXiPP4ii6Eeu
	 y7jcAUCatT3IcqN3ozZznne9fNhGjflldYqcZOEQ6I1jEJkt/sXV6iPg7h+xzXrfOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=lt8V+v3f;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Nx4Q63HR;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128AD606A323
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 22:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=lt8V+v3f;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Nx4Q63HR
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id A9AD11D000DA
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 17:11:45 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 17:11:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794780705;
	 x=1794867105; bh=O/nL3M7QYBQAodm3V+Vr2qZZcDJ4sjVU3UHjK9V9fTU=; b=
	lt8V+v3fSzzVbE2skIBfYPzRADbJBnSw7HNAUmHQYgi4GtElH85SEbfmSQ8Q3Bik
	uddrcKz2Y7ejXntuH5+8Q6wp1mutEswUPxhjEanO4qAHnZQaG0lYFLf96GomGxLK
	6I21D7GrvyFqza2fpzcNP/HXinPJjb052IVyjODdT0tGxGCV/b8pOkalN80u1ZxK
	l9mEDLhRLqXNLH7MiThoAYAOjGrti4eJZf/S1/Si6KJ8QxXJIVlINoaqa+7Lvqh9
	5LexmMtN8sNRTNS9cMMAw3TplJvDlsSzWKkLtj0sQOJrz77OZtQjXq8iS6w8Wypj
	AMp6FFjCNO/kNi+IRCJ+xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794780705; x=
	1794867105; bh=O/nL3M7QYBQAodm3V+Vr2qZZcDJ4sjVU3UHjK9V9fTU=; b=N
	x4Q63HRxBtM5XGOr8RL2uX1PnI0StNFDtNudjKe91DVwv/z2vV+nxeW5MYCgYJLQ
	CARFbLms5StNohJwr7ZzCRiMY1xu3vBvKIXYh5dO1QDifo35paN0GiScf/Y9EgPY
	a+AHdy4mmWlERgnwsX0WV3fvZkUf8EYkRgOjpyvlih1fZWLpLpFpBsbCnPCeFHqy
	qdgwxs3UiERgZjgccBH86Vos/E37D10wz5FRXVcM6iCBiE81Gwr7vmnGayhEVWdC
	A2Nv1oZxooQ2EBTwpabMrF1n1WOBiwfpQtidBCCLKMUR+BSxAmcex//wBe3nMRow
	zzrX/KVNIPVksRC8IjNUA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794780705; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:ePC83IXYmM17jjr9Wn4AH9AFOtPYSLQSZi6J+0KjlAkhWoB
	DP7yk8oFrSbFmZ8Ie/kccCgUbp3WLk3Oq1nxLCDQiHONAQdHcPFCS2jhbCyhcTnp
	+wfA64XKvKiXaYG9fyrcGRdE1eRikOeW7kATNs0DSXTkzoKQ3noIbNKwlIATFhSv
	dmJXkwqlrEVgRJWldKYuF3D+n0fyzERZ8WCFSFPdrhxodlzNjGvdvh3qV58PuEnc
	RljwgEtT3JFpyR6t6Qm9jKLSX4TCX2gi6NWA0XGUpyeC8srjVe8GLserNN0EGXxF
	B1MPXEcF3X6Rj2+SfAWFbHSmxJa5cBGjalauaFA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KVZvsApqV5Ig4aK4yHKugk3U4ol5sxOe2S8OcbJHZ+o=:+87jI7xacTI71GzUKbwU/NH5cO+WgmjEnOpMP0Zpnik=;
X-ME-Sender: <xms:IS76ahqS3uhKvDtgZGeBHxIvI67w4LE8xNqYn8VbotEPTKS_WcqMYg>
    <xme:IS76audkjjX7RNhEsebzEBMO35df10Gw7IC3abe-BAxrk9adLUuqoxMpr2vhdLpaX
    zAsqUuiAECkkBqpedjqy4plcFocgiuNbTUN42ggq8z6FFjCJHpZ9nXr>
X-ME-Proxy-Cause: dmFkZTEdEb2TWn2K42vj3B8C4jJQVPCuEH8W65ZVF4lwEB/v+MEt8dWRPZCBoLFurw+xUK
    l1CIbThZi6KdBJpjFusZix73OrbuJm40mYg46RJWsZexfsALzdyDJ5qUB4+bS/zO1+QmME
    4v1Nie4dkcnJG/33G3qthWqLpXdQ8IsVJ24Wgco1vBDxqb4UMK5aGwexCkl8b9Ta0+R335
    Sb0yvC70w3hkXqxEEgCky0Ch9efdLXHQQNe8ikCzIHGyAMFy5p6GdJxXJI74xqNSMN3bFS
    nXmSKt+T4eOFjvv4qQLlC7A6B5y5k5VT9FV90qvvm39W6/JAnxpjmaBQ22quD6yl0Z85o4
    g0+9ApHy7QOW+nmct/m+J7KO8xDr6Kbh65wt5S0cy6TC/7lfouAk0FuZcDPmwFSvNQNjZk
    MMxknXEv++3qmQZ/O10AAuUNkLMam//C7fE9IgWVry1sT7Dng41VffBk7Tu6ikkHO2mLbi
    6WxQ4WUtxuTxBQmPvZ7JFuvhQNmsPhadiaIVJXdquMkuHc65/BtCuSvIwNpdnzVZaOFbuV
    l7TemLYIOX2Sms+e1X+Z88yKSbwzAYqiezL0qX/OEuJVZlt4199v/7nQPM9MjCBHO71TVB
    Ybpz9PPSYnKLtyqZSxB0gAgj/HDx41w5ABde+Xep1zrqAs/noP5izqyEDrrQ
X-ME-Proxy: <xmx:IS76avoUWTBU2oeMsIBxIHZKINMVB8Ktih2aHyNGzjBuIxXHXuVyyQ>
    <xmx:IS76al9UwG7uK3ktLCxlK4xnKgaVAmntAt0aOZtFg4T6YSpyGdkQCg>
    <xmx:IS76at3oOteUyTFumaxwqQlkqc_ibStFN43ysfgZUTGJQaqrePGOmg>
    <xmx:IS76agBzTCw6sWNCnZRWkTL_lj1pnqLQH3D5qdYiiEl3XKrpeSYg0Q>
    <xmx:IS76agorhQ3oNAWonNZUROHbrJCdExoJWI2TOyI1WWLBmntwCUkEROWu>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 34EF32C0008C; Sun, 15 Nov 2026 17:11:45 -0500 (EST)
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
X-ThreadId: AXiTsbB6wUso
Date: Sun, 15 Nov 2026 17:11:25 -0500
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
Message-Id: <8184c823-eb90-4b71-9892-4e8eeec143fd@app.fastmail.com>
In-Reply-To: <0cd54ba6673168ed2f6542d31c03a02f467a416a.camel@rong.moe>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-8-kmatzkaczor244@gmail.com>
 <0cd54ba6673168ed2f6542d31c03a02f467a416a.camel@rong.moe>
Subject: Re: [PATCH v3 7/7] platform/x86: thinkpad_acpi: Reconcile EC level on resume
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sun, Nov 15, 2026, at 3:20 AM, Rong Zhang wrote:
> Hi Qiling,
>
> On Sun, 2026-11-15 at 01:48 +0800, Qiling Zhu wrote:
>> The firmware does not always restore the keyboard backlight level across
>> sleep: after hibernation from auto mode the EC comes back with the
>> backlight off, without emitting a notification.  The cached level and a
>> possibly still-active auto trigger then desynchronize from the hardware
>> until the next user action.
>> 
>> Check the EC level on resume on auto-mode machines and route it through
>> the regular notification path, which also deactivates the auto trigger
>> if the firmware left auto mode.
>> 
>> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
>> ---
>>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index f11e61417..802e0d53b 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -5395,13 +5395,22 @@ static void kbdlight_suspend(void)
>>  	led_classdev_suspend(led_cdev);
>>  }
>>  
>> +static void kbdlight_notify_change(void);
>
> Nooooo. Add it to the right position in PATCH 2.
>
>> +
>>  static void kbdlight_resume(void)
>>  {
>>  	if (!tp_features.kbdlight)
>>  		return;
>>  
>> -	if (tp_features.kbdlight_auto)
>> +	if (tp_features.kbdlight_auto) {
>> +		/*
>> +		 * The firmware may not restore auto mode: after hibernation
>> +		 * from level 3 it comes back with the backlight off.  Check
>> +		 * the EC level and reconcile.
>> +		 */
>> +		kbdlight_notify_change();
>
> If the LED core doesn't detach the trigger before hibernation, please
> restore the last hw brightness instead of notifying any change.
>
> If using led_classdev_{suspend,resume}() causes pain when it comes to hw
> control trigger, we can get rid of them completely (i.e., on all models)
> by tracking the suspend status and restoring hw brightness properly
> ourselves. With your previous changes to kbdlight_brightness, doing so
> should be easy.
>
I was wondering the same. I can bet we'll end up with FW 'bugs' where some platforms don't put it back as they should.
I'll get those fixed whenever possible....but I'm thinking maybe if we just check/set in SW anyway that's not a bad thing.

Mark
