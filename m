Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696A41611D
	for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 14:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556454; cv=pass; b=bhOu55KKEFDHxd3xwn7BpLI3gx5RnUpC7FYel0+0iLEFDl9zbCowu5L8bNyTZefiQI/dQLl0IEZZdTjItZj4Nb9Hup7QErvisp84YdHfQ295VSMGV9OBaf5zxAtxHMyKpH2dJ1f0h/7WzJ4EJtTGjKgP68EuWzxG4HwIjaxnefU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556454; c=relaxed/simple;
	bh=r6n4V8oTIiF6Cc2yyAdGZUbNGGVL2QpLuXftiOlSQEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrhirQw42XWEmSxoO3wSK7Ip8xzjmwaJqM0LhlU1PG7laW4afs3aRh6afaMJAWt/UrKA1BxzZarMNTBkIHftAu84V1PBSN/83g2FteNgy2fU734JT2oYAcWkx4YooN4p0Z1zzPGbBQD2QT6ITXU+HzVXDWzT9PuD/ot60aCTRLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2MgLzQt; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2MgLzQt"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69e7a5b61e4so3399597a12.2
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 07:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784556451; cv=none;
        d=google.com; s=arc-20260327;
        b=o/PHuA+dSWyz+odfE2ZM/165TiWOqOm+ZQ9ex343Z/54aZS/AHBvb3Kyz2GiE9Kip2
         ylU4Jyb3J2ytwWV+9eHw6QU2EtkF8ihGRbSpk43rhfNqwmOXX9NOrDxqANj/Ps8SojkA
         CQieFj8XzO+mVW8YD3kf5G5x2zTTy4U/6Q2uPaQG2zRxONmO3edh3jmVUEsoSE6sawws
         8wixE9qxnB6GI9FYLSF7q6JPOcXOZX8w+k6z/a8utChQMdhSOopak6qSMs6rsIXExW29
         lVWlap27Tyb8N4H1xzzzlDbZAUEvxOodmaHSr74mnT9HUdO4EkwXw9Umg4ne1PMxsUtF
         b13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t6aKvIAiL2N7RKSpb432cnl3pylXzPZaT0UMOHNdrnY=;
        fh=UcO5vrlumX7GOECC/yyN5UPTXy4eHnhEXXADPDOIQKY=;
        b=l4k9vqGXWkjG3C2jvF7ohRw1g8a9bdv6FW8KyY0evP6KrtyVNamN/HL6s0ta2zOpXI
         8LPo6ffeI2j8HsVzhHNFIyz0sApTcw+MHRqahiL8BarHBXmRCqnhkukGiJMVSNUrsn1F
         l4ilmccQUChVFcRokoGc9+yppO1eRNBNYWJ+eEzrqIeUfQTocOAuRRTBEilZKcjcc0JG
         A0LXzvhLTGYTBWVfj8CdsMfR5qZzSgzxE6JVG0EEMjL20m1rjIgGDCPzAXcVXtBuyPV2
         7fUOQQbK9XtrLkJE+p/MqBMKN7rv4YuMYpovFAjIwPk6ama8GUY3D2fVBobSEdzdO3um
         6RcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784556451; x=1785161251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6aKvIAiL2N7RKSpb432cnl3pylXzPZaT0UMOHNdrnY=;
        b=a2MgLzQt3CGzGz5eMCYyv46AMhuVNalm1K4dR3Xeg9zOQXopfu28uSd3Dn1MyG+UDY
         LYpOHmPxBsoaN8546q6TXqs+nKWL18NMO3lr2Bupq5pBlbbYXDpur9PaRE1q9w9pPM6K
         AEW3veYlo92OAzIkA6CO/Gr94w4wDHO+jtBaD3tVY1cIG2MW62IEUP3MVFUI/xLQnpDr
         tSMJ1bDo2L7hwBKlwSJuasLfXQFZ5UZ7RdrND7BAzm4QXHB+LVZ/5QEAwP+mI8qnke1N
         /2OoDp7r6SV/+olx+3tY3o11kmS7Ndwsg3xoH8M3sT+Gu4eqZwkWQTwh8ZADyrwc4VAa
         gTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556451; x=1785161251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6aKvIAiL2N7RKSpb432cnl3pylXzPZaT0UMOHNdrnY=;
        b=tM/Cz27qi7iqzZ78WeoNcaCdu0i0gZLrjgAD5ML2RdFxoebH3bSXhnVBvxoxKU2oDq
         fOliAxTD5dltJtZwn6Vm5g67NrrtKNCyMtILUUrf139qrHBjH+I2OXnIhfhiuI1YODrD
         IayUsCaH6SDNWZxXZmdCXIDgmIbRO4HEfSm503iVp1uf8llKzQac4pgPsuTpE3b8hDrQ
         BkiilU+1wGfuFb420HBLP0fPV2hTMi4svnj9QabPXmG+DS8vAohGA/s083WR0hDI1AoY
         iZtDUFtsXvAKdAq7jInGDm1wD3ip73Edv1Xkcmp4y7QMfOW/kA9ATWc3HUBsoP0BTIFQ
         E/0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr+AsCXOHRH90C16wyyL/bYPa/GDURxqXui0e6Vi9HIvShZAZcZvCewqokcBxR99VEfsPLMdEGQcO1F@vger.kernel.org
X-Gm-Message-State: AOJu0YxBNMQmpVc3xk7O9UudXjplFrVbWc57JzK2j/LpsWU6rQrBEZH9
	9YxiONBOV4CBJR0Zhw7EIneTm//m+77kUKidNeKWMyhkeEhe3hA4TFv3Uix0e56nRUT8mWPHUby
	sSXb/yXCADFer+3MrG4J0cgIiCO1Cpys=
X-Gm-Gg: AfdE7cmzeZrYZBvvtfmvwaHyr2DLovOG8UYKguW2PzmmzuuEeUaaVICHHkkFe1h8EYF
	1EYGSkJVq5EAquXYzWs4zLTqcTlVaDWq5Uk2d4K6mLul3p9u4ZdUZndmgpVx7d4tt10p/6uUQcS
	aXXjjsXjpTFbLZC4yDmRSr80yUk72p+ydZHa7kImeR6UfxO3l0GrSC4gl8lKBcbo6sxSIIHoFZQ
	Y/4pX/y7+hBps308f7p6Zw3YJTWczrE69lwlgTs/3a3MS7KjOV7/I7dQogHN1ZkH9ul49VuTXAh
	ZyIZDkPCxT3NpgISvlvadW2c5RPsEv1MaKGFsVSzo+gsW4FBFAJK
X-Received: by 2002:a17:907:c012:b0:c15:c3bb:c90a with SMTP id
 a640c23a62f3a-c16b47c7292mr550030766b.35.1784556450739; Mon, 20 Jul 2026
 07:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718215632.3295049-1-egbostina@gmail.com> <20260718215632.3295049-4-egbostina@gmail.com>
 <20260720-huge-sturgeon-from-shambhala-a1bdcf@quoll>
In-Reply-To: <20260720-huge-sturgeon-from-shambhala-a1bdcf@quoll>
From: Eddie <egbostina@gmail.com>
Date: Mon, 20 Jul 2026 17:07:19 +0300
X-Gm-Features: AUfX_mweWNBqk7caXjK50S4Mh9MQkC1xza8VdHGojIe6ULgydOnDi9gkyNgr6GE
Message-ID: <CAEFOc61Tan85xQhz33BuGSnJHyACvjRc+6YMFYav85CzxMwiwA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: leds: backlight: Convert TPS65217 to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Thompson <danielt@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, dri-devel@lists.freedesktop.org, 
	Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-omap@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, 
	m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 09:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sat, Jul 18, 2026 at 09:56:32PM +0000, Eduard Bostina wrote:
>  +
> > +          regulator-compatible:
> > +            $ref: /schemas/types.yaml#/definitions/string
>
> You should not need this property, it is already in regulator.yaml.

I did not find it in regulator.yaml, or in any other schema, but I
found out that it has been deprecated in 2012 by commit 13511def87b9
("regulator: deprecate regulator-compatible DT property") and was
never carried over during the conversion.

I agree it should not be in a new binding, so I will drop it.

It needs a dts change too, tps65217.dtsi names the children
regulator@0..regulator@6, while the driver matches dcdc1, dcdc2,
dcdc3, ldo1=E2=80=A6ldo4. of_regulator_match() looks at regulator-compatibl=
e
first and falls back to the node name, so without the property nothing
matches and the regulators stop probing.

So I will rename the nodes to dcdc1..ldo4 and drop
regulator-compatible, reg and the address cells.
I will send that as a separate patch in v3 along with the other fixes.

Thanks,
Eduard
