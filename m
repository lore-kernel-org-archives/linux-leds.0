Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CE645D92C
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984352; cv=none; b=SUpl+GCt5rk+33GBPRHAKk6MU7E8JLXsaQt1A0q1hHP1C0owdVpG92uM4tPOXX6t051Q0GzeV7GyULbs/1i8DoaT2ZHS0lnuw5DbDwBYD2h3t64ETd/pKUHztYuuySp/x7dwVw5n0wSfvuYbKK8F2RtCcfYe7S1d1l0Yf73PgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984352; c=relaxed/simple;
	bh=jpK51PQL6j9Cf1IgpkOHIvcSEm3bEnDbbhGbkSgqDQA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uRyhakYQ71UP5sRnFyg0PP9tm7mCluCe5vTV1xMHQUPQsJ+Xh3IH4JoAXpmmTh1JALMxFznTibAvuGyuckBaNZ13KYzO51NHBYKtdvZvAXXEOZSMDVFDwk04kJlDRzI2qJJArI3WikMa6qHYj/MvdXoKr8JlBZYM2Jz5BmQAncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhuDDfNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhuDDfNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0081F00899;
	Mon, 21 Sep 2026 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789984351;
	bh=jpK51PQL6j9Cf1IgpkOHIvcSEm3bEnDbbhGbkSgqDQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lhuDDfNcXCuMMiFYKhoUtNN/n+iNW/GsNpX4DjD4atJVAkJwiEh3zJqFHEu+Qw3x0
	 G0EnefNc00EHKvpprGN2pzZHWMFHhvqjl8hZeDsJhXsfwPj8Lr6WVJDTa2k8h4zlBN
	 PmvmxDalhzMiYLhW4+uL5ECtNhFRRa7cogBfACPrnQm4/aEJG/zmqJTTk7TMx21+Zm
	 SSnXe0v2O7Wn75B5CbqK8MYtGFs78QUS+xgErLs4thhhJJRsTcOA5JRo+5mUYm1jhC
	 8MgkQr3MNfDkdFUNWJc+6s8MprAj604ZpiJDtQiCShuDG4J/yKXjLpmq1YCdMZKGNi
	 lofevrnQR+Wcw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] leds: trigger: netdev: Put netdev on activate
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260921093249.3481413-2-alexander.sverdlin@siemens.com>
References: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
 <20260921093249.3481413-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:52:30 +0000
Message-Id: <20260921095231.2D0081F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> When hw control is active, set_device_name() takes a reference on the
> netdev via dev_get_by_name(). The register_netdevice_notifier() failure
> path frees trigger_data without dropping it, leaking the netdev.
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/20260914140045.B8F4C1F000FF@smtp.kern=
el.org/
> Fixes: 0316cc5629d1 ("leds: trigger: netdev: init mode if hw control alre=
ady active")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921093249.3481=
413-1-alexander.sverdlin@siemens.com?part=3D1

