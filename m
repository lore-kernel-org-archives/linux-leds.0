Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180883;
	b=ajcfPQVSsm9Ll1IBS+FCIghEi9LYxt2nV8i7iwT4rHcn1ubf2jip3Iit7L0YlaR9YNAk
	 KamhTuWDJC3wi4EEqZUpoSlgnChKPRSK0J1fFn9S/Pst5ksB3Sxgo+X6Zihbu4/pxDpIu
	 l+iNRtBQq0v/F9jRw17fU+KpywrhIZotff9/geifgao37dvCwTuv1T57o3vc4fytN9yZS
	 ZBciXGZq2bfhEh2VvzX9xo/RzoUL19+Nq0gQAnX94PVP2E7HVH13t+BHwUUq9l6fP8o5H
	 U+cVS9NF3xq8qIDhgJxLbAfocCcJYHL0YN5OKH2SyKpWDxZa5XFyKm9vPcuB2O+S65w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
	b=Nw3iO5kYlKRSPXLejww1QaCh3ytc6kAio33LVZ8HoIBUu/w00PmO4AMEF4MCTLwx6rU5
	 pdi9s7isY41UmHDaDlWrgosgDvWCSDuqgAgSh2HoHQsdICj9RkvhXvgxOxUHUVOi/cXng
	 FcbsPI7s9g/RH9F8PD7xssuWHlquZ30UbcFGsKR0NjtMCHjgDPZ+AogOkTvXkH7hgeLr2
	 2EdGmAGvAvNb80SEEppRZWY158VD9yYQiLX52rpHjMge4tT3zqfHkwk+rB0sZBBp2TOEc
	 YgQQEUF0I3wyPpDEZmcCmZJyzQVGSzP5LxaCAHCMlUTYzePCKAkM/bd064vpyuUUT0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJw6mAzl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A5D606A32E
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 09:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A5D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJw6mAzl
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c169ae1cb26so286655166b.1
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 02:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180881; cv=none;
        d=google.com; s=arc-20260327;
        b=bVwzE5Y8qC+fffnbyudVP8mtaiYqoN4CfTXd4gytoGESdJ3LzJatoFNtkFMQ0Tmarv
         PDL+MXy516LDV++cOSPbXCB+2HX4kpqvXPFUDkHTzSFos+CLzj2P51quSvURngIWBGdA
         1lI9MyG0OD5pf4G7lt8s4eDaPDEcPiJrRAHwlgkBuXOmG6tbYe4f4TWBLIkT/EP0g2vZ
         r12tvCQalb5Q8/bC/0Q/gQVxwMNIfAd6Ptb5QTXbrUXtswEOQq2xt0UPYYBbuw7yrIai
         grCb8qacfZcNF4S98bvljyFkmsI11BiKBVGkUw+qzJ+mqn4+xQQmtyVpBs07aEZTI0Kz
         EOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        fh=aI1/HGRRM+BS4J90q/Jrn+vrI00BDiZHM0wUrtZEyZI=;
        b=TfAIvy2sHZmHhZ3q7y0g9b5ntFQXKy5tVeT6Lw4/BhIiABRhcVivi/ToKzZQ5Tom1k
         let+kOfORUxF3uw+K+31F16bjKnDFvBD4X3ezNfLDYk1KlJFvNbw+/YGigtboBRymMrz
         zqvRJHFFiVzJOcsAww95W8eTMcKMAg4/PBbJEZfhXMTZ4Gqx/tNpKcOsCfG1lxTsJurA
         Q0VUH630u3BPwvCXoQo91vOTAE4hKf4LTCJh8pH+NopjmcTOpXC7FtURiR5VI0zE7Fle
         /eSRy1Dz3/HWEuB66DmuFS22AldlNe3AiznmNcGistNJOzM5pd8OtwL9pNT4jmoyCjMf
         M/eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180881; x=1793785681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=zJw6mAzldYFqYZzdqrK5sVCjCWQPQmTep1dLeDCOodLgldWlrkclOGlwaZnjuK1Oum
         TPJIIs//JWN7qNyOHlCsUAdJNutM2b52i0HJOialjxTrWs4keZvZmw3BRcoJU4Awqzjr
         WT7ZIhJrd4c9JQzrTY2yU8wr3bsllD1F4CAiDQBfntXs5r47SzlK8X0ezxzisTf0fyLH
         V2m79FTBz5/Q8KkYGms7kGw/9UPrH+YveHnhAh0ujkqjlAJ55dCcMHh8t8hYyve2EZ4W
         CPhdOdeH9FP4wI1+y2tqcuYKKYhDPN/HKsHrz7f0EKP2g/ydwoE9hgBJKjkE88fNdPU0
         JRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180881; x=1793785681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=zro06EHpfy+4w5Vk+ljQSCAaqrUe2b9TCP4JM69d5D66WPH42qwumyEsxtDtfwOlL/
         vo/+aU9Ci10Q8GHDDRTm0SWoJGYwBpdfmkZF3AxVvMqs9SFrsGP60ocfhswoiTbjoEIi
         L7OzAwbbemkXGAY/E9OGVaAQiMgWXRQX3fMU5oy7NHRYurbvey4XbW6MXKNcNUQyeLUR
         jQiLqmk88sDRqB2LP6HHtP/A3m0mSqNrJAR3U+GGpJpN6WUFeXa90ABiPY0yDlAZw+K+
         Hpen7n4HBlRdQ8nfBFLRJD/I8Ox2tAUsirHvHQptJnjefKlmbBHrW8VOD/rfK97lZef1
         iJMQ==
X-Forwarded-Encrypted: i=1; AKwUvByIQb2gUH1eKdFd1N7cRvLESPPafdn1lob28WUAUkTySKQD4ykrQqPz66IbqMubZ2EmgPjzriF7CEh9@vger.kernel.org
X-Gm-Message-State: AFq9FYLK5duPQt5fRueL21Ng+iv8vgLyKgY87plTsye1AOBkYbCTcqz3
	Srexnjcrw6ieGiVP8touPleMz4WiRv12qsCLxLdG0gLK5QLW35Gik87xO6kXsw/frqRKSOGu3E/
	PWDzDiiC6YJEqD3fIYq3Zr3owfg06WOM=
X-Gm-Gg: AYBFou0hPdNF/gax1T7HqPBMbjJgbaA5UOkmNjSnCce2nhaLiM2Giy17vZNd2DkUoZx
	unGeR4qIWtqFISuP0fFU01HHDE1O86HRBQL10/LHOq/eaL0BVme8+ONeINdXbzFp0/Je9z602l6
	WH99O8UfrrN1x80GU1s8vrKwcjT6v94ALAn72zke+jo8AEIRyqT5vRn1wZFlTn+vnb8eWz5Ta0n
	JxVw+e6hB+lBxdKdKaePOWUVMTM4AiCmsMOAloXWtXVdChK8WurHrzcp2pg4UvXQsf43aBunMwU
	Gfs2gX8pJyJkOkkuyL+H2Hzx0vAd2Rgcqi+BCFt1WwvBAYFNa4ssO/TpdwNVqlXFr2BIRATgRbV
	p3Z2VMp3c0wQSBoJF7t7Xp3671p5IidlauRfYp12xra6SdCLr8ftT8hZG3PYIF1I+/8mKndR0jP
	RIRdpWOKkRnW1QNg1GcHyb6314pyBAl3Qf95JNKBv5O+9T2F4qR4pjVOl/gbzLaRn3mkzZ+Gajx
	wasNo7MfOZ55qX+XVAgQE/2HA==
X-Received: by 2002:a17:907:86a5:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c49c6357d34mr69949566b.18.1793180881026; Wed, 28 Oct 2026
 02:48:01 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:47:24 +0200
X-Gm-Features: AclHuK-8N84O0Y9k-BLOPVpeywTja7886uZe3ugxN4eM-96m__IvC7bzZgS0MkU
Message-ID: <CAHp75Vedr5J1WJMrAkBjRSLKA_zf1kt3GD6UhjzLcy9vowxnaA@mail.gmail.com>
Subject: Re: [PATCH 03/10] lib/list_sort: Switch to __nonnull_args() macro
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
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.
>
> Add spaces after the commas in the __nonnull_args() argument list to
> follow the usual coding style (according to checkpatch).

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
