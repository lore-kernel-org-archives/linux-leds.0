Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25C360ECE
	for <linux-leds@vger.kernel.org>; Sun,  6 Sep 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788715654; cv=pass; b=Nfbel6IY6HbCafUaZhf+bcY6ygZAMsD2QE+tLGWbcZkQhRnXGDTmHvbVqrdHgw6/tkENRffxoaBL8a3QifW2SgSfle6+T0mIszatHuqPCGdRi581hAijOocNiUoirSjyImwQ1iXF9qFzV4KnKaGLqownHukgzbumPC0+TlUjJTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788715654; c=relaxed/simple;
	bh=MraagOlUbpoH3oPLClVqeUHGrTt1DDjhELOYW/M7Pj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAe/I0dpk6q0EIK78/vwDcTz3tfwAYnziyu/PidVMvBgz3/vkP1WuR9yO65tVGokNglVCKdx60SCZhmSCzRNc5m/NNpFdKB3nWFWVemV5T2w6OwcxgFR63w1vdnadiPP40nlG7Opd9iZ/vlMXXAikj7ipsbCYxhkvYEZTIiv0lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBRGmHtY; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBRGmHtY"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8534d507f59so2933376b3a.0
        for <linux-leds@vger.kernel.org>; Sun, 06 Sep 2026 10:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788715653; cv=none;
        d=google.com; s=arc-20260327;
        b=EcdC5sfjHS7dT8+9cExSOH0PFVkp0tK+klIQ6VPj5Jo4SWVuGLZsn+jyxI4Q33hdNu
         arUv3PghUlIqfB1WCh55tOgiS90hiP0fF+2cZiFfhxZ07urzeLjFNsfVTMbrxqRiEVAy
         o3VgUq38u8+zNyKI7OCI4h/br9XwwQ2sA27CrWYo1SAs+CsOIpPijgUU1NjciWuzA48p
         LdqYyBcEyWZu/wva+cs+UEFlLJJXyqF4lXh01wBD58N+cwk11zy8FAj/cB0QifitTd++
         2auDGJ8TWGwlZjYOuj4wchdMMQqDf2WcYSkmpCMORWQOxSmNDwJkDoqIMkPR03h435jD
         U2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HTHe80Xg7+ZeuYbrgbgsluol6fsDFnRR/at+m3TB9OE=;
        fh=H2N2bNOv8hB1vqb+QQ62NX28fI5ss8O4fKpwbfiGvJ4=;
        b=SFV5yqo133KEIfosM274t/gD+mxiP/PP8IJGZU/QKxlL0Cbw1bFcXm/k8UrVNg6ROW
         54yXpkS0LOKyWyyllkRd6y7fzYt294QpQde+76d6w9iV5IUBzuyMqnfb7LN6rVFEoQBg
         9ZXtw6lv1kt4ZEKqSc3MH1MGKookP2cltnSQ3wwtpp6mdeb64xb7cB290UYXBH6V3PwL
         WH5H/kAhfH3Jivjc5qxffI4hrFAAjm6G6W/pdgYUN8qc/wAABF+3JHh8vtc2IGZlagyo
         Iu58oprcA8MY4BiuqxI/WnFEjAB/JtgFXlJJ/imMl7GcAkwmpgkGN5lXBA7bnOHfvBxG
         wAzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788715653; x=1789320453; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HTHe80Xg7+ZeuYbrgbgsluol6fsDFnRR/at+m3TB9OE=;
        b=tBRGmHtYOWv+ER41CDeEHk2vkJodO9MamNNG3ITftTNWohvwTqpT8hLHt6hnq2aN3W
         /6jxpnx2bPtTiAQRhnrbeyCsqJjrHN9m6161Vq+0+jfNejLl1y3XIHDFwg+uZSev/7iz
         Z9UtyeQah2Pvm9MxCIu9s0ZN7FAMH2GtRdhqzl5Wp4fYhhvD9k4MaBxAlHReovTS0yat
         XudzQ77nwXHYDqaUtGMWirPVRPuTm4o+NMgBBo2m267H14dqYkXmLdJ0TtJfsOyZAaYr
         ErAZLiCIaWiWC0dbZVopnN7y9z1bhJat2xLtxZyHuoWTl+rvC7hYDYsLYPb3XvsscaOl
         jhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788715653; x=1789320453;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTHe80Xg7+ZeuYbrgbgsluol6fsDFnRR/at+m3TB9OE=;
        b=JXDGsRMbi+B3d792rq8DicJlaivDRfocMEY4nbpGmAOh8WwHu1z0iFjSeR8jp4fQB/
         jSZYDNcyQtOyIn+XvZJzrpZJIisA8oAHFjoygfVn+moJQcRaD2HQwSRJOVqbgeHBqMqu
         SEInGurN9Pe9GWaL6J0YocodHACzqaqqwk0UaDA8vAC7yEDOO9Zyku8cQS+9I2HS5/YA
         hTfcVbMq/er7SZfcvfwEhyLNj9DEUefyazI8vWvmsJwNj3Izwu+pCxA8lDbE/JcHf/G/
         vgHX0pAWXAZx4AnkjJ16CS/ViCqH8Vzj1VhWyz5iN5XgLpyO+iiTaoVHzZEnsvD4OwdM
         5qVQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6Y4nXE39Ytzjnu5CqFIkK0uIJqyq2gMdUwlY3Td9eAg07EDCtTckrTrYYZ/xQghpb363jBwO+Kpz6@vger.kernel.org
X-Gm-Message-State: AFuF++k9t3RLielMUPQ3ljOO7RndclKxd95w/9O5m9FicbGnhLJvxlg0
	e0E1soLowMR14iilw5LFoS2xR4rAddakFCZYzMx5Eq5d2ycgm1HoXKpGl/8fdLTCFUHDAOGOGcK
	OWraZ751XVE1M70jYX6QcawZsTtQXhac=
X-Gm-Gg: AYBFou2k4h+WFbk9y5o4CAZKqb9fF5JwLBFMagrl0w835ZKTCoWafF1k4FOzH2tgSSu
	4RyDSwT9BI6w74JMrDwTl1DGqYg56FumAOC8wlfLzy4pb8EE9cKW/y3gPiL9xQardcwQYB1JaI0
	MKYUPNgVi/GD9VScRQ3+qeNV+2vQp7flkhTbimNIxpKd23jz9qP251P+NuEPP0GhPPBNVz/yP1G
	Pdzgw/3bSYVcF3AkR3bgjhccirxBinLEz/g0CXYY5E0TESAgEPQ2CQcXk/Nj0suFZt13dq81RA0
	0fPuTyEIPT/Zg6n5bWOsrAYLzVXe8Jj06aJb+qHm8eh8vUe1eDBjWzFu9vP6DBXn/WFGFtsObyV
	GKw==
X-Received: by 2002:a05:6a20:9397:b0:3c3:a3f4:5485 with SMTP id
 adf61e73a8af0-3da39cff434mr30724224637.6.1788715652668; Sun, 06 Sep 2026
 10:27:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com> <CAPVz0n3u0D=0swsO4n6LROFurO=as1w-ZRwaje08BN9dY=JhXQ@mail.gmail.com>
 <20260827141457.GA2943942@google.com>
In-Reply-To: <20260827141457.GA2943942@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 6 Sep 2026 20:27:20 +0300
X-Gm-Features: AcwNN1US6VGLlyitJNPleGZ36XvgnLU1yQ7kLv1UGW2us5RAJXeSTeJhWP7qGxo
Message-ID: <CAPVz0n1bTHph3nquDNzrp+kpRcbzHsBBddHGxY3qt9qiHf7zWw@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 27 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 17:1=
5 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 19 Aug 2026, Svyatoslav Ryhel wrote:
>
> > =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:57 =
Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > The initial goal was only to add support for the CPCAP used in the Mo=
t
> > > Tegra20 board; however, since the documentation was already partially
> > > converted, I decided to complete the conversion to schema too.
> > >
> > > The CPCAP regulator, leds, rtc, pwrbutton and core files were convert=
ed
> > > from TXT to YAML while preserving the original structure. Mot board
> > > compatibility was added to the regulator and core schema. Since these
> > > were one-line patches, they were not separated into dedicated commits=
;
> > > however, the commit message notes this for both cases.
> > >
> > > Finally, the CPCAP MFD was slightly refactored to improve support for
> > > multiple subcell compositions.
> > >
> > > ---
> > > Changes in v2:
> > > - fixed code style
> > > - rtc conversion was picked, so patch dropped
> > > - added audio ports description into mfd schema
> > > - splitted schema conversion and compatible addition
> > > - minor style improvements and typo fixes
> > >
> > > Changes in v3:
> > > - added regulator node names list into pattern
> > > - filled spi_device_id with driver data
> > > - ADC patches were picked, so changes dropped
> > >
> > > Changes in v4:
> > > - dropped regulator patches (applied)
> > >
> > > Changes in v5:
> > > - switched to MFD_CELL_* macros
> > > - switched to use determinator of model
> > > - switched to spi_get_device_match_data
> > >
> > > Changes in v6:
> > > - removed address-cells and size-cells from main node
> > > - changed macros formatting and OF matches
> > > - factored out common devices and made device addition staged
> > > - dropped cpcap->variant check for 0
> > > - EINVAL > ENODEV in variant checking switch
> > >
> > > Changes in v7:
> > > - adjusted spi_device_id entries (name/driver_data)
> > > ---
> > >
> > > Svyatoslav Ryhel (6):
> > >   dt-bindings: leds: leds-cpcap: convert to DT schema
> > >   dt-bindings: input: cpcap-pwrbutton: convert to DT schema
> > >   dt-bindings: mfd: motorola-cpcap: convert to DT schema
> > >   dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
> > >   mfd: motorola-cpcap: diverge configuration per-board
> > >   mfd: motorola-cpcap: add support for Mot CPCAP composition
> > >
> > >  .../bindings/input/cpcap-pwrbutton.txt        |  20 -
> > >  .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
> > >  .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
> > >  .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
> > >  .../bindings/mfd/motorola,cpcap.yaml          | 408 ++++++++++++++++=
++
> > >  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
> > >  drivers/mfd/motorola-cpcap.c                  | 143 +++---
> > >  include/linux/mfd/motorola-cpcap.h            |   7 +
> > >  8 files changed, 571 insertions(+), 188 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwr=
button.txt
> > >  create mode 100644 Documentation/devicetree/bindings/input/motorola,=
cpcap-pwrbutton.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap=
.txt
> > >  create mode 100644 Documentation/devicetree/bindings/leds/motorola,c=
pcap-leds.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cp=
cap.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cp=
cap.txt
> > >
> > > --
> > > 2.53.0
> > >
> >
> > Hello Lee! May you please pick this patch set? I have included changes
> > asked by Rob and Uwe. Thank you!
>
> Nope! =3D:-)
>
> There are still a bunch of unanswered Sashiko reviews and one from Rob's =
bot.
>

It seems that Rob may be quite busy. Which Sashiko Rob's bot reviews
concern you? Maybe I can clarify those?

> --
> Lee Jones
