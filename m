Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A48B3B7B7F
	for <linux-leds@vger.kernel.org>; Tue, 28 Jul 2026 08:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227848; cv=none; b=ZFZN/wJ5XSnTd1FT6fRYvXupTE3c9qXQFsHCALGvhiprIfrt3VooTY7IRpTyBZgWG0/0eaXWGqTdLvqC6KJzlwzcxsZfE67mhoK63Z4zWzsgmh0a31oP45v9oPrwHsvL2qS/kZKn18ko30XBrUfANpSuz65OI6/irRYKdP8yrDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227848; c=relaxed/simple;
	bh=kvOziwHTfwbnIkMV33Q47vUInB20/3D0E5bjpQBS/js=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mx3p4y/kh65g60YMnXB2ciSzmtYTpFW++e7LkRAmf6lwJXJex00w3Gkuw0HqEqVXIxHnCNIlk4GsRbWbmWBpkAQ48wqQ12DW3GyNkyeXP8gLAan+eoKfThAcQdXiyn/9JNzHgvYZtuOx1ZdrBGi72dYU2gRgp4qfRhAJ3N/wwPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAu56gvN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAu56gvN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e347638adso3300262a91.0
        for <linux-leds@vger.kernel.org>; Tue, 28 Jul 2026 01:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785227846; x=1785832646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfzWVXRZDa4gX/lhkOHjJJWDV2ss9jewQTF5vSegi9s=;
        b=WAu56gvNfpTZhcukEewYq/gkW8ekoEADQU+GxGbtcDRFjPyffljTU2jPR1EReFs4o9
         uiKiaEfB/57DjZEUQl0AAmqJPNPeg/dq9RKvSqbfrKHTES7s2fJLFccb4PRLS1U3nFKZ
         WjGSNkNSUebV16WPVbT8liuhwRw5KYI3gsrtkzqeSTqAXvL4w0uK4paLoaOKztqQ3wZc
         OV7IO239oPJh6fvidnJSqBsGviwKqxTGYAVvBmKAXP7A4Vb9mMNGmPUlhvoiRN6cg3TT
         6JDbc2fqDBDA8nBPla6PA79jim92IL0LN4ee6qYOGuTpw/XDQ5KEGNdEMNJSnNPUUArV
         AklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785227846; x=1785832646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfzWVXRZDa4gX/lhkOHjJJWDV2ss9jewQTF5vSegi9s=;
        b=OTJRYR5vvbCEgNxOisV05Yc98iLEzLbTEP6ufPrlaV7fXPpkrq9dXeUiRLMkwJg4/5
         /uZRr7BBEMZYpaXAHACw3JFhHTK5rdln2dWvxKhWbsx3o/6ZHCv8797hfxw29fO4ATyz
         6q/QMuNDYeWhydGDO1BaYnFo6b6L/OxEGw4L3qiuvhhNu70dBuUSW7tQ0/dCFLTiyIyV
         Jl/7To2mnwvCu7LMuI53vRVeP70K788VSWtkPg6m7rw1EHHIrlTaaot7YTTeGdwn+Am7
         5P2dy6clxv1Da415yP11wRhVTFejdvjdKG5JqDbZ4err/zgloA0OGzm8cmDClFdxJPiq
         VpuQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhrEwokw5h7wkF+nZBXMAPpi98//AiT1Pq3UpV8UGYETLGGeRIfFkHnPL0LVtOau4GkBfaSIimQgWw@vger.kernel.org
X-Gm-Message-State: AOJu0YwraSq/5SXWF0HC9L1tH8QV5v6/I4229R389+00my2fJtHaU5p2
	yqVLWVVDdcVPwZ6Ub9KwVFfy5pduZM/5BoGGiMp++U1fMLHXsXySrd4XrdHth3J+ydfyVg==
X-Gm-Gg: AR+sD101HTMhEFRUWwuhTUI0RfRfhik86CDg+ee1Ukbz8yVoA/lmNmIqUSCVe/VdPS7
	12e4LR+hlvjMsqWRY+HC9+nE1OXxlxOSpzVk4fybvpNAzf/HzNZmhbBpIgJuMDxKogMU7BlkXXa
	pZH/Woz8p8xvF4mna3UCdl1dC2a0O3n6op+3jfh+jEwh7NjkuaPBLoAr1sNKX1yqT0y3psPBeYw
	ETzM9ZA+9q1jyLq68BkWJ/XrcomDNbdz/EU9MBo6c5N7JpjT8z4RtGcDjvlHx8dyp/gVZi6Nz40
	kMdP4cWKUj4FXxm6GDZ6z80s5dZ1utzQbqBqI9SY98z7+ckIKa/UZvV//5HxWLBoea/CRqVlKFC
	j5wmljxYyqFuFcMaXUkhSrtol0sYYJMCB5Ko7cH0y2ma36Ognxfmr4vsD1Bxyf7eATlSkQ3wHNA
	C5VrzQ/ycKRxr0XmEaOAXWau5e4s5O+Sc6Hbl1jNUg7Kyx5KXVpmABOZ811OQ4JAjcdNnuV1qvU
	L/cmWiONyJyMudn3VwJ7yFCZOH7A1pvhWeAZNGYa4rCJvTrPh9hW05d1JxJgZTDNOCiG6CBaWWb
	gSSOuu6kIo0c/1zE+TUu8juYV4e+OUCdLUrAono=
X-Received: by 2002:a17:90b:57e4:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-38f6a4594e1mr1751973a91.16.1785227846554;
        Tue, 28 Jul 2026 01:37:26 -0700 (PDT)
Received: from [192.168.0.100] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412d1cdsm944553a91.10.2026.07.28.01.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:37:25 -0700 (PDT)
Message-ID: <b004a0f5-1dcd-4d40-84c7-33108eb20395@gmail.com>
Date: Tue, 28 Jul 2026 14:07:19 +0530
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, simon.guinot@sequanux.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev,
 skhan@linuxfoundation.org, kernel test robot <lkp@intel.com>
References: <20260724162332.32291-1-ninadnaik07@gmail.com>
 <20260728-garrulous-wild-jellyfish-a6e0e4@quoll>
Content-Language: en-US
From: Ninad Naik <ninadnaik07@gmail.com>
In-Reply-To: <20260728-garrulous-wild-jellyfish-a6e0e4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 28/07/26 1:24 pm, Krzysztof Kozlowski wrote:
> On Fri, Jul 24, 2026 at 09:53:32PM +0530, Ninad Naik wrote:
>> Convert lacie,ns2-leds to DT schema.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/r/202607231542.6ovJrInT-lkp@intel.com/
> Drop both. You need to read that report again.
Sorry, I missed the line which says not to include the tags in a new 
version of the same patch. Will remove.
>
>> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
>> ---
>> Changes in v3:
>> - Add optional property num-modes to the schema.
> Missing rest of the changelog.
>
> What happened here?
>
> Rest looks good, so with dropping incorrect tags (really, please read
> the email you received):
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Should I carry over this tag in v4?
>
> Best regards,
> Krzysztof
Thanks,
Ninad Naik
