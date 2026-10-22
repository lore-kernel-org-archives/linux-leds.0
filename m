Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702810;
	b=uUUq0JPmYvoNTkK9MjIk4ROId5yqHAVFyVAYd6hMg55QPIsUgZlE+ZQp5LOvC0Q3ZWpv
	 jNV8+lsOCfWuIlppWBFYEJMUVWvQSB5hOA9h4e3Hv0CfzXkc4anGPI8juyyk3YzIWmAA9
	 PZDhoAAZHbT5sQtGHi3MlRT/Nfd/oANKoA0e/r1j6akl/9z4Q4INPRTN4I60LeF01wHg2
	 ZNRLeug/xwYnTDsfRpF7pvF2KpH+y9q8c6OkXvzm0swQ9EVE7O2eH+mlMYeQRtwnkiW/r
	 6/KpS9sq6FmTDqzIJU0Lj8SmABE8O0BfuxFwNL0j4V3wX/FtEyLu420NuWsBh+jPCTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=a+TVj+4Eo0cuLbImvgKBU3zCHqSsK0fiVALfcKdKlGQ=;
	b=WtU+qHc4Jlwt7DFfNtUtVcYB2lVFRcTzOx/WbcNDYRsjhMoCuLV50QUjCwY41ku2jvmL
	 zYcSHcyhmzvXXK2LdtCPMaiaWlYG+is4LZ09BWETA6TA3/Ike92i1bZtpGIxwCyiHRauZ
	 uxiU1sHqS9+42ZtCvmTJp0YTxV6HzNmhOb7kHby1VG1NHH9aTO5vUq11Ety8qYaVo7nFC
	 Qr5UmlnekuV8G9UT//I8QgoXd7eUsTpeDGFwuVmPjWkUwrQ0FitQOUR+igFH0LMayuLMP
	 ipFkQ1QsykSL/QZcb0j2gBBwKawEsLfWEUGnuxLW3PG67xlVJsQ2aAIXJMlHc8muViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bqMtcI04;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F58C606A31B
	for <linux-leds@vger.kernel.org>; Thu, 22 Oct 2026 21:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F58C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bqMtcI04
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4956869750eso1397135e9.2
        for <linux-leds@vger.kernel.org>; Thu, 22 Oct 2026 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702809; x=1793307609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a+TVj+4Eo0cuLbImvgKBU3zCHqSsK0fiVALfcKdKlGQ=;
        b=bqMtcI04Pu5MSW9kbxQGcCWePH2OxfIiXtLBYdnh7Seuyo9Ha7kw9yZyibB5Rp8p+8
         +uJJX57c4HZiUPJwPgqsh9QF+bSRsy2A6lJRFVN76J5sGZQOm4l+/O2Q4yKLoDg6hOKG
         K3Mo5geiAHPki9CxUGGiOwGbUxHUVJ+B4j6CfSmk6IZJ2FtFyU31hYNw7fyRt9j6Bezp
         f9o3/IoCKyfDj7NAn9jR9Y1pLBeHGdR/RNW4Rbe+lr7SM98dYCf3avjMvhIYJP1Yk/I5
         HfiVahpE7JFWivhrx9+BRGdO3ccbDi7iVo3n0TeklgMs1i7WbTuW+QQIQKS8wON0TVBA
         kVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702809; x=1793307609;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+TVj+4Eo0cuLbImvgKBU3zCHqSsK0fiVALfcKdKlGQ=;
        b=PBhgPu8S9OrZy+GsoWVQXVFC/8XP3eWDMNO770SPS8tZgjjxS3OG9qnRyb7TW5Tb94
         JvHmjYGgRx4yGCSVREv4zs+0Bs7kv+6nGQSvrPLvCOFyRjy1svwkxao+yNA/Frr/d/aI
         3gZ7n1+LpwebOJ32JC9ihWf/vSIS2NA3OOv5WBGxPtSLOaCFNPo9/S8e4BB46KV8uujU
         oNT1jmeMWVDjQN+GFsId340EdSd8dq7KHIPI917h+Hp5DfMOO2ydyE+SXk2pSjde9WFv
         tVcy3RdtlbrbVY/9CP6FGhCCRQ/kpQB9sDKe/WWd/aOKMVow5+iCpFwiuu+9pA4lnlMe
         pekg==
X-Forwarded-Encrypted: i=1; AKwUvBwuhQevj4g43edukJEqMQK9pKKlobOX2zkraetlOLcKdBg3L5xgo1RL9t29hjmkcoXzvnWhZy2ELsb0@vger.kernel.org
X-Gm-Message-State: AFq9FYJFDzXKQe4R92qZF8Bf1hcgRQExBPE5RKqEDPO1qum8mU5DUXXt
	ZvMSOF8IQreUnmIXnF4ubTXC8gTyI0VITKxSoHALDuIJu9d8WYjetUxS
X-Gm-Gg: AYBFou0YV/Syk5si+GQcrVwLMrRq262zHAj8HBTxooN5/oo5P3eeVpFg1Q6vFKKqMu+
	gHPV4BIcib6/XULug067+zOjDTlfwXxDwZWwNNkdQLrmZ+RrxJ03mCPo3n4TkKZUQpwCveLbFT+
	iGxBWah/L8Yozup0oFW/xyQV1E7vXkmvwmrmGPuuhJJIvTpLR+ZtDxcpDnzoh1MZcG6dEmrYE7z
	7Ji0buwVGM3hd1qV0uBXfXnze8N+zJdBbIlL7NdWNPZLHEiniNRGLASg5K34xCxpsLJz6Jmt5/R
	JiqxA3+raKTE9KD8GZm43g7Dv99WOrP7uZ+ec7D3Xcx0GEt3lnQgfKRLJz88tcxbULYHmfxb9py
	z04IKBJekAvN4/dm5mrCFDmWySKXkb/xjt6amVJjmTbmKOzbXY68+DlsntVYnJu462WJKc7906N
	qpeuO3zwfGh9Am4wEx46KIZTMZ7uLqY5aoK5geneVjkZgLYQGCbMJn5NTj7UrWqVZMXsIEW4GGY
	AwDYVFPFJW8TKdg866qmfzEUPIKn7VbakPI1x0g9fjSIgqbQ6DNA4DUDvlq2g4ydvXJJfY9tWyj
	tAqdmppn1Cr9oN1d
X-Received: by 2002:a05:600c:3111:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a211ed7ec2mr3619535e9.19.1792702808835;
        Thu, 22 Oct 2026 14:00:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b89beasm8702815e9.5.2026.10.22.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:00:08 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:00:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 14/21] leds: flash: Avoid divide-by-zero in
 led_clamp_align()
Message-ID: <20261022220006.6e066670@pumpkin>
In-Reply-To: <20261021123406.3163547-15-lee@kernel.org>
References: <20261021123406.3163547-1-lee@kernel.org>
	<20261021123406.3163547-15-lee@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 12:32:23 +0000
Lee Jones <lee@kernel.org> wrote:

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
>  drivers/leds/led-class-flash.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 181dfd49c6ad..16b3b6b9365b 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -375,6 +375,11 @@ static void led_clamp_align(struct led_flash_setting *s)
>  {
>  	u32 v, offset;
>  
> +	if (!s->step) {
> +		s->val = clamp(s->val, s->min, s->max);
> +		return;
> +	}

Why not just:
	u32 step = s->step ?: 1;
and then use step instead of s->step.

David

> +
>  	v = s->val + s->step / 2;
>  	v = clamp(v, s->min, s->max);
>  	offset = v - s->min;

