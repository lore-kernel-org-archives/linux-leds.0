Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7983B7B76
	for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 11:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201186; cv=none; b=C2PAvyXh20Qcm4s+J0JxX7TyBI/WVok7WID6NRi2+TsEQWi+auwh7JYmTtufTZBTiaQ93FkQxv24AYPkdxEiaW3irXEqhM4NWwNjNswkGtSbOHRG4yQio10sN7q15Si/z2nVP2IyZGJCwU2T9M/Bw+sNKdQpziQoYXlB2jvnDVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201186; c=relaxed/simple;
	bh=coWmigJsx+ElzWB5ARTuWqx25/AMQ+AaOPeffQHrEZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ErErJb+LcNHoLYLOMMb//qdqiwzTIuV2BmxydjzkgLKENPWvN3fGtLrF6yeEG8zfxs65+AW2l1Hew4gtjb/SzIK1YWBmBY0v0wRX16V7hz5JVewWc84Y6AIkQKu1s9WZps8QnimYWgvKSfDusehhkYY65W+8/qssCAhfQSjZgzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wkKE5-0002Hv-3F; Thu, 16 Jul 2026 13:26:01 +0200
Message-ID: <d7b6ccff-fd3b-4985-b2df-82890f5b58ce@pengutronix.de>
Date: Thu, 16 Jul 2026 13:25:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: leds: Add default-intensity property
To: Stefan Wahren <wahrenst@gmx.net>, Lee Jones <lee@kernel.org>,
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
 <228dc585-4aec-4477-9a01-812815bdf288@gmx.net>
Content-Language: en-US
From: Jonas Rebmann <jre@pengutronix.de>
In-Reply-To: <228dc585-4aec-4477-9a01-812815bdf288@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Hello Stefan,

On 2026-07-16 11:07, Stefan Wahren wrote:
> Am 16.07.26 um 09:31 schrieb Jonas Rebmann:
>> On 2026-07-15 18:55, Stefan Wahren wrote:
>>> Am 14.07.26 um 09:35 schrieb Jonas Rebmann:
>>>> +  default-intensity:
>>>> +    description:
>>>> +      The initial intensity of the LED color component. As the
>>>> intensity of
>>>> +      each sub-LED is multiplied by the overall brightness, without
>>>> this
>>>> +      property on a sub-LED, it may effectively be initialized at a
>>>> brightness
>>>> +      of 0 regardless of its linux,default-trigger and
>>>> default-brightness
>>>> +      properties.
>>> I have some reservations about the wording. It isn't wrong, but in my
>>> view, it isn't entirely clear that the initial value depends on the
>>> implementation.
>>>
>>> Maybe something like this?
>>>
>>> without this property on a sub-LED, the initial intensity value depends
>>> on the implementation regardless of its linux,default-trigger and
>>> default-brightness properties.

[...]

>> How about:
>>
>> The initial intensity of the LED color component. As the intensity of
>> each sub-LED is multiplied by the overall brightness, without this
>> property on a sub-LED, it will be initialized at a brightness of 0
>> regardless of its linux,default-trigger and default-brightness
>> properties, for drivers with initial intensity values of 0.
> IMO the mention of "0" suggests a driver behavior, which this generic DT
> binding can never guarantee and it confuses more than it helps.
> I think in absence of default-intensity the user should consider the
> initial value as undefined. The value depend on the driver
> implementation. So I think we should avoid mention any specific values
> in this case.

The only implied driver behavior is that intensity is multiplied by
brightness, and that is well-defined across all multicolor-LED drivers
(leds-class-multicolor.rst).

The warning here is that "for drivers with initial intensity values of
0", default-brightness is dysfunctional when no default-intensity is
specified. This does imply that the behavior is driver specific, not the
contrary.

But the key message is that there are cases where without
default-intensity, a driver may just do a whole lot of nothing.

This is not only against my personal expectations, it is also against
the documentation in leds-class.rst:

   The brightness file will set the brightness of the LED (taking a value
   0-max_brightness). Most LEDs don't have hardware brightness support so
   will just be turned on for non-zero brightness settings.

This I find to be much more of an issue than an LED blinking in an
arbitrary color when you haven't specified the color. Not only would
that to me be somewhat expected that I didn't ask for a specific color
and got any one, there is also no documentation I know of that says
otherwise; and the question seems completely hypothetical given that
to my knowdelge, no drivers exist which default to anything other than
(0,0,0) or (max,max,max).

No multicolor-LED driver should have ever initialized intensity to
(0,0,0). In that perfect (and/or non-backwards-compatible) world, "The
initial intensity of the LED color component." would have completely
sufficed as property description of default-intensity. But since we now
have LEDs that don't turn on when you turn them on, I felt the need to
include this long second sentence.

>>>> --- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>>>> +++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>>>> @@ -45,6 +45,9 @@ properties:
>>>>                  color: true
>>>>     +          default-intensity:
>>>> +            default: 0
>>>> +


-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
