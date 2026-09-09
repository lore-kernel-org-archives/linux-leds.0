Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980557982A
	for <linux-leds@vger.kernel.org>; Wed,  9 Sep 2026 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973096; cv=pass; b=cSRFkE0VMGJJoxIMjakcoQErpSy6bxiTT/WS3dKB0Lqx8tzEb5qmUULIqzgTpmIAs7pWpoKrvfqbiUEkoqONgm2HkvdPzPk0TcSw5Exus4Sg0DkMmeFfRL9DkLVi7sUDTxO1L3hZkqmgrDYwzlZaMZS5/NRzU+r8fw3CLlGJKNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973096; c=relaxed/simple;
	bh=pX375j8sh6vF6kmJpBXuTbigJC1Pj462kQb14+L3SCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fPekhNElYEvGCeUFJXWDwYK2kA6etTyfnfmPY+9AHAdEFc0XL/71mLsFf5WTaaGPteWJskKATu8pHmAhuSauFP9c5DBwQVpRIQKA0EUaZ28EJg6xqlrk5kMizmkMAGIYachoy7Qqsh3VJmUXYYPzrTtiI+r+6QyZ5wWWOjtu65c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qlp4zwlh; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qlp4zwlh"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b89a0e69dfso97634e87.3
        for <linux-leds@vger.kernel.org>; Wed, 09 Sep 2026 09:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788973093; cv=none;
        d=google.com; s=arc-20260327;
        b=F7fCha9r6sWdu9vY5JWwCjWWuWaEhey/PNT1fh6o6f4JvU6xNxgdkZkm54MeRgfP+P
         nlmmNKE41jHmLsgQGSYauvfZRvXuDbUyJyPp3bBMuRX2tSV8AU0ZOXpm3akudzW2ALj7
         t1Nz9lebHpyNPVmEFiDtSOv3D35e1XWgZR6uFadkqM661vofI+uHgzK/zMVvfhY9VP8l
         BqAIQmAA6YKWYVfkz0MGOFwQQ+t8bDLHbiRkJB4sJp8IiYeqBrgsBy2ghFSzEYiukd3m
         9QC0kpieD4tEzuBIcVTCzaIZ5wt27az1tEdbr3eOOhvYxbi73PAKZAijZDBg+P4hTlMj
         zddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaSEqqQVvbHkTy3GU8KhCzhbcZLDrCGnsQ+LbvJQKCs=;
        fh=XX8HOYeCftJ/iUkkR/o0gbXNZTb6aWVrwPFoY+I85qw=;
        b=cG+nPq2wCAF25pbbHKsQYvcq6u5/EyKfTu8mrtnq3R6J9SecZtv0sbbQQ11DVcng9B
         9nOnobp9eDjsSyPJxEgysPKHlIZBtfP9RXjX2Ow75eOm+UB+7U9xW2qgyjq1gdrEgvvm
         0fmkiwOSF8rujOAlWZCUu9IFApLzz9Ikbq9LTra/wlWp2pzJ0ZtfOwDRZxaXZfMdXV4o
         d69I5A6PSmVQLMA/zIp3YJgQL8B3BadQX2wKke3U0OiJqAeJgZu66nFd46jAe39XWzMR
         GIeJaJeSlBXVmCkeMQUa4qpW7IClL0wgsaB4D0AH6aqRmPQnXqtAOn+X/OBAzmP6wAv9
         DXng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788973093; x=1789577893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gaSEqqQVvbHkTy3GU8KhCzhbcZLDrCGnsQ+LbvJQKCs=;
        b=Qlp4zwlhj1LtqL0jEgK8M4vTLA1PPh5A0RZL8FOtvUVqBF+0+/9r0SzK5r4DluKVM8
         9xVlWnJo60UVhrPEiSfpH1tKXwK3xihkvaW7xi9Jf78KmWU5u6iKcsIzj2SXKFj604hU
         ANt4Kgp+02MFjAornfgzsWJ0M6NJVjZOBArOmTBb3P+T9LOq8AUAeYN7ay0et4iPXQek
         FKW8g2Fs8as5/ekGyJRUmXMxPlK1vdMObp7si/hl9EfqDHDhZKfbVsf6msAZSRC4oXz8
         w9AxUi8ajAdvSm7ZW9wN7nc2hKiQtD8eWr8XJVzHi4EZ051s+weuta1O7BQqGOiPBzja
         HJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788973093; x=1789577893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaSEqqQVvbHkTy3GU8KhCzhbcZLDrCGnsQ+LbvJQKCs=;
        b=aVFI+kS+jCPZfPJTi+PdPPf7VF446TpKX3B6pJ6lehWIN9mvtMyR4TAgLmbAMvQ6nO
         N4BIedqZhBspiDeqHceamgYYgFCNKl4kR7YO58Yd4oG/dFfiXXWtCNKZdOd3711hsBeM
         xzCXKrZeojoW+HM/PpAKrurVi9n6/mfMmX+/c101uj5SK0+SLY1q3YgzzRadlMEw/uwJ
         7KndTgF4DRe/NK7y6RCGFGlOtgn6k8xn/1DVxTbKaHRAK/bxuUJkHiLJpPCf+DIXGv49
         mO5Ow5SXYqVu7XUcjePaopgU6bZ3CkYMMckwp7PFIR0U5GiA51M1ZNUqmeHhJwDq2Vgx
         is+w==
X-Forwarded-Encrypted: i=1; AKwUvBwK6yP+pRK/4Y9YE4uSTvWEVX01gl13zxm/zwFlzlj/TAXVUdqdeko4qOvT1OUEIgshryYIE1J6DHV/@vger.kernel.org
X-Gm-Message-State: AFuF++m2HQ+WTnb0J0sQGzn0i4FjslZnte3TA5a/+JuDqWObc+jIXc32
	hO3+PsDe8CPsre4ZWAVle7wNfVFO0YDvU91pUo5XP4oHvdWigUSFsLMljvU7xv/CCrn3QWIxcsg
	jICLu27z/NBTGYhLOesdDlBjhfHjtjBC2SQzlVEM=
X-Gm-Gg: AYBFou35ALnW25YsgLgTCmmyOsXKafVVkzOsPkU9GLi2kUUh4zrfOawWHcjuZ/LCoV4
	YIFugxFpMwkiXxd6dV9POHtTjF8C5fhl24yTBA9AkEC703if65qfaOBzoelNBFS1HrUk1mGuV4S
	aRT5KVG2OF74cTEF4M4YvHRdgS8A60uy/vkrYeQBUaY6nSzTaEbydn+warlUc/BIyso0YAwtTab
	HXI7vGZHrRbewFcFsgZ5YXpHvZSOnUCl46FFKfJPJevnknnUMeUowgn9xOfXn5u2VMRqMzGrtjm
	K+l/F1GjVu8jGIRQ1TzVFmSb16pniP+YrtoQ/K52aNUyZ3CeIhHiebKxhIBz5vOSE5StTL4f6bd
	5TGj44SAl4jBF
X-Received: by 2002:a17:907:da1:b0:c26:1648:a069 with SMTP id
 a640c23a62f3a-c2941b50c5emr98787066b.36.1788972621568; Wed, 09 Sep 2026
 09:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095654.429346-1-clamor95@gmail.com> <20260721095654.429346-2-clamor95@gmail.com>
 <178463529533.2776661.17291216407355479584.robh@kernel.org> <20260909162654.GK2133376@google.com>
In-Reply-To: <20260909162654.GK2133376@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 9 Sep 2026 19:50:08 +0300
X-Gm-Features: AcwNN1XKwhxknUsv6HKXytCI9drSinxM2O3i8RIi3hHlsgo01tXMW3-PL-0Uk58
Message-ID: <CAPVz0n2zLd2SPrHGb5vSX3AvRrofbA7Q54YFpmcPP6032MUw+Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
To: Lee Jones <lee@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Pavel Machek <pavel@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 9 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:27 Lee J=
ones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 21 Jul 2026, Rob Herring (Arm) wrote:
>
> >
> > On Tue, 21 Jul 2026 12:56:48 +0300, Svyatoslav Ryhel wrote:
> > > Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT =
to
> > > YAML format. This patch does not change any functionality; the bindin=
gs
> > > remain the same.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
> > >  .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++=
++
> > >  2 files changed, 42 insertions(+), 29 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap=
.txt
> > >  create mode 100644 Documentation/devicetree/bindings/leds/motorola,c=
pcap-leds.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> >
> >
> > doc reference errors (make refcheckdocs):
> > Warning: Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yam=
l references a file that doesn't exist: Documentation/devicetree/bindings/m=
fd/motorola,cpcap.yaml
> > Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt refer=
ences a file that doesn't exist: Documentation/devicetree/bindings/leds/led=
s-cpcap.txt
> > Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml: Docume=
ntation/devicetree/bindings/mfd/motorola,cpcap.yaml
> > Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentation=
/devicetree/bindings/leds/leds-cpcap.txt
> >
> > See https://patchwork.kernel.org/project/devicetree/patch/2026072109565=
4.429346-2-clamor95@gmail.com
> >
> > The base for the series is generally the latest rc1. A different depend=
ency
> > should be noted in *this* patch.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit after running the above command yourself. No=
te
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checkin=
g
> > your schema. However, it must be unset to test all examples with your s=
chema.
>
> This one.
>

As you can see only complain is that reference in the leds yaml to
Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml does not
exist. All cpcap cell bindings were converted one by one as separate
commits, so this is natural since motorola,cpcap.yaml will be
converted last and patch doing this is included in the series. It does
not bring any regressions in yaml and dt schema checks.

> --
> Lee Jones
