Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5993B1025;
	Mon, 22 Jun 2026 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.126.83.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133347; cv=none; b=IB04lyhkNX0lNkji5aDxOeBuRNwFLkKpvUwzJtZu46YkRIM6CzFF5jnqUR5b7BRkyuOOtqSoSykgJ+MUhktWo6O6ej0rq5MFbrgXnDtutvDdmj44/TMVZF+0+OcBpPVVU8H62C0KCon6WHd52sgd/+LvANT50MG80CPZFg/MQE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133347; c=relaxed/simple;
	bh=GAhKwumPBM/ZJ/fs2a5wZfugooTYZFZ1iglSmH60i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubsLX4DdPqoJWvFQjKbplKGH4lFuQnTPdFMBd1x1wO7W1xeiSOCB8Re9kw76KiAfLEDJKsH0pvz8d0KKJxU2dpcbs6xKQ3spyuRofMRjPQKRDspxRvWWyHvxEkltlFIQo/zEjVN1LL27Nbb8aXUgnozXKLpsB12bKGaqzj83x1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=g4xfAG22; arc=none smtp.client-ip=188.126.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b="g4xfAG22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1782132878; bh=GAhKwumPBM/ZJ/fs2a5wZfugooTYZFZ1iglSmH60i2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:From:Sender:Reply-To:Original-From:
	 Organization:To:CC:Subject:Original-Subject:Date:Message-ID:
	 In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=g4xfAG22+OX2dShJpgZCots46hqwpNBazf7IiMIDRF+vF8wO08FNeNFNHmJAyAG/P
	 VhQF6LIC0Dbs4pEJiRJ51JMdvg4K1ezPwLDyNSByS2ALIzlOz5ej8BZvn10ZLp2RPA
	 0USgCtkNPhqVyVEWpSVvy9DIGDJkjUxlIokBlwTngbT8ur8YNlVse4ZOHOCVqZG3dT
	 3/PKKdD7EbmUdt4xcu/h2Wr+Kc7h7dgZnTFzyYKA/QHAslBZyHjGzKhaUSbQeZ8bVI
	 4/YrD+iadJNgjK8OSuba5LXHSor1v0bQpgpCuWoZVpwbn50Uc2PkzE105x6oWcOo9R
	 hvx0CxnjOFWkQ==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPSA id AE1E8407E8E5;
	Mon, 22 Jun 2026 14:54:38 +0200 (CEST)
Date: Mon, 22 Jun 2026 14:54:01 +0200
From: =?UTF-8?B?QmrDtnJu?= Persson <Bjorn@xn--rombobjrn-67a.se>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: uleds: Make the documentation match the
 code.
Message-ID: <20260622145401.3364c9cd@tag.xn--rombobjrn-67a.se>
In-Reply-To: <20260513134505.GZ305027@google.com>
References: <20260402220811.4804DD8F722@tag.xn--rombobjrn-67a.se>
	<20260423152655.GF170138@google.com>
	<20260424194714.71de0ef6@tag.xn--rombobjrn-67a.se>
	<20260507131128.GM305027@google.com>
	<20260510214308.09652225@tag.xn--rombobjrn-67a.se>
	<20260513134505.GZ305027@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i.h8v9BQtXONSkWzVFG1ZFz";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/i.h8v9BQtXONSkWzVFG1ZFz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Lee Jones wrote:
> On Sun, 10 May 2026, Bj=C3=B6rn Persson wrote:
> > If API documentation isn't allowed to name a type, then I withdraw the
> > patch.
>=20
> It's not that it's "not allowed".

In that case there may be a chance. I'm sending version 2.

Bj=C3=B6rn Persson

--Sig_/i.h8v9BQtXONSkWzVFG1ZFz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signatur

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE52SginNFTPmg+iBb4Tha3NZK5j8FAmo5MGoACgkQ4Tha3NZK
5j9IIBAAw9GN4N4UrO8ERxrcnAX06bihIvMgts5L6ln7ilfnwe4e0vqo0S0p+Iu1
FPAKjvnT+9U6EozI0pTQqbDkH0NHaKaSKiqKUPOmptARGKOSvOzvablWVbP+gZ4Y
3q70yoTZstYP+NneBhLKfHjC4m956r5jl8c/9lOqo8HrtaEM7vg7r9FS61iuFsdB
J1lWN2MHY5Zj8uaEsriMGMFPLP//sli2DBhMMNqq0sEMViQLYQlnyp5H0RyF6fVE
pXEEvNMJaX6NSg0R199Iy525lqyZaJniN6lPjAEbES5woEX4EkhMCZyhg6wefIqY
fRDP6NjGwZLNjJDv7wlB+vfCwYJXVilNsIC03VEUHEQFCsAKYw03EkOtDISFk/Oq
8mGs1fq4lRsIlf83Ui9qtS6jemwy6hizgKL5r3jYfdwodX8McYVkHeG5ueGfOeXF
2xBpcEh/AVJ13ivk+ztfKsN6tbDdXsCfgVeHRw8bKOawjXT8n34Qrqhv65Rh318z
mtZH4LcS8mehPiHTdGtKFpCMhADx9mDMWzILLPabywh6ROrlNjAZS49pjzQ/FEj9
PiEu4+D8uYSdMMhND8zM9Ve5D0hyAD2e78hs/MmGJsYN1IyirfGt141fEO3ooX6+
hHRjO/l0kC3UVuYOoDX5xT5AM/r+2kCbCd1mrmgHlJMmsYDhbIs=
=VLM1
-----END PGP SIGNATURE-----

--Sig_/i.h8v9BQtXONSkWzVFG1ZFz--
