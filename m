Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23466416CE8
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 14:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102083; cv=pass; b=ecShjyECP+2YsS9ZcMtISQDaMlSp7jm8GT6K3G7XVFB36xLBPdfQ5XvteQ+6ED2sy7E1BWZUo6Eopm8vnZ9X62zjHz+bOW4WKDc8ooH/GLg3KLfJ6vKfMLtvhM7bzvctr6hztITT5dzIDBxuUBL6hxHoqBNIQdGnb4S8MrzdxPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102083; c=relaxed/simple;
	bh=eHGHo1CpzP+Lhry2jDKXXEgAfPF4V1nf1rNJycM0IZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkxN5NS8avpbr4OB7k/SYA8GHyQ4NNwW26IUvLv4qd9GRyvzpd3896RDLGSr+KT0XfoQAW3JzgTf/PQ6ErKm59wpR8Pruld0Jj+IP3IkYMw/sS8fV+m8aeF315a128eLM7VMOsk+kMpHle+pvtFMvO5K+Bsg8MKeTg+ZAdLwRB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEDQcYYX; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEDQcYYX"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304c520fe9aso2192235eec.0
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 07:34:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102077; cv=none;
        d=google.com; s=arc-20240605;
        b=HWrRqN5x2Ip5uRby7C5pUzEsbKotPhJ3KBa9DA8eivHDylLURItigrzvp3OYw50okh
         PtctjEbnwaLAqlLP7mzx+PA7ZIk/s1pPEmpFPTFt2r9iwillfurSHnqMIV0JxBHkbpEu
         HRGSikbwo5as/0CfXMARySc/KKZc4wuRHNAvL0k+6V00lQgewEpZauXcIBNgFTwJwm/8
         J+SGvXtqd8BY92O0q45HUa/PkXzoLG0UZogTzygCOFGBgifwIjQS/OqQNhFU5L9+51xo
         AqMLtbQgB38reRr5Ppq4t+aYSMrNrGWYSSlO1xqgY68VPVDDXnMsPJUsDNbQFVnQ+Wfh
         b54Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4QsNr9+C2sksb8f9hiRst13xYKm9uscJWoJD0+yoDM=;
        fh=MkOqSlOjJtGItoXp6X9t3J3aOOmQhX8dJIDWQKYr6Ms=;
        b=RynqpqnOOFCaXzSCIhkdyenZPVgn3mfECuXzPR1SGx6zoGyvpar5mbIpD0KNzMiKmV
         DxCreZBGBIMov6Y8aFxoAB6OMke9k+x20VyTwQ3D9EyjQeIM77AE+m7TWJfwHM23SSC6
         omLcKPXkiSen8EH7bRAfvCoRD5ms3liWqf1VhejMbQLldHl+jFwbUu1cYDGVEA3aWc0B
         KiqQvv/tBGbo+ZZP2lO/JJgUA7BmpWTkkxm5JTKVvTagGHfbHb6WpXCnDw6xYZ4j8NpB
         r35HNvLKW7zrqe72G9BoYLJ3evFeRRPWHpNr/GgMyZO3xuz7v2myAyJlAY9p1QNvCwjD
         gOCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102077; x=1781706877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4QsNr9+C2sksb8f9hiRst13xYKm9uscJWoJD0+yoDM=;
        b=GEDQcYYXmyqDTIeTwRUeJGjkgrgVo4QvCPnJpFto2PCMedbmf6U86eQL8mQzXpK7KB
         VIcIsjPFjnPZtqjm+frmahsCAFcV/Tpc/oitHdYuiF0Ffi+0cRZmuqrXDUcf+G6s9TGC
         /bzSIVTtAwpbDrFirH3japNOGBYg3M1htuK759cGRP60+yjTFW5fLes48bA0LLAa+XcY
         4kzfilYX1T+jE4SR2K1U8f2SUC6TvKPwYZBok08tpVVWloEVr2vFsnhxHQ40EbNbde1m
         atKqXT/ycgTAmLOV5EyI56oWW2pd/Ulhw2vv2HgWj1rkJdpLctB+8zAWCHnjTUXQUrzg
         0Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102077; x=1781706877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y4QsNr9+C2sksb8f9hiRst13xYKm9uscJWoJD0+yoDM=;
        b=GDksOpvpRsYVWDtAm/c6KxLDfQzzP9MSD4S83M/4VLz9JAx+i87JTtGy39rQxhj9hT
         1ww+ZFf6U4e6JH+uXzXXdSkDLh5GwnIC6YozzZrFDqLc5LAJwWEoe23qh/yiZbU6GMOn
         kDAw2k8oZiZgbAm5UzZdzo9PCScqq33frjGCnAkdOi/5fMQd4uEkB+Ew0IQQP0MlpS6i
         uEHhAVNFjkytJb+Q39QjQm2evYEjKo2kZNkpvUMUUXEjfywuZ0tfe+UFh6PVlOwTQ/9w
         Y8NzX96sSmeGSi4h9dmQLLhq16p6gHDtfGPkc+3HXR1Y1UqexsPZ3QtB0Z159URGpU/Q
         Q7Pw==
X-Forwarded-Encrypted: i=1; AFNElJ/M87XyHziib3kTXZVP/BNdZKn/MhhYUnhhRHVbO+68970P+lUokJpsQ9NTMY1H9+aHlNSCV4B5ixP2@vger.kernel.org
X-Gm-Message-State: AOJu0YxX7fRGcQosyLR0l8bXNiquSnDe02a/VuEzEpeMKIECbm0i4agc
	DHeW894S8Yh0UKQXZ3Se1UAQveou6QZlwDSM1SyZpi85cajeocj7Fw3f50AqfwDl6M9Y2iS0vfZ
	DHDg9kADtjOoJzspi9oK3JKY5iirGjvk=
X-Gm-Gg: Acq92OF0YsSnsrajTumuVHyo0oJHv7kU0mU/h5IAmq2ePsG5GcGc2T0yajpZ6+RR/hK
	RVDDHA/9gMzm3QN8FNoYCdeYCl6mC+EwuqTwzmdDY8RZYMQgmhSA/uLhgKjc2U+XPp0+aq/FdEx
	tvU9MWh7ydfCWf5DyPDtCeAOF1PhQPP6rK13IT3V2ZpZbOrXu9gCJLFcHx8XX1wOuNllnARrqRH
	i++mvifXU2kEJNGXGCGWXzhdDgEwy5QC83AhrId9mjggRq4V6oHM/KfuTmuOmhbw8vpMU7i8Isw
	PckIW5vvwvdsblGyZJU=
X-Received: by 2002:a05:7300:4311:b0:304:d32e:65f5 with SMTP id
 5a478bee46e88-3077b7d84c8mr15465647eec.26.1781102076873; Wed, 10 Jun 2026
 07:34:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-5-clamor95@gmail.com>
 <aihkNekrgfu6-6Q_@ashevche-desk.local>
In-Reply-To: <aihkNekrgfu6-6Q_@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:34:25 +0300
X-Gm-Features: AVVi8CdXjWV2Xn6oo1ydHrhUl2T2tO1QvChE8BglKpS9ooBB10CdbUEM-do5fqk
Message-ID: <CAPVz0n2WG=35W7Z8USDck+xQ4sQSxkfhJR9oeYGe_vBkkXGKFg@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] mfd: lm3533: Pass only regmap and light sensor
 presence to child devices
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:06=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:28AM +0300, Svyatoslav Ryhel wrote:
> > Instead of passing the entire lm3533 core data structure, only pass the
> > regmap and the light sensor presence flag to child devices.
>
> ...
>
> >  struct lm3533_als {
> > -     struct lm3533 *lm3533;
> > +     struct regmap *regmap;
> >       struct platform_device *pdev;
>
> And this pdev is probably not needed. But I haven't checked the whole lot=
 of
> the patches yet.
>

It is needed since it holds childs pdev (dev would be better, but not
in this patchset), you cannot get childs dev from regmap since regmap
holds cores dev.

> >       unsigned long flags;
>
> ...
>
> >  struct lm3533_ctrlbank {
> > -     struct lm3533 *lm3533;
> > +     struct regmap *regmap;
> >       struct device *dev;
>
> Ditto.
>

Same here, dev holds either LEDs dev or backlight dev.

> >       int id;
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
