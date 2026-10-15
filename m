Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461DE433AD
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089707; cv=pass; b=QebXgHhgh2h6holJ/pSc7vNRrXpZ2klAu1kZ5YjSzlDIqIvafHN5HvbOSWre4gs2CWnfB6qY2rhFmsjlswJcCsSL+MlCR+ukK+MPQ5fESL37YwvpvzFIgtNBaHk6V/H73NY2Bvxyw/kf5HUn4XSRpF2ugf2TPhfbfTnjS8NLIRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089707; c=relaxed/simple;
	bh=xauoRU92rayWXBiUnhY4lqEI/RzVYWTkJ5X0x3hjblE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQW1gZbISfsF+zlNuqZec9P57ZpOdUSIoJRA7SbmHsK2Z/z3SIKkzh8UP0P5bxBAlDo/4yn8oRlpilNGUUR6H1O/P6Vcc3eZcotm4HPcnDjU8Q8zKVEF2pFv/K5ljrcPxqwJOuhutzK2He3/Ic/YdfWWq/G/O1q/I0HhhLfRdj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+x9goKG; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+x9goKG"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6913582eec.1
        for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792089704; cv=none;
        d=google.com; s=arc-20260327;
        b=LNf1mBis152xGf04SZgoTiC+S9ILEQ+rDUDAnl3WLoadBej43EASIZnTVbOZHLHr7J
         IwgMvCVVkeHnkn0QNVBAgI8DhL83wDwh+/TPLdL/gLd6sUYEtyDyNN/d3P/9g40xru3L
         orby933+3ux2JQS2Oz+oRj1zNSX6a1h/MEm0Qw7kZ1PTfBh8SFGvcLSsjLaOmSI8wyHT
         9iVLjuujPqIGPeBL6ijsBdVtADJ/JjrwYTBhlsK1Vd0Q3XJIV8dxaoJDM+IRi83WPj2M
         IfaBUU5kLZz6B4FP+w/Uh2ecYdGoaVYGfMNH+mSvosrNAkq4Uf40jTpCumeSRMFW1ASe
         MK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        fh=b+z5mEzf1TFsUxomcR99m4Uy7VqtxHOtfi3Vu+PEPpY=;
        b=Noa6Ur4uf+gY9qhtTJrNij8wzReEUQQGiQW54pypNrZudW8H7NTdS3Jw2YPcBsVN3P
         4ybnxgVyCP2DTnmCde1Lxz16s//o0JdDhu9Pdf72b99/5C2RU54grbSDGZ5nhFTYcZZR
         WPbUBJUYj7odC4NKIQqX9M7ZYmDJ5Cafy84nBhl4B+k4K/JmPf4jT4NW0LbUtvPw/PHR
         mfa7elh680kBNzH5DhhXh1rZmR75/E+VF7e23XEqEBkn+bWPHj71AtAoEToS+rOBhVaI
         3meeGWZZoxPxRHO01TrYM429n6/2FP0V+QURXw/onwGaKME4j5yk2sA3qx6cdKs8PB8a
         rNbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792089704; x=1792694504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=D+x9goKGpfvnl9hCynIoU/Y+0NFqZ7WirIuX6nMhBfHcDA2HUKIJVwq665QzT/6/Ap
         A/+Lm1PdYvR37sHqfiRmmbNUORvFIIqxOzbKh1NPcc9zHysO1RKfLlxwVDQoPLblq2BS
         oYRsCOP/iKDu9u7N4MRx1K2zgUKTkrr7oj0dHgtC76Dp+qycvi7ewwrGSe6r7RAsgwh4
         x15HDivoawBFaFdgcmvz5+L5fOTcV6n6Rxuq+wPN+O7o+0UuIiw5PyKLfWrUtlb0G9O8
         wIyrudOcUFKeZNt1XX0/P4qWEJm4QmV1xnN0lPQVDNi56AwZamHh+5OL5h8eaUxEhO/K
         EytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089704; x=1792694504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=vx9D/M6UgIi694g0w0yBQTaeIi6PjrXmh4VNRAvS33YzEQyQk2gS+nUOTOdOpntwTr
         RdFi3TxJfz+kKJQxsoWl43JBBhgl7JQRErhUVlRIRjtoY6tXRvOb4nMUAR2XrCyp9geb
         9zipPlAx3SZQ6sSUJFf5CQJ7DLM6ygm3J6/7t810jFHt5yc5xJYW//juXhwLurE4skNp
         G4hWQwU6UqmmjddbOzRmhcRJ2G/nhpKzHKZ/gIxBPeTRMkd5BlTYZ0oQOe+ULEWF1IVB
         HHtlyaIEPBj1JN9hiYbt7mUjcMrdHCVnk6IPH3SQh/WVix93rMymJhxvr/UjipCBRgN2
         dAIg==
X-Forwarded-Encrypted: i=1; AKwUvBwtRKCPYdkf4P9uc0XHR7573P15XrCr8iEwB+bag/6pFV7BAZ3g9HTMFfwd0i/gm3jjOTMjDwo4ZAvw@vger.kernel.org
X-Gm-Message-State: AFq9FYIn7Wey7mSyLks+fox/27qocrXd+cxqdulnvMLNmYZ8ZquV6kbW
	5WPoqtdRK7vHIgEkMZJqy6I/4meZQRF2X9VKv6immB6XLB4gvDVPdjWTVIpvQNM6C5nUcJsLQUJ
	c22UEPTvd4w/s6F73ikdCboDb9DLFF+I=
X-Gm-Gg: AYBFou3o44GJ98CqUTQfKGZpCtCqkLoT7K4JF+hGhN4WIgWTrX/CHDlQvDcLaBhM0Z3
	0kPfJdSR05vWuerjLGwNE50Gei4cPp5gcxuNysSvcVLBWgq65KYzGvKqNkr+4xGg6ATbyVC3PRe
	bR88CorO7xicmalARVT4vKtgxPkB6PGSYEetaafifPTyliquZG5pjI0vCmxIciaSy7U9tdJpQn7
	e1UextPqDLjiOjKHnBYdr9HtvK8Pq8x7Ra70BEudgJqFg+CkMxWrNjhG52esyUTjqRdcRSmFjt9
	u4p/ZVGQ+t1tp8qDZTue7HSKstiES8cXLR9rzibEvZuSbyBCkvixPneCuKGl+tLzjCZuaExHSTR
	QEnMOZO/jCbYO
X-Received: by 2002:a05:693c:2a12:b0:35d:2c2b:215a with SMTP id
 5a478bee46e88-35d2c2b2220mr10102451eec.35.1792089703889; Thu, 15 Oct 2026
 11:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013173504.451391-7-clamor95@gmail.com> <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
In-Reply-To: <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 21:41:31 +0300
X-Gm-Features: AclHuK-9dwgzuV_rOZ05ZsN-0-b2YgDg6QoraK02oNxRoGvJeYL0q4NRa-SbCE4
Message-ID: <CAPVz0n2ubBgOGO5q4ZBYkw-eDSuNh-MpdBk7uoWW69m2QduSgQ@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	linux-pm@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Krischer <florian.krischer@fkr.dev>, Ion Agorria <ion@agorria.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
6 Markus Elfring <Markus.Elfring@web.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =E2=80=A6
> > +++ b/drivers/power/supply/asus-transformer-ec-battery.c
> > @@ -0,0 +1,289 @@
> =E2=80=A6
> > +static const unsigned int asus_ec_battery_prop_offs[] =3D {
> > +     [POWER_SUPPLY_PROP_STATUS] =3D 1,
> =E2=80=A6
> > +};
> > +
> > +static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv=
,
> > +                                  enum power_supply_property psp)
> > +{
> > +     int ret, offs;
> =E2=80=A6
>
> The referenced array provides unsigned integers.
> Would you like to specify a more appropriate data type for the correspond=
ing variable?
>

This is a nitpick, it does not affect anything.

> Regards,
> Markus
