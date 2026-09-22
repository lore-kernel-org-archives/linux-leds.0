Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B568053E2FC;
	Tue, 22 Sep 2026 14:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089010; cv=none; b=f/sLnzF5wIEAXmbosOskEgUn+7Dd3UEGQTTbDrwvkJNrBddPIPBbOdNI5NcwJSpFzbcw4t5Py6OokYkJZI53zpuseJpd2pMBzqQdR8O3bRrO3wQ0ygBn9cOXTUO2N5fuD9k52nORVozPKP7D0f7t1WUR1J4Ith0gW7lQIPVddng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089010; c=relaxed/simple;
	bh=8j+o8pkL4ONJ3zpiKQTw6CXen8UJ0SwRU2gN1720bCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PpTfeZPsF1DcDBtngW9WzN9pxYiaJHjQonhFgbcPBmOYK0rPjufKi+aU8da5O212zrRXh0bkeIvH1jQuDr0+uGtXDIfLchFdukoMRQyQ0vyiGWl7o7PHXYJas3oYb/xAheQk5gDm8oLsm42v9pIsqfo/byYE1hBpe/MRIK4+0Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=muo6cfuT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="muo6cfuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B061F000FF;
	Tue, 22 Sep 2026 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790089009;
	bh=8j+o8pkL4ONJ3zpiKQTw6CXen8UJ0SwRU2gN1720bCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=muo6cfuTnCTX4VbTWxORhnxZ5ENUTPqTxSr5nEnTez5430uv1G+rj1QawOYXdqwZx
	 3Uk4O16fiBrn/sDZzcYBPoPkq+9kTqfAu34qFadT+JTW9pajqKhOYEHhQJzQuUwZOs
	 SaXAonPWV2MohK/fF5IKapf9Vb9thqUSg2rbYHGxB2t0/m0sU9QoadebKHvMIyl631
	 9I1r6ZusoF+rW45A29hNzMO5OX6NlAF/1mJ+oHUYegdl6yfHBoADy2usjuJjZtFiK/
	 vpkUsoxBBQ3GG6fUQovnjayjph8IEqa4y8RUbUoa7UvPqkJ+UCnlchYlL+U9qyZRux
	 oM4CMYghW/+Qw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] leds: pca995x: Make output gain configurable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <b77094f48d9aede5832f38927c64d4e004a14538.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <b77094f48d9aede5832f38927c64d4e004a14538.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:56:48 +0000
Message-Id: <20260922145648.D0B061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The output gain linearly configures the LED current in 255 levels; the
> absolute current depends on both the gain value and the R_ext resistor
> connected to the LED driver. Make the gain configurable in the Device
> Tree instead of hardcoding it to 128, allowing to adjust the current
> for different hardware designs.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D7

