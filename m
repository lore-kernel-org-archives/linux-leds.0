Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976D4A260F
	for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2026 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970694; cv=pass; b=bxIiJ9KvF9seJAk3gNrm6Ozr5CyhfIqdH0lMLWdp+yNqB2pFS/fS+5abWxmNmG3N+alBaEOdGn9SKbtJulYsOMuOK5tSFyE8HhhBU91IzAl20wHr29hlGagZOxnbrHcNWifwUnRNPJ0h7jadJj1690mjR0w0wmuXZ7sxsyBzlq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970694; c=relaxed/simple;
	bh=g7zY5LqWbX7zCAxfbqvGmNGg5FGFzE06omeqj1uG3CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eAsZue3QRCUMChJIQcKNOi2mASMtO8seIRo4MhW+FSDST0m8rGyR1QqyPkq+p67E0e7+EmGXaEwNF5IN3e3uVPlOBcuFgR2Tw2w3D+C5bvnzOqzcO/lzFNfsgC1Yj+lBS3+/MwkWORn+hoxw4N5l9Rqargush2YuPDgamMT9rj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q/7zgEMj; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q/7zgEMj"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35834f72d94so7023401eec.0
        for <linux-leds@vger.kernel.org>; Wed, 14 Oct 2026 02:38:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970688; cv=none;
        d=google.com; s=arc-20260327;
        b=pCRu2Kpy/6ByhTj62OORf+nZkqkObjH1FyXDPdup+04R02Bz4Y1fFrMLpDaKM1Lly7
         Ks5zAGe1obkpRxuHZSr9qCdkv25dXWIn3Eg0d8ym7+ObMqxWAfmFmTNC8WxqbfUM5RPu
         AyIyJyO8ZBXUb+ILobOOv9UDPrCoPhr5Co/YTTDbDeRBwllTZRF4EcCKfdBpw+6W1TV1
         8H4EZ4SzKeLWHh+VfP9Ln0kpGbKwfhQQdfmivYW9XiIvdsw8anfEaN1vWCkxP+XQ5CW2
         bbET4vt3cCSEfLqseTtBGbQedYLNiPyBNPTXpAWjWYI7R+kJah7oxE8X3h1/DBHfPQw1
         z2fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        fh=u8bd3+DFVQPGgb3EuKN0CjFrp+7PGbt+6fQIQbx1y5I=;
        b=pyyWjIl+HJYYqt1AGjbKyLaEMbUrW3uCSPaM+7ECkAEbHmlz6gXgWXwWLc7ABEyb78
         pJhBr3KQdFq3Qr4nRKgU0FXFWBYGvI+HfGD6gFEgyCyvG9WXbc1ZNwRwgjd8fB/kna5P
         CWn3JE5ac+SKFGjTSa2SMXnc2kLSS2nmBZ0ZN9ZZZa5IDflCAIKIOVSuGF8qz3+MNbjB
         rSCrzSNcWv39Hs9O/CLnjh4livrLPMEaEQl8QQEmr3ULgJz+gri3+54QmXe97vta6JFb
         0AKLchcDnKMX8GR/hbjMqbaNFvc6wFMDVLFGTYa31gVHtM8yEW4g5b4VBqPG0PGUYsMT
         SbUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970688; x=1792575488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        b=q/7zgEMjdIv8rMv8KsQ23m57DHmzEJq2oy7GHZ4tFt4b76WiF854VC3Bzrig6VVxa1
         +xpKNLBOBMBlTXcfTxuPil7xG2o9+rzaelJJh93QRuRNBtwZCiTS5LHQlNZelFzOtmXL
         wneOa9aPDmvCyOSSMSpJFWAW3+wN3o+VAPQANbh6q5yVdbGutJj7SJC4tiPANyZHhhfP
         2piH254oDxVMIZIbTKPmX+dCcrOeWz5Tw2oE9exqVur4syQBaYmiKYStfCRNd15vKspD
         +pI8Dz4UOldHz+XXtp5KGLDX0ESzbN3cE5QCWImib6g9E2AFiX0MulbZDPIERsveT1R0
         i0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970688; x=1792575488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GRnJUmV5s4dSNP1R/wksRwnenMI3escdmM6c2DfrR0=;
        b=tA+48ldT1pkmfe8W2kPc4hmDsj+oUE5F1r2RPudAlNxevklnXDdf+5txpKM9QOocSL
         6YWmIey+WaA1rOXdDA1s4q3Oncr86/EI0HpzvhhytY1TgQ3+NfiME/O5Qbgi7kekohK+
         GJ3fM02HJV+BY3/0HN9ZNToneRglgPCVAFeGR0cR3utr6cp+B149Zj5jQB3KCymS+kYv
         SYWrA7U1nPD2Yteu5atHV+Wl1kHX0djAyTzYAAaVYTlq2APxPReqTu4RaeQ7EXR95Cyt
         h1s45xUQWvF7FbBl9zHNoxv188GQRTILo5J/dfLvEXKzrjFGlTm90ZxakdELVMSWgfOh
         XrWQ==
X-Forwarded-Encrypted: i=1; AKwUvBymdKPoiTGo+OHARH79S6Enw9nzqlmHNEWnkPUOt5KMiVVHrCcw4mntk2IMat2fxBkrKu0wC99aTgxy@vger.kernel.org
X-Gm-Message-State: AFq9FYIfNcVuaIGllxIhMyeYuDKo11JKfd6V+Ou61Fyv48xpgbN4y8Od
	9xUcUYjC06bjmeLBiEQqB0Bqu6pII/Dh9bOagfsXSv4K8EmXlQuXiNo4BMhmGzE5tGdMGcYMmDt
	7Yr70xvkdgVNx89J+1F2fKVt47F630g8=
X-Gm-Gg: AYBFou1L+L7giHEx3LI99Srzv1sQ2JCtBOJyhaUnuJxjZOvzY9rI/CvZeSXqgnfGifg
	CFMXMeQq8DBUkc2JA5h/Ivps509v3Atzeqt4SQwuZHuxjGK9vXn9deeyNZtlz7KCOuGfeF1nW+Z
	l1GkeCYOqZUxVnJ8zQFJ1O+1J4Mc2MTqn2/UvkCzMIn9foN1YVMYuJkbph3ld2yIvB4HovR57nP
	MdxHb1KsrFzamOnKYNRuWBkui1/5DiGJjVfjZUDQSWxgrW15v5Wh3rRlaTUV9XNkcD0cSWwLi15
	lnXHkmoq9fxGI+iuvaHa7Ck/6kAHlzSD8ATlUuf3N/4IFgxgcRvyWwz5c4JjTFqI2JSNhO/n7Yf
	P0zYIHpMSIVKV
X-Received: by 2002:a05:693c:41c5:20b0:35c:ba31:6fef with SMTP id
 5a478bee46e88-35cba3173b2mr5358615eec.36.1791970688092; Wed, 14 Oct 2026
 02:38:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007085457.98762-1-clamor95@gmail.com> <20261007085457.98762-3-clamor95@gmail.com>
 <6a69d4aa-d04c-4bb2-912f-1584abd31e0e@gmail.com> <CAPVz0n0FiT93626L3MnMCto1X0_FmWp_zzQpQ=yRBXn+ir6OPg@mail.gmail.com>
 <4abc72fd-c645-4410-9387-3f03c751fd3c@gmail.com> <CAPVz0n1YKV84J6eG9juM_V5kLCy63WY0hmicUmyEXZp2eEHKyw@mail.gmail.com>
 <f7475c9d-8dda-4dd7-9d11-4b981de1b7f8@gmail.com> <20261014091732.GH199624@google.com>
In-Reply-To: <20261014091732.GH199624@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 14 Oct 2026 12:37:56 +0300
X-Gm-Features: AclHuK8zDp7qUuUBcdJaZ9_rNb2h2tvvcSZ1LWN8ZXrMNyjbELJoL8dMw154gZI
Message-ID: <CAPVz0n3-=xn0Hy3BgPintGoONVO2NKyENYDQ_jSnM_Awxowjhw@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
To: Lee Jones <lee@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 14 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 13 Oct 2026, Jacek Anaszewski wrote:
>
> > On 10/12/26 9:25 AM, Svyatoslav Ryhel wrote:
> > > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 20:35 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > >
> > > > On 10/11/26 3:55 PM, Svyatoslav Ryhel wrote:
> > > > > =D0=BD=D0=B4, 11 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =
=D0=BE 16:28 Jacek Anaszewski <jacek.anaszewski@gmail.com> =D0=BF=D0=B8=D1=
=88=D0=B5:
> > > > > >
> > > > > > Hi Svyatoslav,
> > > > > >
> > > > > > On 10/7/26 10:54 AM, Svyatoslav Ryhel wrote:
> > > > > > > Both the AAT1270 and AAT1290 feature a FLINH pin used for man=
datory Flash
> > > > > > > inhibition.
> > > > > > >
> > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > ---
> > > > > > >     Documentation/devicetree/bindings/leds/skyworks,aat1290.y=
aml | 4 ++++
> > > > > > >     1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/leds/skyworks,=
aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
> > > > > > > index a65d92522c9cf..596b5e284f44a 100644
> > > > > > > --- a/Documentation/devicetree/bindings/leds/skyworks,aat1290=
.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290=
.yaml
> > > > > > > @@ -31,6 +31,10 @@ properties:
> > > > > > >         maxItems: 1
> > > > > > >         description: FL_EN pin
> > > > > > >
> > > > > > > +  flinh-gpios:
> > > > > > > +    maxItems: 1
> > > > > > > +    description: FLINH pin
> > > > > > > +
> > > > > >
> > > > > > You don't seem to make use of it in your patch.
> > > > > >
> > > > >
> > > > > I don't have to use it in my patch. This change completes and imp=
roves
> > > > > hardware description of the AAT1290/1270.
> > > >
> > > > Still, If we don't have the use case I'd avoid adding it to not con=
fuse
> > > > people looking for its use in the driver.
> > > >
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/t=
ree/Documentation/devicetree/bindings/writing-bindings.rst?h=3Dnext-2026100=
9#n17
> > >
> > > - DO attempt to make bindings complete even if a driver doesn't
> > > support some features. For example, if a device has an interrupt, the=
n
> > > include the 'interrupts' property even if the driver is only polled
> > > mode.
> > >
> > > - DON'T refer to Linux or "device driver" in bindings. Bindings shoul=
d
> > > be based on what the hardware has, not what an OS and driver currentl=
y
> > > support.
> >
> > I'll leave it to the maintainer.
>
> DT should be OS agnostic and driver orthogonal.  So long as it
> accurately and indisputably describes the H/W, then I think it's fair
> game.
>
> Is `flinh` a datasheet term or did we make this up?
>

You can check yourself if you don't believe me. Both AAT1270 and
AAT1290 can be found freely.

FLINH pin #10

Flash inhibit pin. FLINH is an active HIGH control input with an
internal 200k=CE=A9 resistor to AGND. A low-to-high transition on the FLINH
pin reduces FL sink current to the maximum (default) movie-mode
current level for the duration of FLINH. Strobing the FLINH pin low to
high does not reset the flash timer.

> --
> Lee Jones
