Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC120ED;
	Fri, 11 Sep 2026 00:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789085318; cv=none; b=clZ4S1Ukw4EZhZOnMsS7GnlbaFPUBilobef3w+l/TRz2OvepIJXiGe+ifiB1g69s7Y7NHZaXdpbH6DTbaDktLJzmpI2RLRet3eE5pUcyOjjBt2ZkdcO1ny3nJOiDbn457dmYkCFhNnX3/QY5mR/VYQNHcvFiYps4ab8bcgm7tHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789085318; c=relaxed/simple;
	bh=lsnxtRHg7TtIKvqa50+tsrMfyEB4MU3AffaNJPy2pPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P6WX7IZLX0QcmuDhCw5P/JEiRA4t3r+rcKUoTCO4FmV5coRM3otPW62wgans05042hopZRWFWOb/KhvJ1QF9WFauzFbIGCOqVy8vxU+S6MEmAomn2VBIxJaI+acYJ+dLtcciKS2OOmpJoeat94wPA9YooiVx01U0F5crmWYZ08c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ri3k1rLm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ri3k1rLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95C71F00893;
	Fri, 11 Sep 2026 00:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789085317;
	bh=lsnxtRHg7TtIKvqa50+tsrMfyEB4MU3AffaNJPy2pPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ri3k1rLm9DFRFzuKzZFMw9XK++orALJx0Tjl2GZvlbdBwH/wRF4+lz9dBIX0IY6E/
	 6FZdcqWs01uHdi1OnHjeQ1OzgtVIo4PBCZOv6s+qQ/CBMC8Z7ybRF15ZxCIpwIGSy9
	 xBsVoPWELMhvsEuxRDKPI4IAi+MsF359pKrBKdLuSaXIQ3cBlEFHKKtnJQBis13/sR
	 vYh5ubtaMrAqfuX7ErnlMFFpruUUdSIJzlFUw1CWi5WLvAMeKJiGN5BY90lyEsoRsK
	 +yR/uCvfkDualoLTpuDipvUcWUcc2deLUNxu//XBTR8mv11PX5MSt/jUYEEx3dA6Og
	 YiZaC1C0oC/xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 1/2] dt-bindings: leds: Document LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: linux-leds@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-upstream-ltc3208-v13-1-fc9aa3758b55@analog.com>
References: <20260911-upstream-ltc3208-v13-0-fc9aa3758b55@analog.com>
 <20260911-upstream-ltc3208-v13-1-fc9aa3758b55@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 00:08:36 +0000
Message-Id: <20260911000836.D95C71F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-upstream-l=
tc3208-v13-0-fc9aa3758b55@analog.com?part=3D1

