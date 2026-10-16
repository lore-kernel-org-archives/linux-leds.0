Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7E5172CB
	for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168047; cv=pass; b=vB8A3IoIK2kfgvjlQXsBOuEXQTHe/OCR7LLvlmlqyzysONvqaWjuJgHZREaV+t+vOkTFVxxWkDJmoEBf0IPrt+J4FY/boKLce+wRr9iCCw5H6VKS4ssNBDDCDlHabJv5+Na8Wzecs/Bpq8o24EQ/jVHry0R4EylDUdjViZqauz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168047; c=relaxed/simple;
	bh=7EREj28Pt4d+3/OFjKBkGafNy9R17eDiUOr72tTJcIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUDlVHJHzyWhGV5d6kyVs6Cu2OTRwWoSIW7jDTyaGQNbx181MqzsUAPW6UdT8r+VNj51Rk4RGia/j5vHRDjRa6QERuIbxl0Iq4PzHbfIX8ZYURRqYw/m3vyi16r0xDd+NDDnIi9LuHBKfJhzfdL/sUjikwoxjnRlH1JZO5f543U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA0p/dGu; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA0p/dGu"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so49700eec.1
        for <linux-leds@vger.kernel.org>; Fri, 16 Oct 2026 09:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792168044; cv=none;
        d=google.com; s=arc-20260327;
        b=b94PH7gLkokQDLQwmzL4BbiAiD4XOqGf3Wlk7q8o4Wm2JPQGpt3En3dJxkeHcnB0hB
         4VBBA4aqfZoqMebOnMDCG9sjcxYuzu43cp8MEEmlSpM67BUbJq4zlGo1mm420XdB1+xY
         1kVPkor2dGFKRGkoauXGrtU97YpqjFwzsyVKA4Pdc+KlPkaV5iUAh7zYnntZjIGClmis
         H1DdJW9o+vxvGvHmyiilr2Ni2IFUYGISj1zKj9ZbCjxPVUJAyiy6CrFOMu+Qu3wKqohs
         83JhwjXebgZvGU6Twvo6zkUwa0pLhavMiPLbB7+hcZxEMxuDkLKFK9yZglp+kHxAI9dB
         icwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        fh=rRKffQd+InSscxbJlKTGvziKcBDVB0UTOnw5PeZhriw=;
        b=Izbyq4Z1OhdmiAGhcqitULCAMTbvnr0Qd2fugvCViRPIm+EdrzFKpWm85291RxgMF+
         9FyLpQ2/MJwYVdiLL7/Bfu8dfcXkPMZIGsc7a0OhBYuhPEOC0KnZFE8ZgBU7uIqvsU0E
         WuFqHSg3Yis2Fw30HuT+l3t6ffWd+k6UJZDfOaDEZoT0I/WqwoE8tEa2Vmz/JUn7ozQN
         oPeWku74iZRllcb4jLVhWBE4/VaZQkES5yNxCvwvXny6rwv5ohonVOJwjRYeeKYG/xAJ
         vGZaeF0ukNU7rEJoWEABUQ5D0pbC9tecQ6m/VVwAtlcyuv2hoF/I7xzoLeeJyA2cMgGw
         G6WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168044; x=1792772844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=kA0p/dGunHRVQFYJZxY63SPffce00jnFtWKw6dFU1c8T+ICC30awMa4fiXZ8fEQV6p
         HfgIC/dD3PFkzcNQcaQ0EYk88IfXgQVWM7eGmWAL/MxrY+vkkmunKb2U3d8Qv8sDBS1A
         EFpQmv3q895Nvzo0g0Jdt50ZFVu4JdyiWv8iQotFzCHnkyEMMdQn8zV8zsWVwwL4wykn
         lNEx+RHNCeoiS22qfZFwDSUY3QmmF3LjiKmYnmqajqHDsnTyySLBUTVoujBgCArX9N/l
         IiInZQ5ZRG3tSwm6LJC4rO7snD4fp20OR24P0zUWrFa2Vy06kopeGhUoVIfu6iMEgonV
         uWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168044; x=1792772844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=BL1qg0vRp/30joQMhOAkvTvnJeNCIMxLLIYrsq+5LntCaWHqc04FPEp53ixIySKg8R
         dvMq8jk1jL4vv1N+TtGZMy6QbJPkH69MWi19wZlFR5Htz2w0ZOQO1xIa97kqv9fVx40h
         9Ss+6HjdgE8Wy2bf17v8XxEQvSozJsHMjfQHXWkeVh6ciaIGaqjIVRsvVa+KAzXKbQMV
         8DCcAilc0nwT1XxKF/p5LKXs1uiiA8ft4moPuOXym2LJX+w1ZngISMtDxqgN19yUpU4g
         Ghiz5NgnA+PcVGbTlNRt2OIpnomf02kevHddqmdn7gM+HVpHSCghTQHVH4YGXPL61e+4
         91qQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCI9p1vRL0bskj69ZRBk27T3mREYBWgysPCvAlCdye88/0lUu3YW4JdJLzNXQO9x1u/HEjvmRR5UeR@vger.kernel.org
X-Gm-Message-State: AFq9FYJcAfe0OJPSqsrIpMP4vvkW/TEX6arakugSyCQcuksfLD0weUBq
	0+EBEPcuyVsjYNAMSpuKC/Ma76cPNMMLx0TfU6AxuZ+Tr5StWeNQ90twVe2wxUpDYPNB0E/qW9+
	p7O88/hQ6v0jVe2aXLoxWuHN2Pu2Xgz8=
X-Gm-Gg: AYBFou0yMqSQ9WAkalgMbSpH2Z/vnxt5dRHCCuXyb2GDx/ksV5JxMybqmlfs4I/kUJ2
	+5SX1aki/kclTzzQiiBwKdjb1Tj1x1u5lMs2pUeLxTnRLn4hr2Q+2EYLuPnFP9kq6GXmz4eNkBD
	pi6NWjgVJJ1Nyl4ID/u23Bu2I1fzXAjH4B+zSN9X3gW5NyjUYJ9jmXNhFtzTALoCal82VwaJCWD
	R6q2K5XzliT2xZMJagjrWj0XBlxgqK+RqEZJUlcjd1z7ZYheNad+ZODVzhpbx8KD9gYw/iWPe/y
	s8EkxHWgLNnpzRH4zV3a/873ZWzK+vtGVA9egoK8D1vOFAphwk7EjY/Zx1o+tkxmFOCTjttSSDd
	g5yAMEcU8ho7j
X-Received: by 2002:a05:693c:638d:20b0:35b:cb8a:8d0e with SMTP id
 5a478bee46e88-361a18634c7mr341911eec.16.1792168043963; Fri, 16 Oct 2026
 09:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <atJDFRXmgZ37GrCE@aspen.lan>
In-Reply-To: <atJDFRXmgZ37GrCE@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 16 Oct 2026 19:27:10 +0300
X-Gm-Features: AclHuK965ULDwrtLzaPZLgAMgTCNPq5g0it--pZ3MwPKJFECiLPJTV2LEV8Gatw
Message-ID: <CAPVz0n1RVDz0MsMBccanpynh=Qn4x6Ar7rXRUVitav88i-hWYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 16 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:3=
0 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:09:31PM +0300, Svyatoslav Ryhel wrote:
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
>
> I think this could be spelled "else" ;-)
>
> However, other than this this looks good. With that change applied:
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>

Patch cuts part of code, this is the full context

if ((brightness < 0) || (bd->props.max_brightness < brightness)) {
        dev_err(&bd->dev, "invalid brightness, %d\n", brightness);
        return -EINVAL;
}

if (brightness) {
        ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
        if (ret < 0)
                return ret;
}

if (brightness =3D=3D 0) {
        ret =3D aat2870_bl_disable(aat2870_bl);
        if (ret < 0)
                return ret;
} else if (aat2870_bl->brightness =3D=3D 0) {
        ret =3D aat2870_bl_enable(aat2870_bl);
        if (ret < 0)
                return ret;
}

aat2870 cannot read main backlight register nor channel enable
register to check prev backlight status. Hence this logic is used. If
new brightness > 0, update main bl register; if brightness =3D=3D 0,
disable all active channels, if it was 0 and now is >0 enable
supported channels.

>
> Daniel
