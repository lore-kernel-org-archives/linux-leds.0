Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E862737647B;
	Thu, 10 Sep 2026 23:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789084459; cv=none; b=Cb7HKhuTMwd6eZrhDzUoXw3bqNF0v+F+KELF471VQu6y/4FPp1rBeAXyQpPgums+YDWzj/UMf6paxpcR9nmcPEpYrmqsxvtjsorWGuD3WDKMVJHNJOT7VZ+ctgJGO6pstF5leJUD+O48YBRp1vTa4T2H8wp4mfZGSCGwJed+Ya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789084459; c=relaxed/simple;
	bh=wbE4ey7wXv5IiWRv7QDT8jcDOdEeUluGp3V2QV35o+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jAppaUmQnGzBZiIL/aDLj1vp4uXLioi4QeFxR9UWEisQLGR0FopLhywsG1asIlXt+zQ2jHV+ds3/YZpXhZ1ht8UB6nQQy+Ysic/vSHl538raOLl42yP8UKnvSkyceY2zlbGJjc+rnSoGMLN5WxRqlA6YY8UN6grtVi7yI8up3Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZirEBRUc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZirEBRUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448881F000FF;
	Thu, 10 Sep 2026 23:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789084457;
	bh=wbE4ey7wXv5IiWRv7QDT8jcDOdEeUluGp3V2QV35o+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZirEBRUc754TLeX8xjVK2QvxtgoFuUqNKJTqxZOp6Rah9UzOoyoHn1h3mVcK5W+si
	 CL23vNEZOeq2fypWEBXR4kPfr7N/487HB13wLLFJOO9t/I2CQsS5qwAJsrcSHI9jx3
	 6SGpu+Ur0xy25dF74CeDzI1EtqrZJhCd5es8d5n/uBrZMEqSTJOvd8ps351p+P9NXh
	 bZ3pjendEsaG/diUlSFf713JnNWyH6Hrsw/k9Mk5lGw5JnmOvULsukBxNDxXsnici6
	 YYi9YOFkOZFacScCx3TS2Sokv1O3oTSVp+G0BH4qGThXIi5U4xi9mIg2EqAyOUrFl/
	 mUNf/N6uLMvhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260911-upstream-ltc3208-v12-2-9107f5f0a7b0@analog.com>
References: <20260911-upstream-ltc3208-v12-0-9107f5f0a7b0@analog.com>
 <20260911-upstream-ltc3208-v12-2-9107f5f0a7b0@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 23:54:16 +0000
Message-Id: <20260910235417.448881F000FF@smtp.kernel.org>
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
tc3208-v12-0-9107f5f0a7b0@analog.com?part=3D2

