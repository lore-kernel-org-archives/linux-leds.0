Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501342;
	b=DvImXods/1KUl5TKXIY1CsKVsXo+IocsSctc4SgF3oPb8k04iupB3kA62nuHMGXA8mmN
	 EHFMnW98Bv3FEDZGJjuEYTjix/afPfa+fNEOd3F3z6fVZjfpQFJ6IlSQ5juNOxuH4C51p
	 gpMbtY3QR3T/JgUQ5GjD9vJ4wW+H/XLAXzdKrtmSgmumGHxAY8R5sy3156dnhi2kq4HBu
	 Zpe7MuubZJClmV5IY23+diIMjmvaCWHPiB553AZPKAp7CQygoxh4VwRZDazMoBYLA4BOk
	 jwq4QTWKXjFQxTqFoPhfkz+qp1mJ9fRBYmbWa4QLGfcoN4slj/fIYN/b3mIF5Vbqu6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501342;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vUZF4ORfnSHMOz4AsAX4ufI1kc9TvJPiD5AJKA8YHtg=;
	b=IsuFu/0kQ3iFzoR38rQbsaHqOwnYzAUQ3CGYwOqtt+l8ACPqKTXzY6qrAnu9ZJj5gSoH
	 9liIhGrAY2Cmn8MHQyUDuK2bNyxPrKeCsq1Flbfbbjj/9zpY97oaTr4FsywruY2yk54pf
	 NruV3Nlsj8HTn+UeoXoHylC/MwyIfBJYrcNUTHV6eDyYZupN8+uVOx/qkbOo+FyBFMxya
	 vmPVYRt9HfhJJ6U/hktKIkqia2/5Hq80CO/t1Z1ZLFVykscl7MujRfzHHQEyusrlJbXmC
	 6fZoMwesgOjLBwsUaEdd7lnNPSJI3ohQCT8+QqbDJYyCVqxcK/qHBnkpqkFNWwb+iDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmsdyHO4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C999960A4AF1
	for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dmsdyHO4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499E81F000CF;
	Tue, 20 Oct 2026 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792501341;
	bh=vUZF4ORfnSHMOz4AsAX4ufI1kc9TvJPiD5AJKA8YHtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dmsdyHO4a8WaElBJAf/ug9Z9+2PRX79Dw9UvCnu2yfyhXbs/S59wGtVNmJRi5Ddk5
	 Z0GzOFKiwMYv/mwqjN1PuZtbXqAeMROnwz+rlno/UwLRwh75aaTNBEbTDlMmKCbA4m
	 r/OhZYyksQI8+XRQWr2vM6vhccZwU0+A3u/6Wlm7t3MxD8HuEht70m4uDLo16UYAFS
	 vjR+o0NC3IICdyCpFjge1JX6s4G202DNwf1Ktx1gVNz/NCd7sZwjb/LZ1MEGd4nCzn
	 ao5CRIm8/UVqYDfY0qa4h9laIQLmSC4X45AnZ6O6/lRKQUBtty66U/S8gxQ6B18L02
	 QGBWyUj2pGbEA==
Message-ID: <sashiko-outbox-178987@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] leds: trigger: netdev: Access net_dev under
 trigger_data->lock in the worker
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261020124651.1987272-3-alexander.sverdlin@siemens.com>
References: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
 <20261020124651.1987272-3-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 13:02:20 +0000
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
> Take trigger_data->lock in the worker. cancel_delayed_work_sync() must
> then never run under that lock.
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/20260914142116.6DAC51F000FF@smtp.kern=
el.org/
> Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020124651.1987=
272-1-alexander.sverdlin@siemens.com?part=3D2

