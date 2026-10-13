Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3CE53F684
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 19:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920235; cv=none; b=R9xiDwCOj1I0mmbWZ691DTbzm4Bu58WUsIP8oTnymLsRLDFyPfK65ostjDXua2CxHKSDIy8ptPtuuyb95djDi/lL7m1LiHrmID3UueTd3xFas2uCnwHeiSLeQSqQdN6SUsrGDMcgoArzi+9/Dm42QXMvKQxSsbw6NDrSrZO2JvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920235; c=relaxed/simple;
	bh=Z37gHdlGehOrP1ci7noYpGYC5tE0i4Q1D3pfj9Ep1a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gR3GbSTapYgbpXNldk9b7lDiScnlb+T9AZfHAEvYR9xLieJCfnGq06cq/AwgkkFcRw4Orjp4ZI0B3lVyHA7E3AcT2A8DduBRbhmRh9t8Wtf0ACXAueWM9Ay7csPlW1dFmtjV9O5SbTDsthCCqk5/m4AUfuD/qCjdoxgoa5XWsuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxTWJ1y8; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxTWJ1y8"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1514169a12.0
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 12:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791920231; x=1792525031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9exOSu0+jZnPfMCxgSOMFQaH4XUnW2vjeMsWp92tkhw=;
        b=BxTWJ1y8KYHd7xiDUVp4gn/bfqqES5+veN7Mpl5XX+cuMVa394DIzS9cliDCpOqOOt
         dx58USavoC8RmcqX9w+fx3TJYRdaCBJfIA31KmeF66xPV75ZVr2lhQbm2yvxtAntTfcC
         7ktwvXuQ+EcYr+OFbp/N8f99u4t+ygTF1QCJfH8lZxNOcQaAYAkZSiVQhTIeKGdyh9Wb
         HGrfBC4V2suK7k7LMfMgNwnPWj0C2JQXJ8lhLdPdFTxd9th37Ot4ybwT5jy0jYmV8Vxu
         medQGbpLzwXHZVTD17A9O6oS6w2GofXHiaOjj9b0XHINGXp2AsIVKU/f9eSj7IMYTNyz
         SKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920231; x=1792525031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9exOSu0+jZnPfMCxgSOMFQaH4XUnW2vjeMsWp92tkhw=;
        b=Bj/wtfrT2ZDqQP1OTAoDipTpRe9uU/g4C9skXFfF9ZE66ZteH9vtojr7Ovxf1BZX/g
         4x1Jsl5DUx2YRJPCWs9rrEBInqXvGjEKKTLjO5gIqlVND8JV9xBoKdWNtfxmkoL+96Tu
         1jd23tIzv+M6b28UdcIL7WATd1lJgJp5LMWXgFSTmgHKlZfaPnBktbZk5BG0HOI2Bd04
         1IY6JZrJbbBLZM3i7/jA4YkeDO1MgkzWU/3UYKo8x2ZKRVHDMm5qK3ednsRoryT1Xkhk
         AsUbV01Lk+DFMysbll6StnAHWcx5Lg04AcE9GTTosGMbcnUZUjywN0s3HSRqdwaJJcty
         cfCQ==
X-Gm-Message-State: AFq9FYLZ3McqH9XFlMF+C9T0XdueDfudqAMhO12gdsk06Bqlvm1dbi/Y
	Cgk3dUS8wWHMhES++qOf9Z1Z5Nou9eB5sHNYT7HtbyecuL43SuEqexgV
X-Gm-Gg: AYBFou3Ipns3/Q6kYUleB+A6yRjsmaATJN2WH2JwUVJZfcB6dARiRzBfrakQ4QCIJve
	iAHXg6k+6Jf6WSHCdYHziHQDPf7uZjiTNYBvlEtkbO8CZ1wXV2LTCbDFWhHaqHJ8Ouy+UyK6U9F
	rXHVX02OMRe2h5sNrnHhy9QobeIRXNRK8BxwtOsyBkpo36rvMYDVeakhdpfx+zR4xS/N2823WIJ
	3/rzSLc6Lz+Tn6NaZ1hiximjT0eWl2fcpmZVBlVKmKm1vl36YWqe7KPQ4kMivS+mf9Gnw4aVtGr
	Z3Aox7csTVyh8mAZ5rawOCHu78ICTFsAs2BtpGzSYXOyHSjFOiTqx1PBJM9NTEL8zNRMb62TVbY
	UeaPBGZnNy1dHXyKK0L/B6HMAHXh8jcuDLsFrcaV8/rASh3k03AjXxgOJTsDHKIbw4DiqrV1DJC
	TKSE/Xmc2bcrAX40NFBZnRBuxRNBck/YDXFqQOJhFIknU/X4tKVttzHI9Ao0h6bbog26xLwktUe
	RKpJLsEdg==
X-Received: by 2002:a05:6402:234d:b0:6af:d794:4a8 with SMTP id 4fb4d7f45d1cf-6b17c2a3834mr11309062a12.12.1791920231269;
        Tue, 13 Oct 2026 12:37:11 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b86sm243132a12.3.2026.10.13.12.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:37:10 -0700 (PDT)
Message-ID: <e81313c1-361e-4f27-b578-c99171fb8877@gmail.com>
Date: Tue, 13 Oct 2026 21:37:09 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: skyworks,aat1290: Document
 AAT1270 Current Regulator for Flash LEDs
To: Svyatoslav Ryhel <clamor95@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees+treewide@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261013181803.496627-1-clamor95@gmail.com>
 <20261013181803.496627-2-clamor95@gmail.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261013181803.496627-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 8:18 PM, Svyatoslav Ryhel wrote:
> The AAT1270 Current Regulator for Flash LEDs has a similar configuration
> to the AAT1290, but it uses a different programming model and requires a
> separate compatible.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>   .../devicetree/bindings/leds/skyworks,aat1290.yaml       | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> index 65576dfdca110..7c26bb135c0a7 100644
> --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> @@ -19,7 +19,9 @@ description: |
>   
>   properties:
>     compatible:
> -    const: skyworks,aat1290
> +    enum:
> +      - skyworks,aat1290
> +      - skyworks,aat1270
>   
>     enset-gpios:
>       maxItems: 1
> @@ -39,12 +41,13 @@ properties:
>         flash-max-microamp:
>           description: |
>             Maximum flash LED supply current can be calculated using following
> -          formula: I = 1A * 162 kOhm / Rset.
> +          formula: I = 1A * 162 kOhm / Rset (for AAT1290) and
> +          I = 1A * 81 kOhm / Rset (for AAT1270).
>   
>         flash-max-timeout-us:
>           description: |
>             Maximum flash timeout can be calculated using following formula:
> -            T = 8.82 * 10^9 * Ct.
> +          T = 8.82 * 10^9 * Ct (for AAT1290) and T = 21.5 * 10^9 * Ct (for AAT1270).
>   
>       required:
>         - flash-max-microamp

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

