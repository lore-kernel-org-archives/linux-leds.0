Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE073382F7
	for <linux-leds@vger.kernel.org>; Sat, 12 Sep 2026 22:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253169; cv=none; b=gTQ1K4uE7iF2GjAmMV8tibNVXiv1m8Adyw9AxHooaEfDTA0z0iTk0AXLZ06Wn/NrZJ3cg7w6RvkSf/JC1Im8TOHK7wleruRybeGconn2A5krSq+PVslV8cGiALpfM+lY9biGQR705LaSU7hMzzQAxr7vGIeDHUSymsjS/Gz9B08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253169; c=relaxed/simple;
	bh=VVaRJv0AuKvFyvj0ouF47/dyKARYAPcGOWjdKdOaD+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XPcKfXXJSvy61Sa5akT1nZQ5ccuPlpv2R6xXnlK4F4p/gGm9IL2aNIXWGc5mjSWqvMJQa1qTFZkQCvxl7WO9Wr8Ilj6poQj8hnNGrqLwpRzcGTaTB+ZywXjPv1tyVygg1UzR4uepA5farR+Z4GDCwkxGUk6/0OhxMJz+BmuOkOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQLa8D6U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQLa8D6U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F023D1F000FF;
	Sat, 12 Sep 2026 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253168;
	bh=VVaRJv0AuKvFyvj0ouF47/dyKARYAPcGOWjdKdOaD+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cQLa8D6U9cQuXBV8WINFxJMqdvN4Vp3RHcSHfWRWaSbsfQafh06sF+8aiy5I2LNH8
	 hqgHQ24qPx7sZOb4hjgUSGOgL6a1ziK0Bbv1jJzc/ihBrBp198UUrtiqiHvdpGizje
	 Tj2Ka3JJMrKhXppT3oUMvBXtTRX7ocDPeGN/Thhqm+7kXXTexh6w9W4JWOv2BFY6Of
	 uyUhM4KdPFN/vijq0f8KK8mFrEKEwGUhgGM3rETC5A5AU8W8NsBUXQ9uqY9W72pC1A
	 3DZheAf+9HBBF5cXAJmsKhfPgxBwbO229iDaLWWPyODKrYImZS08CbFj5VjCcJatym
	 JZ0HirHzCRkKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 04/11] leds: st1202: Use u8 consistently for 8-bit
 values
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <GV1PR08MB849700619434BC1FA0CCD8EFC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497422B7A44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849700619434BC1FA0CCD8EFC5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:46:07 +0000
Message-Id: <20260912224607.F023D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The driver spells 8-bit unsigned values both as uint8_t and as u8, a
> mix present since the driver was added. The register helpers and the
> prescaler conversion use uint8_t, while the rest of the driver uses u8,
> which is also the preferred type in kernel code.
>=20
> Convert the remaining uint8_t uses to u8.
>=20
> No functional change.
>=20
> Signed-off-by: Manuel Fombuena <fombuena@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497422B7A=
44424C4968AEC1C5BD2@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D4

