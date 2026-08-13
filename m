Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F7D4192F9;
	Thu, 13 Aug 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618232; cv=none; b=iqDRv87xuBRrnOKvPtainQoy818IfVHZDunm4IxtXrBbbsZSQscWHAqXonkxXnLgqUBNfbigjSxP7crTDl2cwt35cqMXmKsVVyCE1jFC3jXCAH3rvV2Cc0dBZZrUKIf7F2KXn03Z6BxZR2Jj0Or2nSugZFgafu4qiUdJETKRkc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618232; c=relaxed/simple;
	bh=4ZxeGb9cdlY4ZyFWDKWuj44pdyUfc109MJtUzAvBwmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RlFAUuY9SLok+N3lBkRTVreYWDNjja3Z6tCXD10JK6FGA+HNbXVpRybIYYQnaNQ0PnMTH6omEI4q9OWInPoWMYzAHJZq39P18UPeIfnabGB3FY5J/47VkW+khGpfL5T0bHApTL1joKejrIXcMVffMxkaUJFS4/W9Ek3RcOlb2rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=O0a5QjxV; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="O0a5QjxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1786618217; x=1787223017; i=wahrenst@gmx.net;
	bh=9/aZFij1F+aoTzNB5a9WBgP5f4BcQvGm6O9yVblVbm4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=O0a5QjxVZ4RH4QpxXqvwi3ZN8ALKlH9J+gQhCy521qKsPSQ5dTB8MIpGcbXbcj6N
	 SOMb4diA11bkCPSzVfDb6VmU7TXwTB/ciqA2rdkFCdyic2x9n8knsMEqfr/GITM5C
	 QNP3HpLqLUG1Onmryt36sEbxOrlDjH9KelAaODZZrC5+We1f3KjgDzwb34TGKLrrc
	 Fcxlhzv/qtc2yjJ7Zj3kSu8jsTJ0k4BG5+PTEbW04zGsv4D71eM6QeDkUSvE56Shc
	 dHYksSZA1wIRc2S4QVDP0Wc/Sf/fiW/6j+9NRYVY8VkDmb5XNA/S2+XI/p+OhuGcr
	 AGikcEJgcnxiZ6pQqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf07E-1xNVRL382M-00amWU; Thu, 13
 Aug 2026 12:50:17 +0200
Message-ID: <aaeb87f7-5a04-4592-ab59-b4114b005aab@gmx.net>
Date: Thu, 13 Aug 2026 12:50:17 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] leds: rgb: leds-group-multicolor: Implement
 default-intensity
To: Lee Jones <lee@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Jonas Rebmann <jre@pengutronix.de>
References: <20260813091428.9072-1-wahrenst@gmx.net>
 <20260813092522.0228D1F00A3A@smtp.kernel.org>
 <20260813095330.GZ1072730@google.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260813095330.GZ1072730@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2FkglYBKjXO9xD3NvRNC2nkirWgAME6OBJuCEPF9YweDi4CQgmc
 EiriJAVHnw6PwLaZkYdhow9SjsAwSkpxq+T9pee+nwk3d8PHstteoI7/me2IFMWq6tjBx4o
 rbwFQmocCurNtHu/gfBIqHyiayvPNbeKNBh8il6zRQGf8OIWs/rBKNAmaalG0xkmpSryL41
 pb1tQW9OOPXSyzOSU3BXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aUKRP04kwoU=;1+DVeA26wh1bzYvWlP3I75e6LhA
 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

Hi,

Am 13.08.26 um 11:53 schrieb Lee Jones:
> On Thu, 13 Aug 2026, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
>> - [Medium] The `default-intensity` property read from individual monoch=
romatic LED nodes is applied to the multicolor group without rescaling, ca=
using incorrect brightness calculations.
> Please review, explain or fix the Sashiko review(s).
>
> If this is a set, this request includes the other patches too.
Sorry, I don't get the problem with "incorrect brightness calculation",=20
I tought the intensity setting is independent from the brightness. Btw=20
the intensity is applied to the monochromatic LED not to the group=20
itself. hallucination?

Does mixing PWM and GPIO LED in a RGB multicolor group make sense at all?

>
>> --
>>
>> --- Patch [1]: [PATCH V4] leds: rgb: leds-group-multicolor: Implement d=
efault-intensity ---
>> commit 13399f1aaceaf09afa7e252e35000d7d61ab1925
>> Author: Stefan Wahren <wahrenst@gmx.net>
>>
>> leds: rgb: leds-group-multicolor: Implement default-intensity
>>
>> This commit introduces support for the default-intensity property durin=
g
>> boot for LED multicolor groups. If the property is missing, the code fa=
lls
>> back to the previous behavior of configuring the sub-LED intensity to i=
ts
>> maximum.
>>
>>> diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/r=
gb/leds-group-multicolor.c
>>> --- a/drivers/leds/rgb/leds-group-multicolor.c
>>> +++ b/drivers/leds/rgb/leds-group-multicolor.c
>>> @@ -108,8 +108,10 @@ static int leds_gmc_probe(struct platform_device =
*pdev)
>>>  =20
>>>   		subled[i].color_index =3D led_cdev->color;
>>>  =20
>>> -		/* Configure the LED intensity to its maximum */
>>> -		subled[i].intensity =3D max_brightness;
>>> +		ret =3D device_property_read_u32(led_cdev->dev, "default-intensity"=
,
>>> +					       &subled[i].intensity);
>>> +		if (ret || subled[i].intensity > max_brightness)
>>> +			subled[i].intensity =3D max_brightness;
>> [Severity: Medium]
>> Does this logic properly scale the intensity when the individual LEDs i=
n the
>> group have different maximum brightness values?
>>
>> If a multicolor group consists of LEDs with vastly different maximum br=
ightness
>> capabilities (like a GPIO LED maxing at 1 and a PWM LED maxing at 255),=
 the
>> overall group max_brightness will evaluate to 255.
>>
>> When reading the default-intensity from the device tree, the value is t=
ypically
>> specified on the scale of the individual sub-LED's max brightness. If t=
his
>> value is assigned directly to subled[i].intensity without being scaled =
up to
>> the group's max_brightness, the sub-LED might be initialized with only =
a tiny
>> fraction of its intended intensity, often resulting in the LED being co=
mpletely
>> unlit instead of at the requested intensity.
>>
>>>   	}
>>>  =20
>>>   	/* Initialise the multicolor's LED class device */
>> --=20
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813091428.=
9072-1-wahrenst@gmx.net?part=3D1

