Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792696839;
	b=Uwo68Nnrl8KTooJI0rDwTc8q3zjBXsknFmCuDxrK/jNO6JDZQ0Quzyo4AKFowOp+GaVU
	 T+kY0+WvhNLXkYam2b8lW9Gmqy0c11sVEisJYNi4+H5fx9HBoc9QkC6rExznu9ecNSFF7
	 hRBRk5565ido9HWlpiSd1W0vRzNmab+PQx4ZWNUFo8ORpOVhRvvD6Mi61zRJKbLGY6k4k
	 yw0Cy7fkkmx0m1n8hJReC2FYrFmHQ06bwbYOItLkl3qgDE/ctNP4fB4dJIuY44KMN0lIs
	 CoelTIbawnKIJmlW69PQYHMkrIOKLKuf+6JsLXpRHbPX4/lAVnicPlZbw6JuuSj+JDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=9sXkOvf7AxrvAAH1/YNkURKgzHX7Y0lOYp7pZGB9twE=;
	b=AYvGXy0ltAZXBa5ZxanaquZCdQ+5csUf0HscDh8yB2LxbzJoVzNVPFT7W3qzmU9zHiZZ
	 jBZ1bAf+umD0CXVmjv9UFIWDf2qC/0XWU/8YFIdCSCR2SIRSaiNPjD4J6gGHwLT60+ofz
	 tFwjNeuWMHrd8xmFFrJODrELJ1n2jhzyfAz30QtbaVqSDhAbmuFFnuqAVRelWM8AjMobY
	 WqdhnA4hUsAZ6rhTQaL0XOa/jviohqV6MOyoAg1dfuEQnKTF8+Ji4WVFd2Lgml62TBL6S
	 eJplUtYZ5jbEnMGaqie+A1YYMVhCuG6yQLh0YQFAaptu/kVJjw4MTdSkmB7e66DQIAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhEpnE+1;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C209606A31A
	for <linux-leds@vger.kernel.org>; Thu, 22 Oct 2026 19:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C209606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RhEpnE+1
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4677aad67bso17625466b.0
        for <linux-leds@vger.kernel.org>; Thu, 22 Oct 2026 12:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696837; x=1793301637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9sXkOvf7AxrvAAH1/YNkURKgzHX7Y0lOYp7pZGB9twE=;
        b=RhEpnE+1jUnYlqv7JiGI+cVLv0LAbRqOGEjDHl+SzzNNqELp3BCGQMTTtkgrVV3sGl
         EFu4BCg+awMIqSrV39O77g2wInCTCrcBhkIjy0jDRVtvvIGkUBfHrA9RQ60mPXoMgadW
         ++gt39oScXT2O6apkAxfTnmB9uKAJWi5IC2NaVHRKSqz2CXsM2nyCcjU0TwiFPHwe6MH
         y0T2ETNBajdsd7ISMCyCFyNHHC18XZ+r+d1l9jE2k2ZkiJXu2/Jr2MsniWUCdPbIRci1
         QZ6s/cvamcXw/xg/Dc28xFpzsZr0b3ZAVkTclEmnqNGmro07X6tHoGCdMbjrYQ9HIXQl
         JTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696837; x=1793301637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sXkOvf7AxrvAAH1/YNkURKgzHX7Y0lOYp7pZGB9twE=;
        b=c02rW8xtv3QhsomSdNvjEJ49nviz7je0gVfbA0A9NEmqMmHdZ8+t5F17RzKUJ5LoAX
         pUkItJiIDvaCVYoYQg6+WND0hJkLk0RLuTOpFkUJCtqOt+ezgwDsoIhii1O9aesHwCtA
         hoKPNEm4bL6t2OfTcb1bbRVzVn5UuxafIuhQzM9W7/ZbXdcYmngHCXcJKtQqzXTss/PY
         U3KSgxuglt2L9t0zXGh6Gp1P6UaF2BcEYm2T8PFP/hI79p+Q1p2/+ubVxOEhgNa57/Ux
         bOi/cp36+JPBsBE7jVInah5/Pf+0za2xieoehWOU9yFL9a31aOzcdgOI4S/B+pUJZm+K
         iGpA==
X-Forwarded-Encrypted: i=1; AKwUvBzSnsjxERhDGhbZqHeY6bvHtLAJiEyYb2FITM17EEkMI3P5WwJtt8p1xje9nQ7Hva3pjnjTEN1skvG7@vger.kernel.org
X-Gm-Message-State: AFq9FYKnOZTpPU8SZSHsKjKivNAOW/yVR2aDI1uTgYmw6DR0xLgNgdkV
	0glPTPrsHm6KpZW7Bkc8qFRmdXyS/yhwTs0GD4tyPYjtJFbhEsk9qr/w
X-Gm-Gg: AYBFou2qt1WQENSEPPqsWe4bdWetRM2oXNyx4n5oy5bvv4yu0QJC4iJOdfvjtrn5Ykk
	uoPcjlt/OJ2zjQRL90iiFcdsG8nPQgoeezw5uFJgnKrHLmOApqvj70MWtxQQxIRMWvZq33YDX3k
	S0MH96xZYtFO3nHYA4OGx1OPQN6thgx6aWnPclhjQnz5CsugRLd6kh2breUs5cRldntuXnHkl06
	8DdjX4sakSTNrnMmZYPACv+Od0j8HzEWRTLBBHXSqXjIZCBJ006lN6uW2/XvQM5CWFEM5KnMbCP
	U9MprR9XCCZ5GsjEMK6OaH8VLwb0y2LsA1agA9sGcxqPPLa50qpfiW8iZek9Uub3cYpT7pTU/ET
	gfmr4PgvYQK94rIXmQqWM9y8rDEv/Q44/JmaZjy5YmerY7VIh9iMIzwLGIPKLhkJkbRdGs3j4Zy
	kYPh2XB8nUq9uF6DF6v9HZa686F6LsMySxm2/suTixXGJuaCqFXQBQEowKe1mVwfrW9qDQYZD7f
	2Gp7hFpy4Sz9LczYn8Mpb8Kh5n3VKFd0vqCzVVZjxZL5nWhwqMfv6NDM2pzabZAHr0=
X-Received: by 2002:a17:907:db15:b0:c3f:4d1:8cd7 with SMTP id a640c23a62f3a-c46a92afc93mr21950366b.25.1792696836432;
        Thu, 22 Oct 2026 12:20:36 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cadf1esm20266066b.53.2026.10.22.12.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 12:20:35 -0700 (PDT)
Message-ID: <e44c1fc2-802e-4cd6-8359-a315bda970e6@gmail.com>
Date: Thu, 22 Oct 2026 21:20:34 +0200
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/21] leds: flash: Avoid divide-by-zero in
 led_clamp_align()
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Dmitry Antipov <dmantipov@yandex.ru>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261021123406.3163547-1-lee@kernel.org>
 <20261021123406.3163547-15-lee@kernel.org>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20261021123406.3163547-15-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

On 10/21/26 2:32 PM, Lee Jones wrote:
> If a flash LED driver leaves a setting's step size as zero, writing to
> the corresponding sysfs attribute invokes led_clamp_align() and triggers
> an integer division by zero when aligning the offset to s->step.
> 
> Clamp s->val to [s->min, s->max] and return early when s->step is zero.
> 
> Fixes: 7aea8389a77a ("leds: Add LED Flash class extension to the LED subsystem")
> Closes: https://sashiko.dev/#/bug/linux-9d06d7fe-310b-4aee-8b16-0fb49550c287
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/leds/led-class-flash.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 181dfd49c6ad..16b3b6b9365b 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -375,6 +375,11 @@ static void led_clamp_align(struct led_flash_setting *s)
>   {
>   	u32 v, offset;
>   
> +	if (!s->step) {
> +		s->val = clamp(s->val, s->min, s->max);
> +		return;
> +	}
> +
>   	v = s->val + s->step / 2;
>   	v = clamp(v, s->min, s->max);
>   	offset = v - s->min;


Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

