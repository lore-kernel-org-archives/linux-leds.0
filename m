Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC90642B30D
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976060; cv=pass; b=TUYGWdhkFDSiIwb9sjpeg6IJ74CMB/HhE4xJXI5fEl7Y+x3QAgOl+qLoiyS+2mi6/k6BBYp2RWuDUu+KmgdLn+X13ky78vqe3PTSnBV6pOdELH9mtL9N0rJHkrigFvnIFCOMBHsWG040JMf0MqCu8mQwnVMC5WUvtjO+k5lkrWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976060; c=relaxed/simple;
	bh=57Sok7jJDa/57dP/GDfeHEhYnwuYZlpWnaikd4BSZrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eqd3Xy3wdqh78UEXNSPdN/maBc6IEGlBX0i1y8GohC5NlNseznKmXPug8t4gw3EcMdcnpG7YxPuF9ytRAngI34Zwcnx/pERnrFftQNQPfFORGx1QUyI5Yc694VGnzlIghA8vjmwqhLwxU2w7shxf1E4ibjGwNERkejyBQ+3Iscg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRho8oHk; arc=pass smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRho8oHk"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccb65437so1992023a91.3
        for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 00:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789976057; cv=none;
        d=google.com; s=arc-20260327;
        b=YUw4KL1+QQ9oLhssp9CGWXbu3ZmUxDMCImvtVR8KqCwT83nLd1jh7Nxa7S3UOeD3U2
         RJUWzaxTmZtOMHkyLeZmPNhOs9EPl1nvH1XykOKY8CoFGV05XUcKri3x6zmqu7iSNSoO
         SGrIQByWNqeeJth2hwoKIUGN4n/Bx5XQ5UEk26i5M8NoDv++4JfzPM6NFN36m9WoDv3o
         WUvgr9OynFQ3Nb1a8Krn5+dS9oGoAMJ8nS0A2hevrpmmbOotIGhnzfhdQXgxIUAOm3UK
         U7TU/KDPFljtRlYhi3tVw6ap/F+bgdAuWH6GrRLWCD7ufQk9ryK+SWGvD8oE0Nv7CT72
         V2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        fh=bfN4X75zROf9xf99AKkP3A9cFu3/rWX5nJJ1LwgBAgw=;
        b=I46+CDkaCEthUoBdzTk2b9jyCfedBHM4Z8GnL2OxI/0vXuqHPtrKHcXpspXk+Go/Qi
         xzI3PNoi4irp/yk8NKjoeMmiqg4o3C6K+uTxRBFf/WatnFIrFZ4t6yhDreUkiv8xzTpK
         SDKjsVpbgxxtcq6Jw750umhIa5jCH74u0jmTAZX1bEJLbjwbVtIfB8pKXuaNxErdhIou
         h3NUegu4yIvABaXrqx6VHPW/2FZ1uAJArwV3WxKPZTqjisoJNFOXelML2f4ry53eulv9
         5f0rSnzjtIAmAAcBuCz1CRbM+Z7Q/17w1rdims/yw+8PWRyKVqI+C4fR5hIP7B4tv2iM
         YXJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789976057; x=1790580857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        b=bRho8oHkSZ6eNFFlMVFarqQ5ou6tGwP6n0eX0AMCacl0jOnq/EcGvM7lHBlgkmMQP7
         zLLh08JXmiwSrxOeMNy0Tw7uLfdHnUz1OHewAdYTttaeLiZZIRbpdqKAm1exhBXt0SJ2
         uwLkghVLI+wKYXaKcDPzLNu4LmatZLIhyK9LSr7vpCufUr4zYs+7bCeFlZ0tLLW0hSZD
         TgyIWK0sBY2F98z5zFIvPOsTthpcp0n1jNIxNiXIZlkb07px7TcCrRNBMw8uaYpQmBZT
         ni3Oas86iQDAeF7bEgd4d758qslkBQczuds/1ZuAokt+/PN415MLqRAZdPxSP20gQeeM
         UVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976057; x=1790580857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i/KB7XKvlLtdNPe51SuZ6hkHW35ikyi0W/vUmCBDQwM=;
        b=jtyJuG17j+oGCwRQ98SIRYZxTY4r9fKlDQSONulwhFjzpY1sPCun7WAowLx5K6JMmj
         gwmuwRH8OnGBgIJoWRf60JS54X797WqAt1/4gT4XwKLq17BJpY+7hEzTdZ1GWSbxlVKj
         ae0gChS9Rzq+L4Nm9eMKUIzWqQ2Pw/gRLFk2Sai9tzHN1kJO/wxZoZzLupFXOjKcoKOZ
         /f3VvctJjZA7TnVITwvKXUFJWWKevEjvOfcmCaLdGVT2KG+1wiTLOm02CBMEXThvqF7l
         0E082yhLJb1t01TCvkrftJslnQ+K0qnQwf1JE6WIKYd/CjaUILKszRETSxUUGq9esEbz
         ihgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLj7D9JIH3K0hRqfw7hqP7mRqAVV8mLHXUC2wH6UaxRSC6LYpDR6/Dk0d+6S88sqXwcZjUozRjFkk3@vger.kernel.org
X-Gm-Message-State: AFuF++kPvxY5uYUMS2bpEvVxglJdA9cpM0ULA5z8+LkAo6N4teVC7QsE
	Qab/sNMaXxrd5Ij6VNtub30Qs7trtbEyWxw9hFaTm2Qilw+aYkZ8SktAJjXDMzy5ah3q52bwCqp
	14T5N/6FX/vUCY/Y4+joSapUL3BlVBAA=
X-Gm-Gg: AYBFou0/pD6fnWPdbjuB2OVU4iAzk2Ery+NxlSUnzyQTmSY89MspioHgJdmIhGZi66G
	MdY1xJQaWE5Ig3PrSWyDc2YZao32b+4WAqaxyFyW7UEO7NYH/1rqnx4v5gybDheq7MFbFaLSM/Z
	HgXF9dPgW2irc5hcH75dVR7UlxoKbJ+o2pPJJ319xL9oKlanPIijQZTdvf0vVBieS26WgEcVPG+
	eAJItBkgQM47q7leo83hClgMyLpnC28JQK/bbyW/05lgdCI1xka1Oxae8G+nGw68LEqU0hB3Qn3
	NCYDLWGfPDSjmEfMHmEe91pvm0zwWBwfhU3lRDzgo2pD/gyggHCbdHBPexS5eh2UAcj8QGDdnZf
	rc6588+pkC2ed
X-Received: by 2002:a17:90b:4b87:b0:39e:345b:3323 with SMTP id
 98e67ed59e1d1-39e54fb121dmr14066759a91.22.1789976057124; Mon, 21 Sep 2026
 00:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721095233.420823-1-clamor95@gmail.com> <20260721095233.420823-5-clamor95@gmail.com>
 <CAPVz0n2rhZk0fjM06u=C5H4LgVOsN6ACriO1o+byx0dyqTwGzQ@mail.gmail.com> <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
In-Reply-To: <CAPVz0n2mzwp-ffUu7tw5ojXgM=+G-PT3V9pHN--dT=dnYw5hHw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:34:04 +0300
X-Gm-Features: AcwNN1W6gcxmcfy1bLN5jucC74BzWiaaqHA32OWE3YHnq2Or7J12ypc4KJW69uA
Message-ID: <CAPVz0n2ZeYk8WbWfW7L1kLsQN4e0mdQ7nM4Lozy16z9X8kPCWA@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 6 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 20:22 Svyat=
oslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =D1=81=D1=80, 19 =D1=81=D0=B5=D1=80=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12=
:20 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > =D0=B2=D1=82, 21 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 12:53 =
Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > >
> > > Add support for multimedia top button row of ASUS Transformer's Mobil=
e
> > > Dock keyboard. Driver is made that function keys (F1-F12) are used by
> > > default which suits average Linux use better and with pressing
> > > ScreenLock + AltGr function keys layout is switched to multimedia key=
s.
> > > Only Dock keyboard input events are tracked for AltGr pressing.
> > >
> > > Co-developed-by: Ion Agorria <ion@agorria.com>
> > > Signed-off-by: Ion Agorria <ion@agorria.com>
> > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/input/keyboard/Kconfig                |  10 +
> > >  drivers/input/keyboard/Makefile               |   1 +
> > >  .../input/keyboard/asus-transformer-ec-keys.c | 310 ++++++++++++++++=
++
> > >  3 files changed, 321 insertions(+)
> > >  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
> > >
> >
> > Hello Dmitry!
> >
> > May you please take a look? ATM only ACK on input patches left.
> >
> > Thank you!
>
> Hello Dmitry!
>
> May you please take a look? ATM only ACK on input patches left. I
> would like this patch set to move forward.
>
> Thank you!

Hello Dmitry!

May you please take a look? ATM only ACK on input patches left. I
would like this series to move forward. Thank you!
