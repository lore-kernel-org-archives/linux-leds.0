Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C0343803F
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2026 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131287; cv=pass; b=SL/KnFxJAi43dmTcV+6dWJ3M2x7QuntCfrEzwZt2noF1v0LW10c+O/CLMiYcikOiuM6dZ842skaLCxIWsexv+mSSI9zA+ypxxOhmT2oT9XVp3e3zJdtk679+PU9pf+U+mYJJ3M4vFg2IFc+9wgTnT0saVCh8u6Tq6YEU5arjK/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131287; c=relaxed/simple;
	bh=SRKu1RMP8lCKPR+HYznxClqvbk9Ij8Tx9Yd8BcRgYPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eWPsF7OuzkNpusAHpcOczM7KyQmFvixWm5qZeGwyLpzeJe3bidLCfxcurPJjHaER0pIBF2P399QvHm6WLG3UNSpqOcZHc1crf1GfgxPjS76suT0wD7h+wcCEzZ/hU+xBX44hRNQr6zR3/d9bYSacv6gpNcoK2XL6wmDV6bOS5Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dt9ETela; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dt9ETela"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e2dab83eso123903666b.1
        for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2026 02:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787131273; cv=none;
        d=google.com; s=arc-20260327;
        b=KWmhwoZiKEEWM1wvR6nJQ/Nadyuv54YT5eC34Qr+4F57eyLSwjoLQ0LMCaZ2+a50tH
         sjL93bC7wy9Dx77jDw/sxb3Hdt2H4w+KdIxxE7crMaTRftlcF/ANGMUoRhSa1vy/cpPA
         BMDUgKE3VDM9PIDIo14ih5IvJfOPiz2AoKRYTvihznOTUoGqF2udvKMg9PV8UCfZfCY/
         SDwzXMtzW26roM6nhK5pf68TFV3w2Z9OcPkzJIxx9uy/H8gjkksbaC4ch+cG1Bh+0O0S
         XhvvsGuOjnmm6RuAvW4cxSo4E1GIcu8n8BQWcO77H3wLS89+rdsOn/csStQ4edEFBBmb
         bSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vi8ghfGMWZmpwEtSeTZjCsYAT31WP+MRhmUIZU07Nc4=;
        fh=rhk8BXC7KABcCPoV3OjDkF1ccy1xqsV5smw3VrTb8QU=;
        b=sJLazGruY3PIav9aGnaXt1wMvoyOuaxocFd/YQ4rrkCSKph7qXQSFf+MNptjgVmPtk
         EbnPneefE+Cyaq+FxKITLFnVLBI2nk49NYp8Hb6ChNSNXxczr5DJsTImm0V0X+ZlvP65
         adaZRr4bV1Z+JSwcW1Xj2QVXxGG1j1+n2BW5R3lyIYs+5kWyIFgOihvgC2vOUKfImBG+
         sMkiwN8ReP3/QsLhoyd1B4fRhawybHDVPZdbrM+Vi0Q4BtP16FIiMquXt5Is0KG11ECK
         yIA9K40HtvCMvGvopnqOIQUojiAlskJNP1XJo1H24fC1ZJmRdU0/Z7BPGXOFdGV5KeXn
         MApg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787131273; x=1787736073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vi8ghfGMWZmpwEtSeTZjCsYAT31WP+MRhmUIZU07Nc4=;
        b=dt9ETelalYwPNHWrr7GzEURejWE6D9Ja4V/si2XFpml/u2fYfMjWLEllo50zrCZBvN
         GjhrV2jBxWSVkgg0y7IWniXkxNgRpoGLtAuWNG9vY0NXblDMu/xsECF6ohQjMA/GZmUX
         SDLHUkXwJlrxtTgnIK2+ZGwxCPKx60I2SjL5TptNpgGGPK3quZccmkaaG7DdG/mYeMDX
         yTx8JkK3Yzg582kqwzWTk+5j7Syvgwu+Ig0VMuknW0Sc9FeWFFBk2kMEr3PjDPgCJIdB
         Ih4uEmuYPJmCAIOsBWZ6WSGUMQw/kTRfkcwI0qnG/k0dvaPCTGw6c7JSqfFbeC1MphA/
         m39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787131273; x=1787736073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi8ghfGMWZmpwEtSeTZjCsYAT31WP+MRhmUIZU07Nc4=;
        b=UutejdIeqDiyfGBC9wqnLrnHZpQrdBZnCpQGxpSlXnbf1rrd/0QNI+GzhdkXdy//0u
         KAh6leAtbXIIVHvt+tCQlPZQ/3fPjE/7tMdm1+j5X5hLsburykjHWNDXP4AvW4+xKzl1
         aikzP7hlrt5LLMHtyjbm3+tNv/Mk2OLS+uCcYCFaqDEWW1iaPEKb/y3IRONFJ/aIigRj
         +f20ZsTr2mx1DAELgZIbbWcZVEBZfnJ3zBQfonT6gv62One7WSRuwHXVpZpmAb9J6AVB
         UbtAP2ROdy5pivFF224QTrYo8zyAvyZLDbz1K7Yl3BghmOhbqnnAQ4usy8nqCDeVH8i8
         ynXw==
X-Forwarded-Encrypted: i=1; AHgh+RoSKQvy0UNL4UHskrRJxN+LXMfdX1/kAB3uFxT34tNgijzTvG72Yl22JvOSyuaBFQV7d5dqGlqxSeZP@vger.kernel.org
X-Gm-Message-State: AOJu0YwIL6Do5BCkuA1Ehp1xywDWQWFgSJ3czSTvWJONkc3EfKRkrrtg
	YGdwdP945P+SzuOFw7Rg5ShYzuMa+yqYQMfQxFIIgq4BcyCPUxQiuJ+7okIDG4K1+Vww/44oGFD
	gkcgPr34hYuJhqPpSJJKNbZpCadoVrcU=
X-Gm-Gg: AR+sD13tJNOYgCKhm+iwpf3lASXv76cSMlbjRnjV18uWZTA5dr3JImm/WxEZJHA4Q8x
	+jtoHWYH1iT1Zf38SskGW6AaLaLb5dzqmRMM3y27XyEFMCwcKaVKy/73+x7PLWtSZDhkJdC3bFe
	nCSYtp7tfH9FPayQKaZl8Tt91uzYhsueSwRV1XXMXGft3s8snwmsLSElHlMxDd+kWodQRt3LdoN
	0i5MotP5u92/WMse0E6dIUa7ptWwcTJoMffZesL2LQ7+j6xJrzjD5sfYOTj6oahYigPfqESTCXN
	p43gUGUJ8GVvNdbxU+dj+VRVG/r/IjV5ajQdFx0AVyaxl0sc7+SVQu1KdMCXUtIh577Oc5oXx+T
	nZA==
X-Received: by 2002:a17:907:c16:b0:c1f:bda0:a771 with SMTP id
 a640c23a62f3a-c242e22d850mr188578366b.13.1787131272600; Wed, 19 Aug 2026
 02:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
In-Reply-To: <20260721095233.420823-5-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Aug 2026 12:20:59 +0300
X-Gm-Features: AcwNN1VQ1pRWSA2IPSzjj2VjuH6jUfN6i7gcHLhHAkq5FyaNBjl025TKLUB959w
Message-ID: <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Only Dock keyboard input events are tracked for AltGr pressing.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++++
>  3 files changed, 321 insertions(+)
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left.

Thank you!
