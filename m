Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181021;
	b=yGlu9kV7xxu4CLciFTu4lJoL5amCFKT63okHAag+aogOwOfaFDB3fKsxCyFDi4bpJwt6
	 AEFsxQAJmt655GhAtDqAlJ3RV6ejSVaBiWEQLmdBVFinJplzqNJ3pR3BY6RbH8qOnACW0
	 L54gg3hYi1uRm/NJn1jtPL57f8HUO0cJZkalMcFP2/f1t21t6AUXj7RtpdHXiFYfn1ujA
	 rrbqI+fVE2uH90ReAP1r8wbL5igCSkIACqOUOSG3l4bZHZ/Cv64dX9kBY+ALUL+k+VWo7
	 anqWmlDT0N/QJ7RvVnwDhRS1W9LuihdJJd1oCP04A+ehCVTVjQMvLRQvG3PWHqhBuGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
	b=rQKeYhiscPJFnhAmnkj8N13oQFOet9tl9xXAVIz3+bklyQqRrGcPViiM1wwFUeZowSce
	 Ilvq4rgKExVKYltCEf1t2jP+RRP0+vwix9tV1QrF4kfPU7krisuu+UeiwrBNBDYAzrs+2
	 se2rOAyUaVFVlT6btpdbZYuuR9UzsC1OC8EDET7sYEkUMEydgDgcmPxmSjg8qlEhp/XI4
	 5seZFgQdd4LLuU8F+VCEUz999QS2lTm/TIHbcsujYbhfAcj2FOjnzBtoVplrELPvwzGk8
	 Gq63Ol6fwznMmQh2bNOfNNysyvLrhjl4pNiBydyS/6U+tXi4DCcSxf79ldThGSsF9Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po+tkBhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB403606A31D
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB403606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po+tkBhH
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso2865230a12.1
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181019; cv=none;
        d=google.com; s=arc-20260327;
        b=HkBjgtVFR+VLLcxMGD2mnEc1bKmtjk1wlINfVQEW7fQ2yr66onJ0TtC39o9yJFE6fE
         2Boca8t8oD/7zI2Vuk5H2bsWO9V+el/r3Rsrf6uggoTE7M0p+NfAbMDR95ywXA+DOb6P
         b9GrzAmjMOyMwaAhb3ab74UdLMxqT+lgd05YnNPiL0nMFoT8ZMLt6XW5b2EsPazb3/+4
         SnuXLFaYoPFTSn3nT+3lc78t9fjYBJkg8LZQwAAJ7foc8Lik0MR/7jyLPBmYti3jPcNX
         rS/4lFzbH6GilIhGTF0kwK1NBYVFEhz755RgusreoQq6tGCPbxp5A7Um1EQN4FPEFPtC
         qnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=kB+AyJuCOd21dKlb4XWUJC/AyVJTo1iYMAL35DdoAJU=;
        b=mOBAP9dnF6lRq01Ei+Bc9xMMUP0X19IFlCHdnGae3Ppmgzgdh0jpWLgAa9K2aO19C6
         Za1/ctnzE20nm74ECs5zo20Cwi7KEsXbQ61Nps+ZewsX3acNxiChJqmmc5OEwgAIovuj
         UpuJdi0SwUPNQM+nkFmuwD/n2+Q+k6Bsf/yg9RGu+dFYXYHMkSwPiVvTa9W60hTDNR0D
         0C4isGKWvPku+EPDYor9Q3YZrTaN246g4LIJfZkB5BrvVtZyfxwf49kV+gcKe91TXPTa
         Q6VLKnPL0wOcnYEqQFoBYlt8pVFxWmAq2e0fIyVntFLD2jGSR1rolHg5/cTlJa79Shku
         hTsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181019; x=1793785819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=Po+tkBhHSAxqEHwLFlZ/dUO+MJX4kBmJcMJ72/CBTwKDm72BzNBiMEteALPgfbyNoP
         EzBjYCRyohCnJfUhTv7oF1MACYHopGGCSjOQ6AazrqyebZD9uRI6Ayr5dej4TDUM4dlt
         SXymOqJpD4azna2aSzuZrbEp4Lwg6lVAvMmnKhE8Jgl/LQsXxfn1L3AWnI0S+lFXopYE
         GOgNNvE45nthasHpbdgbf74OgLbSrrfaJWK7r2jXh+PEfaeIx1GrmaA8Q6XsabUHVALV
         5xyPXXcFo+JPCjrfzKLTnwjN4I5ZzTw08NB2P3kl8K8jQ2pAiA05GHlZledigQ/6uRPm
         L8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181019; x=1793785819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=FavrRZg/5+Sy7WGnNzLk/OBMzUsGBzb33rMzTOvXXoc7D4fyy16aaNKbmxZczLV4IN
         b3idcgu8lX8ClY+m+ncQA0CtppcihEeUhAUl/zF99awMUKnjkcHDWoR9p+j/sQJ0Osyg
         iRgU7r0a4hIiN88GQPsuphzkeLihn6VT09vHGTCieb8hcx/CZ9//7Zwx2Mycl1LBkUW9
         0e175/yZt9u8pmMHSmsF5s/xnIRbl+8dvWiz3hwCSYHI9ep+YjpLI5cXP0rt+a0wgPgt
         K4/T2xw9K8Y2Fy+2fdXI5tBQ1gru3J2vXrl5k9JXFyrkieSzd4IGHbMElA8ejjHNflSl
         XFHA==
X-Forwarded-Encrypted: i=1; AKwUvBwrMcYODY1Rl6efnW09dY/sp4IEifXpy8kUVos4r0fivlCzSb/HKYfLN2nbBe1tV7a1OR4tVU7KcJQV@vger.kernel.org
X-Gm-Message-State: AFq9FYKM7trejfa43Da25iC9y7ebnTBsJwZG73sumENkakaghlxIeWav
	DSaxKbtlzVus6a2QLrC7Q5YqlhukdyxlyIGXQOiOs2tSIE35URGoHmljYtKXJDbJoavtKDg3MN0
	MDOzEjavgf/vGQulG8fKEXVzNIUhQ+8o=
X-Gm-Gg: AYBFou1kH9M1rwooWV/W29g/WUe+r4/sjORzG1/Kbb3Wx7u0RdG/WVbzQAcdn9UdtDe
	XKmp4hYXK3z9HNdqm0N3u6kEVq2ISC6ZLxb9iINWzRgk2cUERrxREjqZVGmbQZkR5rVJj+br8O6
	eUCeHxA5axjRkIBfJzwFh6pw1tQVKpPa+4EZ2dpNT5W9aBfY5sJlaBnniKD1LANR+deu0W+gi9d
	p5PxfkZaoQJrBvazHOk8XGdS5+2JdKsLFTaleKysnoc1sqY98hRVz+csubN2qR4EKfiaO2AHE4+
	Gg72ETd09E2WoxYiHseA/4CFRYRFPbtWaqIWKpwqNgXvDanlsCe1ShHUTO0f/zwQL7+hTypw1hB
	m54AFY/RC/QyIJ8QiQagmoHOU/zqn5mpJ/ZqbXJXZFJvKhM7z6IW/qViWCI2TE5atnhWXST1tm5
	/fBk64xgLEDQdPpKIhuHm5WVoSp9l+7NJDgpauka++bbeDsVGQ8983gExISrm41aMoZURzj6I6M
	G60v8qqkgT+ciMpX9yb7NftlKlj6dvYb4jr6JuYL7aGe8k=
X-Received: by 2002:a17:907:86a9:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49a739f8dfmr484567766b.14.1793181019107; Wed, 28 Oct 2026
 02:50:19 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
In-Reply-To: <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:43 +0200
X-Gm-Features: AclHuK92we6zl1A1tCfKfYVeuXltUG4Bsfa-fRzr4orRkDVhJuYkTUAxt0MOtcM
Message-ID: <CAHp75VfR2i_PPZwSG2UPaxShU5L=FsSdEAT+0iUMDKAfugbRsQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
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
