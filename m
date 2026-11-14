Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794663446;
	b=MWPApFwWwRFb7En6D2ELKjUVYY9sZhul4JMKzMJuRuNgkHjmeBgkmRV7sY4luaSN5WGU
	 9OlWxHKjMPU7XGq3EaszgyMN2Xfv3kS9vHeP5bvEhHlinZbOC/T7WmQEvS+UZ6EdrCB2m
	 bGA5EmSoiy9ErVOSea7dL+UhlQNlG1yCr8rTOJZvSiQgzlGUzvpo4ggmsv3t/2V+/fEEu
	 vFxH4mo1ynUOfyZiPwLjKZ2kWdJ+uvx6Vi4GbFzHJ77s/OtnZR1amSSOeJWTk87OViI/3
	 1VDydXzoDwdG1QHfkd/Lx/hJ+88qAiUpdRNz9QjlhAueH/myDO5MY4Qd/uYgWB0OkmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
	b=uNPGRmd77bFuYFdAkwwF+vlQNqCAxyuJ23aNV2RYTeYrU8S4tZ2r0ncz0Cj2SBZ9ps99
	 Ih3OEmcws/KOMppcDK8lv/ZPrDobyXcoGWPDi0m3zj8zWgz1ccrBaOuKDnMma/G8tK2Fx
	 anmMhZv885BZNe+62T84Z13oJiDGvcrvsYQdlfgCmXAu+68F/v9r0FrRng1leE0/Zh6RD
	 +VQcV6Lbbpdv3q7DSV4+t33G4TWI4O94eyNNmonIVvxS+VRpRrWK2cCwmhr5XRfWh7z7f
	 ztjUDLEDt3+ft7qiYVZBv4nAZ8JjCXy9/1D97amfPPfvY2frpj0p1SY/ccNXjcYSMlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1437606A330
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 13:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1437606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso329040966b.3
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 05:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794663444; cv=none;
        d=google.com; s=arc-20260327;
        b=aOjsTUg3Ct6TZV/bvlDXS2RUBWgPPK4RcxN3KOEQ1LixSW9mD1GXqpORKiScabQC/k
         cLjnj/C34zvZnwJfkt8y0h2mynhODc6fM4D86f9RXwInExluEoYfldXH4R+NiDHypvAW
         +s0A80oGD/xTdN86At3yHhgNFNqmvQvmSXHXHHNMWEBCyYVtu12YeYtjiI6o5QZecV7+
         Z2TvfVEFbxEK3exdoUed90ksobblwlwp4ypwQHJwwkd2zbgrCKwDTz7jw2SaoERyRbLZ
         TDpcAgyhdNOmlEADQcBQEC/yZHXC8yh96EFYV1U+D+gilmpdpKE6OpmrYtIUmx6czo1p
         gzpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        fh=noNKBNRylU9t7E058f7gAN8v7B7BGib0TfQmd32KOY8=;
        b=Vl3hTWZ4JNhHtBzViYxLceucWkEM2xciXT60gjl4tE1GzJ3wSDSjAkeDy7LmTPVYxQ
         hQnxmfOW/Zh/HyLURtsXokx+xb1hOkS+wOc9juWdA9NYbEJS6o1mGzbOLZ9Mt55rp336
         vDziuGD90LKPAE7cVPQt5EQdq9zyXeTQMsoPE6ed+m35eFvvZTGxAiNyPgxmYIv/Onnz
         8VHLo/uO0uHrnI5XO04dQI14ywNOTZqG50kxXwwGAq+K9GQWG5u4Ib4NY0kpiDSYS07q
         eCOOCxGsM1Apno1zTOoUG4+2RvguQwROsiNN1P0t2f/BRnnUy6NqbJqWFI2n2JoNVcyg
         zymw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794663444; x=1795268244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=V0DVzrQ3UtNS2CGItTaibnG4J77tS7qMIR3c3C2ZUlh81GURnIp8X/IHvzSGRyT9ls
         zjvCcMSGfVsCr6PaYL7s/vQfBw5Mif7+7tUD0srSf73nlG5orBcEr38slNFK3s40BEI2
         7P3tnLj21L2r9iq1fBalGmh9cWBfRaIGzosEYay/i4E+/pcIFFHj2aP00nst0S6qHd6J
         o/X6UWXAn5i2xjeOmvPTXT6Ku4VxLGqH9IukfZrHdwmQeffXKQ1EEEj4+Y8Ud/51mgzP
         hYSzzU0nDdx3vWOvn6HCLUOcY6VNwAbS3mh+1q0boLKaBCkOkU/W8ctopAqNAKKW/Jrn
         WAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663444; x=1795268244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=wyycVEKrPETMlJe+fwBoJR5mozx6mvt8/WFvYqOBe2ycVmxXs19bl8XLPpQxDymjFP
         mAdt41yeIdQWr3wk/8fJjRIb4tDSoVjZjyANjVnVpHw4U3VkYYAXXI2lbttn/AyO+wsI
         QA5o8AoNnLLh8OdqoKG/fBs9zALuoisaBveTsEysJudCblAT/prErkdhmYT4mMK53XRH
         dNbe2ykzET6byRwslcxHC0LZ+jADmJQl38zO8vczSHgUev/rPTQkcBA/OAaALGpaGv7L
         lkTPCnxLqucdoAjQFdvEJ2mMsIrmid7BUg1i2CAa8ZsKlmn7+n9vgSWN6gqIJ+/TSdKN
         71fQ==
X-Forwarded-Encrypted: i=1; AL+hErGU1Uo/E4lKzjRug8AFwpR5qDh3S8j+HDx/+vyCCRHnTfzUDlVAuNWZOp5JAuIe5/zCMMXvh0szbSRn@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jun1IcbN8S/KqXnZHbPU+FvhC6K/fhLvp3knWi0+02oJbQtVR
	IIk/eSjqgxQ9VObMKsHduaFaIBGLnWf68up9VXYTAJUrF5jhJTZlOven61GV7ZefSVaF2oE0jxc
	qITIbel+Q+64ky36AUyYIgE2OIaxXEt0=
X-Gm-Gg: AYBFou2ugzetVfCV1AxkaKyuvweqKQhap/rPF6BRWV2XX+ch2sQnZG8cf6e8wFFwyeS
	HxDcKzrPZK4wtOqaC35MafqNOYoarRsVAd6Urb93N8bRhh0L8ETbFnbkym0/5UyJ664GQVXDpV6
	2WurqPA8a9TWSkOoW4y9O+eUOL8M/RRFGD2McHTmM/7UgO4ud7jtbFkpsC7TKnoeETiC4aTP1B2
	/YqoQg/UuIBokalONv6hegln5yugkH4PXttb3v8Z5+g8tvA+unroEnJeV9waamY8mxfgrRVZ31I
	yrRGrDl+6WaUUsXcofGkZdKb1HTgSjJJJvqYY+J94wNQl8/t5cfKB2D5Qh/+N8zIi2QtbwwJYmu
	FsPyq+p0Si5FDFfzVduFEVldlSlg7eJ7EaEnVqw==
X-Received: by 2002:a17:907:3e1f:b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c5095db45d8mr475395466b.0.1794663443789; Sat, 14 Nov 2026
 05:37:23 -0800 (PST)
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
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
In-Reply-To: <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:37:12 +0300
X-Gm-Features: AclHuK8XI7bnok_ObDtOfMHWf2vbfB49mnYymQ3JtOPklAmq8NLX7LejygF9N-8
Message-ID: <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +#define DAP8211R_LED_ACT_BLINK               BIT(13)
> > +#define DAP8211R_LED_FULL_DUPLEX     BIT(12)
> > +#define DAP8211R_LED_HALF_DUPLEX     BIT(11)
> > +#define DAP8211R_LED_TX                      BIT(10)
> > +#define DAP8211R_LED_RX                      BIT(9)
> > +#define DAP8211R_LED_LINK_1000               BIT(6)
> > +#define DAP8211R_LED_LINK_100                BIT(5)
> > +#define DAP8211R_LED_LINK_10         BIT(4)
>
> Do any of these bits allow forced on/off?

These bits only control the indication of connection status, speed,
duplex mode, and activity.

The LED_COMCON register does include "force-on/force-off" bits,
but i have intentionally chosen not to use them here.
To be honest, i=E2=80=99m not yet convinced that they need to be added.

In any case, if you think they are needed, i'll add them.

> > +static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 =
index, unsigned long rules)
> > +{
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_1:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_2:
> > +             break;
>
> You can collapse case statements, without fallthrough, if there is no
> code.
>
> It is also possible to do:
>
> case DAP8211R_LED_ID_0..DAP8211R_LED_ID_2:

Agreed =3D)

Thank you for your review.

Best regards,
artem
