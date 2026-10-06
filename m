Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90A1CAA78;
	Tue,  6 Oct 2026 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259007; cv=none; b=Padaje9JOOYUZsv1zRmLSkYphuGRNt0lymNXzVt3qPMk7E+/vA89FV7aIXG2A1kntxRbSDaiQ87PW0XG+/N783OgaEu0uNA9D4MBqcJQGoEvyH2M/SL9ASZxF5paTnWFzEJyxVDHU1zqLcPleY+v5h2/DfwHWKAETJqaQvZMncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259007; c=relaxed/simple;
	bh=bvGDH/KdaZKStzOnmDyDNsK3cDCR6DsIHxsKUZVPqWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=upY4kRrcXvYHFDUtsz26hIsIIjIpqYABShh75Xyhow+YxMjQZ5yxs2QzvPMhgL6EPqI+dd2/4w58vEkf7bTzyvW99eJCjF2vh0pNlvDKvQ5kg/RYRI+VUjdvUJP7tsPXt+jEEZufMgq00ipF9lTc6H0b44y0RXu+WyLFN02b2Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OyBLe/Bo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OyBLe/Bo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186C81F000FF;
	Tue,  6 Oct 2026 03:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259006;
	bh=bvGDH/KdaZKStzOnmDyDNsK3cDCR6DsIHxsKUZVPqWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OyBLe/BomHBB7g/aE/vw7Bpps40Z/MaWA5HE0JGPEHFDM9HtcbI/O5ysdn3SRajEE
	 h5tU8BXfUr59Ju1+dAzh8pATrQVx5D/skINRsaoUjb9ozgKnwvNn3Z0C1jVQN43qus
	 9fx1BWr/hRKJNtaW6MUpPwIxfy59qz+R/AMLRDwyCsnDz+8u6TKFJnaUikmyBtkCgX
	 DH3s8k5T3r6RWS5UDBV3lFOxnT+Pd9batVsmlomVF7njyE/iXlEiGB1loOe9gTbbwY
	 MSer8nKU4qTn/fNNg7wo/Q8lkCBYYuXUAxzh05udovkGA/JhVMWYMxVAr+xK5SN+eS
	 kMAPv+ce+aDMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] leds: aw2013: Add AW2027 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-3-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-3-108ecbdf2775@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 03:56:45 +0000
Message-Id: <20261006035646.186C81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The AW2027 is basically the same as the AW2013.
>=20
> It differs in:
> - the max current (30mA rather than 15)
> - the number of current levels for colour-mixing (16 rather than 4)
> - the supply voltage max
> - the charge indicator (unsupported by our driver at this time)
>=20
> The max current register (imax) also moves from LCFG to GCR2, and the
> selectable current levels for colour-mixing (LCFG_CUR) take their place.
>=20
> The current driver implementation provided here sets the global imax to
> it's maximum, and scales each led to the closest value using the local
> imax. It's the best result achievable short of adding custom sysfs
> entries and mucking up the linux interfaces.
>=20
> Comparison of all AW20XX chips https://www.awinic.com/en/productCompareLi=
st?id=3D47&ids=3D1022,74,96,75,72,71,928,927,73,76,578
> AW2027 datasheet: https://doc.awinic.com/doc/202507/77b87097-27bf-48cd-af=
9b-9b615064c1e1.pdf
> Vendor driver: https://www.awinic.com/en/driver/AW2027DNR/454
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-aw2013-aw2=
0xx-rename-v2-0-108ecbdf2775@postmarketos.org?part=3D3

