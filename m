Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793278843;
	b=MbOsA2btD5OZce9Mcaj/7RpCprg9SjaaiuJ7aCBS+e8rHw96az2hw0vqOcjjCv6gNQeP
	 uDriwoACW6avHZr8p/G1ngjNfRykHWcslLS6GNdz8z59OuNQTRNsnR5qaRqW77148rx/s
	 AM8Ebfv7INzmdvErPT4WnqJa/IIxUlGBLQ3EdLO+4/yERzdjaM0vw0pFB8rPs0ANqUmgQ
	 8OpJnF1okwkjgVH1e/uNTq4soJzLNRKZ7fQCWLDg/sRg9mOYbWQS3eDQ0ix6kNhbCTWeC
	 65kTueQQelCnnR1mIRAE5aV/aXspt8JjA7axEq//EeCYxnCq0RJiuUVuQDYtkvTN0hA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
	b=b0d9ZoETMB1zDm8VGvc+eIrSq8M+WigosSCrLCvANfpCtNY4hxdvoBNgChg0cPnxmWIe
	 QLngMPFaVEsNMcMWe3AiQ6BJ38H4CVX8xTNnCYjKHxeSkzEthHTEDf1ciQJJfgmnkV67x
	 BIjMf8vFtgzww7pOBZBh8jQ25VnG2tpFBJoIrARE9G7U/Qjg/6XZTH5JRUWwywPiy9u0F
	 C7G+M1MZwY+nmkYdTKf5JCTN+CjvpXZcdAQY0rCz45jNRSgz1h8AYm6MwOjsijj4Oh0mT
	 traqQzJPerzIQioVMnersku23oQFakd7W7SNGMHcXiX8MOxeFG3J765az1RDaRVhBQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofPvZk+o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2218606A338
	for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2026 13:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2218606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ofPvZk+o
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bb5afa736so362963eec.1
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2026 06:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793278842; cv=none;
        d=google.com; s=arc-20260327;
        b=Ps6Q2CwllQ44rePSAujl3orwtPAFqXrM8A0BUWjwQWs7xlagF7RiyvKmjsQlmOvHoh
         zCfBKgpaZPitjPZTIDvMoqMHk4cG8WjX5hGxDe3A7tYg0vpQpmGb4JhOJrYgvpHVrM24
         vQJFHPHFqW3xEtIPYruPh0AzSGQ3yG9MpSAV2xyYeyioiVgDJPv/RahqIqZ75IB1SHvq
         C0oto2LhHDi2N75zmr6S8WFqShFaTou7bMzI2WtNuqbxPXu1lYwBj3nhJQIZgsfhndY9
         lDazvQiwYz7Gh9T0gLNpY6W6iElkQItExJhtD21RI/i3nU+P7Qtdbmk9rWjhxwmTwvNu
         9VpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        fh=9xJ/0XjM+cW5U703+IjRcRLdSbyEbsLcPM8/LI8tBlE=;
        b=McO6T8C1FGiVvl+BG+dKTrjrDj37XSnkoUig9uHvf6TUPf37GZFZK5+GJlQYxOjSGA
         BR07BLOQ0wwKhyLlVFX2aZ2jwnV76M7vwnb4ZiMtQPgTW5drvPu442nZ5lpf3WabrjGW
         G5sBEWYMbN/2SyMcI8Hev9C19GgOtwYZZ3n34WwvJ+NwZ8jYxvZrMejEYX1DjulPakXz
         AHsMz21Bi2fmkqgnN8X5NQxlJ9NQ7zwa0qq0iJFmXmkGSpxcAUVqzUUj69h0FBPUIl0+
         0SfcObHwT6q/tAJHWq9ffHtwxpjIb/ryhskPnSGIoCRIkGT7o9P2RF8aOjYZizG9Gwtc
         c1+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278842; x=1793883642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=ofPvZk+oAY1UtBN8lfS9Hjg636A5yXXxymVbjphADhkntlAvo7d+OJU8vVQ+Az1YKb
         dWukwXu2x313G1oppF7iAuhlMKCT3diyXTgTlAKXWjGM+Iwm50zBqxbGFoqtU4CjQPRi
         ToYeRwJPj5xeiznntBlX4VFyiQuMizC0YzA2Fycqh5ak/5xu31DBjOip8vO4Z2tuK/4f
         9PhR8pLQtraxqSwScA6jTPUn2IoU48Ael0NpD7F/lfQbSWkS9kG+njGnjZ8V4i1r6jjs
         NKUP7iwgO2CL1t6jHHe5bxmc7L4p3wIS4RcYs0ebru/xZh/T2s+t/RLRgJoRw7N6mzGF
         pkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278842; x=1793883642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ganH4EWpICXirAxibAD+5YRIHmRwYY6kvCGrRyrhM1Y=;
        b=sabbXfzdQxmrDG5Khw1i2JtdCK/EO03Emv7dX8a73cJ+Bz6hpMp/rjBAHSNxE8qyX9
         J87m4SuDG1uZlMrOfZoCawArP1PrF4NUGuGN8kSsEjLnITtA4LWNmwlJhXq8752dfQTA
         +F1jUnekfw25lvU5sZNp8576NvH2iD6/t2tXoUHbJvapOzVS1i4YK2ZWpfkMc7a5T4Us
         U896xWJqSQeV6c8s8T6kYdYDRaBA3chVSFE7i0aBzrNYNDwUjIUG1LiUR0HWOngNz0kO
         C5tfZTdOSmyUVhg3kT3uLfh7IFyAF7U8pk//v7GF/VQ+z+QE67rie/aj2TghS6sk5KAl
         XM8g==
X-Forwarded-Encrypted: i=1; AKwUvBwA34RA8m8hiKihNazYNo4XY9NLpRjLZGXk6sk8leZmf7M0xJfg0c7RQC9EvETgdsS047nZZGFxxSAe@vger.kernel.org
X-Gm-Message-State: AFq9FYJBSLRbALToDv4q9mivyLACb2xIiGq7xiJpJ6rPtZ4SVujaMiQY
	S3cVLymI4UAbibaQUQDI0kmwIQT1vZTzDBMqqroCPnzj6Wqf8MzYbSb52KDDgksunFtHVYDpG8y
	CWULjnFAOLQGfEyt5t9879nD/Urlxpc8=
X-Gm-Gg: AYBFou3L8EC45lJbsWr+FmTCq6CQ1VzO9xbaw4wrkDFD+QzW8tOpEpl5wx7kVKM3Y3Q
	XJ413tfxpC9jRc0IcOBUrg9nYvO9IUaadoE0862a5ohB1XF5oRB/bbz9P9oLwbA6mS9x+uX5D/Q
	tzWQAWuCq4WLzEdlX0ucZoR/yKe8GKxygpQ10jSB67pvhybwF2o/32+pEVREYCwA5MFTlnFrSqE
	6K9XT02aWSyoCqre9IE3d3sUIB5yBz+UfJ5Ez+37kKTZxWBvJ7JnM0bda1U5VM0kkMRzpb1KqQ1
	x0ZJl4Jdkplw38Q1G+rDq8pe+JXOAI5Vo4SuLgR7bV1oWBXSEvaoDirJxnal39FEUpbO9yLYbqa
	p8vFAU6EIZKxiz7add1+scGP4jOb5n5anUrv+9kDM78LY1/jMf9niqFPHHG2ttiJU4JYtPB+nvK
	3ZX885hyA/NG1F8X2PFXXdjbHJWo2TmO0y+5Cyia1nJl15iULpgqI/kNVjukaYzWbB1Ul/R9wQq
	WR4JWWabhC54p1sHnL18Qfni76yx0Tx8KTjew==
X-Received: by 2002:a05:693c:4196:20b0:36a:e7a:e89 with SMTP id
 5a478bee46e88-36a202cb0e4mr12034617eec.2.1793278841146; Thu, 29 Oct 2026
 06:00:41 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <5bfdc1491d297b5e98cf42322c790f06481c28c7.1793027261.git.d@ilvokhin.com>
 <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
In-Reply-To: <fb3b6a24-74ca-4da8-8593-352afd515313@suse.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 14:00:28 +0100
X-Gm-Features: AclHuK_VOCF7u599iESvOsHhN0DoC1VeK-LagvEMwpUC6WNOUUTl411X-macJoc
Message-ID: <CANiq72mMm75svCqevd8fHtVoczDpvpo4NwL0SC8=bWy030vQuQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/gem: Switch to __nonnull_args() macro
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Ilvokhin <d@ilvokhin.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:32=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Should gem.h now include <linux/compiler_attributes.h> ?

No, it should be included for you (unless you are doing something
custom with the compiler flags etc.).

I hope that helps!

Cheers,
Miguel
