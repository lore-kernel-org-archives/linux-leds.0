Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1A5439003
	for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749076; cv=none; b=orlULQ4GIXC2oQZPE1trwGdMGGxj5kk337q2fdlRlwJoSCYTeXiKKVcotIX5fsUXgbnUyafi+rzzlMnzQ3PBH2Cg37r3huJ0oV+Zdl0n2nC1GsHbsKRGOOK/Qjp3T/lZnGdpJTndLwUDcxergi9Myn/gVduNr+mhKGPGd3nMEyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749076; c=relaxed/simple;
	bh=LHZ+CtSrs1sFgqxg1SDgUv6SV2Q72AbvoN/75du65As=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bO01ofj6rueH2FFMla9bBjLOC7pOrlmlMZKe5xA7Ncf3dh7YiLZoWqykqJ/93Hv9uUxpuE5lz/jSwqHAy160iiQOfldOJI4rUUWdbFiZvZLKCh4aA5GdpLOAEWPX2JueM6bfjqxv9Q+jROuytyiZzo+bcoAfDQKATGS3CXHNZ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59d4aa96ef2so2779910e0c.1
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 09:04:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749073; x=1783353873;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEWuyLm9nvyhq9LS7vVK2FWNUi6758jMrQo6mncWdtU=;
        b=F/qA0oNRhBmm5V9Ca96v6jL7OfQq8q+AxZ7JMibMPPbAXp4EDG4hDj8M0yQWKrBQBF
         jEivdlktmcPWR7vILhcL4HF5FpQEidYhraeQ+C1lA7J94n6/aJsFctQbRGhJobJ2VD7Q
         P9+Gq99/yOSRoWELnljhrZ2LEpxY9O2Lyg4oe8lry13fi6jgFIMTfkvb07VTKaeeUIYv
         KQ3DmsDTXXALqZBir+DDOyfw8K3xThmSDX5JqpaIreB9RUSoLyGtiyOCTVWe8jfNFNP7
         8y3Fe+Vb1EzGqBwT0+srEB4CBUIJHfoEmh3h8WK+tnG/9jZCfoxS9a3afJi3+bLeTlNi
         jY/w==
X-Forwarded-Encrypted: i=1; AHgh+RpmXKoVCDRtml66CuOvU7+XTikE5qmcp/8M2dMMEO47eL6tlv2BwCwjMyeTvsYpge16le7qgixG/IIM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxym+m4Z2C4M+/rybn5o8y/VCrT1tlA+DH12dS4m6ybNSOJZpkR
	NoycYX3auvw8Tpvxbr2mBlV4oOm7ZBKQV0PcWNvxI5IqW+wGZFbB8mbJROSVJrPzTM8=
X-Gm-Gg: AfdE7cmYzDnxBlMrmX+sqktv2ZW5TwsvkYl//cYqxtZEuGbnNE9XV+0jSGBTPEsX1Xy
	qLdLhgsKYxNY67y0bBRVDki/qEXqrVnxN//Mhf/kRX0ltzdglJID+LHU3FxOnEDJU8yghF6vxx+
	XpHd8HRt+b0hb7vL+ezgBLLUPIQfeYdaQJ5BF7lcXTZ12u2n2KDbkWZSqZW/UYXmp5fP7Wl0E78
	CjfQHInGF9MMtOlFvVckzjSnbGcYhwE12o/5SAOYnZbgpgLo/K7xRUpMmkMxzvOIoyrvGihXj4i
	j5B/FuQ7TY2wwyJqPL0s6xaZzNh/avu/TBtLOtKim3XvQOahjOA9VnDYktFEGOoQbymG5PPdcSx
	jeW0RV67EXgRFrlXyKfMCtMMmWuHrTuqT4wOpSehs2zSRusZmyVYKanlKK6PSWQnu+AAhwAnZZw
	uT6IRM7uM5Ivn3qhsMkO+QuDzU4B6kHyMYmSMZdqYjiBRLkmvzsQ==
X-Received: by 2002:a05:6122:3112:b0:59e:f988:51e with SMTP id 71dfb90a1353d-5bdbec3481fmr263957e0c.5.1782749072749;
        Mon, 29 Jun 2026 09:04:32 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bd78c3248esm5938201e0c.0.2026.06.29.09.04.30
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 09:04:30 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-96358d0a024so3392473241.3
        for <linux-leds@vger.kernel.org>; Mon, 29 Jun 2026 09:04:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpI1hue5WVTcp1BKqaZNysfXkv7RRwduQiOVrg6a9HNuDXEVLa4KzHr77Nlh8HezOmZvuMzlzDGg7vT@vger.kernel.org
X-Received: by 2002:a05:6102:148a:b0:738:ff1b:940 with SMTP id
 ada2fe7eead31-73a365e2846mr277383137.4.1782749070424; Mon, 29 Jun 2026
 09:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629130329.1291953-1-arnd@kernel.org> <20260629130329.1291953-7-arnd@kernel.org>
In-Reply-To: <20260629130329.1291953-7-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 18:04:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjJRCW2v=ocjaG1xv2Bhhn1fcgL1YKsV3+MWbhboFtpw@mail.gmail.com>
X-Gm-Features: AVVi8CeLP4wAatdqRaN_LpUF4e5DDi2Drj76tc85gOykWJhBx1i_jZadj7vLGOk
Message-ID: <CAMuHMdXjJRCW2v=ocjaG1xv2Bhhn1fcgL1YKsV3+MWbhboFtpw@mail.gmail.com>
Subject: Re: [PATCH 6/6] [v5] gpiolib: turn off legacy interface by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 at 15:18, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> All users of the legacy interface now select CONFIG_GPIOLIB_LEGACY,
> so it can be turned off by default and only get built on platforms
> that still have one unconverted driver.
>
> Allow turning it on manually for compile testing, in order to keep
> the build coverage of the legacy drivers in allmodconfig and
> randconfig.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v5: added patch, now that we are getting closer to completing
>     the series

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
