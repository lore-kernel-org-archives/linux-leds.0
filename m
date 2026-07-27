Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B153E169F
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140558; cv=pass; b=K+F87LBixDcHyhXZOlJIAyVt26r3GoMPNULVXs71UiC/jVrUUoHrJiyKrPqHEuwae1KEnxVKRueX55TRYgky4/BiBHTP+hZ8Rus4yrimzz4uFhykjTNo6lHE+jl6l2cCdocnWaib/oA8fkV89W0zt4mASp2nIB2JEpXqVsy9tJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140558; c=relaxed/simple;
	bh=mw92Hf/dQnuOO4mzXGCnNoSoSNZ4XLCDu5vbV5GvF2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugpKP0s572zWezfrqjGojQuPgyLAQXPJqareufOdRMdlLHjTbqGaL+MkYypyBVjRrO2lTuuxPGrJVps9Ucxym8rct4AY3GMGbbhwKTS0dvO7IfOc4E66CZw6m2upg0CTIadNSraZ8cLoAh9rXsqCqbrD0UD4nu5p4lfH22eDIes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WACiFu7z; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WACiFu7z"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca7c1176317so1722557a12.1
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 01:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140556; cv=none;
        d=google.com; s=arc-20260327;
        b=Leg84nw3NFwEEfAbelPloatRrTQ7Xkqul3Mpzdnu51YccAJXpLJGiga7MeFPjUDj9e
         0/kXn3m5OBFxsK0cNh2VdxjWEqdClmCbOD1lWhwxo9hggXS1oUgxhsdBkGlpU07hZyGF
         0PIP2NkviO8t0600scSPef3JUd5pacxZPCVDVAuCWLOeIvP/btrq0/N1BjYmyB9u+/B8
         up3yur/XLBFii+BerqCAwOnsdhIL1vYT6rlG9N88ogXcKRJjcczGLbhogkOkv0MGYZap
         gCXBamSrY+PbKnPkCEWdNi97FwT3zNOZR2tpzy1v0oqMKYdC9BhDjIH54fJYsZAzlwjK
         hsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jiiyofhSvlGJbOk+zjioYY1U+uBRekjwWzmE0lyF8KY=;
        fh=Jc/uINJtDhSJHQlE8PYHllN6FuK040c973lJ+/uRM8E=;
        b=VF3mVFalI3UrKDS/uc3BSzeaQ9j2zcMfq3Zr9+BtyYLSP81/RXds0ySHnV0d2hZpzA
         bv9j3dwJvheQ5uYWZuhw+KTHrJ9hywHTaNKafZFOmcO823yLcMq6umA0SzM3OxvzTcaT
         VtWpdghzRZxJrhSX2+RLB7aW4HVTTACGWvu0+X2qpJ6QDSoJpDkgJlMSaVpfkaZ6Mnaj
         wC3njRzSVUFViMKAWc5JGMup/AXoCG04PBbas4sc+E76cubH2ZsXF+pn2coNoElg8mcd
         YEUeTa4OmQgpmbW/2kZflbSS0nAjAXVRXcFTCsCq7euK6k5ubfogw35n/lI2CJKR9xpm
         ffsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140556; x=1785745356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jiiyofhSvlGJbOk+zjioYY1U+uBRekjwWzmE0lyF8KY=;
        b=WACiFu7zKLA7BiL2tpISJ0tGgW8Q7+/skiRVtyUHYBi1b43cDK4VZyHLREaMb22n+C
         qCJwpIvJFwIzFatu6RchWr++GLOFdvA6og0DgwtoCQ7TbK00pC/o9wlQRLf2vAHipe9L
         x5NQTLcPenfEXWOVPE/CXXmATcyuxKKLpBrwSlDMnQBZvr+MiSxbN7EFGsowUyn02eUz
         8fAenl2u1hS88bHRfmejE7cVjj58XkT6yLs/xSilKEvTVrbBkK1AUqdX+WPUpsg9+CDF
         WgNWQeMvk8GC7lsJbMiZdXV+KZUEIuTk8Zhfdom+YA44W2fT3A9ip4Y0hTlzBT8IeR5v
         IewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140556; x=1785745356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiiyofhSvlGJbOk+zjioYY1U+uBRekjwWzmE0lyF8KY=;
        b=Xj0dfho68+0yGJ+kAay3M3woQBsAlDHlUbI8tpVXBmuRVcVLCrEddFxBdw9IsQwsEW
         xTj1g6WAy1YGzbO5KdGaglgXg51ca4x4ejMY1g8vcHII0KE7tVszjU8qzA13xNC2hRGc
         97zPeT/lYF2lMR56wzsr6M7c8NnRszZEWJDGzKSCSGNezBOfs6GPGgouuCgU52zCRFGf
         acHe3J83U4YDufxcyg5XbPJAMOk7DDLWHQHzKo7D8qEQePDSNMw+hvUMK//JQ3/Cjcbx
         8EvsN8AakejWIzeP1nX4NY2nFpf1M5mlAACJehH6+L5eD5OcR54AnRXJnr+ICPteWRUv
         M7yw==
X-Forwarded-Encrypted: i=1; AHgh+RoG/aqeG7pZxzj3j8Fx8u+dpq6uOAzluGG8NKHKkjXWV78DQLbMgYzhfgX5Mvu2uXH+kEhXTGaHLapt@vger.kernel.org
X-Gm-Message-State: AOJu0YxmgDcV+3PXQcxHsgma4106RTJtIp3tI8YAOGiXdXzLKHhVQ37D
	CP6u6MgNb2MBYQzeZm7aBT7wndJVN8e80cjBGmDECj4edgOPoZzLwJO6+KVj7mP9gBS0JfB0Znm
	AmlasJp+ShpTwnBH+wJB0xC5MBagqfCc=
X-Gm-Gg: AR+sD12RvhT9l1oD3pbCnokW2b+kwAADIg2x8/Obqpd9z3jNfvZbx7tPIkKG7qlJQHt
	t/6GN2h7TUdp8vxPn16sk0/8EFvd3q6O5ozTxwjNzvh4MFL4v7NUWxgw8x6JmDOvnUNhEhCdUq+
	yu3EU5Z3eCip5/nVb4LOjKn4fbAQxiqD6JCpcQW3UxI18XKajOF8lRA7cVMM6gFzco6k2iOziqQ
	6RQsdHPG7/1e2Yc8LcMcJFz5engLh4dr/5RClMMSYER7e0y1H7T5r7F0FupcKH4t9px9W/Ej+ry
	tefCC6D2PkMhgw/j4Zs=
X-Received: by 2002:a05:6a20:7291:b0:3c3:a9ad:a747 with SMTP id
 adf61e73a8af0-3c67da6cbabmr7867709637.26.1785140555737; Mon, 27 Jul 2026
 01:22:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-7-clamor95@gmail.com>
 <20260722022519.3b1e4fd3@jic23-huawei>
In-Reply-To: <20260722022519.3b1e4fd3@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:22:22 +0300
X-Gm-Features: AUfX_myZ-uH2FsBg2M-NpEbqqEjSB6AkjRrQi_JMKQ0vOPgoMTtIwPKkN8lpkdE
Message-ID: <CAPVz0n2JBNRW3EP+b8Nk1C2MbJnszLiC3hSwEsV7r1ga8obX3g@mail.gmail.com>
Subject: Re: [PATCH v5 06/14] mfd: lm3533-core: Remove redundant pdata helpers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 22 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 04:25 Jona=
than Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 17 Jun 2026 11:00:23 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The lm3533_set_boost_freq() and lm3533_set_boost_ovp() functions are us=
ed
> > only in lm3533_device_setup(), which in turn is only called by
> > lm3533_device_init(). Incorporate their code directly into
> > lm3533_device_init() to simplify driver readability.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> >  static int lm3533_device_init(struct lm3533 *lm3533)
> >  {
> >       struct lm3533_platform_data *pdata =3D dev_get_platdata(lm3533->d=
ev);
> > @@ -437,9 +396,21 @@ static int lm3533_device_init(struct lm3533 *lm353=
3)
> >
> >       lm3533_enable(lm3533);
> >
> > -     ret =3D lm3533_device_setup(lm3533, pdata);
> > -     if (ret)
> > +     ret =3D regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
> > +                              LM3533_BOOST_FREQ_MASK,
> > +                              pdata->boost_freq << LM3533_BOOST_FREQ_S=
HIFT);
>
> As you are touching this maybe get rid of the shifts and have one source
> of info on where the field lies in the register.
>
>                                  FIELD_PREP(LM3533_BOOST_FREQ_MASK, pdata=
->boost_freq));
>

Very decent suggestion, thanks!

> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to set boost frequency\n");
> >               goto err_disable;
> > +     }
> > +
> > +     ret =3D regmap_update_bits(lm3533->regmap, LM3533_REG_BOOST_PWM,
> > +                              LM3533_BOOST_OVP_MASK,
> > +                              pdata->boost_ovp << LM3533_BOOST_OVP_SHI=
FT);
> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to set boost ovp\n");
> > +             goto err_disable;
> > +     }
> >
> >       lm3533_device_als_init(lm3533);
> >       lm3533_device_bl_init(lm3533);
>
