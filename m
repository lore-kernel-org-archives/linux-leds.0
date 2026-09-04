Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F7330B0E
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 07:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505902; cv=none; b=KhderoCugDUog9lSbZUGYPYDyBhy11M9PnYFTYTvJl2zNg6IWNnsgr4oMlL56pM2h1tPan7ErhaKLMkdpDaYr5h8oMDCtfF82KNrdFzkaGMlZRc20Gt5COtkdT18J4rRakMQn6kL6tTYlCfpsjtiven17wWwbtq+Ps1yd7GettQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505902; c=relaxed/simple;
	bh=+T3qLgMdbwAKQGeb+6CWZmbVJ2vot90srCNXELSffII=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W4Amw3xV4Tv0d+8Nwt5TeBPnQkFUtXU7eoHx4/KZGtjZTh/4S3b6/PXVnDgCzhhTt1+ThEBc5GpIOKllsaFGbaC4BCpK9CIA/UFk6Vovlrbfjv5VRJLGDpnkTYf/zIsCG4/kwxN4zyDV9MY1NMomnnX28K/tstUD4oykpVDBhow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9GKURKV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9GKURKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC13C1F00A3D;
	Fri,  4 Sep 2026 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788505901;
	bh=+T3qLgMdbwAKQGeb+6CWZmbVJ2vot90srCNXELSffII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V9GKURKVdaLK/Ih13u9IcJIzsNF084a2Zfa6aPOmdYIVkwBQust9e0dN6DxQFTlAU
	 OUGqL4Dti8Fa9r3oA3HfEhHCFURVG1eEyJ9KMg63OteU9jdSs9I/l2V0uqt71zkE7J
	 VU9atcrMaeVVHb9Gq+aCVJTgffhDfTghjrf5xds05LmyLYCJs4UzOcTm/c8hxxh9yG
	 daaTj+zV3nfJnhZc4K6XmYHknY/IVanCoXa9m2o3S36/fAqQIB+koqoeiR/2iLHyqp
	 CRFJP8a+GF9Omr5AifIHka2eCdDrhhKPU6w4732siDPPO0U38YDNp1GiasaCUWSXAV
	 lYbQdSn+yAV/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] leds: flash: Simplify flash_fault_show()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260904070806.19125-2-dmantipov@yandex.ru>
References: <20260904070806.19125-1-dmantipov@yandex.ru>
 <20260904070806.19125-2-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 07:11:40 +0000
Message-Id: <20260904071140.BC13C1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Do not emit extra trailing space and prefer direct pointer
> ops over strcat() and strlen() calls in flash_fault_show().
>=20
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904070806.1912=
5-1-dmantipov@yandex.ru?part=3D2

