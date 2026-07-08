Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3EE3EF644;
	Wed,  8 Jul 2026 07:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494497; cv=none; b=c9ZmmPxrO9lL5oGNKZYaCi5Lmryh3PTl1wp7Ae+XO5pN//SRFuxIXwaNVfI4vnHOSUxoiC4ODNQP/y2J7Fm7Tr+hlONDtkrFY6cokFk2U3p3ekaCn3fqmAQErtiUzUMve2pYnZnsNN1eC3VneewHb+w1miMW4fQqPDlrNYO3NMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494497; c=relaxed/simple;
	bh=hhaFe0X64KSGhhzNETD8YC4dLNXWspqkJ7BdFy9opeM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h+Qm/ZU9AeMdvWSY6GCtV5M+43jXdzWI5Ih4lEJ71VFDu9dCuVq6YbMFKg11mLVx4p4BIj/e3AvuRPicDfSXQFAJJYHGzSApArBWwN7TLyZ0tEd53sX/o9JE/vYFcYJAVDbQL7fSJ10PkyIEVR/QOnyOEA3/OqptJqIiZbtiyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fttyLnQR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fttyLnQR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E84A41F000E9;
	Wed,  8 Jul 2026 07:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494479;
	bh=hhaFe0X64KSGhhzNETD8YC4dLNXWspqkJ7BdFy9opeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fttyLnQRfIGLtgW7DF65ANdJn74QYNBDtUizOHAfDxDFr5F2+aEYBiXbDf3bp6nir
	 +bhay7YriqZ1Lq1HgZmvh9LTI9mHTRTx4EQ1G+dfboQLdMMIm0Rf2HL0ekzgccOtMa
	 WfRsj1AB0X9eyz2YhTU7ZIQDwi+eIHVj/UqVjYnVa4/EdPEEmpiv2G10x+3V4nZr87
	 LukQ97zsOAjK8eOMuy0hN1tiQayaY02E4+3Jj2d6suYrr23FoJmjTYO5oVzlkN2HBa
	 06hg7tteRhvqdRqR2/N7QND1L2tU8igq4CLqp/vnQKS1IoSlTpHXXQlahAeLo1VKpy
	 QxiXAykZtpcXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-upstream-ltc3208-v7-2-aed7f7bd461c@analog.com>
References: <20260708-upstream-ltc3208-v7-0-aed7f7bd461c@analog.com>
 <20260708-upstream-ltc3208-v7-2-aed7f7bd461c@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 07:07:58 +0000
Message-Id: <20260708070758.E84A41F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-upstream-l=
tc3208-v7-0-aed7f7bd461c@analog.com?part=3D2

