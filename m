Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F23B1B3
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988135; cv=none; b=u2qub8xZD/p9yaKr2dS6dLC5A24HDWTttIgtQ5eHsvyrFWmwWPGPbETguCTx3gBK0X80RrPb37qxZ7u920Nl1OWMnu/MaiWOKxmXv90jG9Phc19w1ej9x4Cr2kIfCRdfvHBcc9LGIeQ7oW3Fw/qaxLETdrGXIGSXgf8mjCvr13g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988135; c=relaxed/simple;
	bh=BKCqcrD0RzoSyvvZLCPX5LJ1shYDr/pz/kCB7Ep3vhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cetVy/grsy/pImJ3IufiO2H5jLyuFZ4/x+tQwjwafFt7fAdGX82dAREisA89jgnWpkFoBhS6m67Ky28gdg7FIrfq3xnQlQxxAi0puYdYk2wDdQ7cXvoZXOwrhqZnbOTkFXGV8/WcAGRB31uTNeIcydJZjPl2pUJun/4xkqcUlEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UB5NfpPa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UB5NfpPa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C111F00A3D
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784988134;
	bh=P+dklRexGZN1T9IuNACHVZ61aN8aiII+79MTcQXbTYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UB5NfpPa7NG1unaEkJGtiI/ywZe/PGSOgTQiO/A3QcPDMSkKXyxtrbR2QyMYaASGQ
	 eRmvV+7ou0MoqcaF5cINb9B1rTyPFIGgcaTGY1iKcgfJof3BkplbFv2pxGsC/QLTx6
	 ywaq+UmEekK38B6KsQI35MHF06p3DLB7ojsTA9pVutYPxE4xmfn+gS6Vtk/Bw9fPKI
	 85yyH2n927ehUsAes5gWkO8P3fzUf1FpvPUvEMVDJO9QR6q5tqzfTTd66H6ZOWPsus
	 Ap0RQP4gVe9Epa2dB0FoorunbD4RLkJdAFzFujPLuOafXbiOsEakn36jafphBYd0O0
	 wspcnMbupUKDw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so1181264e87.0
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 07:02:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhzKoMchevEGlnaXJbN5mJTRNVfsYSjJHImG/3AhyDHvhhwrgS5NXO8f65craownTvkVPRJa2ymNlO@vger.kernel.org
X-Gm-Message-State: AOJu0YyyuHi59hBNZmXlzPCfZn1FbpFBusYYiLsMpMx1A0OZ/jJLBcWn
	xgVnQf59HmtKBjUem1RKzbw1mas+/atXg87xH86Z1t10rHIlTIn/l7Ox8wBusQYYoyToPGSingQ
	60krwzmDoXkFzuBk8k7UY39wjp6ltcRE=
X-Received: by 2002:a05:6512:308b:b0:5ae:baa7:5ed2 with SMTP id
 2adb3069b0e04-5b2c1b52811mr439464e87.63.1784988133654; Sat, 25 Jul 2026
 07:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710150841.19669-1-sdunnaga@redhat.com> <20260724180412.43150-1-sdunnaga@redhat.com>
In-Reply-To: <20260724180412.43150-1-sdunnaga@redhat.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 16:02:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLnfebNT-XJrVVamfGkFF3-dLgbqS0sGK7DGmHn4HRYnvg@mail.gmail.com>
X-Gm-Features: AUfX_mz1RKV5pAY_rkJPQ1mz2SCJsDv1pnF_JwVtNdGXCBBF0VXe-5kZbcLF8lE
Message-ID: <CAD++jLnfebNT-XJrVVamfGkFF3-dLgbqS0sGK7DGmHn4HRYnvg@mail.gmail.com>
Subject: Re: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs
To: Steve Dunnagan <sdunnaga@redhat.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 8:04=E2=80=AFPM Steve Dunnagan <sdunnaga@redhat.com=
> wrote:

> gpio_led_get_gpiod() returns an error pointer when a platform-data
> LED's GPIO is unavailable. gpio_led_probe() skips registration in that
> case, but leaves the error pointer in led_dat->gpiod.
>
> The skipped entry remains included in priv->num_leds. During shutdown,
> gpio_led_shutdown() walks those entries and passes the error pointer to
> gpio_led_set(), producing:
>
>   gpiod_set_value: invalid GPIO (errorpointer: -ENOENT)
>
> Clear led_dat->gpiod before skipping the LED so skipped entries do not
> retain error-valued descriptors.
>
> Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
> Suggested-by: Lee Jones <lee@kernel.org>
> Assisted-by: ChatGPT:GPT-5.5-Thinking
> Signed-off-by: Steve Dunnagan <sdunnaga@redhat.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
