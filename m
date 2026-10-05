Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376154D2EC3
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791219225; cv=pass; b=Cdfr5jqLdYNYqLl+mYE31EFEnPF+TX1+CJTh3wQH9Zl4txSpqvlIryfp1RSNG9KBFlOW3j7GBZoCgpRWulUSkzJvPQf6QM0k/xzf26rZlbN69EyQX1DuSFqPS6ieTnc+ho6eMq09mX75KwMUqTgMQESBwaLHpAKhuS4Jsh3y8QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791219225; c=relaxed/simple;
	bh=zSYpeV2P1QioqwAowluQEe3O60HHZwF3K/Julewq0kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDQ/LMJ+52d0QAIN6ipZ2FlxTTI6zY+4QbasktlXLL4XSTzOXWKw91jZjlCnJa1cZaUbUolNxmghI/mTdClm9NC10uB2byCHia36r4/A5Y0TYfWtiJEtAQ3azKaNpHAepzfNQfgxiv2g6xMi0p6ySxibU21/EMDOPXTm67x1o9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQzhVZRG; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQzhVZRG"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34d2d25127aso993855eec.1
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2026 09:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791219222; cv=none;
        d=google.com; s=arc-20260327;
        b=g3+SCVCrWXE7adJ9LS4027kU4gFSTEFlyqeD1mjJEqg6AKTac+BtNsWnNTD+TJBAUq
         EhNZAndCodWTrCEXG8kV7cWlRI0XUjmS56cxXjsUG+Gsc3S/63535YhV+csrNPKyU44P
         UzNew7ftMV8W3GNaeyXc5UAqOG02Z7uNFwr7adglnQ3rjlaREunegJnMHOJ7froinjBi
         UQuLFXmRVZ4BJKRvWYb1KTqq3vQbQq5RvabjCx4VOIKsoJRYszVOhNjr+0GvODLcYF/s
         fVFaMtVLAg+KNQYrNJY8zyx/Lnhus1sNJ+q6YX8+Q5aQAVZhdCL7y1sw2nzfKLoMpDc/
         1fxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        fh=nKCiL21z3dVUpWUIqzDpqIU7BPy1uN+xKq7XB5gkHZg=;
        b=BYubSKDg94YaHAggHQmJ+7PnE3nZC/QC0cgo3mioiRgmtI+cmz5g+E70Iyb/5SGcQn
         MTgm7xcFyvx8CbrOMf2cSQEajXzE9wwLsdx9uaTwiEhSg7YNXFAkiYWGssWZeBgo/DTN
         2Oi+TiaEVuwVBW/DXu55ZFpeKMfFK9lvBJBKUHIUe9SC25Tq49VvR3PU4k7DdwDT9L+U
         PxY4EdqmF4JCXNDGdFsnJEWv8Uaes8LYF+Hd2+WbFwceFexBMUxmEXv6P3znz1LUV6nQ
         JjPUre1218IElebfUWIf1PHnDV1kR+LFntvpDQ3vEWfyEWEW7L5jNUarujlgv9slzNQq
         RdPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791219222; x=1791824022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=oQzhVZRG1/i1tE/dByK3EUdbB5r6pa9Hw/FHX2RuROy1L1cO1yCZbs95WqQJtkLZu3
         HokXOoSh1Ns/qrHPybONQbBTCGBa7LXXoCWjoqGmW/LoeDefuv3gw+QzN68zHVcaEMvI
         AdFx0X46N8CgwhjncbkxXdl2JX6Ytg519aNwe/SEkVLjvvLIPim4ugQ+PwXxBOW64faQ
         ISHmHlql2SsnuPUtWoAvhzxQHJwKDdAtNx/Bl6Ym8pL1qR162kuFxPSG6MBArIyolS5B
         jiU4uEQcPA4XewEW4NIKQBV0DtRNAmxOst2MOJ6kWrjbkfT6XVNjOu6SLmcHSWGKcAND
         GyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791219222; x=1791824022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0gmFEDsIHtz0UHp2ElZOBRyG9knCsE2/mBdJQGZCe8=;
        b=2v5opjFwpaz7zelLxafpAEYWNPnc2Q2nr+TTNeorpTEe8BUJ47yJfCL3GTynT+5eIV
         OkbqySWBlefz+NuWWD/T/VxURwq6jQ6GnCKjUlb8Rqp8Z50OaDxLfYTf2yBBZL2zF5Na
         2zRU6ghDyh7x6Kbmc6YMF41lq78SGc9bZcWFlfONuVWBY5DOtkn+50qb+z4QtAElJxhV
         aQrrTWonxV6hqXldF7/zDK/Sw7xJRjqY5MOJ9cJ+3hmR34JeDFib80lqA7zBTJ/9pVtX
         47LGVvB7bCxPqHhcZ8Ei5Fx1o5rhytB9pvxZUxL16mC52qPfu/rrNkgSBc/6UeWS/t1G
         vm7w==
X-Forwarded-Encrypted: i=1; AKwUvBxnytcqa5F/hwCuEjbsUVa6GUxGmaxTqi3+P7ZCJBtW0NeKbWymjsmiEyVyyelW1HISLxXml0TF9PmU@vger.kernel.org
X-Gm-Message-State: AFuF++nLZreHy79t7B0zDwNEByRL0YDwUHr30xXypY7nwU8MD6aamxQF
	waG2n7IODDf1sVmdnWJjJWDuGtE5Tl67BNzcyG8iAOCME4+KCoUS/mDFKw44KQDZSq+StGAZA0N
	I2a8TIulddnhaPdPLOzyMwEpxPT+DHnU=
X-Gm-Gg: AYBFou3if/Hj6FXzUAs5ogzUC4ihx2F/SKlCWV6K1RRRFz+E06gRo7NUtMa05lF7O/t
	ka8Thxn9MUNBJROPUVPASolS98OgYW5kTvrGo4Ao7FPcZOV701EyQZkbNISWY9MiKa1/C80mApr
	kKczXPYZzq+QgizezLCn9p3G/049SWqiB6DTKsSfUIt675Y4MM27lPMYLUusMoNvdrBf/7uS/tX
	ib6+mRDGtrFMXt78+v2ftPNKeEanFbdLgzKq174Ri+dFDfCAH8plNZSKSge/3WCQozBmdxXuhk6
	ju4IAIpSGkXfpwTnfsvUyZWfxrNnNvz0wBDRK2yRRE65l+0C+p0/GePB+gkbs5hgtAW/v1q5mpd
	a+S66dwUGfNfG
X-Received: by 2002:a05:693c:8804:20b0:351:202c:c7a5 with SMTP id
 5a478bee46e88-351202cdc40mr6426669eec.0.1791219222183; Mon, 05 Oct 2026
 09:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004164121.193514-1-clamor95@gmail.com> <20261004164121.193514-2-clamor95@gmail.com>
 <asPQ5FgHe87XQJBT@aspen.lan>
In-Reply-To: <asPQ5FgHe87XQJBT@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 5 Oct 2026 19:53:30 +0300
X-Gm-Features: AclHuK80gf8oQpP3oXOiwBy9nGlcatk2lN-QYD_5rDpDvRkaMQwRh_t86WEgBCw
Message-ID: <CAPVz0n1-v-AcKg8O66q074N3gOZQD1Z6k6O+ae6yJS_-NvT6UQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 5 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:31=
 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:41:19PM +0300, Svyatoslav Ryhel wrote:
> > Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lightin=
g
> > Management Unit.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat=
2870.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.ya=
ml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > new file mode 100644
> > index 0000000000000..014678616076f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> > @@ -0,0 +1,127 @@
> > [snip]
> > +  backlight:
> > +    $ref: /schemas/leds/backlight/common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      compatible:
> > +        const: skyworks,aat2870-backlight
> > +
> > +      led-max-microamp:
> > +        minimum: 450
> > +        maximum: 27900
> > +        default: 450
> > +
> > +      max-brightness:
> > +        default: 255
>
> Should there be a min/max here as well?
>

Seems that you are correct. Thank you!

>
> Daniel.
