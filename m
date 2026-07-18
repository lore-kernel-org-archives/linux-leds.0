Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973E337DEB7
	for <linux-leds@vger.kernel.org>; Sat, 18 Jul 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362549; cv=none; b=G1MQGE9CYTvVX1b96rzzvDCb4yyLPtY1XT1m5uEnCzT887q++SJw8uvrE0oiV9sMoD3g3O5pcPGPwjUzNMq4SnpTViXahq/OLqyUj9kUe7nbRE58fjvF1VIDD7oDcjdt81wct4uBl1pkfCFRheoyhdY5LD15zL95aJ+Ql6j4lZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362549; c=relaxed/simple;
	bh=EzqbWeSzT85oPY2MHsX+tDDam0WXfL2C/ffFGRTeXHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=duBVFvZqO5sH1Tr3HRigsnHhjNA7Dh5JbBinnrnxEOKGAX8fTkwpcA94J7WbAAh803lHs1QRCNV0dChkJ6W6A+tBn+mbX0+9bGU0GcjdCCAOopv/rUeaGtk+16yz8J5L/iwepx8ey+p5zngZXiHZFgnmlwIP8eeHLf+q0Q6GQxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYs7jRGu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYs7jRGu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf452def93so3695895ad.1
        for <linux-leds@vger.kernel.org>; Sat, 18 Jul 2026 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784362548; x=1784967348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSp1oXB6t0r670gpxmHzNoI/B82n3yPGLeuK8fscBxA=;
        b=JYs7jRGu43g3WCEqlZAkH0ZMJ8CI5ngBxe/Akp3r5/JB/S5cDDka76Gz0raky/OVtl
         ODNYSrMYLk69/QBS/ecS16lX0sjRGK3HnEbf6LsscL6pldoUbqYFS/uTScersW4Drs+G
         mPHK2oe8uXu0z3G0Oivixh82oOV7OgT8ZwqTBxckAk/DbgRmJMq/q+N679PREbrDNLZK
         kUz2+QNc2j5TdNXB8VviL8hN7GI2ULUWx1XaPnHgd7vlDoheJ1U6ty9MApkd1IxhNU14
         k4xuyWSDso4FaLT0+2WJkWGDw0vr6TV8Oc7vbI/4h2JJcQN3NemNOHpyvpKnLEai5qlc
         YdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784362548; x=1784967348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSp1oXB6t0r670gpxmHzNoI/B82n3yPGLeuK8fscBxA=;
        b=kV9EgwL0O7ON9Vx/+ZHeKXrsbHjSWAsTfgx0pCsQDhi1vBKiRNeQfJf7I4vfEPoAqP
         ZNVETKtJ1rHZijRPvQNDAnBYQIBtKN2m6jIaAO/TYXjcLccvJ698NcoZlzYztSMq4fqh
         NbXQg2BToieLx3H0FHS3gW4YQwN7M8kF85LzP8jkFwIhGAKr1fRKQoQNMNmSuPtUWWjp
         NttcYgCpDlZ7DyGIib75Jqg4Px6lhAzlXdlw1FM1J/wg6Mf+sWk2XSbpc21NCd2hIPCi
         lkSxVO6U5OzLlcnUm9g3Tdo9reYfMCyVuAJU+PcTxOYEhj/KA9m3hADvcC2WTJHKjufl
         G3gg==
X-Gm-Message-State: AOJu0YwpZB4mH7jivZ3TwJ0/RffNGsIDAvb+CuZMe371lwf5zYPE3f8X
	/itVvkmDWkMfxNbJyR8ZqBRw8ZifbHsDFproxUxgIwOzZ/wUbapMTXbK
X-Gm-Gg: AfdE7ckskkKl14Ozs+JIDW1Rh7+XvbVHbf8WLpP/hby5M7vEgrhxwKNCg51jk/nmHpn
	c5b+3bx+I7DEJ8w2HFzHCSk92j55or5h969L4Ca4Zkptt3rE9IaDy4nFHKq9r7clCUd1bGXXqge
	/ey5EAaFhrXPxbOJCQ9slfwjPVSE+jeVnHDvI281wvW8UQKqGZpKyi7wS+JEuDy8E00yG20aYUJ
	D7UGgLaGSsrabPLgoSFBH18niKPfqrx8EiWNLcBe+peMOx/2/lUQ8NiILBk0km7oOHKvCCa4t2d
	eAo8z9GSMBU1f3rbpJDHSYbWGA7PkXEZpoIpOGTuXurnLW4P8C0Sx006hmgFVpIxeVKmb3ftI1F
	7YfdqoQXuKI8MeWyZBH8OOfqCQqyfALsA/CQK4I+usKiVK1ysG33jnPmqHrFtkl4bhunDYFBmwC
	h5jQrPZpVCcK0dMAMzg/F/3KHZFiPGtWmmn9jS7OR/WouRrPoy9q4y5haCUwo0SbTa67gHrHYOZ
	hg9GSNZJKewVe2S0ZwiedMW091Fqi4cL7HIECpBpdOd
X-Received: by 2002:a05:6a21:e082:b0:3b4:8c67:51d4 with SMTP id adf61e73a8af0-3c38dc7b38dmr11363127637.39.1784362547811;
        Sat, 18 Jul 2026 01:15:47 -0700 (PDT)
Received: from [192.168.0.100] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm27605069eec.21.2026.07.18.01.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 01:15:47 -0700 (PDT)
Message-ID: <2f1795b5-cab3-4241-b3f8-532a7fc4df9b@gmail.com>
Date: Sat, 18 Jul 2026 13:45:43 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ninad Naik <ninadnaik07@gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
To: Rob Herring <robh@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
 conor+dt@kernel.org
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
 <20260701180553.473121F000E9@smtp.kernel.org>
 <20260716173939.GB534222-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20260716173939.GB534222-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 16/07/26 11:09 pm, Rob Herring wrote:
> On Wed, Jul 01, 2026 at 06:05:52PM +0000,sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] The schema conversion incorrectly restricts LED child node names to `^led(-[0-9a-z]+)?$`, which breaks `dtbs_check` validation for all existing upstream device trees using this binding.
>> --
>>
>> commit 6c59295f22b17d02a2b26847db54458f820fa4f3
>> Author: Ninad Naik<ninadnaik07@gmail.com>
>>
>> dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
>>
>> Convert lacie,ns2-leds to DT schema.
>>
>>> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
>>> new file mode 100644
>>> index 0000000000000..679a618906d80
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
>>> @@ -0,0 +1,87 @@
>> [ ... ]
>>> +properties:
>>> +  compatible:
>>> +    const: lacie,ns2-leds
>>> +
>>> +patternProperties:
>>> +  "^led(-[0-9a-z]+)?$":
>> [Severity: Low]
>> Will this restrictive regex cause existing device trees to fail dtbs_check?
>>
>> The old text binding example used a child node named blue-sata, which does
>> not match this pattern. Since additionalProperties is set to false below,
>> nodes in existing device trees that don't start with led will be rejected
>> during validation.
>>
>> Should this regex be relaxed to allow existing node names, or should those
>> device tree files be updated alongside this conversion?
> While yes we prefer what you did, it's perhaps not worth changing these
> old .dts files to match the preference.
>
> Rob

I understand this. Should I relax the regex to allow any pattern so that 
the existing as well

as new DTS files could be properly validated?

Thanks,

Ninad Naik

