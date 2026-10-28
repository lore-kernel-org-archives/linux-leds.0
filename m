Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180935;
	b=D0WTU6r7E82i/WzwrEDZL8D/Ac/UJGOKjbCA9BkUAWG3P5Df6EFVnourWmqD2ZhkxaHu
	 KJZeSWC90ReRWWSGcuEWtmse7nnIP6uUQRBZ5QeC0f9zF5AMPxNCV9KG81IITMhymTdie
	 8HCSI7ZS2OGW4O8VZISO7flqCmz/ZjlEB9S7X+1S1ga2EejVfCbm6mT/n+j9+eJopQAhv
	 FZ002BzxEadFHUlrz1GbWuJhbB8r/g0TG2zzBm0FC6LNfVMWP+hgUiKt/5r3Bd6FtmBco
	 gBEIVS4Y0+Vw56BYGsYqaIynJaWpOuWzlL7nuZCyhaO8TGME0pbD6LpvIYLuveSxsJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
	b=MWtHbQ2EPRmbiPIfD1XxMb3UjB87b6RhEYaIu3kUdLkjxhq1OvnITBHpxbWDkprxvQ5m
	 XFulcNYhe5iVPrKAhflNSec8o/92B3VBZEOIqWgxP0N00+PjEDd7BR8dTnld4R8QG78yw
	 J8fSaoXfz9uAB15HKd8KxbG1RK8YQGvPUjlzvYbWU4vWdbL7S04Gh9+eu6m+ctBZqWUyD
	 sfs5n55INIlR2hguX2inwaXGzfnMly3KAT737b5ow4t61G8++sxWsUUp+KYRz8he54Mj0
	 fwjV+D28LR7mRCJwwxaWk8TtKnLy3zYC1sftTQuMwsYAgKCDXwsPerYOQHvfier/RjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vui6KWrO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C03606A329
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 09:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C03606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vui6KWrO
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c46d41f6af3so102026366b.1
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 02:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180933; cv=none;
        d=google.com; s=arc-20260327;
        b=VP/apFC79edvqBKJjuFb093f5il+MjTVQPQfS2PScYVv88y+xVyCztGdne73jT/pyo
         XXdhnBNYh2iwhFDE4slP8eXYofrC3537zOzULo/crmM16APzSqpxsGJ/dElcjU8NQzgA
         79Ten723tST2+UgrqTzpoqfZGv/Z2JBCk7KKdD7EHoB7DihRar5cXAuh1ydkRpSF8Bf5
         PCm/x9FhMM+Jz2z/H/zSTxKPXbYw/+kuFCz9L8ZGoHWZsmKFHWP7DMTD8saiMSEgJuMA
         FGFKVdJFEOh4lRSN4NwQmMbAvDCGkkWOqBZDj7PqnaPxAFjYZBNArNKpfVJMbCp/tJ3a
         dO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        fh=FS03xTwf3tmvMtUsOfy79EzQAHEJ8okKpncLhpZrmFk=;
        b=H7727cyV/KuYCANK3aFGMoV0y+azxBq8F/TWnSJe2h6m7ALiw5Jeh5vMvnBQRZkmJo
         fRMg68jxVJr3QjxzXVpLm05Tryx0glugUdpGY97Tl/W1Posmpn3xR20qmbwnb+wf5wjO
         9IiWJfcU0yxGqMo9MVGrJn+AfHEAOhAEosiAG8cxpSJ16/uVgrLRyhXyurjRiKfwl0n4
         RJ0lMT2VrYmbDLtHHwnbcJ82RWajV63JwBpeqmu33hkYUsS1PTYfYccwFnBmzMvbsELT
         zM5OZj5+q5GRGhbnqKYijYAj5Y6lTGZNOKFWaaZ3wgp6QJzJedAByeNBU1RS5tbi5QhA
         T8rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180933; x=1793785733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=Vui6KWrO4M0VRNK72Uu/n41uCoswnoTt+s/4QwFSHl7/x7Wwr/LrY3N3cJToCeeoXM
         gjMWLp2yO7pfatfowW3ZvCHPPtkx/53S/09OAgySOYQqlj1GHNRXmPOsjzGdOwkPRw08
         1/E93mARaaQYA60m0E0r3++wEApoTDg4hisWLVZFMzjrGhx6r5bLTJP/d/9noXhRolUh
         YG+kLrJQW9QXS0gd34x62/dM+7wa+NmCevHYC/qS7YEKyxS+fAE1T4fKnUnN/erff9tG
         OvbCtkvj0vDFGT0GdrFXaN8Mc+wQG9Gu3QDE89h3/4MLK25Lx6K4CEO1axqBDwDqaSmX
         AW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180933; x=1793785733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=dZziXLsz4yw87yxENc0C+yCnNnuqhG4ASkxTXg39bWdQieT94QgAGTlAVgZy2lsB9g
         9IMKKw5a5GRs+dCpjCaue7q/wgVUZ1pdoOCXg5YVb/IHRsIH7CjVqBT+u/BVIVw1roqy
         hBhj/AHLYMipTxamT+a7YCDJr6AMZL3Vc2Le7kvD3hFHmlCOQL4yCj5taOaEgyq7rsip
         i2N0voIC/4ljeog4/GZiWen5+/ht8sFAh0oYtpfMf/yazlcxk69YoPrwU7oQ8rk+wCmK
         GIRlvCffSPckV6cQbaa2tv3X+/j07FeuolvTBG+YQVnYRcU/Po4wB/+Mg1VDF+1jfJOT
         ANxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+BLNSqF0N0AyWJBi8NXSxtOqIdf8ZIxmSnVlMLxuPnyZ6Q7NzIzxD4svWJcnDCipz3lrYcGLCqqLG@vger.kernel.org
X-Gm-Message-State: AFq9FYJAWhmKfly1Iyieb/C2pD71v5UZ7HYkvVvl1v0HsrPET3yGJxZY
	1c1Cee0EUh71enkOBgiJjDNOxzkswIkhMSc4Gi9LliIlJVpP++u5WYhiecWSei2kPQYmv76e06u
	wfcQ+vnh+nbaUTWYmFxkdW4oe5NH8ss4=
X-Gm-Gg: AYBFou1S1qzEUP+dLlvtCkgfnFbQYjP2S+9Z2PW5zLXggi4PbcK36ARco8zDraluaUv
	RpHfiMhqIFdIqsfrLrbXAE3c22M67bt7A1YHpM4s+d1CqY2luH5MXYyK4pW3Ul9yAg1qD0vNN/4
	ms1ql6EmDo0MJ5+zSGRLFoI3rMog90iEZwUGKv1kJ30bLTzm8y/urKfVTRTc5vR0u73XdEGnS2f
	SorsyZ/LJW2DISJP0SXfoTzyuvwoNrBCYS3NL/Aci7NaXqqIHs6kZTZjlKg184Y9oS4OFV7fahY
	tUIZ79Ty/uJYFL0ioTKRxhFaNfhTltVBgNW1ZlRcPGsRIptx3uj/+aPlvo8nHnubbZ2TP9AMM0Q
	rd530rFnOUlIBWLwAsT3g4Ag7PEeTTh4bz+v3IBuEK8XcXRn7xSjOxoAwZ9+38WeXZLHeNCsJNt
	mtR2CiBpstYJlCOHDkwOKucxl4ORCsb0WZKxobm7KcgWzsZs4j2/JqDzG+gwasTmcQoeejSEW7p
	PV1wHenprSiQ0unIx/lsTyNmg==
X-Received: by 2002:a17:907:a893:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c49bdf394e6mr156034066b.17.1793180933042; Wed, 28 Oct 2026
 02:48:53 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
In-Reply-To: <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:48:16 +0200
X-Gm-Features: AclHuK9bqVSr5ebQZT2ja4gGk1wmv0GUJ0T7y7aJfJNVsg1OI_1bv2lVUKDS3Hk
Message-ID: <CAHp75VfJ-L5ELAttN+Fz_Co2E1KHumwLZAEMXFMhRubzgVLqug@mail.gmail.com>
Subject: Re: [PATCH 02/10] string: Switch to __nonnull_args() macro
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

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
