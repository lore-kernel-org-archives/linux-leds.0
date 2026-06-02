Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8B6392C2A
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 20:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433496; cv=none; b=aWS3FG1Apl0/VLVplNguLmgOcVrLWx/z0rUeef73a4EIQZDROwsgkbYt/9U5ewYhJMhhJZzFstedOW+dgu4y7OPAPs8AvcgsgMyTMHq9FwAouqhnhONMG+OlWk/LLw6bK1sUuAz8TVd8Prv9U3msJVRULw27OZjMpesWUFxeT1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433496; c=relaxed/simple;
	bh=KRGTT4AQ+Oey7inw8PS07TanUxbhPBY4tf+cjHXWYBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHy4OQiSymgDljAggY+dbRGClqAPjNet3nRtuSEKp2Kq20VhfMyWtVaN3VO12uwlOR8bCOb+9DDIhp4+35DeV1mwPVAs/pJQ+a61GIKhdyrTq+9CMgrKJiR6/1mlSyv+SDhGtjN25SLL2dF6ftjziGbcujsOyoMghlFNre9hmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsQo944G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsQo944G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F1F1F008A4
	for <linux-leds@vger.kernel.org>; Tue,  2 Jun 2026 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780433494;
	bh=G6rZ7t6/DhXfpQVj0UlyYqS4gIMH66eg2Oc1gFXbhJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WsQo944GDchg/wLfBxF995MDsIQlWR94qpNUGNWfmtj0cc9Cm6IAvLYK49Jz+sub+
	 cCz9hX3qvk2i7XzqttjMLfpB2FTj81X0WI8T9GOEFst61x7uetTvHoQlZHBhkw3wj+
	 pWEXAl35dtpSL5N9q+XzcWkaBdzolGpamWnG3Ut+8eiWiblT+djxuby3gRu3VBbNTW
	 b5gX5xDdjGnEk3Uf3Rhjs7eEYv4grJDMr3ZOHMMp2kabifDBAot1ZDAITd3RH9n/oV
	 ENGlOonCAxXOF1Zy8Nr8B/0OQsXqHHxsvHFgQOc4sUtBFr0j9jX5I0vS+C7g/hnM3X
	 sTT2vS+XYtAaA==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7ddd3d67084so61135227b3.3
        for <linux-leds@vger.kernel.org>; Tue, 02 Jun 2026 13:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9CDaodXeiDcBhnK3UkHp3Hhky4Tp2YVC2LH4KPuyE2wefsyzbQYPozhgpczwoOX2D6n8qSXoiNDcmU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2B48oEfsfux47NfBjGoFn5VZXZhhzdQtmE4PgAW3Gbp1oVPLg
	WxtLhHs+YxH6iyMUP1uCYqvqdFU2GE3IrkuI8Ftj8Klm4Ly/5IA8EdPue/VIKuLJ9Ybqn3OGALH
	yM7JxfRTEVB5/NjFhluPYciwgIUKTYBY=
X-Received: by 2002:a05:690c:620f:b0:7b3:edc7:9b97 with SMTP id
 00721157ae682-7ea4400dc8fmr7795367b3.0.1780433493990; Tue, 02 Jun 2026
 13:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com> <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 2 Jun 2026 15:50:57 -0500
X-Gmail-Original-Message-ID: <CAOZdJXXetr-FPZUSX_nzS5nZc+bbv5b1m78sCcZzrDJi7C05vw@mail.gmail.com>
X-Gm-Features: AVHnY4IltjGxIj5Fh6-JK6uSKIHTP0yZBU085pIyp8WmlCvLfmlYl2sow6Y3Jn0
Message-ID: <CAOZdJXXetr-FPZUSX_nzS5nZc+bbv5b1m78sCcZzrDJi7C05vw@mail.gmail.com>
Subject: Re: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 3:07=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> @@ -557,7 +549,6 @@ config PINCTRL_ST
>  config PINCTRL_STMFX
>         tristate "STMicroelectronics STMFX GPIO expander pinctrl driver"
>         depends on I2C
> -       depends on OF_GPIO
>         depends on HAS_IOMEM
>         select GENERIC_PINCONF
>         select GPIOLIB_IRQCHIP

This change causes the following warning on builds:

WARNING: unmet direct dependencies detected for MFD_STMFX
Depends on [n]: HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dn]
Selected by [m]:
- PINCTRL_STMFX [=3Dm] && PINCTRL [=3Dy] && I2C [=3Dy] && HAS_IOMEM [=3Dy]

WARNING: unmet direct dependencies detected for MFD_STMFX
Depends on [n]: HAS_IOMEM [=3Dy] && I2C [=3Dy] && OF [=3Dn]
Selected by [m]:
- PINCTRL_STMFX [=3Dm] && PINCTRL [=3Dy] && I2C [=3Dy] && HAS_IOMEM [=3Dy]

I believe the proper fix is to have PINCTRL_STMFX depend on CONFIG_OF,
since this driver actually does depend on CONFIG_OF.  The warning
comes because if CONFIG_OF is disabled, PINCTRL_STMFX can still be
enabled, but in doing so it selects MFD_STMFX which does depend on
CONFIG_OF.

Adding "depends on OF" to "config PINCTRL_STMFX" seems to fix the
problem, but I'm not familiar with this driver so I'm not sure this is
the right fix.  I'll post a patch.
