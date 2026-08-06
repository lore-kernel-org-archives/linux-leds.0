Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DB63B52EA;
	Thu,  6 Aug 2026 02:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785982349; cv=none; b=Xsn+5/n6ppdv5jq1C0O8jACK9UTQ/UZZR01h19sgtDgDd/uCwAbh6LZvySM4MWf3Z9IYRLuHTujaP6ey9OacBRkTgXRYi6p4+F9RaTDkAr6jp6rlQi50yTwnBx2J6rOZ7gOs8MVEDz2wDnuRNE0NnMMCcJPS57Nx/1rd/6pg/fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785982349; c=relaxed/simple;
	bh=BWpoJOfkvYkeKiBj9s4RkOufJhUrKlVV+lMuV6QCzds=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p2vhWaA+uGaS2uJ1/2U1EpW/qSoTqWL2TGshpCXVaMOUabBRImFxiND9Xf5nkzrp+DBbFiw9m3l1l4gRSBqDV4p/tW0AQpSnHXSUJhAzvH4BxCbWwnbatOCc8q55WwZrY6NH8iJHFS87kmAjKekgiKpyDXbeuKGN8UKKHcsSFLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7QWSpPj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7QWSpPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B6F1F000E9;
	Thu,  6 Aug 2026 02:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785982347;
	bh=BWpoJOfkvYkeKiBj9s4RkOufJhUrKlVV+lMuV6QCzds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y7QWSpPj8uRCFZOManRaUq7bZMVs6eD/6Ak+oUstqNsys4aHn+gTF0XLm8I4nlRas
	 UjQwRUc3WwP87Gsw+r/jWcCTK3gFPnWq/xOUK3n/rETRhmawiO8CyGYyiOGvjxB/bn
	 C6G0Y5J/9jt5Ayby9ZcPBKP7xV0MBJWM9EG7YxQWBcqCMAySdPJ2O5/l9mPuRoceOp
	 Fl4FzziEcl4I9EIRIo6xpQmD8LOMQYQ1LQWP3vTIX/JJYdfjsqG9n2psJuBaHgHJNm
	 fupL+LsjdV56GUbVuhIvaBXYuZU5vXwnEXLNNJa6+ddyT7hVDUvOX+3Ear5swPW+to
	 XEVE0MAtORfEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806-upstream-ltc3208-v9-2-c746e872c193@analog.com>
References: <20260806-upstream-ltc3208-v9-0-c746e872c193@analog.com>
 <20260806-upstream-ltc3208-v9-2-c746e872c193@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 02:12:26 +0000
Message-Id: <20260806021227.57B6F1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-upstream-l=
tc3208-v9-0-c746e872c193@analog.com?part=3D2

