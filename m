Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97893AC0C8
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870749; cv=none; b=LNKL/YYA9RUcaOP1ff0KIKrH6LQL5q4F+4AjWZTJkHqwP7NP3OkIFxs6HbmtDrtoQPS5A8bGvaK8KbsEwZuIS3Jkhs0+RjORWZktggitOTTtEipwgsgTzXtN5AxJi4fidraEzUtk2QMNQP3lTutuY6DlPNGzogv0V8czBspMSOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870749; c=relaxed/simple;
	bh=TBV34R86SPS5ThLjoDwVci6RMeMKSALxMwwB3k1DYqo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=ayXhUU7cluWAMd/Zi0EdU0ZRgW+E4UpNs4m3sQcXxpvszBqBGrgj1s48eU01EbXvzc5TNlbhtnr4d166U5nFD5klC3o63JljC7MfxOVvHgsigZk0zWD60uAl6UMQ+7NTvEBSZHHVb7hJKZT1bOatTFL/ZR+nprfPKQTC6NL4s3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOGyPrit; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOGyPrit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB5C1F000FF;
	Tue, 13 Oct 2026 05:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791870748;
	bh=TBV34R86SPS5ThLjoDwVci6RMeMKSALxMwwB3k1DYqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hOGyPrit7BgMGFznjhktFgEUF0a1y0neWYwocS329ToGiBVs1TAHbU7Ev0FEYnSVE
	 pHnZNE8e0vwyJvJ4Lyft+Xwnj+WQc1q/HjIizEGJoaRf8i+eaEqYOiffI7vzXbClje
	 HGj20FQcWle0BJMQyMScfDLdCVXT9mEJXjbP9/dDrH1/T+r6S29Ze+xICugjGMzEig
	 0NrVj4vmBDskj1oz78k3qJacQoyZ1iRJgS+/khguupsdqDX3pAomVgaAY/G7B3MSmu
	 mhpm7qIdgdxXuJnfBgWgPO/D+T6R7j8hZdCefc/2XQt68crzzxxNyv6WJH6KIUaJ4T
	 3ao5OAqNBeBMg==
Message-ID: <sashiko-outbox-169015@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] leds: aw2013: Use dev_err_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-3-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-3-cab1fdd050b6@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 05:52:27 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Failure to use dev_err_probe() for regulator requests violates
> LED subsystem guidelines. (At least according to sashiko [1])
>=20
> The original driver didn't use it, but it's worth cleaning up
> while I'm here.
>=20
> [1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts=
/kernel/subsystem/leds.md?plain=3D1#L71
>=20
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-aw2013-aw2=
0xx-rename-v3-0-cab1fdd050b6@postmarketos.org?part=3D3

