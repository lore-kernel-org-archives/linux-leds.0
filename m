Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE409489FCB
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860848; cv=none; b=JQDRH3b4MxmrZfQ+CgoyLTE147RwXey6fShr709sbBPFGrnUgOtXqBCB2OcLh7J/gfUJBiQD90/mhlQWtvo1y5kSJG5WPlarNF/XLELdbcr5/bk7z+IZg52nD78jVA7WLtbxCOc8gV4WHPFV5JMSouyHyR3qn3uSC8OLZoM/MrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860848; c=relaxed/simple;
	bh=UBCvD/8H7U1G6l+zkRF1O0TvQPJkvfc8Ju2LSglSakI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PLuQPAKZUiV9lHQaKQfcqvMKRwQei77a0uu3CeCiu2fUaqK1RV0m3UZHKKFwTfi2oO9mUzMN7ocRdHA4pm5bLfA6jd0nEhX8Rqv8QtPkCLxIN9gYSDhS+JA9ivcQ//5oitYDBdw3r5/QVPGeBsuc/64pnEJhq4bR3VuS/znUG5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCEskdR/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCEskdR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE221F00898;
	Thu,  1 Oct 2026 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790860846;
	bh=nBolW6Swa+SuS5C9fUBinHTcdW1OO73WR2RPAF2YHLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oCEskdR/zSOdP+NM9wviR/7cmNUvItcQsKNwdtXoWaM9fyBTO1t+40LmWzKWBAOTo
	 w4yqG+vQYzIP4MLDIyS9WJ5Lsx8ZI66fC09uL1BlWO0l2y2hUQEr3bu00pm+0gyHW3
	 /yZShKpUog7Gil3WCm3i8uqjuYZRHCf398kIDV7mztEGV3pof7Qne6yifGugMV0rSG
	 ZoVNVog9csEYNjYzxXiceZnB9qKzb9TKSna2gGB/n0AFuyciXbAN2oFjy/FxbvWqnb
	 Khm+XsbEd5Z1aiCLGxfpiNIDIWfp4DuwTjrf2I4DHmKdcTCvs7B9AwWLxdTsBasGom
	 v/X0zplV8fTOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261001131206.2513248-5-alexander.sverdlin@siemens.com>
References: <20261001131206.2513248-1-alexander.sverdlin@siemens.com>
 <20261001131206.2513248-5-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:20:45 +0000
Message-Id: <20261001132046.4FE221F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> netdev_led_attr_store() and interval_store() update ->mode and run
> set_baseline_state() without trigger_data->lock.  kernfs only serializes
> writes to the same file, so two attribute writes race on the non-atomic
> read-modify-write of ->mode:
>=20
>   CPU0 (echo 1 > link_10)       CPU1 (echo 1 > link_100)
>   -----------------------       ------------------------
>   mode =3D trigger_data->mode;
>                                 mode =3D trigger_data->mode;
>   set_bit(LINK_10, &mode);
>                                 set_bit(LINK_100, &mode);
>   trigger_data->mode =3D mode;
>                                 trigger_data->mode =3D mode;  // LINK_10 =
lost
>=20
> They also race the notifier's link-state and ->hw_control updates.
>=20
> Take trigger_data->lock in both stores. netdev_trig_work() also holds it,
> so use the async cancel_delayed_work().
>=20
> The async cancel cannot stop a worker already blocked on the lock: it may
> resume after a store enabled hw_control and keep software-blinking and
> rescheduling itself. Gate the worker and its arming in set_baseline_state=
()
> on a shared netdev_trig_sw_blink() helper, so it stops once offload is
> active or RX/TX monitoring is off.
>=20
> Cc: stable@vger.kernel.org
> Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link=
 speed mode")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001131206.2513=
248-1-alexander.sverdlin@siemens.com?part=3D4

