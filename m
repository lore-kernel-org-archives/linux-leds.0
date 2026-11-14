Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794662234;
	b=tz1/vqliZrr5MLxhWfsDZUe6ECGCowwlUR36fj0CIxLk60V9PTuiHNM26+JO+Ig/9oC+
	 P64btqMgTbUe82h4/F0rs11tZ4IghbWSd8njlfuryREw5tSMdhzlOYyOBSWa8cDt5qGLs
	 +ntKAQ5RIr2Okt3JPNfOQMmXhA8rSGZ3I/PaZWoAYY+cBgKvuejYmaDRIDHWoGbm2PrU+
	 d6zmtSimiTlhUNleQoUZXSVB0aCEChMl4LEPwcZyLBOxXn0yaj/64TZvxj1ONpq8Kk6iw
	 I4CPoExY9wU6/DY5HfBIcj9Be1GRWETcTq6/a5cDw+3vxpKUS3zSZAlu7Rt1ohGl1dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
	b=dhFlEYdmFS4rUWCRTnlpms57J1YFQWZ9ye92Y8rpOVEewt7zOYrY0xh1b9Duxn0HhDsV
	 pae+nks5LWkU27p0e4pcqp2OcFTya65niX9dgk7mogowRYebn7CipFudToNQJAhTt27b8
	 LcHrtAuhxUi+Rg7H2tfoFvjmlXjLaz/FgY1MSO5wg8UdZHP9Kl/p2oDugBjmGLbYwLVPk
	 7fwRjqDD7zQD0cAfzAY4llxITzKBUjGOVKhmDrXMA4m5iv6bTeo3ncaThgrQIwdzTW7x/
	 VldLcF1OER2KyHLlgG0eXjXZNjxx/C+4qtQcJoOaR8BEEl8ym60u5xOo+o++phGCyRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA16606B0E8
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 13:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA16606B0E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkBiYsFf
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d28f75d62so422887166b.0
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 05:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794662233; cv=none;
        d=google.com; s=arc-20260327;
        b=T/CUYSF0TWuoC9lWSHwil9Do8ta0WsAtVomFcHQImXY5JWJi9VGMheHtp6QBTc7chR
         IdzZx9zodmmzd6AJnjgScwsqjVWOeGd7/srB1y8eioQSYaGqDXJuTVj9eKYHbHGugj8a
         BXcHMHE5ZtYIHE0F8ADQmE+xTI8qHcfujhGYtn+tdW0ERF0g2FGrtoccfdF6YaPUe9WT
         wpVzWqlA7qNDmI3uNZ4KNBCWDguVOen7OGl6RebTRhiiSu2VRIv/1UB62qsR/L/i+tJN
         jstb6DAAZXYyuU2auVEXJ5EGZBbWDtj48R/r1YhyWOHhhl8ryuHQS/w8dBmZ2z3zawx9
         3pHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        fh=qkPJW2bMLeWoIrymdj9F5PKC7m7k+Ziti572tZOdlpU=;
        b=HxOkoW9LvPhuw7DW/hg58nAHvJy+GUhRi341u0h4DMWEKyQAU1iMiNjI6A5OA4XQv3
         AdE9OreKf8gQBtCbCgd2qV2uBsSLckPSmMGFIsDfhJX0LImundFsE09QA93em28CRtKr
         e2fzgTLYYOniXQ7kMsNdA5R3ztvnXyuCk8hgw5NZQ/w1shwmtz7JCpOSCHQ42k/7RaN3
         mzHz6gTQiJOBuYwppspz6UUGlo2Sr5hbbP9MSdDmMRXzK+frGADazAHYRIz891kAVVIb
         zS4gnlEhYEs3S8hv1b5FA4P1KxXKgiHvjfCD2X9hT/3CNc+mFl93OcAIMA6L+D2sbQH4
         7fIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794662233; x=1795267033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=bkBiYsFfmEtp7IJKvH7hEn7KTFWusZlaAuAdlpmYXF803sUqFCC1KYxa9tyrf34zN1
         XEF5zkbgkyIS48qvP5a5GB3ex7t7UtUZYJboxL0XL4tLGHUYaONVZb6rUO8eATYZ1QXL
         8+UQQA+DM8uDBp6Hk2hDrEFaQbRoNXoI4sdU/oLAIoBHSwdiO0Ay272h0WfUXQYhiEyJ
         e2QaMbc1FuXjzS/yNEbZqG1YlIpj/OsymtVLBErLFBFscJ/L9ut44gQSUhbnqudxfjKt
         sK7WJvoJ/AvY0cJmbn/C2ArMEwRPABus1HpWmclIlurEsjmpX9yiYldYqDoxhrn8mpyz
         4Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794662233; x=1795267033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITM4+BMzeI3EvIOixDqTXlM4tReFquWP1v2DgL7ZSL4=;
        b=SVgbje1LTNvwS/riN7lfk7cWFrs9cl2rcf2MpAXx9PyiaSiji3m68Oy3h5+BVFmQBE
         J9pTw0EIUaSl3YDtkCvNX+WymfkAGsnZE9Ix8euLvUiYSkSy19bHVH1W5gnUpBver9z3
         gnIQ6Yo0WwuLiwwXqGC/D4QFowqFXBzCDGYhNPsGiiUZ5W1tlnhQFX1yLQiHnrUsPuIR
         iYozw0tsvD8zkIAoXB430Hj+XoPmGj7z9NkdhIMAYmT7MwPFTokI7HZnNYcJ6oUovpmB
         v1//jHU73cxXoPKj9vykBrQDv78UzDqssSMhJ9LdjfnOB4m23AQOgH3uzNH0e1o/aBy4
         OCQQ==
X-Forwarded-Encrypted: i=1; AL+hErHhaFCTWpoyYe98Mg2oA9G2geSllsqBLPdiYGhSoUy3IQwm7NpndG6UeYhhHro0AsrmH32bzTHjjjza@vger.kernel.org
X-Gm-Message-State: APuU4Z+H4Bkjcd4YwDp1m62elwAZ+VO2jEiMd2jDS/DkrKklG9oizs7j
	KLynjklVUjjnD2j6P2NppnabdTeAi7354KXVXULD2eBoCMC3ZeDWgH0gRQd44BUISToPt3s09Mc
	BgQM0VLLSZmF9cceRW028BmCpFHMKFVA=
X-Gm-Gg: AYBFou2gpN5+XkHovNKKe91wPBNJ7i+0UO2tY2N3AgLPKAYKhPUCx5m7j6dYW7GLVrp
	+Hx/r3rL/yYJ/7mU97WggysjRNWLVTernUnD+lfpBosEzA2E5g1gywvxHO13k7+bcCuPPmJYw64
	rZKXlCfUsJdwE+EAhDX242jK3PnVwREmBVrkwVsBgvyYbp+/fqMMi6Ksqwmt564Nr+6EqKxC62m
	zlyXfDDNFlhRVTa1DUOotvV1taqM/G24NJoyBoVFaXSgMU9OqDkFYcdJ604/dpY+awpILbMOrh6
	LW7dsSIN/soLzG3ArrlKyWfosYorN7H3Pn8aj/DwhnVw41a3Pce22w5fBybxJMv4sukTQ0+FLo4
	9nhOTzamRNeldwGOWdzOdABIRfLOSndMbWDAOQg==
X-Received: by 2002:a17:906:dc91:b0:c50:5a93:3bd7 with SMTP id
 a640c23a62f3a-c509614d52cmr448037466b.3.1794662232406; Sat, 14 Nov 2026
 05:17:12 -0800 (PST)
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-2-a.shimko.dev@gmail.com> <20261113-good-renovator-99924ca0d55b@spud>
In-Reply-To: <20261113-good-renovator-99924ca0d55b@spud>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:17:01 +0300
X-Gm-Features: AclHuK8rhFfFvkBwbKflVQt0QnoMak0rCeWcBpwf3o6KE4ySn9wUi4t5_Sc9CCY
Message-ID: <CAOPX74613tpMONAYkvY+6=UqDtJ7h8r8FmHmnodmNZ3Zi3RBbw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dptel,dap8211r: add led nodes
To: Conor Dooley <conor@kernel.org>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	maxime.chevallier@bootlin.com, pavel@ucw.cz, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-leds@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Fri, Nov 13, 2026 at 8:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> > +  leds:
> > +    type: object
> > +    description:
> > +      Optional node describing the three configurable LEDs of the PHY.
> > +      Each LED can be assigned a color, function and default trigger
> > +      (e.g. "netdev" for link/activity indication).
>
> Please add some blank lines here,
>
> > +    patternProperties:
> > +      '^led@[0-2]$':
> > +        type: object
>
> here,
>
> > +        properties:
> > +          reg:
> > +            maxItems: 1
>
> here,
>
> > +        required:
> > +          - reg
>
> and here.
>
> > +        additionalProperties: true
>
> This whole leds node needs to go down below tx-internal-delay-ps, child
> nodes are typically sorted after regular properties.
>
> pw-bot: changes-requested

Thank you for your review, i'll all of the above.

Best regards,
artem
