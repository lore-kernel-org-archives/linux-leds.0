Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8438BF6A;
	Thu, 16 Jul 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192855; cv=none; b=YVAQ0Qw1YrqKRqYAjHa/vy8PycpXVy63mbeEEMd7ceQ3A80vYBEPd4iLgw/QLcQwP4GZ2HjmIJWVZhf03ROPCBICq/c7ZWa+F6FXMqc/jSHrg5nkM8ovOc/UCFMGnnoH0Mtsn1bmqyLNLzhkdClfNXT0v++MjhysOoy6tZf+73M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192855; c=relaxed/simple;
	bh=BdLpRXtRhhGeQHIbi2DoKbhwjsKbods7dep6PgGZyMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsBrm5VSvkQPnWhAMj/fGQ/AT6w3Tn6kegsNjTsRdNnjd8fk/KpvwA1PXE20nxYd43yjxsI4ILQLIEMTtisa8WZHzhAsvyP4PUF+UzeXYtC2Q/i62T6JhQ4uBvDmgK1iezE7iftbn2aeWAadGpu/+D46ZYi+eUhgmiyIDwPHY7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=iYQvGlz7; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="iYQvGlz7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1784192849; x=1784797649; i=wahrenst@gmx.net;
	bh=BdLpRXtRhhGeQHIbi2DoKbhwjsKbods7dep6PgGZyMc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iYQvGlz7l73ukkjrZaIiSDaSvuGt3jGkJyT6MvgYRdGThQgsgkSvR1xl+rgk70T2
	 WkHhRn9gm9/nu2jHcWrnmEnp+m+qz2T/XivHEqeAXVw3AHNtpKpoQNCpsOyTs1zq/
	 uNm4cMn82+oZKWeJgq27GhrPGc5jkQCKxRBPmxN2w2Rmj5uqdYQBZtfDOrgWhfzjE
	 oLqC2M5W8TLlhVXfWMZXl+ERZNvIOIZbcLl3w/DjMlGQc+3tpEA0YxzIcLpF4UkAq
	 t5R39C/y/gfCb6QkqEuU0uGC00Ad4xyQCpHMuwROP+oP3iEAAhY9OC/+PKoWXClWR
	 Nwx6PSaB4W6LvAd5Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1wYGxg44V2-00IEMS; Thu, 16
 Jul 2026 11:07:29 +0200
Message-ID: <228dc585-4aec-4477-9a01-812815bdf288@gmx.net>
Date: Thu, 16 Jul 2026 11:07:28 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: leds: Add default-intensity property
To: Jonas Rebmann <jre@pengutronix.de>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Conor Dooley <conor.dooley@microchip.com>
References: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
 <1a458220-daa9-42a2-8a68-7281afc82eb4@gmx.net>
 <24f25df5-d240-4313-9162-a52ec9d7b84f@pengutronix.de>
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
In-Reply-To: <24f25df5-d240-4313-9162-a52ec9d7b84f@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:06+SGPHU4Y1HoiqueVvIqMVCndK/UTyZHdw2A9l9DirrR3Yb+l/
 Fluginb3MsRBYpA0QxUu2Eg+nI5sl0brkPXOV2CP54LMK9JlZIL3J/meyol0PNqiqp4KAnw
 pqRzcwkYxh4KJOTgQC/B0a3EjGm8CyAI0UfelgZSFj+ydwSjTIndNgEXJmYyBiO4AgVABz6
 hG3iVwnyu7XPh+UgNug0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9gViOcey/P8=;Mc2R97mTzcdXKF4wGargsNsercf
 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
 =

Hi Jonas,

Am 16.07.26 um 09:31 schrieb Jonas Rebmann:
> Hi Stefan,
>
> On 2026-07-15 18:55, Stefan Wahren wrote:
>> Am 14.07.26 um 09:35 schrieb Jonas Rebmann:
>>> +=C2=A0 default-intensity:
>>> +=C2=A0=C2=A0=C2=A0 description:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The initial intensity of the LED color=
 component. As the=20
>>> intensity of
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 each sub-LED is multiplied by the over=
all brightness, without=20
>>> this
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 property on a sub-LED, it may effectiv=
ely be initialized at a=20
>>> brightness
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of 0 regardless of its linux,default-t=
rigger and=20
>>> default-brightness
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties.
>> I have some reservations about the wording. It isn't wrong, but in my
>> view, it isn't entirely clear that the initial value depends on the
>> implementation.
>>
>> Maybe something like this?
>>
>> without this property on a sub-LED, the initial intensity value depends
>> on the implementation regardless of its linux,default-trigger and
>> default-brightness properties.
>
> I wrote the sentence as a warning: You would rightfully expect that
> turning an LED on, at maximum brightness would in fact turn on the LED
> regardless of the driver. But beware: default-intensity may be needed to
> produce the expected behavior.
>
> To me, this is the important (surprising) piece of information.
I totally agree with this and this wasn't my point.
>
> How about:
>
> The initial intensity of the LED color component. As the intensity of
> each sub-LED is multiplied by the overall brightness, without this
> property on a sub-LED, it will be initialized at a brightness of 0
> regardless of its linux,default-trigger and default-brightness
> properties, for drivers with initial intensity values of 0.
IMO the mention of "0" suggests a driver behavior, which this generic DT=
=20
binding can never guarantee and it confuses more than it helps.
I think in absence of default-intensity the user should consider the=20
initial value as undefined. The value depend on the driver=20
implementation. So I think we should avoid mention any specific values=20
in this case.

Best regards
>
>>> +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0 panic-indicator:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property specifi=
es that the LED should be used, if at=20
>>> all possible,
>>> diff --git=20
>>> a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml=20
>>> b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>>> index a31a202afe5c..08e28c5f08a8 100644
>>> --- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>>> @@ -45,6 +45,9 @@ properties:
>>> =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 color: true
>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d=
efault-intensity:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
fault: 0
>>> +
>
>

