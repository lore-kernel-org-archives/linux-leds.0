Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC9D44C4FA
	for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791725298; cv=none; b=sx8GPx5q4JNxe/XooVPCk09BKfSxn5Tlu28ZapghVQHk+zadfoXGr7zCB1vK+eeapqWw2c4vsBUP5onpa1gXfz8LjQr7NvS/0gccxx6DwS/dbxfbNHF+gwIC9F7vBOAYn0LQ2LQmR35vmKrDnwFKmzta6UtwxmF6tN5uBk4ePLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791725298; c=relaxed/simple;
	bh=bmKBnxSlrM9rBY26AIfTXLAwtzZx8fLdclkPI0vbXIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkhZLT5SDuGrEItM60BW9HMPWSdTryw0vYvhRGmZx14Jto0GoH+6cNh5roNKfIlTMIDXpBQ/z2y1hS3kSF+QnjdrR20wVBPqVex4oj/QXnPwBwcvLx6Grq8nxhq5fAFbSbt5JHQB+KIE+hTg29DksOMprox6RM+R+b0Dd1BUV1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5GW/BQj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5GW/BQj"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c315a445752so177575366b.3
        for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791725295; x=1792330095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tmhk+556JexJYWbKIeWCGwz8JU5Skv6kMn9t5D0fvfE=;
        b=T5GW/BQjPxz6VsLIsP7UcXY1u5eotPfmYoNz2ZaumkqD1V9f2rDVKafqeoJyM/6rWz
         /ZPtOYXBwCsD3UcFtvjXqUUeFm5wVB4jzKfXV8ZG8Q/Zc7hGl27SSF1lqTGoLxt8ZHRl
         jYPJQvy07cx3REUG8Zrls1PvwATlBN9Z6LksYGnDmLXkuhOjhka5G8l2kwXyrlaIsOkj
         VtkmjH6IP29NNKpNyz0RGiWZjzEp0dblTCvUxj6GOkzHNGGowuZKd+7vFSYrCue1O2py
         JQAzyFZtrH7Ry5kU6m65TqgSQ5mQbsgAS3n2iJyAYLO/BZwZZbqIDzSYACLsyF8gqEA5
         qu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791725295; x=1792330095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tmhk+556JexJYWbKIeWCGwz8JU5Skv6kMn9t5D0fvfE=;
        b=ZOCc21CcF0ND6UhiB3kRW8rLf3+Ug4/9gSz14x3RQi4BZvN/1iJwIrgqQt6LJfreZt
         Jib9WONbTKYIhXPGiuGisbsQ6jMjLafRphNR9x8SNcRXrVRP0eYs1xo6MelBnx5QDaW9
         v2xCVZzVpza6w+KuBLZBMg7ogaSdJ3IwTQ2NWRJt44cdW/Lwv2YWj6G+nY7ZT/TcNe/i
         nVV0zzKfv6DKoFZkHbdmLoa2nj/KGdGS76thlhcwAAq9iVeyrjbt1Hh2jfv7GSQripaW
         TUW3HcKurdTo+e/yRyp8M2NdobTXdaWF+NMQxiVKmJRD2mQbrMxWQM/hGjD96Jr5SPaI
         gOJA==
X-Gm-Message-State: AFq9FYJFMwLpaEYTdRQiuvVOH1Hf4ftqOktYZ1AndeQLqx08SOCfldGi
	Gqw8v7tDUaulph+nK5+jKQNyVi9kLJjk6F9H2qyglYrt1w41Kf24cEZg
X-Gm-Gg: AYBFou05qC7VW5lgrHmQsaIl9qS1ZFKraY5B89ga6MGo/eEjEL2rwGrtHVLaX4PrjMH
	ojHU4ZHx5REuDhM5DnWCFTq1/RrydFTwGUrxZAUgu3AWuxShpAnK67FoNDsQw/tNMi2oez9uREr
	YeJFvdqDWf/Tvc6dDi6AdWdd1C6rE3vzrFOCNZc84o8LKpp5NJOgEfZBMUO0dQb4ZV/fb46QWyK
	OOy9VRAZL3/0G3WwwuyZ6k/raFHIk6aW4BPHPvXSnDoLmzmO4CO9EyaxMmiT+sgC747PoSbwiFn
	sVljEYIF8a8zLL9wFM4pF32DB+YIkR+Occ3edEcHDtrc24kh2QPOIbACkYhAbO8ezUxZIETfRea
	s6hmeXg0RZODwIv1FTVZ9Z7tho+HNLMz/iDbZWia8TFIRtjLmaa5xs1QG6Gjw5/AOpUm8Yfbuxx
	y3DSxBiv3gWsqOzp8WfyPqHy8lFHkOYrYJGC5A9e+t5Hs2+oclJ3XzXso+dGINuDkN9447FtSVC
	L7ohlBq3Z7T8M+PBkYK
X-Received: by 2002:a17:907:2d12:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c31a9a10df4mr621177766b.2.1791725295323;
        Sun, 11 Oct 2026 06:28:15 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae6csm359503166b.17.2026.10.11.06.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 06:28:14 -0700 (PDT)
Message-ID: <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com>
Date: Sun, 11 Oct 2026 15:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261007085457.98762-3-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Svyatoslav,

On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> inhibition.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> index a65d92522c9cf..596b5e284f44a 100644
> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> @@ -31,6 +31,10 @@ properties:
>       maxItems: 1
>       description: FL_EN pin
>   
> +  flinh-gpios:
> +    maxItems: 1
> +    description: FLINH pin
> +

You don't seem to make use of it in your patch.

-- 
Best regards,
Jacek Anaszewski

