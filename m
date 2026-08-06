Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69526477E51
	for <linux-leds@vger.kernel.org>; Thu,  6 Aug 2026 11:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017544; cv=none; b=eIjTtyXluTj6xmPz//d/sckS2igNdiAIONDc6fEVotLR43BlojCj4JqCoQQMOVxKrG5dv04xTQGVZ3ySIGzQ97w8Cprhz4fbYbdj92uvLRph6KCV5qcohaq7aUg9ZxC4yKm2USiMQl+mmX5+yay3ryCiAwITvIJdA62j0ctEIFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017544; c=relaxed/simple;
	bh=C5vRN4QhiyAK4acT/NV90TAUyr2s/XIWy6zlUPja9FM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pchKmDQsfsT/7/q18DI+ea0aFOPmUz3KyrE6OhTSJAM4GvpEcyAGhJHB5sp7s/RH6P+oiR424pWmGWmhNd0gTxSs0C7sYS9PvTxnV28p2R6HqJe9sfOzuMzTGYB3ci2iRVdL0IqmgRwq155zeIiB42VLgbvSu6I+b0+1+xOf7KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P25EnIOy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P25EnIOy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C063F1F000E9;
	Thu,  6 Aug 2026 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786017543;
	bh=C5vRN4QhiyAK4acT/NV90TAUyr2s/XIWy6zlUPja9FM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P25EnIOyVzlBONXP2qv8Dvq7l8uWY/JnBw+1q4X5sHeEmw1xeEAAsC076XIXdJZaC
	 VbS413uQwg1uNOQYdi4GgvLcxFIXLcuW6VIK3rb49JsXTscmXGteQeWYwgCylTUn0Q
	 mA9dKYlOy7vnLtGizVcLnyP/R91olzldk+HceSriN8C5J7o/SE/sBiZis+0BzfhHQ4
	 YQy/eqO/KroyLUWH8cWNIHIXP9493MG1zB0F8zWsO1XeBbyRD9L/xhDcJF3M0kMWfo
	 JOsypGSf8es4fMOK9tNzEqA/kwl9vz545nlvQaj/SbWBQ0uaZMyNpxQQKD3UBEKVJ7
	 rCwwdW4qwkgdQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] leds: is31fl319x: Modernize registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260806-led-modern-v4-1-eed715baab2e@kemnade.info>
References: <20260806-led-modern-v4-1-eed715baab2e@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 11:59:02 +0000
Message-Id: <20260806115902.C063F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Use _ext version to have properties parsed to avoid needing to parse
> them in the driver itself. More modern properties are recognized and
> the leds can be referenced via phandle.
> Due to the maximum current mechanics, leds are not registered right
> in the first iteration over the nodes.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-led-modern=
-v4-1-eed715baab2e@kemnade.info?part=3D1

