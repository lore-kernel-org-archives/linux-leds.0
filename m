Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB95339B97F;
	Sun, 16 Aug 2026 23:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924383; cv=none; b=ipbS9INKrjSHUCZc0lmAHemTbv3wXjh5lJuw84SMFimunDWFJlsRmSwilYh9YoBykw1j4ZBrCSb+hXTuvtyKhRBlZXXbfusPimt0hUkUnm9TympN+8qRBX4HzVzBKLN7AOX/72Bn103aJ014TrSg56ZP8VpA27dFBqXflqRPbW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924383; c=relaxed/simple;
	bh=qsIPhtYCgNWq2eKkK7vxTDzOdV7fpeRwi78eAJEEilM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ltqvq2MEzDW7dyFKeQM9d3tFyWb1Q54BRxn1Rq872Ymls6140CgdPO0CV4AsvHh/nGn4EDiKWi0BbUsxHcdGgrGYFVY0gz7H6Jh4ilyf9Fu02NjB08aVySIc8uwaKG9glZKND8K41/92m+6padygJE25RKII0crxx8l8QJ37HN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0KmoS3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0KmoS3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F021F000E9;
	Sun, 16 Aug 2026 23:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786924382;
	bh=qsIPhtYCgNWq2eKkK7vxTDzOdV7fpeRwi78eAJEEilM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W0KmoS3k3LZLeNqUHxJejHMw6+u8G9uIxYL2JVtm5f7JRQ/bjNqiE5GS6FVu9ZB3x
	 javf61NiPp6DzS9LYd0kDZ3jB4sfDUp02uUdqW0j8UsEwjxSs9mhL39TTyzVLuJ4o0
	 PythBo5s80AVRc2eUUpaKuEOP8fjUa4G3HTzETAT/nTtB/6iIMFhoTTGVk9fXu83at
	 SvVcjEkPRJKxMM2YGRhmwcTtNE8CvAeqSpO5+STxW0Rg1pItx8JpdLrxt+UWZHYgi+
	 Shzbk+XCU/FCe72V82RCemaePV7bzvQXLvt+AqTiQNZD0Q7InbBL8y2dG2PJtBOIfi
	 d/3CHNFGG/AQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260817-upstream-ltc3208-v10-2-e1f9564b1e86@analog.com>
References: <20260817-upstream-ltc3208-v10-0-e1f9564b1e86@analog.com>
 <20260817-upstream-ltc3208-v10-2-e1f9564b1e86@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 23:53:01 +0000
Message-Id: <20260816235301.F2F021F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-upstream-l=
tc3208-v10-0-e1f9564b1e86@analog.com?part=3D2

