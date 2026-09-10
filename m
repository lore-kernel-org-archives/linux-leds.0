Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFF3C4577
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 20:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789070777; cv=none; b=HuujLLeioSlYlHGNiFWt9XTgOOrvc+9TL9x9DriS+EL/BXjuMVvvbHELSbatZ2xPrmHh4POQI5YOykKwaMgynrP4a5vc58w9qOV9BT6hVGY9OP41TW0kIenBoXL+FuFPMZ9UMBsHbo7hLDx9Cs8+g0P8yZ40rigcncDqocJ5KQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789070777; c=relaxed/simple;
	bh=+FZf8w7gamtymKEs4poKhSyNIKqgP3DcWJ746AYEo3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFQxniQPexLgdjadWdrjrjjxwQ6Fr2Z09eIL+CAsw60IPPSZ07YFTFHBRkt18L8V2zkGPMz/9Oy9VfYgm31e7tuMuU8wxntZW2JSzT0p3MIP0DElPQ86WY99Y+hlsNAqXZWeuGmuZR0lndBIg20zus0jbJxH6ZKrDYozMhs/rnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcQUTQwm; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcQUTQwm"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc147d86bebso285049a12.0
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789070775; x=1789675575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUgV2Sz6/P7makCPies8cUT1nvpwJR9dBUWK+1kW95Y=;
        b=EcQUTQwm+DBXd4lrjFG7SfE5drpB3UJ2MDzzmPMr4bNS537s1vCFZiaepIIPxbaULb
         i+W9FRhXNHgFQybiCBWUoA/x9axUI2ROn0GKEcEA+EANXyLKTdcLhEQQi6nwg8OJYcyp
         8pfxuR2pWg8wTG/HiEtzVYqYqF8q1nw2bqpSQad9etxpPI6k10x3UpbuG/I9yuYvwCrP
         NS/YGrc3iXk3C3YM2Oi0+jM2ECGoHeRA8hQTT87w/DuWk4nJ019AnHG92mYp+lUqoJ1C
         GKOwCgDVgjM1vkM3Gu8PsAjRgK3HVB6SwA+gDGQ0damr6NuKyWEmEl66oRDwgMdl1F1p
         eJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070775; x=1789675575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUgV2Sz6/P7makCPies8cUT1nvpwJR9dBUWK+1kW95Y=;
        b=ojIpj4p0l8kXVWKzu+JNepTlCEprJUW9m5sQkAF4I76tmn1gypaScdDQ2NuN6gjscy
         33HwjNFpqJl2+Y+uepO6rG1seqX1Net/bcs3P2I+nTW2dv5DfVnDBR8k/0WpgksGuWjh
         92aeOWt9OIiXSt40qibAiXI7gUawIDdOb4PrWGWqHxy8iA7c7DGnqqdxjB4yLiwFweU2
         xsgdQyCpDz5IB0dRIggn+0qv+xdyQY1luMxxUpdLzlymFu30Fufmp3HIG3CmFYBfBt8B
         CQfco2QrZ4oHL+n8/nPPx1ybxCLYx3fWE7DsxkJU67uGFuyvYFL45kSkCPjPKFk03OJ9
         /hRg==
X-Forwarded-Encrypted: i=1; AKwUvBydpzeBVV+69pU37qrquI4LIcbhzendci/R0lu8ylyQM7kguYOQpz8eI3DdO8UuDlYON7YY0JlEvagK@vger.kernel.org
X-Gm-Message-State: AFuF++n0Z+NDujT2dDCfkbzG/iBfN2A2reGfZJ8NYjbt+0rjGlkHWr4l
	IAm1VSHPd92Sbfag01YroJMPp+Y5o0LWxeI4VTHXo38PowEAtzQb7QsX
X-Gm-Gg: AYBFou0qwf4CfjbCozxkGfdlRmgQaZkH/hwd2TC8d3dVSbUJxl2IdjVuz4Fgw/FIgjd
	8asej6f2YplXEnL1Ho8I35UaadMqgRF3UKC7rTXO6VLv0nW66N42ZcebStP5fJiyZfyErl7sURQ
	C5Udbg9ahh0GPBuufQ06QKLhBzcRnzY2kKIpvh7x5lYW+EYsS4jHBb+/E6fCBazv8ERtT3HqBtT
	o1WBOHmWpRo3oBhrpuhRcDc1jZMSBlPZg0axYEsA/95mgChJCJBmnj9Vfk+CzekzKvaMHp5QaaM
	N4Flxy3Bp/3rpKCW3PTHTYdNAdezYxf9arJBgzwE9qmJVIbc3jVlZ4MUKV8ynfYGHulfy6SD2Hm
	oBHMJB4exJvzdqQCg37RcgjshI2OysMV7a0q7jbTxzcUDwj6+rMAQd9qOYjwA/aiK/xgv9w+dmy
	DoS00Kx5fvmry1avmtHmIjdePT2OApmm8sUHAGItron1OtR6UI3C5pY7Y0Htfny/2Oy258EbGqH
	gMPloEucbzwMBNCU3xVPGx+e+gc6EQvzdqUE2u+e3Cunymz024ObHEjYchkNWwQEQ==
X-Received: by 2002:a05:6a21:138c:b0:3da:11e2:b36c with SMTP id adf61e73a8af0-3dad295a03amr7441420637.27.1789070775028;
        Thu, 10 Sep 2026 13:06:15 -0700 (PDT)
Received: from [192.168.0.158] (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f1e434sm466446eec.22.2026.09.10.13.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 13:06:14 -0700 (PDT)
Message-ID: <c808a589-56f8-4769-bdcc-4fbea87be6f3@gmail.com>
Date: Thu, 10 Sep 2026 13:06:13 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] HID: hid-oxp: reject invalid Gen2 RGB status values
To: Andrei Aldea <andrei1998@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 linux-leds@vger.kernel.org
References: <20260910032115.28669-1-andrei1998@gmail.com>
 <20260910032115.28669-5-andrei1998@gmail.com>
Content-Language: en-US
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
In-Reply-To: <20260910032115.28669-5-andrei1998@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/9/26 20:21, Andrei Aldea wrote:
> Do not replace the cached RGB state with a Gen2 status report whose enable,
> speed or hardware brightness fields are outside the supported ranges.
>
> Fixes: 252c4bf1d931 ("HID: hid-oxp: Add Second Generation RGB Control")
> Assisted-by: LLM
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
> ---
>   drivers/hid/hid-oxp.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
> index 86a559c..c3cfa95 100644
> --- a/drivers/hid/hid-oxp.c
> +++ b/drivers/hid/hid-oxp.c
> @@ -415,6 +415,10 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
>   		return 0;
>   
>   	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
> +	if (rgb_rep->enabled > OXP_FEAT_ENABLED || rgb_rep->speed > 9 ||
> +	    rgb_rep->brightness > 4)
> +		return 0;
> +
>   	/* Ensure we save monocolor as the list value */
>   	drvdata.rgb_effect = rgb_rep->effect == OXP_EFFECT_MONO_TRUE ?
>   			     OXP_EFFECT_MONO_LIST :
I'm unable to test as my OneXPlayer F1 Pro is Gen 1
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
