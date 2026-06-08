Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2BE3B14A2
	for <linux-leds@vger.kernel.org>; Mon,  8 Jun 2026 22:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956237; cv=none; b=AnkKxk1tiTevOsOEfENCSmFBxJrzBfIXWqr3OIdIsV+XO2e4Nxgft3ICvHDMzUfMZlnVHQ3FuLx4srAncv4AGbkU/Z/33gLyIKIOkvLl1TXhBS6sRcs9hpd6Zto9hZr4oDHu9AjmzDYe5e3ms/aRdsu0M5PGwX9NJcVy8Bwg4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956237; c=relaxed/simple;
	bh=cEEsVG560z/n8AQ7XRIDrWf46jHSXN7lQT2SF1BMXG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZJCIULd/Af/HJvahYtllR93f9if53yLg4LhZ2NIa5rI6t74FcanHtshQtaGKE+aB+IFY/I7mw85axPSgEh6SDAv0OMiibwXeTZbwX+M7kQyY3uHtOZ3CcYfAUQYyRKK/LzepVOKROsmpYEVXk0mFfs4aGsbuYCck3q0BfuCw8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA15y1NJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CA15y1NJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 140F71F0089E
	for <linux-leds@vger.kernel.org>; Mon,  8 Jun 2026 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956236;
	bh=Aij36kGKLQgOKTKFOm0ZH4SZ9YXAanS6oRbQ1zStX6Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CA15y1NJElmg80HYv5sLM/kfa2jCdjk+qTyxpdOme8OofQZk+zipxPEdBIIInb/ke
	 DVur/hT3xjxpA9aK2+/jI2emXiTgUU0esjLW0xkEhufnGnLEhkgDD5MmVDa2tYACuD
	 lPfjr796FmKbOgwArLNtt/L/o3fhBWHA7A/teDhKLQ4n0RlPbbm/aySxJuA6cLmBsO
	 rQlM9HqoSQ3R+6ZlRZVXXL4Cq8w+a1TflL09poUsMsi8/xecxlvq1t1jA8hOsaG5QA
	 4KT4WynYGyBn4o+8rPXJ4NFJFjZdA5K6REgY0ahGLL9vbCFu39Pbd0XGTDK0xyYVfh
	 Wcag2S1XXVYxg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aa7a7ad4d3so3915841e87.1
        for <linux-leds@vger.kernel.org>; Mon, 08 Jun 2026 15:03:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+X0kc/w8DCBrs4n6N/fGtFwOXIFoHTf9/Qu9ayvkmyF3V01+5WZ6EdE+C2sDtSDse881XZGpHyLca3@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGgqpnkukFK1cAIv01SprrGe+/wTZt8RZqydykSmQ6sNq10Nz
	nXVf7fZE3RriKFPfY9RqCq0EJ1phD2J4RSu87S1I+7dACbl2uWfCp1WDvZyJ8F5MgxrIw05tF7j
	Pyus+7HMoN90ZgvJLwD5aFiAtpKnyLx0=
X-Received: by 2002:a05:6512:1153:b0:5aa:61ef:2bd8 with SMTP id
 2adb3069b0e04-5aa87b406e4mr6283189e87.4.1780956234723; Mon, 08 Jun 2026
 15:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525144629.498630-1-jerrysteve1101@gmail.com> <20260525144629.498630-3-jerrysteve1101@gmail.com>
In-Reply-To: <20260525144629.498630-3-jerrysteve1101@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:03:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLkyvwnrmBQ+YFo+UDvuMpMM+Z4fXyVOFXUvSNrnrCEsQw@mail.gmail.com>
X-Gm-Features: AVVi8CfrtViog8K60lVsdBejVduUSaoCk-bta_dOARz0lgQKhvxczOmqxd4dt3E
Message-ID: <CAD++jLkyvwnrmBQ+YFo+UDvuMpMM+Z4fXyVOFXUvSNrnrCEsQw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] leds: is31fl319x: Fix shutdown GPIO initial state
 and remove redundant startup pulse
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Heiko Stuebner <heiko@sntech.de>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jun,

thanks for your patch!

On Mon, May 25, 2026 at 4:47=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:

> -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_HIGH);
> +       /* Driving this GPIO line low (in fact high) takes the chip out o=
f shutdown,
> +        * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the d=
evice tree).
> +        */
> +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
GPIOD_OUT_LOW);

This is fine but only if you also add a quirk to
drivers/gpio/gpiolib-of.c in of_gpio_try_fixup_polarity()
that will enforce the GPIOD_OUT_LOW property on the line.
Follow the examples.

This solves the API breakage.

It should probably be part of the same patch for bisectability.

Yours,
Linus Walleij
