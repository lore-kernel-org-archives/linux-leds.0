Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01B6426693
	for <linux-leds@vger.kernel.org>; Fri,  9 Oct 2026 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537662; cv=none; b=U/Mn6KuT0Qf1AISNKOGnf7+oCtGeS9s45AraJgCd3+Zoos5wRTLt3Z9Zhzn19OgGpr+geum6p9hRv0xLbEap/nfK+G5hK87XZZA2juj9W7dnO5t0j8NoiOm5mpHteWr+cZuGeosEpM5WepKR0KMNiQzSLuEHuiWpwqYES1T7vS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537662; c=relaxed/simple;
	bh=6OHeQyw6fa8ydLxP0BW9vfU+yw1vgIQ/WU4Un/GEGbU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hU3SgCVIWufxkVQde8FFIDXhMYOPfnv9sVyIjjUBdWv1nAmfaBFCpjl4Ht19flau/3TV+aS+vZBWj4Zjp4H1hOyDzCZ3+psHqOhXbEObq7De45H/MSLRiGxFd0SZGQQpNGaKD8huJn75LFlacj5xAH5JR5FGDQ7pj9dk7jp7aGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjqcJ92E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjqcJ92E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA5B1F000FF;
	Fri,  9 Oct 2026 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537661;
	bh=6OHeQyw6fa8ydLxP0BW9vfU+yw1vgIQ/WU4Un/GEGbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MjqcJ92EnrYbrilgbRjkps5vYbb+TgruFMAFVbopLuwQpPt/W7H+tFGaNTpfYX+DM
	 STaZ+y6VtT7frA149p7WnzvwyiMPb4oLb/FkB+ulFsSWn4kkSGNlUj1FIUHK9SsOoX
	 4NjKg53FJADD4qvpn5JAyv9Js38NVO0ruOJCrtNGDosaYUujZeYMinVJ8yyyexgDyY
	 w+SnnhfhpqOHnwKs3pJqerMJIRE4f70ZDggmLRIrll4p1H4CLHEAxhfxRXFIMLxJSP
	 XcWEfR/JU3RMZkHcdx2w9sFe/HMW7lD0TOwKjcM4XLkGTnLk4XCUg81ZZRHnL6NXKo
	 Zq+1iXa1wteYQ==
Message-ID: <sashiko-outbox-165155@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] leds: lm3532: Propagate enable GPIO errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261009091059.25729-1-phucduc.bui@gmail.com>
References: <20261009091059.25729-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 09:21:00 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: bui duc phuc <phucduc.bui@gmail.com>
>=20
> devm_gpiod_get_optional() returns NULL when the optional GPIO is not
> present, but may return -EPROBE_DEFER or other errors.
>=20
> lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
> were not present.
>=20
> Check the return value and propagate errors from the enable GPIO lookup.
>=20
> Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009091059.2572=
9-1-phucduc.bui@gmail.com?part=3D1

