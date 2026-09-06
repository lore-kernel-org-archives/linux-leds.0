Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DAA223DC6
	for <linux-leds@vger.kernel.org>; Sun,  6 Sep 2026 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715357; cv=pass; b=ulZ0Vf+FDwMkj/tV9ASKpoJIerPfth3TdXs+nrxnhZYwRGA3dTt5a2zQ0UEiS6Dm8QdscEp2nHS+4FVR1eVkdmnlXMhnvJ+VgNAD+JeH2g2QszqPaU5l6RmGriYEb0NwucddUpmgFZILt+N6LvmIQVz4FlOiom9SfKxkCGbyqxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715357; c=relaxed/simple;
	bh=xlfHTmswkSpLXO/4f4jYBhuVejOLiGyJyM/ej83cLuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYHk0WogGvf32QVUyGP/FHdzhh9NiuZCXc/TP7SjsyTSUm2GepXqb9+4NwS+SN745GiGRnXr89FN8KRPWiyXuDLkZj2NJnJmFsGuey7DvLwm3vaBoJJGZfqHvnq9wNBtTjdA8CBOj6T8aq7r8E1aABgT18dyFJS7wrziWTxmwtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTvN/LN1; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTvN/LN1"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2906651a12.0
        for <linux-leds@vger.kernel.org>; Sun, 06 Sep 2026 10:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715355; cv=none;
        d=google.com; s=arc-20260327;
        b=hGokA3ByKsCxCqF36H/CPcfSWfWVlQeLUnft33LsiThrpKaMIJ0qMOAe7EMIDNG9VO
         X8rLLSrxE7sCvjL+wWMCKnVFGg0bXkCu+auJYGiXuKw+kTFAcQE/0pYl2TMLUdMod2tP
         x2boF1QttuuEff/+nCfXkRHFWzRFJ32jGa4Cw6kdin72JE1wzo4tKotN9wBRTxt2owNH
         5lBxydLMmg9xrOXSLrgyqf6NBEOXSzaLjRX4HvndDQ/oyqxArTfrjUQ+1gFx3RevS2pO
         3bosqxZM7i5AbvmLEVSSWsX8kaLa2+rah1mxW+MsaBty1bXeSWHjkeHuD56XLdDo8jD8
         nRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        fh=811V7LCJ7N9yBG+6fR6/LQVhsGezD3Li0mvB5URPP9A=;
        b=QSGg8HIlpvaafr47UX9J6KLyo5ylBnyi8jQhCtgIsw8SsM0BMc5TkTmC9I7EgC0hXF
         R2MAFyAxeJwTq6u+p9NOLsibrElSowOBpAngrcdGJmHoAFM292l9uSH+AGElXMS7Ikuz
         bwYQL5bYBVvDRHEEw+4Ljqc04jCbLhi8PqNcP1kN6Fp1Tb4iiOY0gJLXlM8CjvvBfkB3
         Oy4Bn4yMKlvw2vAc6P0ABRy/bhZcJaiX4ZDCRSyAJ7tqvqGMEgtLmiPHejTdsOKoJXBh
         bNax5+qAUdynOPYeVxjSMwW1FPl72Lhy5ZMNx5hAK+TORPsQFbWO5nSSk2Pu3Ddgdc/D
         NdGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715355; x=1789320155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        b=DTvN/LN1EdaERFqCd/Pf18xk3C2W9zOejXGnr4Zon7F3zor5rZQ344+GQ1BawH8Yia
         oxrLD6jEEaJ3VX4H9A0LkI7AjDZUBT/QzS5oBGB1SLqzR9dFcpoQQwfqMFrTwPEZaB1P
         0m3rvOHTFdLh9lLU4yfbJxyweFX42h5JIcRnl9ozmPY9sAFcxuGYjAFBsARs2CATPDls
         EhZJEkWhdvjriIJ3fwyBDu21MkwGTZDYmGjDktjCV4tKkevbckt6Pii2RruUjekLWGsV
         lYM1DxyvWC7EKZK+Cm7hvHm3hx8cVCRAWMfHElaWUrYSGogaVhj9sxCmEemyKJdrhxYS
         hjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715355; x=1789320155;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+vIa+Qy5L/8ukG4yH01NZv4BrUlQHr2FP5xxn3kwXw=;
        b=iUOxCY63rZQK8eHczp8abSYLFPiRuT91YviRZJGRofsrw2wLw6OtkAwlWpIvaiHk2w
         dYcNJWZF62fBbwpGLt9pLw7QPNztQPmu9Nivk2KAkPFBPGfS2ptsQpinbbMmkfcgm5WI
         RszQkm6U+bl84bZDfS/J1kM+t4X+fmwjpJIFqkq9Opfm6Sm+kofc14ukV1mMvfeosFXi
         lXUNHkjgdIGl5N74RFeMXjgtzIMClWO3Td4Gbtw60sqmD4kvQxlViLmKbcJF9vzqD9nA
         autXK6JXcy8e3ur8AUf6FLNHGrTDPaySmrQwCyja4jWw+ZMGDATTdU34CLoomcrq+SDP
         8uxg==
X-Forwarded-Encrypted: i=1; AKwUvBx5UXWdkz1sf15Ib3qvLnAAUi9TXRnksQktOyjLF70A3/M9L6/YPiF/qxQ7ZXZ3RaQbHXrW+XLVxZzL@vger.kernel.org
X-Gm-Message-State: AFuF++nV94ggUW3LguKc4AscXVsoDZ28s6kAWife6xnrUDSFRXIWWM57
	8S9MAPvCkREgOZ7TOaXNlwTxGHyOl6jJpyvEz4DPPCfJRUPCRhYV7p2PIKVkOdujzl1sJ6yzK5q
	K7LGXNOEfqC0tAU7Xc3rR249pE/YGOVo=
X-Gm-Gg: AYBFou2u89KKHJD/WZLVL4DbhX5CYULjvDCeghKyc6nubbgASzDKY0lujvwDJl9iu5R
	TdeP0ntggeLK/T0CmuKkBNqf56ad4x5q1gMbJf4ZiejfgzUnxgpQ72i1prD8yhrnwxIl7q1ym3n
	WYd2cW0Y7AGwjxiiyB53cLPOWSu4f9ys9+cd3CxVa2nko7dyp9TdKTv+Ho2D9gBSoLn4MO1v5ui
	/I5eHYLfetPPgA0KfyM1kvdDk1zdIZsU8Kxw7piQzcAgQT4hBPoOoK/3HLjMe0oyzEEuUPUHkZ/
	Zdk5Rp0w63OQ8JmgTL/g53tGW87YPQvwykHeWq3S8lTZcS5OrIb8UsZqxOMbRmaZzK5Azsa8gTm
	iPA==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae50:97c6 with SMTP id
 adf61e73a8af0-3da3a154de6mr29258954637.19.1788715355297; Sun, 06 Sep 2026
 10:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
 <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
In-Reply-To: <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Sep 2026 20:22:23 +0300
X-Gm-Features: AcwNN1XDTtBNxGlzLOpLQ3w1y2Et6HgHVsvlBacLuEsWHZNblAyHEWGt7R_cBqA
Message-ID: <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 19 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:2=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 Sv=
yatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add support for multimedia top button row of ASUS Transformer's Mobile
> > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > default which suits average Linux use better and with pressing
> > ScreenLock + AltGr function keys layout is switched to multimedia keys.
> > Only Dock keyboard input events are tracked for AltGr pressing.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/input/keyboard/Kconfig                |  10 +
> >  drivers/input/keyboard/Makefile               |   1 +
> >  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++++
> >  3 files changed, 321 insertions(+)
> >  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
> >
>
> Hello Dmitry!
>
> May you please take a look? ATM only ACK on input patches left.
>
> Thank you!

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left. I
would like this patch set to move forward.

Thank you!
