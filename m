Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAA62F8EBB;
	Wed, 23 Sep 2026 00:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790123783; cv=none; b=abLNw0n24SD651OqhS0exJNV7U0zfwxDL9yIfjTY7256x8SXCg0KlQdee/lJf4ZYfxHnmogtZlhLS98XcmH7fEHR990kXzVEMZPG9paARSCTROWCjyUUZp1V6A6CGxQMh4UJV/PUEz6iyRCch4rHs1WvquZ7sLsHchZzBLL+em0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790123783; c=relaxed/simple;
	bh=tQEfcB7kJCA1ldWh6mmE2mhNwk+OQjaple/NfDCmzuA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T3UwH3VHHM8jo40Kph4s05OCXC4dqGVhNNWQqHvBE1RRvkwI+LFfnGO6HnrW2Sq/GreTBNLYZnumuQuhczw54OMv5yz9mjWaVC1VwQvJhKoLzxRxvg/kHZQrth3upSKKMqlJwIcO1cGcOGI933NOCcsmLOiLsn2NdHaIjyNIeZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhQAsS9S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhQAsS9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222311F000FF;
	Wed, 23 Sep 2026 00:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790123781;
	bh=tQEfcB7kJCA1ldWh6mmE2mhNwk+OQjaple/NfDCmzuA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OhQAsS9S4nuoiKD/IazcbeDyJCJCTHr+//4ZEim+QI7zV+4kVTB83EfqpJPfcWe+A
	 REWhfskaFGkpbypMbx/vcBpk9VFCsu69Q68hw7Yq7rUvZMLBj3qOt8PH16MTpxo7iX
	 1WM8oMLokwg16GrbI9byGMwO3OMs1dw3ForlIIXw02c2wjch8b1tCxE3DkViz8zwMY
	 2XpVf7Qtb1W24Ldq4EfDK4HKcg4ERqOtwgXovYk1VqZi3/Fz9eWSxsMa+b3ZNjrY8f
	 CI2EnmQJOkl5vOwzJIYybwl9T5z3vPWsgAuGQQVREE3LGfg6xvYEVu4F8ATfXDO3Fi
	 hDclexfeXwTQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v13 1/2] dt-bindings: leds: Document LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923003325.61722-2-jancarlo.roleda@analog.com>
References: <20260911-upstream-ltc3208-v12-0-9107f5f0a7b0@analog.com>
 <20260923003325.61722-1-jancarlo.roleda@analog.com>
 <20260923003325.61722-2-jancarlo.roleda@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 00:36:20 +0000
Message-Id: <20260923003621.222311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Add Devicetree Documentation for LTC3208 Multidisplay LED Driver.
>=20
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923003325.6172=
2-1-jancarlo.roleda@analog.com?part=3D1

