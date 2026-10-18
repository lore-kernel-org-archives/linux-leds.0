Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC649B475
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331896; cv=none; b=IN5riHHCbwNCznqsk11eChRk7C4J6RG9UW2H6nCK8HZhp5v8TtTsrPIWVM1UFW8gV9j3FbhE59W1zHYxudx+t3HxDCwJ2Sg7/3w4caoqkyPu9nNttdT2AmgVdWX8mkDnKRVyUZkbt6nqTRQSMqsieUtuqZPKpOifZPIHvchDtHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331896; c=relaxed/simple;
	bh=T5nZts/GmSGojciYRdOeIASSwCoOua2/Q1lK32vDt94=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=fU+opT3de0MfQ5dx9N/4SZpGCGMILD6/YLg7QTK6sPBNQH4mHntl3Rin637rfkT7AmFk0m14oMUfF0yvOL9c5LUXKhC6We4mYGZ1HSJ7uaiHHytYrrkfLnVCcvKPPFbmhJbi2hnbg2Mm3k7xer7vExvCvx8lXEL50RIn9MRw/MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfJ8tZQy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfJ8tZQy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326A91F000C4;
	Sun, 18 Oct 2026 13:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792331895;
	bh=T5nZts/GmSGojciYRdOeIASSwCoOua2/Q1lK32vDt94=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VfJ8tZQySaZQvI7K/QmVgiXfvbLGYdJ1NAtGt2bF0CqJDsVz0o8SrpvF+/Ir00awq
	 t974nks5FgxYNygz2SOzMmOkWxHSQJKypwpqeeu6x4R6cWVNFE4ceiDyhI4U26pxrL
	 +mQ7WsK5ucN8gE0h7+DxX5a2/eEBsXqOl96bsEQRYjBaDffLCbHM6sZK/Jlvp351SG
	 P6KyFw7o+je2sZfi8pvK4rPq4Oc7yIS8w1lwB4dUwEesuhXlgrhpI0fi2Pp8ncvBmm
	 zpubXx8xV+2nXKG789l14rWL/C8AklJmUdDZ9ZIqB1c7FTJk1jtg8rDeWxM1GXUsDK
	 YviB3KDMK3Ydg==
Message-ID: <sashiko-outbox-176172@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] leds: multicolor: Adjust maximum subled intensity
 during initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261018135339.1109271-11-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
 <20261018135339.1109271-11-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 13:58:14 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The maximum brightness of a LED device is fixed after having called
> led_classdev_init(), so performing the adjustment during runtime is
> no longer necessary.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018135339.1109=
271-1-W_Armin@gmx.de?part=3D10

