Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A5368D4B
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733541; cv=pass; b=uyo4VU8FRdCYSJHdkA+Q9/pqdp3ZpnOz4JB/rPLKijn1KoLXkKkC2agcC7JaHNuXbKrcJqNhVkXXbjmuLxwwrGyAFOhaS0wHicban3hhbnV6BXNMDaFAUKtxz0XQFAmb+Ig8h8HXh+tfe6ifBRTC5SaZ6y0l17gSOTsBsGlY8ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733541; c=relaxed/simple;
	bh=+G5Wylw68XgNtH6D5xVeqvnZZP1BRSsmctqG/RsT6eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcXy3hE4Cn7eP4+wLElN7Fy/G8bU+UA5x+7EjltK/HDj51zQGikmpZed5cbrzZECX431fQ4Lz2EQzWYC+1w4dd6z8U9IN37rAtJ+142/3pQ9FVqe0N0Saj8dQBHmNn5xCO9iCJBbspBFpdA1zRU5eeaYqIl1NIrY08KVnMtPZAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsfkehf2; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsfkehf2"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15d47266baso1152234166b.3
        for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 08:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784733538; cv=none;
        d=google.com; s=arc-20260327;
        b=rL554TTEbVW4nTr30pX7StAX2491yXCb1jVKtfBcE8OVeNL5OATjJ9HISxpZJyV7q7
         jbqdKYJPuEcV3qMPVYa16tgAax3s8VWknS2H6MVdyXW8HpkZVFKOCGFpWFjStakbiCGx
         Wax1heCZGbRXjcKXtzDCWA+y+DK11xbKcdZL9unZSib+vXWn1SN1zghj3dhSmOkhq7Kp
         KS1A3eGZy4NIa3qu/lauqK1snlGtKP1iukn6vANLoJlkIvuo5B4PFpY7NCKRu4BZ//Sb
         0ycUQ8shgrpLBRGHFefQMShBF62Tq7yPhvo8PYv+M14TZc4SiIg84t1PFL4mJLAyl0iN
         pmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=i1afpsh2OIvkZaaChULugvD8FxciERHSKG0pHwByaWw=;
        fh=8oetVBM6+yiib9RoAty9ebA+kWZBSVblzfJ7FHk0f2g=;
        b=pO0E0lGp0qqlvPu/AWaRQUwv5izgivIServTAIzUhzwXI81FqHoAWwHMkf/O7mZ0bB
         rAqHeDqXcKbgD/5uWM/O61Gmr4y0Opdy1dCGpuQtb+ol8UsuSsbTubPEcLr0onwZ2aWo
         jBZEhozW2pJ0gikXeFDzYL3AjjIRDYXC/lISXCE4yFl4yAY/GFHyjQQMlU4fKadRLrHv
         MJIJU8M8BBsanslXezZaa6Q/59oCLNZBfnSbNBP/G2MBjSLkE0pP7GMyLPvPcimXYLG1
         cMtL0GIIZh2R+FGOrFEoUen6mEI49+fkbzdLrgasFRp+drATOuXXP60rMWMCTPSr8kEn
         GY0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784733538; x=1785338338; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1afpsh2OIvkZaaChULugvD8FxciERHSKG0pHwByaWw=;
        b=dsfkehf2gRTOmYGTA6noprbWgxhtuUvNh9D8a+5KkfbXWpWrlEEeSDEikbPJDmQnEf
         A5ubEifvCH/ISxKZf8WcPRyVfvl6+zssPCWUB3Prdret+KeZFqD1T4O9xq92ql7mKr/U
         JVet+r1zvGU7nKHuFf8HZHSTaw2FybLRbksdIJXoa+RkwNYC+Y8lslKiYvcDfdpHnmsy
         dJRQhfanfoJGcnxHHyNSHqQyEo65U9uqIVCWKarPVlwE1fpVA6aZ+hZZefRZtgdMrQyW
         nrjR3s6Y2pSgN7Q/JpOU5P/BX0XYtzH12m7uMipXFSFc7t/vNHGE29tY/OFi1PCO1zTv
         teSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733538; x=1785338338;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i1afpsh2OIvkZaaChULugvD8FxciERHSKG0pHwByaWw=;
        b=VyliFsfwhzCPsyT3CI1WFcSmscHUi1Lu80BLQy3fqRyhGGsL5NBt7m8LQrYjo8tcQ0
         cH2PDq5HIajBMcOEsDyKJpjXqJh9yiFixn3pQ5LlOxF2YudtVWngwqme4L9eYmrnr2up
         7ElUe8PLzRHG6Xpm66vqGvjSvKlAPC1EAW8FDBzuC2qloLWRyNwYc1YtqBpM4iHKa6hX
         mITxqilcn+fEMW+XhXHgmj0hU7udfr87DDYRTaDsJ+cYbK2Y2VX6yXh8hx1jrwYwTZDS
         lntrsrmmc6lj92FGkBmo2wBib+L5AYgPjNMbXY6FgUNTs+lRcbO3OBAVJY0+AXmfEskn
         nfcA==
X-Forwarded-Encrypted: i=1; AHgh+RpIMRBrV2udc50sgM/XRxcNFGAA/Id4xqgegb8M0Jk117Pj/Dpp4Qf43RnQnlCqvvZJE70bWNRUYhD1@vger.kernel.org
X-Gm-Message-State: AOJu0YyvcT1mSnVlaHeoXNaQzFhHNz1xLpDsvpDd1t1RTiqipI9x48Dh
	pGITjlw+tQ7rM6PekEZK1azXZG/Vais1hcqZBJ/3Ae08L9DrOEqmPgtCbYPQOeb/RYgRKOsFbTN
	zW4m0Kh944hcURMTbyni6d/dhKd3pyRc=
X-Gm-Gg: AR+sD10q9iEZWtYRh7ySDSn5qNc1nQ+lfMwVcbHbGwXsnX4jqjaG8/8me/88g9VcRAf
	hdo0CdJvjDM5fL8gGsSxCKcQ+Sf3kqkCpKifwg3f0vXFMITWWyNMItP9qP6GAKTYeys4eEXtruE
	FcJtoCjPoH8ADhXmKbRYyLhGdcgVkf4uoKxOrftPAtJ2ENM6RRXBOjHy0Hp/NmaPDGD6kehGzSu
	oTUk76+tl8B6Mrri5qS074USnD87JGt1uMh24A5zhAMd00UTpu9Cmmr87hfmXUsO0DpTaYrpxDR
	yCBnZ2L0jvN+2mCuGR8hVLqp9WljwBBO9saXbjVDT94Ltpqz26hN
X-Received: by 2002:a17:907:388c:b0:c16:945:97f0 with SMTP id
 a640c23a62f3a-c16b48533femr836839366b.39.1784733538115; Wed, 22 Jul 2026
 08:18:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721112133.70382-1-egbostina@gmail.com> <20260721112133.70382-5-egbostina@gmail.com>
 <20260722-ochre-alpaca-of-tact-ef17e3@quoll>
In-Reply-To: <20260722-ochre-alpaca-of-tact-ef17e3@quoll>
From: Eduard Bostina <egbostina@gmail.com>
Date: Wed, 22 Jul 2026 18:18:46 +0300
X-Gm-Features: AUfX_mxRkciUP9PmKB_Sf5WpXXnp_jwGYivbso-yHbHHBjEP1jiN3c0a8MRq-10
Message-ID: <CAEFOc610_15k2z-kCtuKkH3M3_ugE6uotvh+=oiYe560UOW=Ow@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: leds: backlight: Convert TPS65217 to
 DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Thompson <danielt@kernel.org>, devicetree@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, dri-devel@lists.freedesktop.org, 
	Jingoo Han <jingoohan1@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-omap@vger.kernel.org, Mark Jackson <mpfj@newflow.co.uk>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, daniel.baluta@nxp.com, simona.toaca@nxp.com, 
	goledhruva@gmail.com, m-chawdhry@ti.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 22, 2026 at 10:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, Jul 21, 2026 at 11:21:28AM +0000, Eduard Bostina wrote:
> > Convert the Texas Instruments TPS65217 bindings to DT schema.
> >
> > During the conversion, the following updates were made:
> > - Documented the 'regulators', 'charger' and 'pwrbutton' child nodes,
> >   which are used by the boards but were missing from the old txt
> >   binding.
> > - Documented the 'interrupts', 'interrupt-controller', '#interrupt-cells'
> >   and 'ti,pmic-shutdown-controller' properties, which are used by the
> >   am335x boards and read by the driver.
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> >  .../bindings/leds/backlight/ti,tps65217.yaml  | 170 ++++++++++++++++++
> >  .../leds/backlight/tps65217-backlight.txt     |  27 ---
>
> Biinding looks fine to me, but as pointed out you missed to remove old
> TXT binding.
>
> Best regards,
> Krzysztof
>

Thanks. Will send v4 that removes regulator/tps65217.txt as well.
Should I move the binding to another place (mfd/ or regulator/ as
suggested)? leds/backlight/ is arguably wrong now that the schema
describes the whole pmic.

Eduard
