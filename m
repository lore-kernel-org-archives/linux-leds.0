Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE33330D34
	for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784187080; cv=none; b=lB4XOljlbNYxldaqyL3YE7v5JKUX1KT1n6siPjkC/GYK7KD6+n6ecfIiyy8KWzu9ViVydG7TqWF/xxiswrKd5gFnKNYfUuIvwWuDtyZ+arRkX3OC+I7UxOolayFGX5st1h9WNh+7SQylTcWJPqVNjGChnBVmbh767jD3srOt0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784187080; c=relaxed/simple;
	bh=QCkCKrqn5+bhLdTzCLwxeYCnpD2o24mk9JMH1WQrJk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iReIo0vBY4RltJkZ2i2TP8TXZ+xI4hu5+yXQVwi1N9/S+y7ChBt0Kt5Vrj2QRjlR4pgyrik5KYic3LDge6Tus8a4bGkHsHx7cJi6WuXsDcgqf6XtTwY3Pcq/vv1pVO2tOWcjZY8decnkOzkEMPY/0t6ibl3Xr+7HN5jYNcmmFl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wkGYj-0007ws-Ca; Thu, 16 Jul 2026 09:31:05 +0200
Message-ID: <24f25df5-d240-4313-9162-a52ec9d7b84f@pengutronix.de>
Date: Thu, 16 Jul 2026 09:31:04 +0200
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
From: Jonas Rebmann <jre@pengutronix.de>
Content-Language: en-US
In-Reply-To: <1a458220-daa9-42a2-8a68-7281afc82eb4@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Hi Stefan,

On 2026-07-15 18:55, Stefan Wahren wrote:
> Am 14.07.26 um 09:35 schrieb Jonas Rebmann:
>> +  default-intensity:
>> +    description:
>> +      The initial intensity of the LED color component. As the intensity of
>> +      each sub-LED is multiplied by the overall brightness, without this
>> +      property on a sub-LED, it may effectively be initialized at a brightness
>> +      of 0 regardless of its linux,default-trigger and default-brightness
>> +      properties.
> I have some reservations about the wording. It isn't wrong, but in my
> view, it isn't entirely clear that the initial value depends on the
> implementation.
> 
> Maybe something like this?
> 
> without this property on a sub-LED, the initial intensity value depends
> on the implementation regardless of its linux,default-trigger and
> default-brightness properties.

I wrote the sentence as a warning: You would rightfully expect that
turning an LED on, at maximum brightness would in fact turn on the LED
regardless of the driver. But beware: default-intensity may be needed to
produce the expected behavior.

To me, this is the important (surprising) piece of information.

How about:

The initial intensity of the LED color component. As the intensity of
each sub-LED is multiplied by the overall brightness, without this
property on a sub-LED, it will be initialized at a brightness of 0
regardless of its linux,default-trigger and default-brightness
properties, for drivers with initial intensity values of 0.

>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +
>>      panic-indicator:
>>        description:
>>          This property specifies that the LED should be used, if at all possible,
>> diff --git a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>> index a31a202afe5c..08e28c5f08a8 100644
>> --- a/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>> +++ b/Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>> @@ -45,6 +45,9 @@ properties:
>>    
>>              color: true
>>    
>> +          default-intensity:
>> +            default: 0
>> +


-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
