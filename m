Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180983;
	b=2e0yq9TkHCXIRVz+PkheZC1MhPfzXLMUSIJEDdEHfcniJJXlcT+X+ugAmT0fMBRWXDij
	 g+2xx7+hgxnFgjrGuiuo46ccDN7fYjQ7cL4drVxvP5ZNV+mhtDs7SAIQfO/aSFgojnLBN
	 TU19XUTMKNm6ywjzrXcF3ZRWELoR+74p3z/h1YTxNt34Jmu05FL7kKx1K541kyZYcOAFA
	 CoU/BoMBhPAoHEXDj5HIPwlIjDPcBjGl5ewCXsSU98svRPziyVXoL/lubrWYrEpFLtjk8
	 Oswp71DXiE710KErFnti5UeyJwrYqIGXG9x5BV5KqdYEMpF2Iugpzuv/j+TNqIA9fNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
	b=IwgnxnTE6ZSax4e76eNgtU7Tkue3WF4jV8oNadgaqXJUrm5tV+xDizah9BirdR0nNadB
	 aJlJhINtIrdp6hJ8XBJOebXFB9Wpmkis8Z82miLc+JepfX7Gw0a0PjO1RZqF+h1/0TFIO
	 L9TVLmV8N6+YpKvDaCYfXAQe+rYvnZNEqPk/fwFTTRzSl8dUXQm+u6GwE6xAu7jEhPQMs
	 V5Zfa49CXgNGAlU+qWSmpVEJ2BT43mV1afYjKmedL8ibLoYdGInoIr55ryh506B56WsXn
	 gRZSAkIkkcqpDMtK9N0S+40lI5RgjOvzJMllderuX9q6Y2sU3Kyfs0v6OBn4wWDQSfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDWonstv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCE0606A31A
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 09:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCE0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDWonstv
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c43373ae89aso99469366b.3
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 02:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180981; cv=none;
        d=google.com; s=arc-20260327;
        b=QOrUdCh8iDXFoeXSghmOX9QTUV1T/NTzfHlYCdfgO07nANEnsEoGX7j02v29AVyLxv
         L5I4ns7XdSbkvo7loW4g7VavY7Z5LG42vdvJVdggpv1lOwk2S+erpT89K2semJL0qhzp
         kJg+Vty0/yRTdmrWxV5H40w8eDvtNndxXsQXKAIJcVdXDfrKOuFOc/2wBnDDNXH1cwjB
         smPn3GxyhVPLSa6ZKg6mDTETGb+UNIul6YfdDVSMxX+DE70h0pWWXHnDcF/zJ9x3l1vc
         thrin7dUWt/2IP0ZhJFpixiP+Vg1k5qrTzK7YtlsyjrxA2dIzrOJPAyeMo7vfP6Nx069
         KEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=4DYwQKrZZbKaSonOIPbqhfTJxpdppr7+yb3jL1V1E/U=;
        b=YV7EBQvL5RsIZwpy2VIU8cT8E8CegzEuGDWxsKrFT2sZP0FZE+LVS/0DOzwirST9oy
         eIAzet05fmGemxWnvq11xDh2cM+OGXNItNpHqrWj9KPCD6SQkp8AhPicPPBiJenMwZTP
         ToztvG6tGll7x+F6GZ6K6/2PQ8BgzI+2Q7mosrdZSIYyhUkC2sjKk6c2oPhVLZ4DMnWi
         sdpo+G/gsF2fG/Urq2k9WNKXvkZIkaPTPB0yIU9piEnBtLCYjEtb8OW85lVuCxlkw7wV
         aL7yGWQZw29yZeDOnHSubV4GbqQRXcjVaP3M0RREOaHWpCxIVrYKpuVzfNNACrrCZq/9
         a9qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180981; x=1793785781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=HDWonstvPcPLttzddfVvr3FgZgIj3VTyvAyBQZO+i5zbi2rECmhSDB1AdWtfuODuhy
         zbThFOJ/JjrdUK/lT1BtY5Mp+LgVPMkR4Qmb04x1Avh2AVbEsATe5lvudS7x0SEorpMy
         ReQIkPvkTLZqXSyJPrV9ZolsJmrPn6NOA+iUBn1Z0OyokcF0SAk+CxO33y5zGnKio9Tv
         cuJUT4+A+kWSsZ5MWECBo71XMwQC85PCyclaPunzfOsIAqOKjt00RM2xS3RmVMACwQll
         Lmk0EP+6mdeww5gNkgsAXctSQmF9/qTytHXp9TBcuVFEHzvtb+Mji/sDVnTmpnhvMOOJ
         3Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180981; x=1793785781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=e3LaqxrTcF+6M4DkkJVGi9kYB92dsAb0LV4YutGtYp6+OZEWMOumXClpCGNNzXgSy+
         o9WdmnkTgH4tnFiYRhWO/GQQsFOHk3gu4SzRrEfnjRCTKUrLlvsZhHpQBnQIksc2XsQ1
         KTpW/3SRbU7mPtoyvA8XhL1uAWmwcz0KINJcAiaVO9xOx2GoqsY7k7y8a+hZQn7PBaFG
         I5KK3ricQpd1YQDsU4/qGeV5oXDOTI+7OX61WVEiX3Oxk4AESB6JnrFoTrH1brZFcXOI
         /AU9MVzqzIlr6IuPqRFWriIpvoTKYzUQMf6oFoHCKl8Xe88hidWdEbx7+QuOWImOHcRO
         HK1w==
X-Forwarded-Encrypted: i=1; AKwUvBwRWNDtfes30t8dRi9puTfzadsH4ziq/Wpi75oRP3goWmjr7e7IFlmDBtVK0DodGXUp9jJWjbU2ns8c@vger.kernel.org
X-Gm-Message-State: AFq9FYLeHqZ0U4YmgjT18kvlclalJCw/s6Z2htHu155Bj/ZZzGgZz2dG
	fyblRTBJ/Dzsulzg7KPLfNaMSudG14Qjwl/NFH8DOLSJDFW3XrPp6Wu1gIUkZ38dQXaGmOnZnEE
	besEkzU1/ZkBg17FSTtWxpIxPNIBj0FI=
X-Gm-Gg: AYBFou1IuBh920qFkBxxNaKRt3lU1aBnOmoJy0HpjRCFboO3glxMuVMt0ClxH9GReVg
	/vlsvKwu1atO/MBmIqbZLFYJqnAG0r1Q3/04dgy3qF8mjHBnbe9cv+cZoPpYKRWibKAY70FqBDw
	0KdE2iGsKpn4cjWKGKBr62zFg2FzxgbpRItdEH7RZcizOuHKMpUZl6usZCG7QOjuJqClKRVrfie
	6LOgoiMsLSvevXfwGUgIzF2Od92YMU8awLGnvZgMxTPG8N1kGypvjPxfYX+eXOCq+2pWZQ2kQMc
	Vvr3SDVXthDvgpdbeL1gDVnbiwjNbjJhgRYg4+LyG/1/u2OoxPBBbizittA1+ro1hGTGk75H4d/
	6CAxXovWj21hdsAC3aggLXG3lD5kfXrrcCocrIU0v8LgOu3mpVOZsrA032T2YTAXbHa7EEKlR8H
	eDZnC3yhhF53s8j9QfdemuNQ0YqZ7Dg/84ciLtXRYnjTS/CjgbvJ3VTGXqFmXUIvb2KJz//Dfnt
	5Np7Mqn+IgR7RdmLrAmOTNI6Og=
X-Received: by 2002:a17:907:d48d:b0:c42:82ac:b6a9 with SMTP id
 a640c23a62f3a-c49bdf7de97mr167322666b.29.1793180980909; Wed, 28 Oct 2026
 02:49:40 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <ed2b0b67c306bb458ba389f16dc92904203a104b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:04 +0200
X-Gm-Features: AclHuK-kwXGKz5n7QFXQ4iO49tQbUX582-rj9xJLuSYR3NDY9XFvg2hsu7UGHjc
Message-ID: <CAHp75Ve71BfcWr++PfQPiOc=OURNn1-cdJey=M1xBVCb0HhHQw@mail.gmail.com>
Subject: Re: [PATCH 08/10] leds: pwm: Switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
