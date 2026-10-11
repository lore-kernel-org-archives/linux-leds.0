Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E8137FF6F
	for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 17:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740159; cv=none; b=l6H1owJoBYn9hDJDQZjMaMWir54arWaCeP7EnbTsTXazr8jGTw1ZueihWPL4q8gvH7nSZB8AH+kldfIXqalhGt8q9lsbT8R9kNvzjeUB1m7PEozmwj+DacvvTy3YzoYjAa1LatcFRRbjWhD69k/4i7EsnbH9O2YiRiSWWynLnjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740159; c=relaxed/simple;
	bh=BA6Eq7SxDm1L8zEyXbbvdU/Ub4OE26FS6uK891J21U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnIW12ccUMIbOG/NzQ8oIqez+i8KtbmmmlNaiMKT9wNgTzNX0tJbIoB7IhYUhHvWKDYRxQ+YfD1DH5g3/Z3hF+CR2H2uis9+vZdGiCJeRqu4mh/xhb86Rg3hBYtw5QsWK4n7TdidwN0WuQaUuub7TF6+Zl2IuFoTKY//9nhE3Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dePmDayW; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dePmDayW"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e62319cfaso109319966b.2
        for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791740155; x=1792344955; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crwJpou1dc4UoRYz8bgCYYV5fnDg/uzo/t0oCNRfcv4=;
        b=dePmDayWmv8v0mwSzR5nVk15cgoAHarFsNHNDSXgdCMv2nKjiNoagrt901O76U3ZaT
         ViR3hutQjPwdEUfQSSU1Pa4p8HkJk/nRelBepZWCzpR4Y6ckXYDEEhrDCHxDt6lkczh2
         y92xapLFiVA+lhq5Y4c/JNmFUfLJwIlAAHKzD3k3HBzfj48+5ZrDe1NzM4asaZikFNUy
         D0RVQQyu/DO2c/KAIczkRwiqSmKFZqmkrww4/Tev1miwV+7C1l9b0gEWQuCs/mlcaSOs
         HOuRtD5ud2K/Sp6iV5+hh60Xh9TMmPLOVJOU69Niu8hctfVdu3nFat0S8oG+7ixpEoDG
         6gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791740155; x=1792344955;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=crwJpou1dc4UoRYz8bgCYYV5fnDg/uzo/t0oCNRfcv4=;
        b=fOihw++xT9NmwLepqoDrbY/LOqDmtHBQai3RQrdHWE3Kcz0qISQb++viRQNxFlMiRS
         nFS/m3gbah36tvbycoqqtuF+42PZLECW7wk9gIAl09z8wu0hnugF2jIgo1Tds7DEDQM9
         g2FzRsU0f6bncKfuFca6MsFM8P+N6M+eoOvo2K0sgyCbTSI7yTuMr1B4/jHhJRkjAXZ+
         vHoLbuEUjIgSj4UYVeHiSyhsjNr4pdg2HeHj5i4uK27+76sbR6MVqEA845VciAYiL31N
         Cm1lJI6nnW12cvZXkzouWbZPzlURJB4sXsNIfBzqE/iDm1dmpRwvqOS1J7kDvov2/CDl
         ORGg==
X-Forwarded-Encrypted: i=1; AKwUvBybVb2JRwLFWaUYXgtQYf+RcOC8eTrQSNBvomhgTLH+cuPTIQPLCfODaO8xFI54T77/ZF/gm8Q6NAIH@vger.kernel.org
X-Gm-Message-State: AFq9FYLWWmsTmHM1YMzArb6lV47manwAaLz/IhYF9AVMJaN9S+dsVKim
	6ebl4GxZCSr1zDEx5j5sz4xEqhhHPm77+mWd3sqfSxB/z/SmMfgy/+P9
X-Gm-Gg: AYBFou0JD6RuY8R3CJTzSOewW16VnY99WmnTfWRZX/je07NwYmPvh76WpSKmPKmYW5x
	hRkc1kEsJNbIb5M0lApO1PT/mRF8FXvpmrx1BtmwErpKlJu78BQRNzdUCX6mtKxVzq+cUWk2Iqz
	PHPENySvEM/Y8DmjPTMR08jfD4nPz3s6SsoKrn9H8OyW0YRQO3MkUnQV0nRfWoqpV8lOPm/d6bP
	nvheyNXAVxc54Y17fPCvJ5iKzAye8wM2SvWkwQDHHtbfq6AR0geO8FcAOsMmGYwPoFD3ZTmF2Kx
	SUInostDBGkPLK3gH6FhxLSi08+W1RwJdUpk7sPSg6PZmngaWKJ2X1b/hiBS7WP0PjpUwCcBYZc
	AhQkUAj9BjcF0rCdtOSSP5mvSAGK4Tyeh9URwVvH56YOdHtKv1nSe8I/FY3pdWi1rzvgkNP+DQP
	TGvVvnvDE0uBWOFlzq36/MPRgMzexH4rFlcOL3BADX5YJIOwc5ECuMRUU/sr+6+72b8nYl94dxY
	yaABdOso0XSsVTpMQGW
X-Received: by 2002:a17:906:c106:b0:c24:6f60:3f7e with SMTP id a640c23a62f3a-c31a9a28f90mr757418966b.2.1791740155162;
        Sun, 11 Oct 2026 10:35:55 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm381019766b.20.2026.10.11.10.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 10:35:54 -0700 (PDT)
Message-ID: <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com>
Date: Sun, 11 Oct 2026 19:35:53 +0200
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
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> нд, 11 жовт. 2026 р. о 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> пише:
>>
>> Hi Svyatoslav,
>>
>> On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
>>> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
>>> inhibition.
>>>
>>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>>> ---
>>>    Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>> index a65d92522c9cf..596b5e284f44a 100644
>>> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
>>> @@ -31,6 +31,10 @@ properties:
>>>        maxItems: 1
>>>        description: FL_EN pin
>>>
>>> +  flinh-gpios:
>>> +    maxItems: 1
>>> +    description: FLINH pin
>>> +
>>
>> You don't seem to make use of it in your patch.
>>
> 
> I don't have to use it in my patch. This change completes and improves
> hardware description of the AAT1290/1270.

Still, If we don't have the use case I'd avoid adding it to not confuse
people looking for its use in the driver.

-- 
Best regards,
Jacek Anaszewski
