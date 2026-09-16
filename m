Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010652D2DE
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575789; cv=none; b=WRHiwY/INmxEehMBXGgfUYlzp1OsMjcZ+m2fpMHN41f69qSTPQjPKbiDS0pzocmT1gkhr78mLZqBALh5OaQBhNG9g344+/TPJgXg1i2Hy+0P3Qy10Gesh+WOcHJv2bQVLY28CAwANWJZMvCba847S6pzb2QrE3CogPK3ugd40eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575789; c=relaxed/simple;
	bh=W3yK5oggubDqXS/mM4H2MTwpNStLBFVlu4dubY9j6vQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uq3+aO0HJ3HqbWv8rj+EU59+ir+xz+8NLzfCWvjEgAJ1aumGZfTL9nmSnBC4j4P+onYC3428qzMT4hlczOHpQSMUy1b5Ygqit0xJRUST4UDCbVX5B1yCnZ7viPS2NDh75a43kF5SRIQe/s1+iGfUnrv/qcDtLYa5sfh0IoNDYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mn5wUBZz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mn5wUBZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E3D71F000FF;
	Wed, 16 Sep 2026 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789575775;
	bh=W3yK5oggubDqXS/mM4H2MTwpNStLBFVlu4dubY9j6vQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mn5wUBZzdDkgq8N/usdUbWDnZ03pz0In1tsfLENcmbmHH5CRCHcDGdfNHiOo8WE9/
	 zSbrA+SXWob6XVUA5zmAGDfnI9vI8LYZwJ7Ctytfg/R/FhIOooIZMQPzCbXJlveP5t
	 t5ecbYTag8ARDji9vf2h1ge5AquLJm8a0C7MV41UoLvmG91jZcuaWmpC2WRxqJ4/A9
	 fS8dekaob03LzM2oZZlgn5h1X4FP9lKdloL3OZbIApr4oZf4Y7IP+OKaXCnllY5m+x
	 aKDDDVk2f0CvHi/CHvPemOg+LUG9c1WTWM55aoTE8shKgI3BMb/lo+KTAvUSoQ41oa
	 emut5QlGIbahw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] leds: flash: Simplify flash_fault_show()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Antipov" <dmantipov@yandex.ru>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260916161607.90106-2-dmantipov@yandex.ru>
References: <20260916161607.90106-1-dmantipov@yandex.ru>
 <20260916161607.90106-2-dmantipov@yandex.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 16:22:54 +0000
Message-Id: <20260916162255.4E3D71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Do not emit extra trailing space and use sysfs_emit_at()
> over sprintf()/strcat()/strlen() in flash_fault_show().
>=20
> Suggested-by: Lee Jones <lee@kernel.org>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916161607.9010=
6-1-dmantipov@yandex.ru?part=3D2

