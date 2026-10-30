Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326160;
	b=fJcAUDDKXLvhIzgRkvdf0hvym5fxq9/Fs9iro1DnCfqI6Qbz6Jr8jeM4kc3yH11uloWT
	 Fq2VWSv/TvYR5hkCIUccbV3jP+0kIsTvlnIADrYBr7W6CMj/2kT2INcv821N2R/rbAHxo
	 tlvauSJQXwB7LRCDB1GULZ4kzG82ybSBGAwMGgMehbTUHCFcg4FlxGxLoz+wgOc1WB8zj
	 cOMMGYuwsJNP4MotzmGMthRkkUs5afiw6ICtShbcL03gNYmycW3axRmM8QpQq15xO8Ywc
	 yBU0XCM1SrMmBktxaS01G+lmxAMpXqv2V64ZtusshKDMkjNDC5X2yMCh0EHHLUoJh1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326160;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9/R0gBDIo2DLmsOjtXNpkmI+2urMfoTBTRSX4ADs/BA=;
	b=1YEq4bww7jfslubnb5pVlaS+furJD2y99swtmJ9MNfYklTed/Vr5ezCLBD/WMgu+AKz+
	 7XCuu9Pdk99xuWfXLfIORRStOKmAPPo//uu7G3u0NW+jQMqXNW0BLYfjLSgLb6rV46sQy
	 wijVzNavYWqOP42baOstJKMTmBjNb7Efr32cPjwsLzZoQlxE0vrRpLYjIqOYvltMrWaEN
	 XZG7k1ogfllWhh0o0nzgtGWa01YeTGBJdoTOtup4tPBnrIcsGhpWNu5VaDDQ/GH8ZHc99
	 3DeP5eVBNcx/ywdz2OlDZhoV3w/YlJDt9wTCwo5RzmUz4/h2oBIhM/OE36nEIYx2qjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="g7/G0n0S";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E16606A31A
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 02:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g7/G0n0S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8A41F00A02;
	Fri, 30 Oct 2026 02:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793326159;
	bh=9/R0gBDIo2DLmsOjtXNpkmI+2urMfoTBTRSX4ADs/BA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g7/G0n0S5S0DARiZz97Uudj72W40SS9MR0tnRV2PhkDgR4lJoGv8uP7TVhtaOl0pA
	 +hQEAFFjjgNMVKHm0yFIFYvqdU8q4OJ83KjkGZzG4diA7/nnYRoUhUaSM3a1KtRA5j
	 x8V8Ch8cWuLIzk/8avUM1fKD7yYuG1Re/tMn3kfiXzR9MhDjFvyYJSrEeY2fnAgCBH
	 gUHxUulfaDwNttw0pggzys++Ux3XPvfQIoYz8FpX3MWsGWkYaJRZssJixXXfA3SJqW
	 bz7AAQ2W71bG6gJqDMYvABWiCWy3v4DuawpmL4wReCSLrbGnDasG2inuYouq7pD5XN
	 bFclSxyGgz5fQ==
Message-ID: <sashiko-outbox-190167@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: pwm-multicolor: Manage the multi-led node
 reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yige Jiang" <yigejiang86@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261030020521.9399-1-yigejiang86@gmail.com>
References: <20261030020521.9399-1-yigejiang86@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 02:09:18 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> led_pwm_mc_probe() leaks the multi-led node reference on successful
> probe and if the final PWM update fails. LED registration borrows
> the node, so it must remain valid until the LED is unregistered.
>=20
> Register a managed put action before LED registration. Reverse devres
> order then unregisters the LED before releasing the node on unbind
> or probe failure. Drop the manual error-path put and return directly
> on probe errors, leaving the reference cleanup to devres.
>=20
> Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
> Assisted-by: LLM
> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030020521.9399=
-1-yigejiang86@gmail.com?part=3D1

