Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E9477991
	for <linux-leds@vger.kernel.org>; Wed, 29 Jul 2026 12:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328449; cv=none; b=fk6NokNC5LOIc+g10j/gMZeYTsk9uDSkINdSS68KBcLl/ywYJFCa+GruB0G5oQ4XfzZ1UpnbRn5uuS3JW1w9QdCiRTtFtwxwPXb2qOEN93pYcvfL9ai5GexWfQEUc9gSHMIvofBAOIfkjzFpD647hYMqRrKmBFbUgV7zgVSxFZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328449; c=relaxed/simple;
	bh=HeAEDpOyWDfK0HywfMKKJR7m/lfHHAOTVtMyX32Yin4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLCfu0cvmWrshIuWPE6Td08TEPgbmWaWN72RC+IdSm5esOOLLX9ofDelVfobunU6KFqjKCiWgJPvVkFLDDz+r8w6aueiQzGGBQ/jYEa2L8CDM9OTH+seJmZg/n+oo2YBmK3+/5CylJvcF639yvwxdt+jFOP8wfQEoOM88+327aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JyLSAyA7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JyLSAyA7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so6506045e9.3
        for <linux-leds@vger.kernel.org>; Wed, 29 Jul 2026 05:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785328442; x=1785933242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hj7jv6pRB6x5AF5ocoOAZbiwUraKrz6rxk84/RgEz0M=;
        b=JyLSAyA7JLsBjzsv5sIAMPO8UgSES5gspaHVhSgXArmDW4bnZ3K4YkR+4qtU1fywnQ
         Irjg6ff/Nvjc9ubPdR9GnYaiSVWJ6Da7YS4a2hnizuFlf9PDpqpYTwK03dtfX8cAxayz
         3UIZ5GdqQYnTu1hiva6mTgO8/7DP+6yIaC7oIU6+J9wmD2Rn8dcoVWOezjHdTsbyn5Mk
         wpC1l0wxXWdOpnXu+GBVY3mIhqePwqtPbHJTgwmpDO+x1laQYOe+JfuOWdoTQefrmkOK
         MowjE8U9DfsaCnyRNE5JCeZysqJapQ45v5K48JDGha168J44FXT5NQUi73Yy62IRY1vI
         IhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328442; x=1785933242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj7jv6pRB6x5AF5ocoOAZbiwUraKrz6rxk84/RgEz0M=;
        b=JdJjCoKjZJmHy4N1achJ/TNUMuPDmqLjPQy7N610PFBh7pQ7YOcwUMjF11brePlEs/
         O1BMUp2stE3+JG5aoodJIig9FzsoMCFLngncteWdwoJddawXBsDEmvplmA7KW6G57QkT
         xB3n1tmFsRuVj3aX+SJEKb51kYQ4uGbcwrOo6rqANIH8XhmDkdD/mAaWpcfwrZ75Bx03
         lWeW7zqjfxdOndOaHCN/iGI//0foDnBCVC5xXAuhBNWgsyHeOYfGoehBaXORQXi9do8m
         pdN2C/m2LD3NIbkVxURZYsn9rbqr/LKox9YtMN9yGldH1baWIbR4eM3XVA3KOBaVU56p
         kptQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKbLB5wxYW08hztQdaYhARJ1LNeY4PIBrpVDb2qJ3w/Ns2J1C3C0gHOX/9LDysByMPczeANwlKPyBQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2b5nV6uWEvtMAaO0u5hd1R20OmNGTo5nFoCyspbT/IQyacNLr
	6pwhwaYGeksCtpNDtCUK2gpqGKNgezNZOSEkwhLAiucJBEkAU91oAETlSrhJJpvl2zw=
X-Gm-Gg: AR+sD13+vCf7cSs/pk7QqmG/yAUBqaZ8Eeki3+jTCr43w1fb2WViibgPFZ5HaB398YI
	nv4r02vk9W179mFgPjt1iR4Y/FqpjXKBAM5h2WsUw7UD7NmdJW0sVGizqDSTe/koFJMwN9T7Uhx
	kEB5/YL2BV/q/amLiBaDqSP4mc6vnrZKPeBG4gD3/inwUbOrE6ZYuiHdVTp0/rZJtXJ6gZJivHR
	+csMN1v84qAjVEbE7lFyG5TJ21GWpatcdJT02hVdimj+N98LogrhsMnTHwg/OBbTkJARACTS2ui
	GEucsHIxJm5ez7EeUN3TdKMMwSOYWSdhXV3BFs32I/JDrxqBsrE1Yu95jUeoSqfJmnUiDWQ+4/p
	IsgkOaCjnY6nOvGnZglRfWuER/XmXX6v8PVEKYR0vWAAH9ZKq50fkUeNY6UpimMlVSUYIRJFJJG
	qcSB0pfDuBCkhmyiffQxoNKbBrjp61QsuJ+ZBnFIdm9Vlyz5XoeLUJxZzuAhx18v//xo7D0LIRL
	NlMjRqHkPl9icAOuRkdAWq9kc4NmLJmbJT+wb9i5zrf4b/zlXsPX9nzIZ3ugw==
X-Received: by 2002:a05:600c:1f95:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-496c64261d4mr74271315e9.3.1785328441446;
        Wed, 29 Jul 2026 05:34:01 -0700 (PDT)
Received: from localhost (p200300f65f47db0401da7fd03a16a046.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1da:7fd0:3a16:a046])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49764d6d0f8sm50701985e9.2.2026.07.29.05.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:34:00 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:33:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v10 2/7] mfd: Add driver for ASUS Transformer embedded
 controller
Message-ID: <amnxliqWscD4Mjdz@monoceros>
References: <20260721095233.420823-1-clamor95@gmail.com>
 <20260721095233.420823-3-clamor95@gmail.com>
 <amGx2fJCUB4_XW1M@monoceros>
 <CAPVz0n2yWtTOgruRc+MAYTZ9=rd6qf6sEnX9v8THvJkN_opvbA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dqlofrf2szwmrad"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2yWtTOgruRc+MAYTZ9=rd6qf6sEnX9v8THvJkN_opvbA@mail.gmail.com>


--6dqlofrf2szwmrad
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 2/7] mfd: Add driver for ASUS Transformer embedded
 controller
MIME-Version: 1.0

On Sat, Jul 25, 2026 at 04:23:13PM +0300, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 23 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 09:25 Uw=
e Kleine-K=C3=B6nig
> <u.kleine-koenig@baylibre.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > Hello,
> >
> > On Tue, Jul 21, 2026 at 12:52:28PM +0300, Svyatoslav Ryhel wrote:
> > > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > >
> > > Support Nuvoton NPCE795-based ECs as used in Asus Transformer TF201,
> > > TF300T, TF300TG, TF300TL and TF700T pad and dock, as well as TF101 do=
ck
> > > and TF600T, P1801-T and TF701T pad. This is a glue driver handling
> > > detection and common operations for EC's functions.
> > >
> > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Documentation/process/submitting-patches.rst has:
> >
> >         [...] the ordering of Signed-off-by: tags should reflect the
> >         chronological history of the patch insofar as possible [...]
> >
> > So your S-o-b should be last when you submit a patch.
> >
> > > +#include <linux/i2c.h>
> > > [...]
> > > +#include <linux/mod_devicetable.h>
> >
> > <linux/mod_devicetable.h> will go away soon. Please rely on
> > <linux/i2c.h> to provide a definition of struct of_device_id and drop
> > the #include of mod_devicetable.h.
> >
> > > +static const struct of_device_id asus_ec_match[] =3D {
> > > +     {
> > > +             .compatible =3D "asus,sl101-ec-dock",
> > > +             .data =3D &asus_ec_sl101_dock_data
> > > +     }, {
> > > +             .compatible =3D "asus,tf101-ec-dock",
> > > +             .data =3D &asus_ec_tf101_dock_data
> > > +     }, {
> > > +             .compatible =3D "asus,tf201-ec-pad",
> > > +             .data =3D &asus_ec_tf201_pad_data
> > > +     }, {
> > > +             .compatible =3D "asus,tf600t-ec-pad",
> > > +             .data =3D &asus_ec_tf600t_pad_data
> > > +     },
> > > +     { /* sentinel */ }
> > > +};
> >
> > Trailing comma after the assignments to .data please.
> >
>=20
> Sure, but out of curiosity, why in this case you ask for trailing
> comma and if entries are in one line, you don't.

Because this is the most used style. The rationale for the trailing
comma is that if you want to add a new assignment to a multiline
initializer you have to touch the line without comma:

 	}, {
 		.compatible =3D "asus,tf600t-ec-pad",
-		.data =3D &asus_ec_tf600t_pad_data
+		.data =3D &asus_ec_tf600t_pad_data,
+		.something_else =3D &foobar,
 	},

so if the comma is already there, the patch reduces to:

 	}, {
 		.compatible =3D "asus,tf600t-ec-pad",
 		.data =3D &asus_ec_tf600t_pad_data,
+		.something_else =3D &foobar,
 	},

=2E For adding a new assignment to:

 	{ .compatible =3D "..." }

you have to touch the line anyhow, so there is no advantage to already
have the comma. And then it seems parsimony prevails.

Best regards
Uwe

--6dqlofrf2szwmrad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpp8zUACgkQj4D7WH0S
/k6ZNAf8DhR7uBfXuQZzNcJ2dR9KB5Mucc4l5ZRolBWJcq6FHN8KK2BbDb+bkrcE
pUhYeNPt0LnZBA6JHWhJAM1zlHnLaQ2PlBWxeR4EIwAhM8nyXcfHgmgMJxBHSeEQ
qHWXZKtQd90uCGYg4BnQO8LmgAQR610/ujayOjnD0EgB2Wy19ZkENuG5Nu+Irzef
8DWW0WMWbrTCP49l4fgVWsLE8/yOaBE1jBeyaZ17yXLwz5vbs6OfeCkqaK11AOnH
KXbRlcea/K7YZX7wPKZLhHMSvmzSk+NEQgQpg7+qgg7NYMLDgJFCfvFTWhNj5lqb
GcHcRJv6c3GBFhS3t9oSrHiBeXrX0A==
=JxD4
-----END PGP SIGNATURE-----

--6dqlofrf2szwmrad--
