Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195340;
	b=WuUGuBSs2Ygzj3B1CHNcjrWXk9ViOZ8ofCcxmTEwkaZ5BGHO/0kUQgPub+LSdt+cshxe
	 zfIq8jWg7sN9KnuznPO6kw8RvcscM2cBeGyzJH1ylVV1FHzTI9FcJl3o5SmzypMtOr9Ue
	 hL5bVPs1ncQ3PPjWLF978yiH8K2d6HgteciUb9vzGw2us2ERolbqjjTuXVrvWal0J9p/n
	 3vVCz1K/6l5TEo4c3D/aGd2WzNr12KvpRy7poNNvBHzm/zp8Xb+EYG8SIP9FgreuJSBRb
	 D2Qt0kTBU4HFPtxnpCV7b1tTfyi9QvHidD3kpZaInJ90bGVxYhrS7VwpRPyE7+/0lmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1YuJ53WOk7jrtj0trQZSUgggEA4iaV0qdnW5q4z5Yxk=;
	b=vOHHtrz5cP1z1n63xdK9I0kQWEf6t0peKks88wHKcw6cIcEJKui0UlE1Ubr+9ajZOfUl
	 D4FA55EFw+GM/15gJhPou+EdOSzKPzXPRNoV6fgd/EcCyG/S3gYj+HvIdlv53+4FA2tDk
	 T9SpW3VjQ7tl59efuZFKJsPmU4bseYaQoQm68bsEDS6ryWzJN6OeUgF7gCJKs64T+PiKN
	 D3lKcqToXQNTeWrV+2a8pKSYLAjVfp8JblEBkXHzyZ0aMzoATpk7j4W/AR/UU6+bJ3h3j
	 XfHQlM5Vfl64YV8teT7wZ1knIBQ7MJwhOqmGVa7Zh3273TsCNm1pw5PIc9iaV00XYmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apmeTwME;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BB606A31E
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 13:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=apmeTwME
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-7037daaa820so482534eaf.2
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 06:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195339; x=1793800139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YuJ53WOk7jrtj0trQZSUgggEA4iaV0qdnW5q4z5Yxk=;
        b=apmeTwMEm7Er4RiiqptHiz26E8hD/INQ3q5n5r9r9rcJQ24FsKAzrfsc6yRE8hcFGV
         g7pUEMwhgEqcgWHsgW4LhmiDEPnRRuEIcz04lWjkq/1zxTucRWdRiPvtcrfdIDEJT9Uo
         UhdzOhTsphug2En4UvmxPYdE4i3WR72Dyt23Pb01/5fxRdxU7SrhSRjMHpzP8JONhr7u
         WXNLqAB/YC7hxIPgiSDjDb4vZvIp5Wzpw+Cx/P/HLmb1/wbVFFT8tCQJCYxOEP21WlHH
         6jghq5Q9o+r/ZqWSJILVxnG7GlU+T/WIS9MnM5ImdRY7Y7km3vr+hy5qjD3MzbFYe8iN
         GwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195339; x=1793800139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YuJ53WOk7jrtj0trQZSUgggEA4iaV0qdnW5q4z5Yxk=;
        b=05c9PKhO43p+xUP7RQHt8MsNg53O6zTuxYebMXp5huh+iUpL6gfg/fUwVWefNqBD/q
         JCXIwLArUupbyMjqpqAUUg4eu5ChKymJ9JJRk1FDgjTDcaqMOeEDURle+Dnz6NVLVldZ
         TqnG0mMlda/uCZSmuaQaEfz14cO7EI1ROnpoDCoFeZWrETQbqEwJuGEBhr7dOLYNv0lG
         gJ3yjSw5ODL/Y+lLj/CI/u7hD9EZbLx8/OEnVOt3yxppTCsDr4S9rDSLLCm4CeZ2N03b
         hvKb3P5FJJrZVHHeLE1ubBSGCnSTcHuX2721jjATjaHNWQQB1B7d/ZljXJwOZ5CNIkKm
         tZqA==
X-Forwarded-Encrypted: i=1; AKwUvBzrMFuh8x6U1fXOxPohgtDI8WfA7f04RpkWKcNzkfPGDokEuqsvbBwXhn1I8dYMn2vkVzJP7HbWIkJP@vger.kernel.org
X-Gm-Message-State: AFq9FYIklNTB8BjehyioVv/pojxsFGF+1AT/+HJB0giBpkfyZBa2EESA
	7E8ggroPYyz1csHO0D+JceHD6ukaO43UAsWdGBnw9HUCTUaXstbJS5bBZi+u14lo
X-Gm-Gg: AYBFou1DHsjQAWbxZCl8JbxmWZQEPt/3IER5LStP9x0uXL6yEfgVKtuMurtDZ5dlppl
	PujesWTDRdBIMKi4ubXCEhR0iJ+6fCBfaSa4qtvT9tWXlH0uthwb5Sql+3MGhnaJt9kg/ZiIOVy
	5W7vJQpqFnLmkbwMVBnEFwPsj2Shui/fGZtu7kJqJ6GFjRMupXGEaYC6cPYsa3inVzmc9heuoAN
	zLfAbosRN5deMmwWxEerRUhqYoZHWyXLxEA+G0BFsdRM11q1s/zvfsFDkHrqA91eKAS5WdGfdBp
	vGB8ue8qd+tecPWLTCEJFVkSOR/ZlKhdRAEWYs/JjNy9Oi/B/ALLVktIC/nWQk/OKtfE4Y5/n3s
	+WSQq/3vIaih80X61QmD3g9Z5LBAwJEI05d5v0Pw5vni9v2VhbLucm7ddmTBuq/KleSNKtyhtd/
	Q+7C9Gx1YRY5Sd9wPK0yht17/1q3sip0tmEymblTLlk67ulGRBcYU19cv7QzwCA0S8DGYm9bI/K
	GgOOspj793998sQPcuRrH6T27yqTlSC9Uz5NwgJjFKNgtGdY6HkBMxk/hgTPseQaik55m+HdqJt
	+SvJlimghaYrDwe0YO0G66T0Kt+rsYzcQ7ajhs+p49rpLhJfmkAQPQ0aXSKyKICMeSZ+0qI=
X-Received: by 2002:a05:6820:450f:b0:6fc:373a:176a with SMTP id 006d021491bc7-713efb16571mr1090755eaf.77.1793195338875;
        Wed, 28 Oct 2026 06:48:58 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142d124f03sm1409758eaf.13.2026.10.28.06.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:48:58 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Danish Khateeb <danishkhateeb03@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] leds: tca6507: Fix use-after-free on unbind
Date: Wed, 28 Oct 2026 08:48:57 -0500
Message-ID: <20261028134857.36086-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179213356828.2581328.5085333261240588869@kernel.org>
References: <20261015144033.56519-1-danishkhateeb03@gmail.com> <179213356828.2581328.5085333261240588869@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 28 Oct 2026, Lee Jones wrote:
> Please review, explain or fix the Sashiko review(s).

Sashiko is right that the "LED off" write queued on unbind gets
cancelled, but that predates 1b5c2fa7081c: remove() used to call
led_classdev_unregister() and then cancel_work_sync(), the same order
this patch restores. Since 1b5c2fa7081c that write only ran on freed
memory. If you'd like the LEDs turned off on unbind, I can send a
separate patch that flushes the work instead of cancelling it.

Thanks,
Danish
