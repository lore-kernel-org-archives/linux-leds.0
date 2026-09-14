Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC1A49B210
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 17:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408700; cv=pass; b=RyAII961JcMVKZZSHzwegoevEvxUjQHgbOZKiqLGyuUqfiCBXD9kaxcS2gRjJH7wFh3RSxTZmULxhlhOfDo3UwPzGzswLIR07xXPuVoApTcX47uHeifqrvi3yqRwB87VUh4vTV9BFtzSET6ESVkKKu02TNGIdVGK2kkrGIWshCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408700; c=relaxed/simple;
	bh=MC6tVURhAg6t9rRXYll8+R5TEvwcrPn5tWtq6NstdZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kce7Pie0Qg/frNglNDFw79pcyfcJG5qy+GhpIHUuWTqRqaTnkh8aQrA7aRS+NVVYp0D/Zu3N9QEiM0I4VhcGYbmuOn+JXFBnbHgo31P06FHzIbzbHVnAEc1LlqfJ83mrOeVWvGlXobiMJgJVNztGPtMamY+ZtkLbIJ6T/sX9YOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBDIXb2C; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBDIXb2C"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-857ff9fef54so27797787b3.1
        for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 10:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789408697; cv=none;
        d=google.com; s=arc-20260327;
        b=cRBm5cQ/drHdu0m1DGsBA7sanVAONdTgGOIhPOwThpijxJVo83AmMkDqmwQeImNVq5
         5vVd4BIuk1dW9PUi+qcYCpVu8dy0tHQmTDuvlBFq8Xy36Ho+m13BdBJ0H9i/TSv7z+Qg
         zK8Ks8kBWHSkPupUTWh4u+Qx72IxW3B2XCmsQDtwQvmlYih4G9NboH8kNlfh3YrNHR7P
         FpB+Uz/2cn/Ypgi2iF/uUf6OlISReyKCb6AFfBQ7IYAUTtUJXE2yYpccrliQxos/mVmz
         Nu/3gUttbqeM4MPjNfhpcZIUjY8jv/uXJA/5zH8JwfN6U2L+gHY/pdv5gJ6w7QBF2zRM
         RXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        fh=dUzplaO48eInSqYLGl2JMofVv4dmwHokPHwm4/2TMZg=;
        b=jUTNMiO7r31SIDaPcB67z4SM4mjL2dz55IFG71aqXdcYK9UGaybSCRTrV3RELy9tRz
         qJ6keyte9bMdlx1miDLhRgKahDwsCjiggeUMtfSL8NYbfEYlvut8LKK5N3q4c+6hgf3d
         picp7TvSMVltJLeMC2+z184ztIkhiDdRZEvSAIiaAdgsFvoAT8H8dylx8OuFRh7V8Cd8
         wQ0j0rQPZaYYre5BKY3kZKDz/eNFzpKbFMJYp0ke84d+0N8H+jYufbHsvJPsO6o/3jFO
         eM1mTjE8ZP5tjtkhR8gits/fBb1CEcGUYiSNjSjmqj78yeo1p2gnPYT+t3PegFX2EhOU
         Oj/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789408697; x=1790013497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        b=WBDIXb2CzThvh/ReckI1zVvavMA1he7nL3wkYVtzY/weJ3J3T6cN+23Ixhe8GT93uJ
         qCAPeFHKzDaIt0efqo5g5vn/ek4/0ijzh5GlcPBmT8psoaTG6hlCcWZD30YOAZ+iGxpr
         NWOg63QOOI9c81vRrMLGBapGWMw+/i3RBFOgm+LWckTohVrRkrm+N+DMMrHHId8PbdjW
         iRo7tftaq2kh5GFEt3btorciKnWpVlCJS9nwnLhUbutXxWP4IEgrFkBjVE61EIxu4jCs
         4m840sYq/6TdnmvXOaTKbeFUa1DF3v85Pjwo/VQdnzaaAMKZVfPBamMVYrOAqc/HkzUI
         9Evg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408697; x=1790013497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEiMFdqpwxfwQBcEa3Am789Jv8ASUhNvQWowzRx8yBc=;
        b=MbKcc19YEigbOKsCYpeh45HaU+PryIOV5OE7VIpXucubO8sLLnDB59bK9Ui4Jj+1j6
         gRA/51ivmplK45tia5M0GFHeFrY3RKN+RCm0Z86XKb7530VCCqEzdPxT6kNZJqx+0BYH
         uBKVteW695K2k71wd0TSvjDHLsvAK5oabjKMUouY6hOwQwgDLxUrZBCcpN+TTQmr1FjT
         fS6HpOi0A1mFWmnA/AtVv4q9aCE5ktdrc76hlCB3TjrCXalOprwDInOaO1Ads0tZ5N4c
         gI9M/JzgExFUTcksyU+ayx10sw99x0JABAAZnHBca4KSy+0KU3kFTrvnGFtgjLGzDRNK
         +y4A==
X-Forwarded-Encrypted: i=1; AKwUvBzB9YSR9ZAqU+ULglTED7RiNNxaVRWNhQl5nuyINF4iR4NkPfbNYWimEpmNr4FCrqHhEoC0n5uTWYim@vger.kernel.org
X-Gm-Message-State: AFuF++ncg6C3lf/N4L+EQ3/9GaOsCiDsVMquTpTq9togovys5vUOqmI5
	aSK2Xsq5r+3C/8cn0+jHWeBgRN+ooezUHfmahdMlA69xoElwqpBPA6KRzY+VUkxRkq+bcekU5BC
	7AnbccsGs6/CaYtefNV/BjEVBixgFhCc=
X-Gm-Gg: AYBFou3hQ85xfu2ecwgCWbJ3W6Gnkv4qg9byfGVjnjjbJDgLybIrkh93new5wC1478s
	IWVR0IOPQYDWBiC5aiBVngfARddqDdbuH8A/YJwqNoQUVzS7ZI4BVwIY6Em0p6UB07T7zsagLik
	iQex4k4wrIAJaS8DeDayYoO9sP2FBUfGxO9nodGMKPI0UymTY0X1dLXMeE393BeR/OpZNMG4UBM
	22aCk1Yr9ECFX6vOk6Blt+Rt/tZIG809kkZuh1VMhiWZ27xJIhJLS0mvb4OLakySMTnaRpNKosl
	A5/ucvXmpEiAZsPwgc4K9Oq4le72Txh6aX/0DR6qP2FYX7t/DOnNL4JTRiO3bMJolg7GdKIgcSB
	NCpllD3KPPkueihXz/HczwiPn
X-Received: by 2002:a05:690c:dd4:b0:873:5bb2:6c04 with SMTP id
 00721157ae682-88d22120688mr11381817b3.46.1789408697551; Mon, 14 Sep 2026
 10:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901170358.176103-1-challauday369@gmail.com>
 <20260909-arcane-yellow-beluga-5ce6f7@quoll> <CAAj-GBkiTvFwx+3htJaKGFCYAC0jGdhyxkfUa8dKWPkYmbGViw@mail.gmail.com>
 <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org>
In-Reply-To: <f402d93f-4443-4209-a6c7-5c30e7c8751a@kernel.org>
From: Uday Kiran <challauday369@gmail.com>
Date: Mon, 14 Sep 2026 23:28:06 +0530
X-Gm-Features: AcwNN1XmAr2U4Y7hTnsIi3akRJyGBw_2Sdlm7tt1jAvzlcyQNUU17kLda5H3aR4
Message-ID: <CAAj-GBnyFnVhNpuPTBoQhBZJLUYdXnBcxnEYy8rsYqkqX=UK7g@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: leds: lacie,netxbig-leds: Convert to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 1:20=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/09/2026 16:29, Uday Kiran wrote:
> >>> +properties:
> >>> +  compatible:
> >>> +    const: lacie,netxbig-leds
> >>> +
> >>> +  gpio-ext:
> >>> +    description: Phandle for the gpio-ext bus.
> >>> +    $ref: /schemas/types.yaml#/definitions/phandle
> >>> +
> >>> +  timers:
> >>> +    description: |
> >>> +      Timer array. Each timer entry is represented by three integers=
:
> >>> +      Mode (gpio-ext bus), delay_on and delay_off.
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +
> >>> +patternProperties:
> >>> +  "^(?!gpio-ext$|pinctrl-[0-9]+$)[a-z][a-z0-9]*(-[a-z0-9]+)+$":
> >>
> >> This is an odd pattern. Why is pinctrl an LED? or gpio-ext?
> >>
> >> Actually entire pattern is very odd - it has $ in the middle, but then
> >> followed with other REQUIRED stuff. I am surprised it works, but
> >> regardless it is absolutely not readable. Looks like a begative patter=
n,
> >> but why would you have negative pattern for known properties?
> >
> > Thanks for the review Krzysztof.
> >
> > The negative lookahead was added because patternProperties matches all =
top-
> > level property names that fit the pattern, so excluded known top-level
> > properties like gpio-ext and pinctrl-*;
> >
> > In patch v1, I've used additionalProperties which removes the regex ent=
irely
> > and allows arbitrary child-node names. But removed and used patternProp=
erties
> > as per the review feedback.
> >
> > Could you please suggest to me which way to proceed? with additionalPro=
perties
> > or patternProperties
>
>
> The children are leds, so they should use generic node name pattern like
> "^led-[a-z0-9]+$"

Yes, Krzysztof but the original binding uses blue-power, red-power,
blue-sata0, etc.
as LED child node names. Would you like me to rename these nodes to
led-blue-power, led-red-power, etc. to use the suggested
^led-[a-z0-9]+$ pattern,
or should I retain the existing node names and use a more specific
pattern for them
like "^(blue|red)-(power|sata[0-9]+)$"

Regards,
Udaya Kiran Challa
