Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DCC4A263F
	for <linux-leds@vger.kernel.org>; Tue, 15 Sep 2026 12:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476974; cv=none; b=nmdZywYa6HY9RcwyISoSa98+kZ1+BK13WY7tn6iCxeNE19iiQ579as/GsEGtVa8erzR1T1F4W7U9YEAJh2zkla9L3SQKnyx0A2MlFrjXAPs5h6EaCkWVABV5Q9cZSWSOnezTzdcf3T7s7YF8BtXuYWJMErSCJGM/5L90OWen0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476974; c=relaxed/simple;
	bh=YF4mntQxtpXpx2iT5moDcDVtZuW0rNrqIirDeWtBy3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mw6j9OPL3/eDHtvRgp3VAhcjiKS86LfECZ2uuU7RE0PXv++ma8XgXJdt67VuK4+XqxN7jKF08KkUTowfntoJuKfEkVOTJsejEGaWwj18KlTmJEeMlofjGTcTCEH7ngWpK2ioY2uUDuPE6tLUI4r7O9BzHECXNGupKStZswuuMdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJVmBYpC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJVmBYpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8D61F000FF;
	Tue, 15 Sep 2026 12:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789476972;
	bh=YF4mntQxtpXpx2iT5moDcDVtZuW0rNrqIirDeWtBy3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GJVmBYpCeHnNucedMdNfoTrlAIn7pi6oAXPkGQP0XKcd8yZN4wQQdBhRixmuN9vJB
	 Ko5F5KH4uYiYJ2hPhuPqb69b5h8cdFpM6Jeu/uRZx6LsbuetnHOeINYHR+ba84jL4G
	 P39GvDAfDwovdUA/lNcArT6KihFhxcUZGsQKeMt/PK4OHuQ5Y5K+VvwcEh3T4L3UgM
	 QWGIw8bS5IOYSTrRAJcsdHsgcLOZ3yXy4e1u36s+rk4hkWRCE1lELXFXVdKVJGuDvZ
	 vUp2pfLw6jyEQSaztlw6/XITBDCsNb1pOP09Nchqvlxj1m9OeDV2OFgQmWqSY26hqI
	 FqgZnjQsBZvog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/13] leds: st1202: Correct the name of the
 prescaler conversion helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB8497AA602374777F1BA08E07C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497668D389D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB8497AA602374777F1BA08E07C5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 12:56:11 +0000
Message-Id: <20260915125612.2F8D61F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> st1202_prescalar_to_miliseconds() converts a duration in milliseconds
> into the prescaler value written to the pattern duration registers, so
> its name states the conversion the wrong way round. It also misspells
> both "prescaler" and "milliseconds".
>=20
> Rename it to st1202_milliseconds_to_prescaler(). No functional change.
>=20
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497668D38=
9D43F680D2CE3CC5BA2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D1

