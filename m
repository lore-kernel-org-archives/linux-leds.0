Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F2539785
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 19:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918271; cv=none; b=U18TreB57BkTAxiPCUMaKploTeULMzvWYUqakfVrEotad0LCigHjUA0a6ylo6TCG29rbIOn+PsJ8JxMoQU6FU8sntChTZ1Zse2i/31BpqQnNPj+DBNHk+X8JERKT7kDa8avyeIgr98vMvAkPPZPpQH6DnzNWKXvZoAU5rW7emCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918271; c=relaxed/simple;
	bh=PVG+fL6tWhRaYjr50UkRjI82YcG7H2Vhz2OQdtPhIvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4xPbqdIgHDSedm6WnXfSlz4tRe0IvhCki7ywELC8x17L5oafEwLF2AG1iRWDN5bOFtCdGXBQQgUZ9g+KVhRczvJ5SnCYNTMZ9FANnHkdH1qJK0TguO1gRC7WapyXbpzNefer1Vwf7KcymACilVKucrIS6SPd5xOSecf7AwGd5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K5XOyA3X; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K5XOyA3X"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2e36c3478aso36671066b.0
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 12:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791918268; x=1792523068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dw+YFgILYLXDibJ1USxmY+eqnIWA3ZQcZYKp70r8oiE=;
        b=K5XOyA3XRCnyAP6Rk6namb9KAnorIwrJEG6OwJ1BX2eEr73GjYkZr8v9RhB8uOS9rM
         l8jjpSvIlvPuEpUw7qJ7DFKKE5dOh5sfeHPFX4tly04X/fge2zMop7c5fNQ52HWNM8Re
         KkFGTJd5HK7n7X5NF60m8cmI0Xc/6AKPi8Wi9RVnsP/NpCgFz1gK4HeLDPEk0a8mOBhN
         lo0qZHLSN1WRXROkazCY1YLbytPqOmrQCubN6E7wWfUcbu8NdHrD+4aH3o5lMKhR5CF9
         /9UNvC929mpdngqsiNXAEifRZWvqCRU2RQDhP6gSIQGqVKwIzp/sDWbY4cVl7NkSohOj
         IVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918268; x=1792523068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dw+YFgILYLXDibJ1USxmY+eqnIWA3ZQcZYKp70r8oiE=;
        b=EevOb5bV01eucAuuC/bzOXgYK6o/wg7g0IG8naC3Cvxr8SHl+FsCeV+IKHlBncuyy8
         pabbV3LsxyAFMCVLZv9azwAffWZNkyIBzJUsWkBbvuWTWU5uSsF2LHRTdtuIviqV3wAp
         xyYxb2VYLkROLDB17digKXtUSWpwR9cV3G8rOJjmFp0LItwllUSGeDN1dx77QcU2rqEY
         RMB619f3lTa+sy8+3kdcug+IsmsD4qNVgpaZI8GxKM3YfFAqvfEBD5qBZceRaPpNaAFn
         Xs+486B/k/+lBzzJSTHfoZAVnSS0RjU+TQRmTvSb3At8F0WeTTbX04qHLsNiDK7kmzBz
         dnXA==
X-Forwarded-Encrypted: i=1; AKwUvByGOeJlcjcMhZEKLlsHXMrnaNjcm13Xg52nQNKE14LL5JANpZWAe+PDoQ/3403CKfWvvDEvg+vZ7iYG@vger.kernel.org
X-Gm-Message-State: AFq9FYLGqIaNw8A1wB0XuPkUBPCwB0WVh24gVNZvwlgIxYbl7/MnXFWP
	J7HuMRH+0IXnXECqPyUKjAQJ2BPFo6kJoNRmbuAes/NbXtKyD7qCD1Ak
X-Gm-Gg: AYBFou292EWYYzslHKFjiv4g6Eu2dCTnXcdmKR53jxKdAQTNo6nKCMZF9ugKtJx0XJh
	/3owLSKi/sNxA5P6h26lbePDKwEQi/HC3+ipS6YSC0AI1VJfEkR85ikyN2m4kVT9ouwVsTjQ66d
	TWQ+houDKvHm5O44u+NLIEqfNijDr0+6tLL2QlK0JC6hE0uhHfJpNN61B5RkCGdaxArrerFhXm1
	yTsnku+kNjG9Bpfl8InOHBzP7QHCSQcjD29YSxJ5TvhG68kR8KQbwCYmxze9pKLPcZvx9DwGAb3
	39mmnJiKrk7p5OIR1zcXdHZa10GAdE46qRBy1zFVV4ZcPWHOazg1oclkBCK2uSo7MbUBZQngapO
	A28Ekk+v4T3xMOYrwjZb3MDT84aFoqaDSOyYWXRNS4H8Jwss7bcVH+qEL1cIvCozaue3yfooYvb
	XePHZX9bRQoAW6IPQza+HEXBMrd0+X6GD/G1c8YPbpZ7Qpbj/bVBtWbRqrD9EMGL6T0yqhZ/wR2
	6QAwVIZd+4=
X-Received: by 2002:a17:907:9615:b0:c24:adf4:5c73 with SMTP id a640c23a62f3a-c31a9a28825mr1274888966b.1.1791918267915;
        Tue, 13 Oct 2026 12:04:27 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3596566d8bsm224558166b.16.2026.10.13.12.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:04:27 -0700 (PDT)
Message-ID: <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com>
Date: Tue, 13 Oct 2026 21:04:26 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
 <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
 <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/26 9:25 AM, Svyatoslav Ryhel wrote:
> нд, 11 жовт. 2026 р. о 20:35 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
>>
>> On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
>>> нд, 11 жовт. 2026 р. о 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
>>>>
>>>> Hi Svyatoslav,
>>>>
>>>> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
>>>>> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
>>>>> inhibition.
>>>>>
>>>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>>>> ---
>>>>>     Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>>>>>     1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>>>> index a65d92522c9cf..596b5e284f44a 100644
>>>>> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>>>> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>>>> @@ -31,6 +31,10 @@ properties:
>>>>>         maxItems: 1
>>>>>         description: FL_EN pin
>>>>>
>>>>> +  flinh-gpios:
>>>>> +    maxItems: 1
>>>>> +    description: FLINH pin
>>>>> +
>>>>
>>>> You don't seem to make use of it in your patch.
>>>>
>>>
>>> I don't have to use it in my patch. This change completes and improves
>>> hardware description of the AAT1290/1270.
>>
>> Still, If we don't have the use case I'd avoid adding it to not confuse
>> people looking for its use in the driver.
>>
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/writing-bindings.rst?h=next-20261009#n17
> 
> - DO attempt to make bindings complete even if a driver doesn't
> support some features. For example, if a device has an interrupt, then
> include the 'interrupts' property even if the driver is only polled
> mode.
> 
> - DON'T refer to Linux or "device driver" in bindings. Bindings should
> be based on what the hardware has, not what an OS and driver currently
> support.

I'll leave it to the maintainer.

-- 
Best regards,
Jacek Anaszewski
