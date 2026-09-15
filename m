Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3AD44C65B
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 19:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501792; cv=none; b=VGAyv20L2HpLtVmBDdTcRiixCjlBa9cKQ4jl8D63allOUyiOZeZ6JODFOk04NYzIgGQiWUAt88Tw5wLsK112Byvu0xddyuwxAJfJlUzftOlyXi1+DVdJBpsBZz9SfaHxqUOv+3xvGBhcWBdxFsAD3zXmYoalS2XloQdquPVc/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501792; c=relaxed/simple;
	bh=Ox+hNbTd7f3+G4o+Sw8Uzx0THm/NdMARd2zaTFBMXU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5wLNInD5Xx5ltRaG+7NZi/LQJr2MFbobU5OHtFQhdWvbYuPXvpW6Y5a4c9wWvsWb6UsVesoAGpzL/0hOtNf7340Win9yVOT+yppZEQi7QxVzmQa/GtvNHavZPqo7PeaQ9O/rqXFrafQjmiJYwmHxRn7CF27VevpUNbO++QZO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s0TUYJeq; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0TUYJeq"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so109366a91.3
        for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501790; x=1790106590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8A5+VLIUxly1brCbgDAu6UdvaY0/rGFhneDDaN+WcFg=;
        b=s0TUYJeqCqxXG9B2wBtLX5teQlFVqBteh46IKtD255/zdKrhQ+Ad2+YuQMA0N5nxir
         ecdbqJ33HTPMRVzXydNQUZK1H2W9UFr9bX6R65oJkZH+Zeh/RZMb6s6yJG6AeBI7QkWt
         zzx4/ZtUB4auFsIwEkk83q2vhfVqW16PJcAiTPtEZio+ddg7tOjTTIoMcDxRsoKE13Yo
         jB12NsttsL5wYhIFrwMbPuXLfMyweIWOK48uYVYREo4MoaaVK9rx6MDkKRZkyHX8BsVg
         qhymf0Sp4pmpq4XR/cDdGmcCSTOcwjnh9XnhFh78MWHMnYckA7oaMea1WWAVH4e2WeB3
         cTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501790; x=1790106590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A5+VLIUxly1brCbgDAu6UdvaY0/rGFhneDDaN+WcFg=;
        b=Qc/oeHidQEe6ecPsoA2PgYFPFI2x4wTjWmHBfnuolBJppvgnqMXG6aTRCrjklIF60f
         TOIChmbdqIZfpLexx8LJIuf+HSMqHrzIELZUmLr1AhE3jaaI/FuoPPfGjPsNkxCV+7Z0
         8CRpAde2goC1K7hxVkLDGp0PGB4/XQLq9UfOFZ7j19Htjv2h4rU3w/1wQbacf1XFzKQC
         TK6EUnOZ5t7d/YbyMum8giGJvVSlRGAP/v86OR+1Ae0T4ZfjnOVcAiW/ii27FaDrWiqA
         GuaLYyM/45qe1pJai+hHOYFaA80f0N2V+l/3gQgGJL416/5Yv+bPS4miZ+y+LsFhMB/s
         QhLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYYAx1bGLkIzErj8eOW8COt1/AgIEcbFLmG12wlTG517iLMa815tamA4njJ/kCcNlddSwpdkJD4Su0@vger.kernel.org
X-Gm-Message-State: AFuF++kGiBKddDCwxVqVHHqFAZ6Li5tu+z4iiEp2msKYP3os/6n0aaLM
	BXSqJZkDSbE0CbqyDsCdzfmdbIGNubBbFemmhM3rs795FLGPFoDtWEbp
X-Gm-Gg: AYBFou0kMomve2vemZZmDdUSlXhjK9XoA4uLeRqvCAd+lf6zUBMANXLuZurPEhliVsl
	EJM37AXxkThptNbGcEzYECk6c0JkVt5ObmffcSysdghEd/KcxKDVuFoXEoDluuRE3b9lxSMDIgQ
	PKILU9iXPcwy8/Bo+6pBKYSpRgmdX+SwwXMsJ5TtT3FywyqvYSFuO/91uvLHAqDYntd7U1YXMj2
	WtIs7jWY9zBS9gXdqc+y9dn4MNmY6QOsGfK0ZIwsv0cWz0IOIaplsXW/Xi1eEnTF4WmW+lZOYzZ
	5t1hsbTHKSJAFKRoOcUa1yHp5IdR4Gba2OK5mj/kCAdA64W3TwdCMD9qcqf4cp3K+e9KnM/hLQD
	VXR3LH/psTGGoKT2N7NjsLHpNHSFNmZygSX6e/GL085v19DTkrKk5iAKwaczlavzmtF0YsOk3gS
	SzIT0/hybkJf2yUVKMTOtkZmjV5ZPIheIXSKfttJ2wttgIQZ0B2hIqB0K6+u3sYT08V0ltxngsf
	FEMDAL0kKJwuxlA9UH8bKZGAp6MoW5A9LLeHPm8EpJGBkNsixo/LAc=
X-Received: by 2002:a17:90b:1f84:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1b0c5c9dmr789092a91.0.1789501790027;
        Tue, 15 Sep 2026 12:49:50 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm821075c88.11.2026.09.15.12.49.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:49:49 -0700 (PDT)
Message-ID: <583fd625-b57f-44be-96c8-94d981c29c79@gmail.com>
Date: Tue, 15 Sep 2026 12:49:47 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-leds@vger.kernel.org, lee@kernel.org, robh@kernel.org
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-1-e1fd2edc8d84@gmail.com>
 <20260913024510.485A11F000FF@smtp.kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260913024510.485A11F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/12/26 19:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `oneOf` constraint incorrectly makes `ent-gpios` and `vin-supply` mutually exclusive and strictly requires exactly one to be present, contradicting the claim that `vin-supply` is optional and artificially restricting valid hardware configurations.
> --
make ARCH=arm CHECK_DTBS=y DT_SCHEMA_FILES=richtek,rt8515.yaml \
       qcom/qcom-msm8960-samsung-expressatt.dtb \
       st/ste-ux500-samsung-codina.dtb \
       st/ste-ux500-samsung-codina-tmo.dtb \
       st/ste-ux500-samsung-gavini.dtb \
       st/ste-ux500-samsung-golden.dtb \
       st/ste-ux500-samsung-janice.dtb \
       st/ste-ux500-samsung-kyle.dtb \
       st/ste-ux500-samsung-skomer.dtb

all 8 in-tree users of this binding. 0 warnings.

existing hw passes. Probably not useful to account for hw not in the tree



>
> commit 72463777ee1c18e7913b350d5d2ad857810ece89
> Author: Rudraksha Gupta <guptarud@gmail.com>
> Subject: dt-bindings: leds: rt8515: Support single-GPIO flash ICs with vin supply
>
> This commit adds support for single-channel variants of the RT8515 flash
> ICs. It makes ent-gpios optional and introduces a vin-supply property,
> adding a oneOf constraint to manage their presence.
>
>> diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> index 0356371a6b014..ab3c5139132cc 100644
>> --- a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
>> +++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
> [ ... ]
>
>> @@ -81,10 +90,15 @@ properties:
>>   
>>   required:
>>     - compatible
>> -  - ent-gpios
>>     - enf-gpios
>>     - led
>>   
>> +oneOf:
>> +  - required:
>> +      - ent-gpios
>> +  - required:
>> +      - vin-supply
>> +
> [Severity: Medium]
> Does this oneOf constraint incorrectly restrict valid hardware configurations?
>
> The oneOf constraint strictly requires exactly one of its subschemas to match.
> If a single-channel IC (which naturally lacks ent-gpios) does not use the
> explicitly optional vin-supply regulator, zero subschemas will match, causing
> schema validation to fail.
>
> Conversely, if a standard dual-channel IC (which requires ent-gpios) is also
> powered by a vin-supply regulator, two subschemas will match. This will also
> fail validation due to the strict exclusivity of oneOf.
>
> Should this be modeled differently to allow vin-supply to be truly optional
> while safely permitting single-channel configurations?
>
>>   additionalProperties: false
>>   
>>   examples:
