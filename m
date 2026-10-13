Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4239A53FD36
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 19:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920161; cv=none; b=h0gXnZ+4okc81jMdon929s4N8wSlbBoaVy4Jc2FDw8a9kd1N8aEkSijlQ4oXQPWxOj8JjgoVtAstD9MO1ohAm6oLnNaECIeALNdQJW93Xiy5kd7GiSpR3uGZ/mLIQkzZVVFUTn8E4+2qB95zCSp3GgRvT1nmPrjoFqCd68OLqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920161; c=relaxed/simple;
	bh=iqhwU817Bh8wtwkSFHCvKH199xxOPA3S/QxigndqQ0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1NeVxzXXCRPWF2o5zawOMVgt7lpaHvss+k3Ld5de0RxW7sBYAAnmywsGpzOca7ZnI9Bzsqt/BkOchPrApF5MAfdf6BQEI8SjKxVzMg23TRtDeZYuZxIvvj9yN7hCXAomfZjzsD2hRG7De6wqtMJGksS7Rtz3k9mgzXVYwL+zu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBA/c04d; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBA/c04d"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c34bff61551so413473166b.2
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791920157; x=1792524957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygjSuqCbowZLjIljPoawIjXxQn8+JXgOLFh5Pk7xYdg=;
        b=nBA/c04d03+4FS8zRFlxSo7hE+ocg/hFKDlZJjyCjvMDyfbYcoS1OYE+Zl5jkvaLi2
         dEEhTmXUkExjqrc+5fn2Xj3j84DQZDTUqK07nTDS0nc2yFz/Jpqoe86J5PPJkkh19jIR
         1PApW+oxSnf18GRALq1oS2LhB745qTTJ8RlbiaBM89OnBEkQ0kJ539o78Yl/JDN0lL3A
         epMng4KcYsLYc4j87rrh93lz1RpBz5+SY0UlF9H66FMDT9gNDenjVjR9hDlUmisvSmi5
         FHtRseykRoSX0dgmVwkvb/jc+ImjCukLqV9q+Pfe2uD5VwTMUJqdyEWos2eB+l/3HP6V
         HU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920157; x=1792524957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygjSuqCbowZLjIljPoawIjXxQn8+JXgOLFh5Pk7xYdg=;
        b=Jem/RFTK5chwfg32fcYGmbfA16klUMRNnUFeAQ0YhUeRwz2EUkrf/43NjTYUtOexF0
         CHGeHrYu3AQ3Ldir48e8HMAjhZfNU78GtVY3e+MNDuMjQemCFmQTLezn/o3OcWyxbBwt
         84/VW9iv4cbYAq3ZKL1Q2m5eO5vuUN5ke35aktTzRLkT5Yj5ftRMDB5nYcLLFb3AQcqm
         0oCGSZPaxsF6tFqfWho/FfILsLr+oVyoE5IKC/yLvNJfEq8Hro9EDOo3dyniknauTQ/S
         A0JZ3Ql+0bPeZCQRxBYpiV8p4K9tD8oT0uecF/+dDu3uV80Hid6sZWkn1DOcVSk1rQb7
         twHQ==
X-Gm-Message-State: AFq9FYLbuHMMLsHw/8Afv7I0vy3uPKj5usc5bshlgC8c2floyuuYSaja
	ZRASslZ1d3ZaC5O07CDK9/XU/R7rmxxjCrLP0Dz2TyAVcIROisXPVRNH
X-Gm-Gg: AYBFou0RA+D7XEMkNEx7Xa/hgKdArFJn8nl0If3TwXF6isUYAeEiUdedufjBq3C4W0f
	40cO1QiG4CGaAVyBnMJhXebZ86r40nKOlqm8E57FgQbu6l+CYMKywVUuC2GGT+WuwRAnS3hnfLF
	n66m9V6MeUaQeRMZZPSKvo5PkajQod3/JV5SCJ7JhYuRDwap3A4h1qBpSTRRiBpK0K26rVAhZXl
	hoWCwiiZQphz2MRXUjcPmdQRV60UCk8NM7F1P7y1HK0ZUQVcwPQVo7tPYHS5QIybzYOkuMD2ujR
	wigZRsICgFeR0wHsx1R2mrREql4p47TNgG9isu2BT0++XTpo3EUqYCRFlTUUk8sfI8of/xNR/2X
	yvNxzE+8jxOezObeOlc9v+wdli3LWzmVcbhyCcGsTfRTF5xE2gLFtcB1dYytuF4jMnbA0JC4vFp
	GCyQAXAL8ORXQWBkFd79RaRoVgjhEwiNG5P3v5eJyxIW9XF3jdBwjglIneDssWXVPPP/0byzfl/
	cFwLb1kX5gS8W6wDR0g
X-Received: by 2002:a17:907:9485:b0:c24:e1e9:69c with SMTP id a640c23a62f3a-c31a9715f94mr1282040766b.0.1791920157246;
        Tue, 13 Oct 2026 12:35:57 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203863511sm232266a12.20.2026.10.13.12.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:35:55 -0700 (PDT)
Message-ID: <f401636f-7edb-44dd-b47a-4c347d33ed2d@gmail.com>
Date: Tue, 13 Oct 2026 21:35:54 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] leds: aat1290: Add support for AAT1270 Current
 Regulator for Flash LEDs
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees+treewide@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-4-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261013181803.496627-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

Thanks for the update.

On 10/13/26 8:18 PM, Svyatoslav Ryhel wrote:
> The AAT1270 is quite similar to the AAT1290, but it does not support the
> Advanced Simple Serial Control (AS2C) used in the AAT1290. The AAT1270
> uses an earlier version of AS2C, namely Simple Serial Control, which lacks
> address-sending capabilities.
> 
> Differentiate the chips by using a description structure with a flag to
> indicate if AS2C is supported, Maximum Movie to Flash Mode Current ratio
> and if flash timeout is fixed by the hardware.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   drivers/leds/flash/leds-aat1290.c | 91 +++++++++++++++++++++++--------
>   1 file changed, 67 insertions(+), 24 deletions(-)

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
