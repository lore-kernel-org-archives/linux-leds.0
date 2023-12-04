Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eWptWnQz"
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2190EF0
	for <linux-leds@vger.kernel.org>; Mon,  4 Dec 2023 02:22:11 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5d747dbf81eso14419147b3.1
        for <linux-leds@vger.kernel.org>; Mon, 04 Dec 2023 02:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701685330; x=1702290130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mahZtkS/gCbwZbbW4tf4Fa5yjcsZKFB4HtxafJ1SOiM=;
        b=eWptWnQzEUl4PQ9GsX0+PPIBLZc/LX32YctrmMGUexdku4+/uFdFJXejCrmntRvan3
         uucXoQ0ijcqMlrP91AMr86MeDqbpvV48jyOemRY5svIH+DlJwO20mUAdOGFdApuD49sQ
         PZRzzmO3qJXczJEgYlnvV6uYMPCkTdi25dSjIx74myIZ0qB/bx3ZwDGoLRojJ4F/W9tl
         Me8aC59FdFtxdHJnFYFKmBDu33BtKN6yCZT8LfrPWV94sVXbyl+dIJ2yV6eAeaogdUC0
         Ymc4IfFjtAKF9U/wx0GI/ank0DjH4nWMSsSPw8pgCnzned2oMQTtoKMpm9yLsuSpwQLP
         2o6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701685330; x=1702290130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mahZtkS/gCbwZbbW4tf4Fa5yjcsZKFB4HtxafJ1SOiM=;
        b=Aso0WUMyZxmRwUMksxyUJ+ApsKMk0r/i667sQrcoNCMW2tJSdopOr2uL4MnJiSKgto
         cUAdOQX80gab2xDceQynK+Jj8CGWgEc9GY8UxTdUE1MMZ94rylf1J0O7mu9PE9VLJ6ZX
         T7ZeqIO7T4Z3wfwq4SWWYLwtqZ2gfNGogjyLVy5DyPDuRPcym/rtWb4MZtsRz6ES9tm7
         380C16YrAvFU64OiIJVmpygynNG/oRJvXn52GHrTNaWDlZumI+uShTASxFw+Sr4JD3Z+
         d13U2h4HEyT5znOipsm6T1O2x3KOYLuD+xskLnApHK5mBM+JA4nSki5JMLR8uIgvusyt
         su9g==
X-Gm-Message-State: AOJu0YzvmOTiIpNpUBAQqdl6Ngx5CCLLhkgDDn7yKSoM2elywaXNdAeQ
	31bQZt+ntNkbEUawHFPZkEQ6LEpiuxFoOOlh/+w/ZXDRoTCdPMy8
X-Google-Smtp-Source: AGHT+IEym7AkTd7XMaD332ZBo+efXwbYlEfd2aEjHbC0gqxXVfcGrk0TTLEx+YN3KaGT7DQCvY1tIUWgB9cSFUHY4gc=
X-Received: by 2002:a0d:cb43:0:b0:5d8:5545:2ca with SMTP id
 n64-20020a0dcb43000000b005d8554502camr1047184ywd.8.1701685330347; Mon, 04 Dec
 2023 02:22:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202183636.7055-1-wahrenst@gmx.net>
In-Reply-To: <20231202183636.7055-1-wahrenst@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Dec 2023 11:21:59 +0100
Message-ID: <CACRpkdYBsYow-+ty0iSUEvfP3CUDRobcvUXWeuLs2chvjgdkgg@mail.gmail.com>
Subject: Re: [PATCH V3] leds: gpio: Add kernel log if devm_fwnode_gpiod_get fails
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 2, 2023 at 7:37=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wro=
te:

> In case leds-gpio fails to get at least one of possibly many GPIOs
> from the DT (e.g. the GPIO is already requested) neither gpiolib nor
> the driver does provide any helpful error log:
>
>     leds-gpio: probe of leds failed with error -16
>
> As the driver knows better how to handle errors with such mandatory
> GPIOs, let's implement an error log which points to the affected
> GPIO.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
