Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8AB640;
	Fri, 11 Sep 2026 00:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085267; cv=none; b=Fxs24P5IKORVK4E5Q21lGcgxzxN8rs79Ybb2HsC/XGY42mCG5uK5gMFvbBHxPGLGI2lxpLa8JNee71Xo+nYXXUqleQORdsh5PgNXJmfjA5AAH9H6A2TVH94jzCX6RBGVagS1aCoA5fCRBQGkDNmm50v0cR9ctWbk+FPX4bf7iiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085267; c=relaxed/simple;
	bh=GsGVqKP1Q8TMz8kxTzryxdtrcuJJn79aBOMrQ24hv14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YuMPIMTtHhsEEbXmCLV3GBLWTGU0FTei7/3glPctlF0wmEjIPk8Dw2UTruBr8pfj4dNwv5vqr7/Q+6cLkHSmP/mQ/37hFRKOWlF+IqV+JaNwRtfRCqquPDEizGR8ciivHcIk2OG7NjIOioquDRiLL70vXa6f9tNkFzdgUqhZLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ak8EYwKy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ak8EYwKy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96471F000FF;
	Fri, 11 Sep 2026 00:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789085266;
	bh=GsGVqKP1Q8TMz8kxTzryxdtrcuJJn79aBOMrQ24hv14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ak8EYwKyFYGVuv/07TiD8cdQEDedqUfqQmtddQJ4a6O6rcl0oDys8Go4YgRcY+Ysd
	 tfQFHMRvzomILHRlRiEcd1cMFpFco+gaODOUd10HA7E/mm+xCEyxO6dtUvLeSKQsey
	 pSTql4GUJDWZBIzFRkXO2EF/bZhr54JZjKDW/152sIUZ4xc9Zxk7f4wqhgJD7/BB0Y
	 5+AYS+fq3+XQv+Y8JJOLb5GjeLrr3i7yML0yTN9N9o2T9rtyH3yEf2X0zbxuRfqs1o
	 wi5SO7VVEaZWaQF//URFBG/dQzEFEz3zYRx8C2GPTJeCQnK7fPvqKCVecHARoPMZJB
	 Js9CyrW9ox9WA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-upstream-ltc3208-v13-2-fc9aa3758b55@analog.com>
References: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
 <20260911-upstream-ltc3208-v13-2-fc9aa3758b55@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 00:07:45 +0000
Message-Id: <20260911000745.D96471F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Kernel driver implementation for LTC3208 Multidisplay LED Driver.
>=20
> The LTC3208 is a Multi-display LED driver, designed to control up to
> 7 distinct LED channels (MAIN, SUB, AUX, CAMHI, CAMLO, RED, GREEN, BLUE),
> each configurable with its own current level that is equally set to its
> respective output current source pins for external LEDs.
>=20
> It is programmed via the I2C serial interface.
> MAIN and SUB support 8-bit current level resolution,
> while AUX, CAMHI/LO, RED, GREEN, and BLUE support 4-bit levels.
>=20
> The AUX LED channel can be configured to mirror the CAM, SUB, and MAIN
> channel current levels, or as its own independent AUX channel.
>=20
> The CAM LED channel is configured as 2 separate CAMHI and CAMLO register
> sub-channels, which current is selected via the CAMHL pin, or set to
> CAMHI register only via setting the S_CAMHILO bit high in register G (0x7=
).
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-upstream-l=
tc3208-v13-0-fc9aa3758b55@analog.com?part=3D2

