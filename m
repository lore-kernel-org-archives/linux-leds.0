Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9E4AB1D0
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860961; cv=none; b=WkT8seKCBZz3TNHNo9xZWTUoL+TVvm5aIWf4hxHtIUew9IEy6RqBOW7JFR/e2HuV27S/sfqb3AL8h4kGo5nCQot32JcR35XBCME6NjF/L0Xilv59P9GGStumGPDo/4StQFJD2QugtxUz/ZtygWIlPy7Diy+fMZZSSdpJeppyS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860961; c=relaxed/simple;
	bh=1dqQrPMyuIvozzA+IlruAjNwgtwCsa55iRE/yg/ruts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nuh/Cppw1wKP1fL8dIwGsnlg2Wk3LPsCjP1Y5OySSc0vQXXQ67EeEkQ/cStDWtRMTnl+rDkDuKFCmZgkZnT9u+Sz3tTJy9eqml8zKR3V2qjaqmMJiVL4/3mo6TKMLcxSkScrBbkOv+C+k+pyTP+L2rfcJ6fdKGZd4+2k+Ay5K/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1JjlXVw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1JjlXVw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6411F000FF;
	Thu,  1 Oct 2026 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860959;
	bh=1dqQrPMyuIvozzA+IlruAjNwgtwCsa55iRE/yg/ruts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H1JjlXVwzco9gPcVGqLCS1p4V2N28+BwH3rNn7FyQrtiIXgnEdd1UnEGiChZHjOru
	 AKxvcmxegmY0j84daeedG0gG4kvqcZMb7kJ+wD5X5DLH8OuIYq/xGp66mCzDbRduAi
	 rXHVpeXPX3/6f5lN5olJ1qBcP6KG6VlpFypQklJSOZJvjI/Uiy5D3j1WVAPhjMDZD+
	 too1QUhkgx1ma6oXP8yn9bXnjG8gK3nxotzH12OpeAgBZjx4cLtPiLxOH+SdOO/mFw
	 CLKe9xuQ077P9N0BenME8GLYs/aRdtK497geQEKFsXuSGSYIal0zQ1Gib2gdwidBUN
	 ubJqpuqig6IuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] leds: trigger: netdev: Put netdev on activate
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20261001131206.2513248-2-alexander.sverdlin@siemens.com>
References: <20261001131206.2513248-1-alexander.sverdlin@siemens.com>
 <20261001131206.2513248-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:22:39 +0000
Message-Id: <20261001132239.9C6411F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001131206.2513=
248-1-alexander.sverdlin@siemens.com?part=3D1

