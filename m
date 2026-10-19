Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792426047;
	b=c+84tinhGXlg9Bgss+w1PCMXyySjO72++FwBi1wzl0ZapIpRjzuwfZ28KqDTQIO61k+6
	 jiZJATuDnX6WQuEljF+hnLp6dEcz0EoFG4fkQ7Ad0X08cVZaKG51oL5SV86Eoe3VStOxf
	 diDuM3SkMeaIY7VCYfhEOdu4gBUiz6qRGFxtysrgO1GA24c7WjTgwpgtxjHUVaXk/vbdC
	 NrQK5qCgAEhunfn5a1H9btslZejEExxiecHCYb+xD0yqM8F6yEcYbvfjy8DEtBAfigWk6
	 LocR6sXKoxTXHYz+O/MxUuK6HryOcNuefkbf0ZHy1UAnwCkq1C5UHEVy6D/D+YsyUMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
	b=4UnTycBtIXVp0r85LcOu742qUzBweMXNxS1bLiAieEsn/Qz8otn5FUe+gC5yTWkmODl4
	 JrJwGAjGY8eCFwwdBMqWzwZVphzFbzcGfhYSWEOd5PunKk+rkMHFZHgAefnCHceg9kGCX
	 iButRTcl1wn3UcMMJ90I4ifvymMKhtmytJx3/Bs4vrvQxhT2w1Buj+dLlPk6eYRrg8Kj1
	 q9pjtUFUhICfF5Vs+n4++izFu+RctrXEPpVsUw3bKHbv4clq237cJ5S4k7/F4AezgbSov
	 MefiOGv7W7+B5AcPVGdv64XWjHh24UaAZ84q5gpnJYMF7DLcLTNSZF5NGWLqTziafpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IoMtSIzZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99371606AF81
	for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 16:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99371606AF81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IoMtSIzZ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so5872184eec.1
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2026 09:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792426046; cv=none;
        d=google.com; s=arc-20260327;
        b=PfAEu5SbhYtsjp39pRY5dMPH268DIq7ajJG80wOADFUb1Qjc6KdYvMqDo5i3XQyJmW
         A1FHbzxHQUlGmIlwqDBpSytSznobb2ze7ViVOvfMVRX33qYziLhyzjOQ7M+eVCAKs+Ws
         Kb2dgALXLEjP3MsuB/sbiO98aaBeecIXn9klSHg93qE86JMxLxEd0NykXSAf4KeD33WQ
         hNgalvgBm8azOivTOjue0CudGrAie+6gOgXvPzzjCml6P0kOejVXmxMoYUub4OajpnrB
         Osg5qq6/dIuI0zLXdcbCq/4+OOsheqZbzigVHpVVLHhfat/Qt+HlOy6/+oTWKpktM2j/
         2fMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        fh=ISPCtefJNPTJjCbzLm8qVTptgmiCI4saSWUGvjCpOkY=;
        b=ooQ3enpeNcyO6hrlTacxDhrtHUJm8P7fsrDzYTLeve+qL2iUAImiUwTW8SSRkY0Shv
         00EojEr+S54HuDxNH1k0JY7E1e9TsSTKRQSNl/zFJklvBTQe0dFEx+TxHyw3IF7LEPjx
         97n0Q2ZtgplWBVSGf23LhsS6edVx7HMH4+2CT17X8r/uWcQ4TIigXx4Z76MdadEoJ6BP
         Zjam36sRNRQJ0NPk5QQqhkdr29xJVrkFK7UZCaRWIO9swHWjqN6ZYZoGfpREG+DpX4Ws
         P9BwgLODHIdvuwyzpYoFQBUaklG+OXKGQtxm3eG5QGSpgfsE13324xAbJlnFAsFfXWm2
         w67A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426046; x=1793030846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=IoMtSIzZ9V1R9FIBfWfd5i2fmLTABAnN9sSr/jsrn3j1VU7yRqgsgxXCplEYoNgeRO
         fUK7dI1I3ae8Eb5LFLibzs1NebQxGtWMGaZRJwucN5STa+gRLx58xI0k4HYcvC0Ye/VO
         Keg80OUbiPn9KRWtob6unTbO9PzP1havbwvm0+KafAeqpiZiq1x9+gzsKwBsN7YRHDGE
         +fao+U49ElPaA2TyrQ06S9zLUjdeLHWSlLv+zvUArfRfkzio6Pc1vZKN7iBSe0lk1wx6
         x6BoiIkbWUwVBbRcQj1KivctyNFUIvn0/3E96/KPE0hTBbC4wX0zPb3IjaLQ4+qdZ35A
         jw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426046; x=1793030846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp1wXmjGVdO0km/o46/fcmdmsHRC4xyRzbLPpnmcTsc=;
        b=jb7J2is6bEQ1EeK6RIe4WcbOJwbP2LkXqqATaRspgnX+FkuB3v1d6/03NZCPwW/QeB
         VyOyXdyYBY6JO7pCh7Jg5rIZf594lJCNEXYdugU0w+sszCGrUKDZEKaLZd1rchC1/ZEF
         4XOUHP6aWfUziwsW0Pxkddhm5rcUdQPvEol70ag5PqlbDkafVJLTlq0Ri523f4l0Jwoe
         BU2S81xyiNYdOfhyiY6rxGF1QkTRDqFu7oplgFb8cLNpk8yKXiu3T2zNh+5Qx4zMeaC/
         R0tIs13ktU1f1OTR22glbpGlIHrQXmlF6KScuaa+GLsDS5Cg/YPrpOghRCmeIFFbcvR5
         /b1g==
X-Forwarded-Encrypted: i=1; AKwUvBw1sl+N4UV8vJQ7plYgYz8cAKq1VtA33Pkj9+1MnjEPfGwpEq5wWPdVcyjSTbJzD3sfucf9+G622sSl@vger.kernel.org
X-Gm-Message-State: AFq9FYIHxLoqjFGrvytCPuKS+Xm9OZ+SM4ALCyLeVrUmIJEi/VVyiF1Q
	aN5lrU6k4Qe/timblHkacUOZN5+YLp5YeggOINi1JpzjxzimEsAWv5WBojQaQak9xQL3tiyZNsK
	wTixkjzD/t0Duy+X9tTjRniGa2oHcVlw=
X-Gm-Gg: AYBFou07cuvnr0DvZzebbiXCHsetW34KLiLIZQ80mqHWFn+P8pYdtoPaMS7td2gldNF
	xTNdfb5LqHapYwtZyPe+ge5AueSzf+SN5Yvy0Qd1P/8g8HXH9B2UBxj95n4YlbU0JGc7dzl4wT3
	ty8mmIDj+27AKtezAt4qQRz5NxWnznCFXd9xwrmg9OwJiTEiuFjb4fIQAn2sRsnCsF/LXnJFGW8
	NAZxZ1/qI2/nGR/28xMXautUMLBMts/zwkxi5Efj7AVxHohrR3vbWoKVdDmjkODMOmT92+nTUzY
	OMS72bPq5ZFDOnTw7U1Mr8jWr+GcIy9kxueBgJmM4oNdxxJC0Dm6/1wE8iVcbv+eHCMDrZPJsOW
	wqlpKl6EFO2oX
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id
 5a478bee46e88-361a2c38d17mr11330019eec.33.1792426045527; Mon, 19 Oct 2026
 09:07:25 -0700 (PDT)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-2-clamor95@gmail.com>
 <179198322819.839288.5272985130898382430@kernel.org> <CAPVz0n08bXQrujADdgQwuLu10JNjOrjBq-zNS6agSBGLLWt0OQ@mail.gmail.com>
 <20261019160202.GE2663669@google.com>
In-Reply-To: <20261019160202.GE2663669@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 19 Oct 2026 19:07:12 +0300
X-Gm-Features: AclHuK9VJmJMQJiC82ERiz5L-8HMq7v4t7pij145Dauw6OWtgiTFIN9w7D539M0
Message-ID: <CAPVz0n2oCKyLKG+pXFw2hAfMTXXSjrwwsFRrhzC24d33LOi-zg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:0=
2 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 19 Oct 2026, Svyatoslav Ryhel wrote:
>
> > =D0=BF=D0=BD, 19 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
17:52 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Wrong subject line.
> > >
> >
> > What do you mean by "Wrong subject line"? Specify.
>
> This is a LEDs patch, but you have incorrectly tagged it as `mfd:`.
> Honestly, I would have thought it would have been obvious, hence the
> lack of further explanation.
>

Uh, yes, I have figured this out already, but thank you for
explanation and patience.

> > > > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lig=
hting
> > > > Management Unit.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++=
++++
> > > >  1 file changed, 124 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks=
,aat2870.yaml
> > >
> > > [...]
> > >
> > > --
> > > Lee Jones
>
> --
> Lee Jones
