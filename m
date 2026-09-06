Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4DF37A846
	for <linux-leds@vger.kernel.org>; Sun,  6 Sep 2026 17:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715752; cv=pass; b=bnaUW2ujK71/dhz+IimIQF6u9kk9HLIIExwnHsIenYv6AVulLPfxGrJyPxHGlf2r12zViO0O4pZrSdLOrQ4PzRPWK7G78IIUDOsOj2XXZQTBQTM5pyf/XGLDPpt4tYwQjsAa8zh1K85+Rd8IaTCyRGLkCKO/3pt0oq/k5RWuTkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715752; c=relaxed/simple;
	bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KCFp7j5iuN3plHOjDh8A4zUuH7ay6P4G8LDgiKdLYPGj9T0PYICoIg9yn08t4ddyd1dXuDWW0kSIXvHKU09pg0+b9afr83y3pApqqn7VOs8UlMWZH+nHBKapVLvx1pr6RNUOW5gM/xKmzwhaTxIl2X/Ylcib6wASF1cEjqG0SRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF8j2/e9; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF8j2/e9"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d944747d41so29108815ad.0
        for <linux-leds@vger.kernel.org>; Sun, 06 Sep 2026 10:29:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715750; cv=none;
        d=google.com; s=arc-20260327;
        b=rRvgzgr4aVu2kqv1T/GBxV801Bv/XkQMGo21BRIwdsn7F5XeCX5l3FCQEfLUsRq78L
         1dj/UozY2LBc69v4V6gVFnKAKUfqwQ5YmRu7aGYJJ6hmDN9y8jykf87pqBS0BIWZhZj6
         AVVz29pKjEgnWTVGx9ROTYqoUcOUfIeWXiJ5ugkVhB3viNwa1p+L3lBfRa6ytwB2TPnR
         KrKvnZF2iRA7Av0JFrryhSZ3wgKpw53YSSmm5qwg7J2Cd7zW6sI7NMjBROIAxILDDvmK
         9llK0H7BZx2q7GjwULdIN3ZF0xj9Suuq+pX4lIlZTG+KwgKXCKwp5wzJ5zbIlGkrbEsG
         +v6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        fh=JrEHwdlDHnYJ9DE2y11G6W/YjDi3GMpUCYX/WmbT1UU=;
        b=pObi994lzCVklpX3HYsIJpxw7CB+jhK13gZZy/gXEKGAMOllIXd8QAxlGrhf6wXhG7
         Dw17lowFnBNItEdl7dzWmWP++VZw9NOAceiOfvvQU4ZDEBkXs49cztrqY/4xf+sI0VWZ
         IOpqo4GYZ2LAhNAexj3yEUu5mvWcbkiV9PFfd2F9Cku4PxtX2uc/HB4mhdo7oSFxDSij
         rpVVdi40mgzS+w12u613mtivXu+n0g74YuAMXYUn1hTdWvDGuIVrBVdlAC3DTmEpu8E3
         Otym6xnLqzidwE5HN10MukUgS9uVDu0t6YUXKCwgk8yNHnUxMlssRnC3y3hcbwDrFwVh
         Yp2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715750; x=1789320550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        b=OF8j2/e9XaMRw5ga8VMjNKTjcE7mR8jmZcAz5h3CAi+h5rCxFnYnEfwtjWc3daAtRK
         wWR3rt+PNnSrR1dFm+5ceUKKbPr4kqSvRyCTz/LEFdlh9sh8dDoqIPNAsqZystl9Cnav
         h/mCpA3lAUX61QIRfNqgQASSNlTzGgBGgTW7NJkBEbG7kLNVL7WTiYZVgCutRYCZqfmg
         fon2Fm5XPPuRiy6UXv9I2qR0SiNCt/QmbKjqeCqDDbm/ZwXZP15ige2qp3w9gsZ561Qi
         bZ9IXQ9hJe0u3MpgmjeCLTpgaXSNYVxnC4DC2pc10S1zGMdMJ+4zTlsFdSmNuItXxe5+
         Hjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715750; x=1789320550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5DEiI0XOfcZ/AmMcsore77sSwCupcFULPw2OZjhCwgo=;
        b=AWc7mlyGh/KAWGr3zkcIu2v9qaf3WkuRptRUL3ICfU2kG3r02+JJA73e8m6TOq606p
         rxq6L7+DZ4CatIUEQNFSBmxjVqwYDonOwnJDYnyRKiytoj5i91M8JtutjcXIBWugD8bu
         gwrgII5mC/Q145axvflpu2tzS9Y+tBKGoZljdVHNdRVKvL+2fFzTz7mYHj3FBN9Ig7Ig
         HLkbauGky4XEn0ywS4ADFQP4wqFep86g+dHF71ye3atxU6sNpyjqjnr76wQU5ufjL5tg
         ZBKMcpxuGQBmOV+AbY6HH2ValjrzkP9hN1ZQ6Ok48DU9kU+k9sC6EIWYET5Eml1O2vTn
         aQ7A==
X-Forwarded-Encrypted: i=1; AKwUvBzzhTOs5IpgVwoZj1OynFe6Xv0ervsD8P/cDrzgCksI6VXMeHtcpyj1w2ieJSZLf3exaB1dybwSTa3g@vger.kernel.org
X-Gm-Message-State: AFuF++laWTYSC6Zwl1WKBc8APQ8SlfJxl76XaA4jyO0JFcPA0JCGsIXe
	kKRW0q8YGMQohi9Zih6qdgNtziaa2vq2ANSKTqMg3pE8+6oW6s3uOjkCIibOLx7ahoGHku1lYc4
	muUNEWvPzd0Fo9P9QOaFeHYyjeQto/yg=
X-Gm-Gg: AYBFou3FBqIW5oJAOlJB+J3+tqPGJrr9tKKgtp7ZL7xwgyIP9nhG64sxKhIygNubJNh
	xsOmFEtULR9KUs2lZkzy4XXJc+/PG7ceAwFVKMK6y01pTAzv4b++dfZ+9SV016vJGWdaLkFYWUj
	Cfi9GffF0X10gq4IQ+6+l2vvzizPaDpkzRH3gkwuT5o8eS1DxIC9hxyxClK1jaHkWZ98JmYUoi4
	2VO4NnFd5hXRS6r7M96ZYFHpp9yjYsOXHoo8Z2B44s/W6bwcPM9tTm0Kc6ZORsXYqbSX8AJ6b87
	KzsR89dff4wSdx8qfb/B7DOYIphGGa9EEskR9SZbNaMY6JOEVwMaLBbsNayP3hH1kULigET9rlS
	wqw==
X-Received: by 2002:a17:902:8a8d:b0:2ca:e19c:97b with SMTP id
 d9443c01a7336-2db122edd50mr199148445ad.5.1788715750074; Sun, 06 Sep 2026
 10:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260702161828.GB2108533@google.com>
In-Reply-To: <20260702161828.GB2108533@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Sep 2026 20:28:58 +0300
X-Gm-Features: AcwNN1XWisbz2ascChHcLatRKYQPwdXAhH_U7ChBKnQiXROAqpt9L2vnmsacgR4
Message-ID: <CAPVz0n2fRs=q-1dAEt2k1FJpQVK9+PMSY0BSMB7Rs3F2xDyFvw@mail.gmail.com>
Subject: Re: [PATCH v5 00/14] mfd: lm3533: convert to OF bindings, improve support
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 2 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 19:18 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 17 Jun 2026, Svyatoslav Ryhel wrote:
>
> > Convert LM3533 to OF bindings, add missing VIN supply, add support for
> > setting mapping mode and LED sources based on device tree.
> >
> > ---
> > Changes in v2:
> >
> > schema
> > - maximum led sources for leds set to 4
> > - anyOf > oneOf in ALS
> > - improved ALS descriptions
> > - adjusted example
> > drivers
> > - dropped devm convertion of irq and mfd helpers
> > - all als configuration moved into lm3533_als_setup
> > - added regulator/consumer.h
> > - lm3533_bl_setup set before sysfs_create_group in backlight
> > - added check if LVLED is valid
> > - LM3533_REG_OUTPUT_CONF1 > LM3533_REG_OUTPUT_CONF2 for LVLED4 and LVLE=
D5
>
> This set looks good to me now.
>
> Let me know when you have all of the Acks and I'll merge it via MFD.
>

Hello Lee! Is there any unresolved blockers for picking this patch set?

> --
> Lee Jones
