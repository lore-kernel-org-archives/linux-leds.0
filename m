Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101816;
	b=IxIo0Ex4l1rbYOuX9TlX/CmDqWLIbIle2CySX78bPLdQwT5i2Q72CGZAwFIPWA6vHy6H
	 yGx/vB8BQVAWhgEHj1NzsEVHYf3SdDam0e+Z8OoMObZ3r9c8cGnHN2S1TsjQrazjBc738
	 tgieGKarJd6b0CPi113w04pbC28tYgKU6Mxg66p9YF38gU1F8wFhcRQSQDpSmwXNMxB5T
	 nC5SShFFa0LpxeGFgApGcG0WSSFXVORoGCH1Jwy0yXeLEOb4ckb1ZuxhpKbMrXhAgN7HX
	 w6seb3pkRZ7qF3Su3kg6CqxyPCWLoyviybhx4CCopBgk9OFS6SZDgIw4JNSjMP8hlkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mbMtI8LOdBAHO6u2t1d+O/wdHaveogJEuUx9nvC91bA=;
	b=G/vJJWlIUBP2Qyd3kbvDekYuawyl0+KoVjo/SSeeK2INnisx+g6pVZpdDEcTf8voyjXS
	 1f9JejjAJikyC0qtVu5zROID0PIHX0Vdpi6KoDl/xFz2QF2/Uv8IHuFlkvOZtj0RarHbY
	 3B7n2Ee7W+8iVYp6T5tkD3goAT6M4aMMXvL6tQaOD3kAv8T5BF5U+FRNNjyCIZHpGSz3u
	 amKGtH2WnsLqShWiuzQLFFwLDv+O41Osp8/VbW2Sj/5zahwZTUJpnvasvFwbb8yTInyad
	 IAe0kjSmsCQT5abkQwJo2shVFbh+gPYKQZnX0DqWB7DWGIACP28wjjQ9wCOo0MFM10w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+PjkpYL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C660A2618
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+PjkpYL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AEF1F01205;
	Tue, 27 Oct 2026 11:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101816;
	bh=mbMtI8LOdBAHO6u2t1d+O/wdHaveogJEuUx9nvC91bA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+PjkpYLwcRBRaC4mTrr+Ct07aui6crvChzRc/c3cGxCbh2kBmRTPxWcyUT6rZt7I
	 +3ysNZ+ziRd3JQSkihlWSL77Z3iZCZgXSb0kRE14ruOuPxQmAQy1be42RYsQwIlNO9
	 r69x7praonuzoVqgL8edZKiiTvG5kMvs33IhLntERhhOEf+u3QHFTtwORC0izwrlC7
	 d/MXac9jA7CeKOBC8pB9r0otc7LcyxO5bsvwvnGTxiVVYp3mcE+nnRmiqS5t7Pp0WA
	 SGk1WcfRl/6hlfAw79w0/QZcQ9IBbvpqj7jaTRX56eUXLLwpWRFsRBgWbjJprFCHSB
	 a+NfgHAanpMuQ==
Message-ID: <sashiko-outbox-186479@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] leds: trigger: netdev: Access net_dev under
 trigger_data->lock in the worker
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261027113349.383147-3-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
 <20261027113349.383147-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:50:15 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> netdev_trig_work() dereferences trigger_data->net_dev without the lock,
> while set_device_name() and netdev_trig_notify() dev_put() and replace it
> under trigger_data->lock. On NETDEV_UNREGISTER the worker can run
> dev_get_stats() on a netdev being freed (UAF).
>=20
> Take trigger_data->lock in the worker. cancel_delayed_work_sync() must th=
en
> never run under that lock.
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/20260914142116.6DAC51F000FF@smtp.kern=
el.org/
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027113349.3831=
47-1-alexander.sverdlin@siemens.com?part=3D2

