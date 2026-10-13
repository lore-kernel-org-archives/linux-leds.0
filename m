Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C209F3A5E89
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886374; cv=none; b=gIEeWdTZ9L5Y4P/IqmfVlKL9blSTRp7ansiMI5esP2cVFfrCbvmCuZw1IaMOMOh/K4/MYP+hMjSqNP5AfCLujg2xhXcp3U8BDa+VIB5PJpxyOMhVMq2NC3Yi0mGSyPzTCohwIoJ1s2vfa8eYIvi8Lv3Fv1iTYRyp6erDxgLor9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886374; c=relaxed/simple;
	bh=/wGc95QH6DoRcCjsR8kbF6Np4DtgTMJ/wc7KH12VOKw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qFc7ac8b+h8hFw2Ac65r4iGtGQ7kTbuu2Kxkb1SM5Qb0Xq6aTouoGHhprGTRydSR6RjkUgbiI/vqu5StP1BeC7e8s1TmDxzYxoUfdqzLordM7bX6IkujfgYd0v9GbTCx2v15+1FmXlJpHHg56eibzSF7qPfdxhdDkLTpoDLb6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4Cb2Jqo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4Cb2Jqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9AB1F0089A;
	Tue, 13 Oct 2026 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791886373;
	bh=/wGc95QH6DoRcCjsR8kbF6Np4DtgTMJ/wc7KH12VOKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W4Cb2Jqoav8SQtg9/FeO/86ItbtoVOX/r7Vx68curminzwprggDoWv0ay3myU9CIU
	 UR6Sn5g1A8EmOldUirnkAZqOpCMCY1BWp44S4vEgqlmCQ/unYoAiUOh3NixkIwxQj+
	 e9T7SpwCxNQ30VUQhq6mLxzkKzlKoClGBi0bfSkBlE8XeUrLqgPWijD0gkaz+xGubC
	 U3RdmN22mzhnCceq3fHqE2Q7JN2CJ1eC0LXRX0464WV7ayF9me5MnYjv6Z6TW8UQ8H
	 Q0n7WvTvGWswvyfcFKYF6dsfy8sldyG7fmWIpzXa9db36oogoVZZYFvwfKVvR5HHBa
	 IVNZUzcXAZD1w==
Message-ID: <sashiko-outbox-169470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013-add-is31fl3206-support-v3-1-66a762a3c12f@amieiro.net>
References: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
 <20261013-add-is31fl3206-support-v3-1-66a762a3c12f@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:12:52 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> This is a 12 channel variant of the is31fl32xx led driver series.
>=20
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-add-is31fl=
3206-support-v3-0-66a762a3c12f@amieiro.net?part=3D1

