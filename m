Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9E399D0B
	for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785140691; cv=pass; b=Pa/65OCkCKCnLQkOn91x/pK3/OY9SU8iFtmUbnl/zWw7N+zJ+WX3GSsYbVDqA9kBBtB3E4sp1grY3AZied8xR4uODpNwWfxx3O0J6ddtVAT/rBOI6RT1iiJFJpmDM897krOzGadHSHWa7j2zFDPtuixLWXMA2eFM+2hqeog77Ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785140691; c=relaxed/simple;
	bh=fkQtSqlmS9bP4148tvn2U0aV7x97yBRmtgLuyiKo4kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLQx6t+07LTQ8tSTWmDDlTKrk/W27yNZyoRWhifA2kFmatCg5nRP7GhDyotHJlCMgPXbof2OQ5fuVxBkeZh4p/C8NL+NjUUwJ2qAnXPFyctjtyiuyuL6bZpWkwpxptgUJHs03zF9RAG5id43SlmBEy8pz7KooXLSBS3S38AKGKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lu7N5Fkw; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu7N5Fkw"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1410002a12.0
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2026 01:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785140689; cv=none;
        d=google.com; s=arc-20260327;
        b=oi3ayvf0w3WUZzvJBFJIu1FbRA7qcUB/irSy8/T2dT/qoCZ+D2ElLeRCbI7IPVsxZ4
         lS7cx3KdeQ9dQltjvmtRORMZRaGbNktvngd2IR/fhOyX8ASkECTqAx93gkIL9+CsPoz5
         oYd3p1y767CgL1A/rO3foO54+/SB3h/Z4wbOhfgxuXTjHpHVKisZ1/RW8wYR4NUBOrr2
         FoHD0SRZ3BFZWc396lOgyRVTMHzPk9eYQrAgZZEjFTPNH1dxOSSp6+z4Y4Nsf2Lw9WHO
         Ggcw2tSy1u1j89HeBxt2h/WR+QGJeO0CSuZPdGZn5qP8rtluz0PIgSJFDNG1l5YhhoP4
         3a2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/9ukOamIO2gMXk9qWFix4f5rPWog946EHuIuaO8IQn0=;
        fh=lmyzQoXL9oWkdO2goMFpnDrJrbsow8t909Fnif11XKI=;
        b=k9xA1b7qaU0vOXwOFrAZCh9KqTenn3yZljQQMBXZINHJyRevbldv7ut5qvNKQ0U4Ac
         3vugkl6TztviHhg/trz0gLV0VcFPqwwcnbvJyCiGa0HibraSwd+hZoSxnwZYZebttztM
         PbO3d/mRV0J/Qe50hqu52DfmaAnxKblviSPA5HXLbZGoOAFFoRThRLvrSBW0gfm/b5et
         XrwD1QBwbFPteoX3DvPcrWUPHuLYBw3tEdWlSpg2IIDbQNFvZOHwECSj7DgCjwXNrlX2
         vLVrJnXqVFXvxx72sEWMoBfjMpt9TOL95uvoSLmB7++dN8sn0EjV1u15RPiYlUBj7NIv
         3HTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785140689; x=1785745489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9ukOamIO2gMXk9qWFix4f5rPWog946EHuIuaO8IQn0=;
        b=lu7N5Fkwr8FCMNgMaaxNdwucjP31CfVDYVlf/pQZMo+eVdn1FBl6kpF5hpR94lshhe
         A8S4sYp3ZJ/sDaX8ltGAX5YkPKMYoB+SQRE3rrLftwE/hhZq/YX35j3z2xqVJBsJMO0I
         bjJMJTNTAVmqWGrdQKmLfsrTKPbnY18aNSfClHxuMdTJ9vvP5PGN+Yw4PWNatKgg3Tkl
         +7AZqQzU3JNXDp37qbMcIHq1W2BSX55SZs2vQvR27KQiFN/4ZTT2vuoqNc/K9v/dHDtX
         Yub8gUqCA5nl1rQq/ybRTGVfK1pHh6XqpvywyF/0SMfOc/iRhSqzTWhHdh99lBp1kDn8
         YL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785140689; x=1785745489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9ukOamIO2gMXk9qWFix4f5rPWog946EHuIuaO8IQn0=;
        b=slIIq6xmlLBJ+NSgwMZr95ZyjxJMmxU796kBP+o32pn0ND/REHTWEKFttgSX2v2ClC
         ldQpBLHkJSaubrY9yf6LXYZ8Wfp8I8ehK8Bo/MBlw7ThsUG9Vp56Oc1Hc2LsqWFkab1h
         XzDv7uleHlRQORlE4bKU9JlEJ/qNKbxxiSr7dmks0k2Vj6388C4qsn/bFhWP+1uq0rux
         I5IuKEXFjHP/9/2QSlrlyTrXfXJQpoHgbi2LumxNOX8x/iwctaXG7QHTjmFIdMu3Loxy
         htW/rPWfpZVUNsdOucjjmzkv02i0jbaEbSt5jP2xrfmsNRIAZCVAgMvTsL8qTplwkNCI
         KuJQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUXqktGHgwKZYSH1OnoM7vEKIjLf5FflzU80341EoJ2bqFvm3HDBN/5sUuRVHnRYMb63RrVO4KPhz/@vger.kernel.org
X-Gm-Message-State: AOJu0YzQu8SpOmtCeJprMsHBim+8cvmW4rpMO2INWbwOi6JaHvagWN8z
	Tdx0+V4dFXqc5NNpLLKKj38HNFajVq/Nbco46zGA+BJ3WB1cIDrIQPGHFVRfIaAwoGaR4gduY3+
	jTZRQq5oQYzI0RnT80a6Op3Q/8GhmumY=
X-Gm-Gg: AR+sD13DEbaRNWaTZEJ1ARXkUOUIS4e3Yqbro6ek0bJQZnVtdyAm6Wuqf2oZQ4LtbdJ
	37Bh9aEwXYb/PqG4Ruh3b/eXv+BlbBxh8Qav0ozyXbswB+pLY/DF5QCwKgglGnL6uAfigFgMUZl
	jvrHXBeAziWKxYR+W19t15N4KDyQ7M9Tws1/WZPwTZtfq/d+yfbMSMfZH/b8fJiYkzI7BVJs+tj
	KmWBftZQ+F40nfSR/XaDm+9VO8hrCgf5e4u+96lzFcN14KNZ9Aqj8tVTkDWznX3WmdX7Y/J6cnP
	/cKlX8GNzy+gX8Z9tYg=
X-Received: by 2002:a05:6a21:7002:b0:3c3:7ac4:dac0 with SMTP id
 adf61e73a8af0-3c67dae969dmr7046276637.13.1785140689346; Mon, 27 Jul 2026
 01:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-9-clamor95@gmail.com>
 <akeXAOpb13hupUGM@hovoldconsulting.com> <CAPVz0n2trouADTziWXnpt=-hwKdsZWGQib+-nVCLaSLibTbATg@mail.gmail.com>
 <20260722023037.776f4bcb@jic23-huawei>
In-Reply-To: <20260722023037.776f4bcb@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Jul 2026 11:24:36 +0300
X-Gm-Features: AUfX_mx8whI7gSCba0GgBVBHpAVLRZADgHNcCPlSfBxfKQKn1EgxosjjezqzeSY
Message-ID: <CAPVz0n1dnoe=Xw2V-nZtm3ggD5KLO6PVrhXOAoPnqvJn+C3L-A@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] mfd: lm3533: Convert to use OF bindings
To: Jonathan Cameron <jic23@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 22 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 04:30 Jona=
than Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 14 Jul 2026 16:57:01 +0300
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > =D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:03 J=
ohan Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Jun 17, 2026 at 11:00:25AM +0300, Svyatoslav Ryhel wrote:
> > > > Since there are no users of this driver via platform data, remove t=
he
> > > > platform data support and switch to using Device Tree bindings.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org> #for b=
acklight
> > > >       indio_dev->name =3D dev_name(&pdev->dev);
> > > > -     iio_device_set_parent(indio_dev, pdev->dev.parent);
> > >
> > > Why are you reparenting the iio device here?
> > >
> >
> > Because every cell has its own binding now and using phandle to parent
> > when device has its own node is not a good practice.
>
> It is however a good point.  So should at very least the ABI break should
> be called out in the patch description with a brief mention of what the
> path change actually is.
>

Ok, this is a good idea to add chapter into commit description.

> >
> > > That's an ABI break.
> > >
> >
> > This driver does not have any active users in the kernel and no
> > activity for more then 2 years.
>
> ...
>
> > > > +     u32 count =3D 0, reg, nchilds;
> > >
> > > Don't mix multiple declarations with initialisation like this.
> > >
> >
> > Checkpatch does not complain on style issue, hence this is not prohibit=
ed.
>
> Prohibition vs taste.  I fully agree with John on this one!  Those mixes =
are
> messy and hard to read.
>
> Checkpatch is a helpful tool but there are both rules and preferred style=
 things
> it does not catch.
>

Ok, fine.

> Jonathan
>
> >
> > > >       int ret;
> > > >
