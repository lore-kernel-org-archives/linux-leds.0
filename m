Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48BB3F4DCF
	for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2026 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130775; cv=pass; b=tcNeqBb6F7f1qaM2elJMxmF65LyTJ6r6pLYpPWQjqU4fc7basXQMG+Yd1zNbA+x8PZ4RnSMz2KeK5vwsNINpuy5JDH99JLK1qRvXbtPdfKwKV2TM/lMPR4oK9EtTktL/grxgNx/7oRnP2XpKUMwGYmCMUknzAL2RgknFxIyOtGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130775; c=relaxed/simple;
	bh=DCnsy73dKFmBz5cXqnv5Jnu6rHCJzPmOacFK6Spob4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIpEthEQ6KmdDdHsp9VH9L7d9aZFQxxluc6Z3x2hPjCPpkPGVNDC2jhTzmFPe8Ms+ZyaHZ1iuVYXTsdzfF/gyPQoeUQD5ywzj0JNav9/pa4AdMwQbNALYljSwPxus7/ueaJaGa0cqi5pKX3v63VmQm0zXa3vcNDwJdp8o6uVyWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjxOquGL; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjxOquGL"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1671ec8692so107644866b.0
        for <linux-leds@vger.kernel.org>; Wed, 19 Aug 2026 02:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787130770; cv=none;
        d=google.com; s=arc-20260327;
        b=gpETPOuvs6VspHC2iAJm5IFl2Q1M+3Ts8e/YVwlrCKEJ5GAqOSEYPhP5FDMQ0EbWUV
         ubHuJVq8sd2Uic5AKVNErzVzv5bVnpFvKKdIwX+tkAlOP8WdQZ5UexFNMIOCNKubKCn9
         GgIVXweCxYiLoVc4N2HFoxLl5gIuLdN7RetXUQgGyR/1C+ZQRP+ZUGDXAniP6UiZhXGj
         IaGLZVgIxb7G703vIadDmTDb86EWhNjrlrRBscVrLRfEgm2YqaD2ycuhJPOclebllZuG
         eJpQhgzzBsMZrrhpEblDO7X1lgnvmhx/NR1xGr21QPjWGx9DUtfpd6ahWgJGcg2sje31
         f4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQVqiPHj9gddxJ2oxHXBLJll0uYkJ3jqiGdmF8ls390=;
        fh=xJwg7owe3+PyjhIerYevW1sMbzoSx7qs/WX7hHYJUbA=;
        b=OIgosSLO99+lN4vt20XLRqInjaxRRGUEgzrjzMy9dw19fTqrLyob7DOBb8udPRg99s
         FCOQ7OXMWLLlboykhnDd3Cq8eY3U1tvOWJ9yv7AEx+MZNToVphvpakSLIhi7xd8hpZNA
         jFnEKtwi7rRWx4AZcD8bWb2KV0XKUjQq1z0NLRooobcyrEgwn+Cbio93HfmKiVi7lIH/
         i5dRmk6cPiXrFCy9e0AEQmFzK4mAcndjG+r+j8nIcQDl6TrEi4+U0zrMqZ+FV+jVpz1a
         Y8cjQvdVJn8rcmYhM9snU32ntQDw5z8ISEiX5r6NGIktvIST97yKU5uaZkSKJgPDGky9
         F0Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787130770; x=1787735570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQVqiPHj9gddxJ2oxHXBLJll0uYkJ3jqiGdmF8ls390=;
        b=LjxOquGL2ecAPBMN0uLeQ1Y6Nyt+22TRBCI6KJrDILezgOzpwOaQZMSHdwmzlTwuzh
         lOTy9neusGIA3v08zPSEpPVhfQaC280TDqyUchmqUNCmR2fxaKMi1fxO83nn6dMqFlsl
         inxU/9NLTvBmhbdAhBSC6b+F7mopvymlSZ/MBsek0WamxWpfFOILritxOOnAFrV/q+Yd
         GQWUDAs2Goe/auLnAeXZjIx2M74bCbylfaZmc++77qxMpUpvYZer5zEQss2eCxa1nhRT
         dhUcQt/BWFIT+YH620RIs1yiLDgFNHDQdc8gJfSuUPbDzPVLbfj0aGdsTkAe/yFa2jXA
         LEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787130770; x=1787735570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQVqiPHj9gddxJ2oxHXBLJll0uYkJ3jqiGdmF8ls390=;
        b=ayPCQu6e8+RU52QQeDOlw6yPOOx70kGUpkTB3OW3qRA7JE3qgaHJDNL3BVILRYihMJ
         48Uka7ZbFYYTwMpVjGVSzjdtMS5cE7PMmahqBOZuwuLk0aE5/d3dBnfSHBTh5B8ofo2U
         slMZU2pR5t8F7I8tyUSaFmEesWlGq0dWzPLzyn43qiBsMgO+dtKNO3FD/ThQMBe9Omu1
         qd6mbTbL+Dt2ohN6fRqztLm2VETCFPkjAkmT+i9qyJz9Bslri0zhG7+jhuEOg/7mcvJA
         HZ8i8GV5NxZWdTbXHdYvIB8v6UCfnawra61JSPORmchq6jrMla9/GpyoJ37lK2pqTQt+
         4j/w==
X-Forwarded-Encrypted: i=1; AHgh+RrcLhnbMEjP6HbJDiPs/h5Pzw8dfv2UIY5SL3/wB0uzhfMuEFL57JYBgTKIUKvaS4a+y2snAl9frSMm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1xMsyvqzGLRQrIh7xsHO6xbe2RdIdd2NRxV5tMe68KwwtPwBp
	lGJ8NjMo1fp9GQyP/MCHH99ctJlwRVqy67DLkb/CEt00ygk8incMaB96PLnhHpEzeTj1TVLKsvM
	FFcyHoTVXSFGwtt2byMC1vMWYn+3VUyY=
X-Gm-Gg: AR+sD13LEy+dddCYr4JVgzQhN/JtbCJCX2RmmifKxzHFtO3QlrGI+WNA9slnV8nWAUg
	VGq9cwilBOWM5BiuwscTytI3EA23zNuKe36uX3x8WT1VEosfNmIT1/PCqBrsMVDGopbyO+Vmw6E
	dEIjGibXJzvJB6itdRW3m6CBaaXqZzYag2sNX4ZSI9popTTPlY41wXlP7inN9K5qyaJBp0bh5Jx
	RdNwvX96zfGNYdAGTlVCWo9hhhirOFei0Hj2yCs2lxo9ZCP6aIO+vbHb2mHv38RpbZSQdR75cup
	b9D9SFL8nmq5h95C/KiBv2kmmrKtYvUnSfOAPRGw78rNJbsEny9AH2OTWOxCykPp2BYVP5SDh4M
	7y24=
X-Received: by 2002:a17:907:c789:b0:c16:1227:e3d8 with SMTP id
 a640c23a62f3a-c242e22e276mr205170066b.13.1787130769901; Wed, 19 Aug 2026
 02:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com>
In-Reply-To: <20260721095654.429346-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 19 Aug 2026 12:12:36 +0300
X-Gm-Features: AcwNN1XqMUC5z69S8iGApPi6yHWon1mnJ-iyXKEJkZHOCPSd2FYry1N5od1LFfc
Message-ID: <CAPVz0n3u0D=0swsO4n6LROFurO=as1w-ZRwaje08BN9dY=JhXQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Lee Jones <lee@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:57 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> The initial goal was only to add support for the CPCAP used in the Mot
> Tegra20 board; however, since the documentation was already partially
> converted, I decided to complete the conversion to schema too.
>
> The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
> from TXT to YAML while preserving the original structure. Mot board
> compatibility was added to the regulator and core schema. Since these
> were one-line patches, they were not separated into dedicated commits;
> however, the commit message notes this for both cases.
>
> Finally, the CPCAP MFD was slightly refactored to improve support for
> multiple subcell compositions.
>
> ---
> Changes in v2:
> - fixed code style
> - rtc conversion was picked, so patch dropped
> - added audio ports description into mfd schema
> - splitted schema conversion and compatible addition
> - minor style improvements and typo fixes
>
> Changes in v3:
> - added regulator node names list into pattern
> - filled spi_device_id with driver data
> - ADC patches were picked, so changes dropped
>
> Changes in v4:
> - dropped regulator patches (applied)
>
> Changes in v5:
> - switched to MFD_CELL_* macros
> - switched to use determinator of model
> - switched to spi_get_device_match_data
>
> Changes in v6:
> - removed address-cells and size-cells from main node
> - changed macros formatting and OF matches
> - factored out common devices and made device addition staged
> - dropped cpcap->variant check for 0
> - EINVAL > ENODEV in variant checking switch
>
> Changes in v7:
> - adjusted spi_device_id entries (name/driver_data)
> ---
>
> Svyatoslav Ryhel (6):
>   dt-bindings: leds: leds-cpcap: convert to DT schema
>   dt-bindings: input: cpcap-pwrbutton: convert to DT schema
>   dt-bindings: mfd: motorola-cpcap: convert to DT schema
>   dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
>   mfd: motorola-cpcap: diverge configuration per-board
>   mfd: motorola-cpcap: add support for Mot CPCAP composition
>
>  .../bindings/input/cpcap-pwrbutton.txt        |  20 -
>  .../input/motorola,cpcap-pwrbutton.yaml       |  32 ++
>  .../devicetree/bindings/leds/leds-cpcap.txt   |  29 --
>  .../bindings/leds/motorola,cpcap-leds.yaml    |  42 ++
>  .../bindings/mfd/motorola,cpcap.yaml          | 408 ++++++++++++++++++
>  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
>  drivers/mfd/motorola-cpcap.c                  | 143 +++---
>  include/linux/mfd/motorola-cpcap.h            |   7 +
>  8 files changed, 571 insertions(+), 188 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutt=
on.txt
>  create mode 100644 Documentation/devicetree/bindings/input/motorola,cpca=
p-pwrbutton.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap=
-leds.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.=
yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.=
txt
>
> --
> 2.53.0
>

Hello Lee! May you please pick this patch set? I have included changes
asked by Rob and Uwe. Thank you!
