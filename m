Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795449819;
	b=z3UfVqjnJuzmzRwMRc7tKidBatQ+B6oLx4J8EA/S/its85JSlLSBg+fWjsEydA6KaV0f
	 M0RcqyUPlxHnpYcl0sVFHDTMR0Z8rcqUGlFdrC5FhEc/f+NSI7a5hPRiIT5LGXFOgUZyn
	 q+NIEeTMgzL2rAaxykJl3JREUx2X32O31T/v2GQ3V1HPJHWF4zIdtagJ1lxDgNJ6kDq+m
	 TI1MHA2KYMpj+GKZjjZwmQLsGuxOimih/CFONMMU/qZ1C7lbhCn+I69RM+rr6jtwPdUJM
	 t0dqv4W7RJ/BwE7zeeCa4RnI5m5GYQuhSDqvi0z0+OXynpzAfUZedL+ds8vaS5c/s8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
	b=zwrsYWZ8GV6vnfSK5OAFqENjnhcB6wYjZslygChunavcz7+TZnsmYoSTdavxnoXJ4se5
	 FH1Vyojww+jZ97h48kVKdBGfEmhQmPurbBOAc/yV8UBPNNXiyaHCLJUL9R+WEu+Oe3XZg
	 qQM3ey8vLEXLFc292tY+G+5eoHkVJYKqfMu2Sl7IiKAYsUWsyTJtH/vapZeRNK81HzRYn
	 4DldNcKKPgmriNI/4i5xbDrcc2A3INgopGhZ5XvQwvKuOmljQvAoWfk+UVT0zo2O2lJ6c
	 euTn9Shn2rZ5o78gArgLAVBiJSQiHoZ8XQlPrlogBRtZ7Nn0aCM460QdncL68qgTkpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80901606A31A
	for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80901606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kPxbmlxH
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so569507566b.3
        for <linux-leds@vger.kernel.org>; Mon, 23 Nov 2026 08:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795449817; cv=none;
        d=google.com; s=arc-20260327;
        b=sOhQULaMbavOvPZUAel9xFekp09+QCY14VGHCiSUc3q9QHz1J4GXrTi8lzEkkzjN9Y
         2dgCuaiiD6dCPcnJFK+Yrh1CgdWuTRIgRo2a9eTBGoL66sm3uE1n6Hq0zsX4dfdeiqCh
         Kuw9ordE22fwW2Xxexeg3i33xotnu1NN57zfcJTqMWPViFV7TkRRTdv4nJWBDc/PedPw
         5k9sw4G8zIPZJRIm46YYTn5An9nBUTbDbMg5kvY4Z9LCddWRqFJIAFJF5RarbRHdN7qQ
         mpLIuafGUxu5aduoNCp5XrIZFxqpNHIQlxMcYOWkRpE5UUI45Ce9fBD5tljv+nT9PiwD
         2IQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        fh=1rAeaMlvTUNXU/iE2TRH4DMt/pkpPR/YRrkVCKnrsFA=;
        b=hffpxEHlPldW9qVOILzKZBVWBJQaZg5yra2HwT6vJ+h/Dqp7nmbG3FKE13IFDWzk7K
         hLZRXQxCH9MdyGXBcyLPm6YapXRxXQAow4ILxNSvkJc6qmRRso6tAL/0aAxEZx1OSQuU
         EfcHJYbPW1is9Pqy/GpERexzLXCce7mYfZQrbLTub73QxlU6zH8PKLtCVeltrHxbO/mO
         hsHr/epaM2+Tte698j7HC+eVaRcQelk5DyhPUSn0nMmIgIPcqxJEFtRVCP+jdvaMPA0Y
         4uFg0uf8hJvRRcGb+bFCRkFyjlaU6eWVCA5l6C5jzwEh8rFmkpDQadHBl7f56ZP8jd2Z
         scfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449817; x=1796054617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=kPxbmlxH36KRhpUs3rX2kF9cu8fs6nKcvV2Ep5Yd1SAPElzfO4U0yee+eyo4yYjKG9
         bVabsqjgWrVObshBsNWmZu0Kc8SGNvonY7/47W6xWPu+XZzUut9DZVDasYOasQeH9Kb/
         cxLOB1EaAVkrHLcauEnwPg9EXJ3MPHywPaLoCpTE0FTTIAii7phK7Avi7MNPjJVN89DP
         s8LFLj0Mqsxb9tOW2pKJn+UDcZJsxmwmdbWgLBk3GXWSXPM0Y4SECfoiTVmHq/AsVfEi
         eK10GDKZe/X/rTJwTT3GnOPtaNslesh71E73eFd/jgj3heXtLGBeR0+t6FPE8tiFDqrG
         Ouyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449817; x=1796054617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIkb6giW2DZQeI3EoSHegibeOoJUT8zoX5bP63zRKds=;
        b=GFPPB/Aa269yci+Vv+UHqX9aM4hlfSd0s1QmWfsQ3phld5shgwXJ4DJcAyC+UOQuur
         VEDlgKU2JDp2FeFrWLdvrOf43h3eCVdIC6wJ6JGAyEgmn97S+4fuxlfuZ58oCmla1hBJ
         IPMoZj43/BgSFZS59Q4agT/vOm1yt+lGqC/EmRVqRH3DH9T5luXTIVoLtLJ9CkxltPuU
         3I08wTBrkPi7rzZ+aFDlcWuJ0sQCEx0ydMkvhR8TLkdJcsbXOyt/Vqn/fIGK/TMzKMBz
         /S8xB1d+vA3Az+YMaMeULggCxHi19oz0huZraNzvT2VPFVq0KPOZjX3leZJcOakIRCfy
         S8Jw==
X-Forwarded-Encrypted: i=1; AL+hErFY2e1S2bCuxFubX2J81AoMoaCVVTXwbswefDuH1EstgXuWDJkcDbf2uFMd4+bzS41I6ulOEDX73MJm@vger.kernel.org
X-Gm-Message-State: APuU4Z/C8+T2r11UiRtqzIkmcjc8mc2x+U2XmMYS0hITbKX0t+shts3b
	sTGSCNVz3OSzL2DyxEy3s8HwaJyAROz04sqmQ8DGA742264tqu98xQcw2qmbgDP80+LThXdyJfM
	BZCvl51rXfJUpHx2Qy7QsSRjv3cb6F9M=
X-Gm-Gg: AZFdTZcBjzK8QvR1rW4LORNg59bvHDwWC3Jk3ypKqD2jfrBgHGEv4j/xCS/qe/cHNPB
	piEdxCRX+qaJPKCUraQ2x9iWJhNt8J+OwbWkUwZz6TfgZtLOZbL5CzPuMeXYT0/Y3vRG/wpbb8b
	PM0XydW4JoF4enn8uEgUpF4GwyW0sWBw9ZIGBrWlAm2DltwzaMtenO2gZvFXM3Rq03u4b2khyv2
	/xTLvlVZ/DyQielck1fxN2LCNu9j7I1cEj6H39JOgyjaafD63C3hfbd/l8APCCV2t1PUNqMN1Zn
	1vHEs86E0MRwNcGhGrhC4SkrXaVKGKU5aXoCaN18JcshiGIbKw2U5lMbm6upe32+zPx/kZKnjg9
	U1jJ6nz7WQIIasFwEFpThDQq6kES/WDt39IWbw2A=
X-Received: by 2002:a17:906:9555:b0:c50:52b5:e17 with SMTP id
 a640c23a62f3a-c513a5e1d53mr819834666b.13.1795449816568; Mon, 23 Nov 2026
 08:03:36 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122131900.2951586-3-a.shimko.dev@gmail.com> <179543998153.3135.2533998901272176773@kernel.org>
In-Reply-To: <179543998153.3135.2533998901272176773@kernel.org>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Mon, 23 Nov 2026 19:03:25 +0300
X-Gm-Features: Aa3M54qYkFzn2AliFXf9fRcB52n5j1nfOYqfcsg4MxuHxjWphZmjYJahIu9j42A
Message-ID: <CAOPX745BjECumVGmNOg3HqagFVz=Bcz=x8-shzjyGjHmN8+NSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/3] dt-bindings: net: dptel,dap8211r: add LED nodes
To: netdev-bot+sashiko@kernel.org
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:19=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The new `leds` block in
>   Documentation/devicetree/bindings/net/dptel,dap8211r.yaml mostly=E2=80=
=A6
>
> --
>
> dt-bindings: net: dptel,dap8211r: add LED nodes
>
> This commit documents an optional leds node in the DAP8211R PHY binding.
> The PHY has three LED outputs, and each can be given a color, a function
> and a default trigger. The commit also adds an example with two LED nodes=
.
>
> > diff --git a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml =
b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > index 4cd0f9730d954..772329feda059 100644
> > --- a/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
> > +++ b/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
>
> [ ... ]
>
> > @@ -45,10 +46,40 @@ properties:
> >      maximum: 2250
> >      default: 1950
> >
> > +  leds:
> > +    type: object
> > +
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
> > +
> > +        $ref: /schemas/leds/common.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            items:
> > +              maximum: 2
> > +
> > +    additionalProperties: false
> > +
>
> [Severity: Low]
> This isn't a bug, but does most of this block need to be here? The bindin=
g
> already gets a leds definition from allOf: - $ref: ethernet-phy.yaml#:
>
> Documentation/devicetree/bindings/net/ethernet-phy.yaml:
>   leds:
>     type: object
>
>     properties:
>       '#address-cells':
>         const: 1
>
>       '#size-cells':
>         const: 0
>
>     patternProperties:
>       '^led@[a-f0-9]+$':
>         $ref: /schemas/leds/common.yaml#
>         ...
>         required:
>           - reg
>
>         unevaluatedProperties: false
>
>     additionalProperties: false
>
> Most of the new block repeats ethernet-phy.yaml: the type: object keys, t=
he
> cell constraints, the common.yaml $ref and unevaluatedProperties: false.
>
> Only two constraints are new. The '^led@[0-2]$' node name pattern, combin=
ed
> with the local additionalProperties: false, rejects led@3 and above. The
> reg items maximum of 2 limits the LED index.
>
> Could the block be cut down to just the constraints that limit the PHY to
> three LEDs?

ok, i'll fix it.

> The commit message also says:
>
>   Document the optional "leds" node supported by the DAP8211R PHY.
>
> Before this patch, a leds node with LED children already passed validatio=
n
> for this PHY through ethernet-phy.yaml. Would it be clearer for the messa=
ge
> to say that the change limits the LED nodes to indices 0-2?

I'll keep the current wording for now, since
the message describes what the patch does (adds LED nodes and an
example) and the restriction to 0..2 is visible in the diff itself.
If the maintainers prefer a different wording, i'll adjust in a
follow-up.

--
Best regards,
artem
