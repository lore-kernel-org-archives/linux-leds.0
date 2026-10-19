Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6FD496D53;
	Mon, 19 Oct 2026 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404458; cv=none; b=PxScepsdqB96SeQXWKrxpVQd8348FA5fcxaSDvlcEZuIQJlteWceE19XIYj4D4E++3cHtRFTMshADaBlW3OCQwnLIgVewRG31BGlRs9crowSlOOFbjHDgIFSjm/nQA+DT6ey/CygFXo126ITmXnOAwTuIigRqfY/48ysEjKHC1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404458; c=relaxed/simple;
	bh=Arzo+IjzbyXm7Tztvr7fkh6ndjZSwAwgMGNUJbuWPWI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=vBYl2nsPUYfKxsPSoIxf3vyrhPaFnGNzEcZ/XBAaIpaC6YzeQ/Q4S/hakLk2Mxwr7/k8MI6oQjJKivp4E5WH6yPATxYqq//mHu+NLc/f6l3Azs/8WzJTuXKKN4LxUuHYoO2e1SZeHD1bnmlqHVJ0xxNmeTsCPl0URtTFNHHRl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVaMltzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVaMltzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7EC1F000C5;
	Mon, 19 Oct 2026 10:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792404456;
	bh=Arzo+IjzbyXm7Tztvr7fkh6ndjZSwAwgMGNUJbuWPWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KVaMltzHwHEg6VL7ClTd0iJzaQeOePU+XwyVne3Yi9FhXJkVW/JP5C+7ttbB9QDnT
	 Rn/t+QY8Ks2DaP30t1PlSE2PwEX+aj61aoQwtA7X2iW7zLTD+6KdBBtYBMUKFFUA0t
	 nKtfqizgxry09l33OLagWWnxz6ihNpKty2Qr7AzUKgyRxVbnb8jVrQaWEAb29zjrzY
	 yFzLN+HHCAGZX3TzdxVs4wO1BHt7jr6y97wkJFTZHH0o/GhGY//0sZy8cFlp0sOiOV
	 yki5TS1wt4Tjv67JkJ+Q9tpXlMknEXSZqVbBzmSoSx5C2y7xGHjxAxjVhJv5tDSGjR
	 VKRUIAdzO/OVA==
Message-ID: <sashiko-outbox-176948@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/7] leds: Add driver for ASUS Transformer LEDs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261019100406.103687-6-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
 <20261019100406.103687-6-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 10:07:36 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>=20
> ASUS Transformer tablets have a green and an amber LED on both the Pad
> and the Dock. If both LEDs are enabled simultaneously, the emitted light
> will be yellow.
>=20
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019100406.1036=
87-1-clamor95@gmail.com?part=3D5

