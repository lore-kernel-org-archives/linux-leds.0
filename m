Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9CD4A3D28
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 19:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791230181; cv=none; b=dkE247wYs2cDAqdX2P4v3WLp9h3oYRlN6zwjqGWYu49Ir9AY2LD8guUgefl4WpXqp2H0WdBsdJhok8OCoje9tgKttQLd761x+oRGInPRStSyhGeFYekycMp9c8XFl0EwgRS/SeD1nBotdr6Zjro9lJcEe3gFwsZfldI6kPEfS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791230181; c=relaxed/simple;
	bh=ugO16hotRmN8VjgjZkKuen56sEVLUnw+E/r3KOMW+/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KfjFdRW/ueukH//GNmQG58mZLqYrdn2MntmfaXUaah6b8Fr/XKwijrJ1dDAVSnRT/uE9IvnKI/W0K1QrtZCA0D77TlshqjLeqoQ7zy484zFvpwWRyXlpN9e5Vokuep65VbrtvUUSrXVwb1RxZm7bt0p4np45sOEahlGegblCVAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+7YZhCZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+7YZhCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EDA81F000FF;
	Mon,  5 Oct 2026 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791230180;
	bh=ugO16hotRmN8VjgjZkKuen56sEVLUnw+E/r3KOMW+/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+7YZhCZ0hKtDiyGV5Hiecb8zJVM2kSMiPPZuckZpnTQn+nqv5x6PkAZtKKqHf7Od
	 CIHzfk2l4BKxkOUHg/rM5TG0k858dDFmyLo+PrS2TYcoTC0aOwihXc3Oar/PcLctw0
	 XGufapvRsAFILFTcf3R+A6FyUxpUcMKvR0r/VDEH0eiQpfY20lo16Nt0sJOrZoFkXx
	 mtueV9Wn8eCdcfKNLIbjwpmjUc4qCmVMydF1BXnRv17slDa0zRwEJDnUavVeY908+V
	 eDuNXE6mQohR48G4WlD+xIGD2D03DVJaL5gpvinPbY1aN6LAuUFi7y8UNaw1rQSjrV
	 3E7iPffg52wwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: is31fl32xx: Fix NULL pointer dereference when
 binding via I2C ID table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261005194923.161411-1-rosenp@gmail.com>
References: <20261005194923.161411-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 19:56:19 +0000
Message-Id: <20261005195620.1EDA81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> If the device binds via the I2C ID table (e.g., fallback matching by
> node name, sysfs new_device, or software node),
> device_get_match_data() in is31fl32xx_probe() returns NULL because
> the is31fl32xx_id table entries have no .driver_data.
>=20
> Without a NULL check, is31fl32xx_parse_dt() will unconditionally
> dereference cdef when checking cdef->output_frequency_setting_reg,
> and is31fl32xx_parse_child_dt() will dereference cdef->channels,
> leading to a NULL pointer dereference and kernel oops.
>=20
> Add a NULL check for cdef alongside the existing child count check in
> is31fl32xx_probe(), returning -EINVAL if no match data is available.
>=20
> Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005194923.1614=
11-1-rosenp@gmail.com?part=3D1

