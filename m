Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3972FDC5E
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985807; cv=pass; b=ELn9sb2E7hheQtcqmJUNvssmDCOr++kNvydbj6IgqJnD/8vVUTvx5XK4Ilb5QTzxsRkUrwRSYMTz4b/wUNTpuizdLTmnqfcyLheUl+Bi/mC1InpKXg57+m9IzL1j0zIe88fBnYY4ZYDAguP59BZtTFoxUTiFpEm/vr7nl/DPhHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985807; c=relaxed/simple;
	bh=iyfAphcrJGor91FmD7IGYNutyAxV9/ncvttL25PE830=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7ixAMCrfpY+SDbUaSBmEoNCjWEV4pLr0yLDblIVOFqzr/l68mZCiEWN2s9ElMxyZVMDyIM8wKdyWHTzNdPXj4V4ADwDe7ci1SmHjsbP/B0HKGHhcJfYlHVJz96Gi1XUKoVn7TZSmaQNVvh7YgHaOTRhzSBXt3rH6LMFK3i/DGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwr4tQOP; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwr4tQOP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1241467a12.0
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 06:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784985805; cv=none;
        d=google.com; s=arc-20260327;
        b=CxcBy/AdRRd0nQVO1hoKGaMGyHwW2JlIiRc1wMHIERea+PBZJ673zWuvT8olBEdo8U
         +1GWSRSKNwvzmGrH+boTx6I4Uggw9JXWoDiQUqFpGUilh36SrjtyusUW5Qt+aFIeqDq8
         i0dXAkKsGljnKKZZgJFv6nTXCtAMCGlZd/exZ/4oRA/ogTtuU7hZU7eNHYITuL6x5Tle
         6V1EV1vpojmcKfGtzxtVS+wS4BTTXftiUVaLEcy1T7TiCze4y9nbdt31N9anwHBXfGt2
         fHkC2ijVH+23UitC31IxFHKF5aRRZqjgbFJxpVSmfq/I/YhxOD8xAMyftsQvAsWWikcw
         j5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dw44hJDz7rSvpH5qvEi2DXJBQouyq2n4xZUL150B+WY=;
        fh=GXFmQATwu6zOQvx2SlK+zKh2jtXl55Hcr38WxwNOzRU=;
        b=GE/7ryoNQO/RBd8ZOl6v+8p8v5dlmTVEis4F9GVMFBBOsrWIad4umBye83KtQRjxBA
         m/71kHy5m1zbuFXIk9hMB08+bJFTEr9JJKbgfJQLlRVWBMtX1lPNcI9LieXIMPXUu6Ac
         U5OwzqCUiduMCXVEV1JbZGi1J7ddxrk7nU68PXCWaX+XcmC6Er4UgfJqvX6MzEv5iuZd
         K70dzcxEIR+cY4iIRDS8jQnClUQrr1u5nO6UCHJcQrk8CqzHr6Z/5G921d07+KnGnvuV
         uUQsOFfdIWAswIXXJRp3j2/R1o7Uh7t6vWdy1/1kRnefZVI/kip3PSx3N2GPkdtRpBmN
         8sQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784985805; x=1785590605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dw44hJDz7rSvpH5qvEi2DXJBQouyq2n4xZUL150B+WY=;
        b=rwr4tQOP/NDuSVNy6MSTjghqfhqv/9wiglejRt1ULV6Th9ZpXSsgm5REam0H9lKkzk
         o896/WR/6nNlL7/9jA0Dl7db0LpDOtVkkqJbmMGG5Q0A0dFsSwRlAiOSpOnLQa59vwZQ
         lb/qby2aAFMubawZFbk9pH6OTbCd0xQI+VV+MlfrNEwwdY1foEztzk19SFDoBOaau+qJ
         Jn0Q6WM26eRMQ3YfafZw8yfEJlCgHzxzGgR5GU9ilx4q+RTu0q23b6DyfWS62TSshZQ5
         fD+eQZrNToPFKs2IYJ8/NHhI2AwCIH1QuaYVO5NtVzyqFuWeYNmvSCIB9Wn9qcqau3Kq
         BckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784985805; x=1785590605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dw44hJDz7rSvpH5qvEi2DXJBQouyq2n4xZUL150B+WY=;
        b=hO+ullLghFIdj0pPZCgyq19ink+0iGewiQyliORByu0bikyJeLNZFjFVIT78EhoilI
         tArIZWFXRUDRdB5TAxGPoUDuQZgQVNpCsuCaRneoFDKkH7w9UnrKqr3PsVTTRtTZagMy
         5QN9MSYP2Q2+tAEd2MwciTi4vFQgan0bOdHLe0lsFLSRq2IlvbJS8e/fJE6jXVAknVgv
         WlnenhooZFoukYU5rXDoCGeW93gyChPwA0X9WfjTtZqAop9bgT6PUfRNr28svh3ClNfG
         NgKzr8wXZpDb0oIVOHnqqO5u1duWTt4MFmtBADMNIuLiD1aWgRjKYOSPQJTk+/A19xIq
         vuwA==
X-Forwarded-Encrypted: i=1; AHgh+Rpq/Q9YMNlWJRRngN0Idb3/XEMcvs3LVE2nkGD2nW0HpAx9njw6tbTr7c0EHOxv3yVn2lOu8hjRxRkD@vger.kernel.org
X-Gm-Message-State: AOJu0YwzS6OqnP0Yoeg6vpShNWL8ejk7F84Ta4OViDk3FbKzkm50ZnUo
	k8Pc0AaQvT37m68qLOmi5GdCm7x6NeDo+VW6qqsb1+E9CmiVF0lZrjh7or/byJq4F8LeuX0B0jr
	DhZ31GMIFO6vISnp/6WLZPsr5iHfymSVW4g==
X-Gm-Gg: AR+sD13JfL/4qGvl0vbuyzfej5YmtJLh3o145sO2lShN9fh3KmK/KqHHi/Ckp3qAVLd
	XyQWvgEHrhJbh93StUCoAA1tnLMsX/j8Vupj2JlQsCCTbcayvvVt3Ebhho3uSZeQczAu2FlIauW
	W6V43xENRFgs+B77B3l+qzebPCHcATKSHMMEiv06ziRuZfX5r7gKaLhl1JfXFWm7SHHN5efqBP5
	c0B2Aho4HGmFbmdga8NJA2aO7DHi7UMvmdb/b+1VQHxIK400CtXT0DfIk+bKd6GKIdOKXvKJVVx
	k/3Zl9xW3piPXokCtUk=
X-Received: by 2002:a05:6a20:c5aa:b0:3c0:9c1b:d0b3 with SMTP id
 adf61e73a8af0-3c67e026f9dmr2180177637.62.1784985805156; Sat, 25 Jul 2026
 06:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-3-clamor95@gmail.com>
 <amGx2fJCUB4_XW1M@monoceros>
In-Reply-To: <amGx2fJCUB4_XW1M@monoceros>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 25 Jul 2026 16:23:13 +0300
X-Gm-Features: AUfX_mx8PDd_aHDdNKfdxjyqn_bGAG_YlQFuZHOTbUPdXQnkuKB3mJ4_MrnWIhc
Message-ID: <CAPVz0n2yWtTOgruRc+MAYTZ9=rd6qf6sEnX9v8THvJkN_opvbA@mail.gmail.com>
Subject: Re: [PATCH v10 2/7] mfd: Add driver for ASUS Transformer embedded controller
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Ion Agorria <ion@agorria.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 23 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 09:25 Uwe =
Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hello,
>
> On Tue, Jul 21, 2026 at 12:52:28PM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 dock
> > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > detection and common operations for EC's functions.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Documentation/process/submitting-patches.rst has:
>
>         [...] the ordering of Signed-off-by: tags should reflect the
>         chronological history of the patch insofar as possible [...]
>
> So your S-o-b should be last when you submit a patch.
>
> > +#include <linux/i2c.h>
> > [...]
> > +#include <linux/mod_devicetable.h>
>
> <linux/mod_devicetable.h> will go away soon. Please rely on
> <linux/i2c.h> to provide a definition of struct of_device_id and drop
> the #include of mod_devicetable.h.
>
> > +static const struct of_device_id asus_ec_match[] =3D {
> > +     {
> > +             .compatible =3D "asus,sl101-ec-dock",
> > +             .data =3D &asus_ec_sl101_dock_data
> > +     }, {
> > +             .compatible =3D "asus,tf101-ec-dock",
> > +             .data =3D &asus_ec_tf101_dock_data
> > +     }, {
> > +             .compatible =3D "asus,tf201-ec-pad",
> > +             .data =3D &asus_ec_tf201_pad_data
> > +     }, {
> > +             .compatible =3D "asus,tf600t-ec-pad",
> > +             .data =3D &asus_ec_tf600t_pad_data
> > +     },
> > +     { /* sentinel */ }
> > +};
>
> Trailing comma after the assignments to .data please.
>

Sure, but out of curiosity, why in this case you ask for trailing
comma and if entries are in one line, you don't.

> Best regards
> Uwe
