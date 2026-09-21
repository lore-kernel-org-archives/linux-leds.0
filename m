Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA793D5657
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985599; cv=none; b=nJ+3PbIXs+D5gnVBZV4b6Qfmg2ZtUrV7/b1AYZ1nUqmjFqIE4Xb5+fwrKddzkZJyKZg0X0rYHilKCnytaiT5vATb/2xROotTo4FjxTShfxgQ4GFiV5X+jI2K85TOhtu0diJz1UrqlznEZvyzBe1++ONxxbPWBAGk3pjDOG6W0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985599; c=relaxed/simple;
	bh=vJ6OOez5eT8TsCuCoFQEamVeTGtdHn02j67XNX4/b7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=phFAdmVK0EKVXOkoNyU5lcserxh5F3nv4ZVXMftJJFtE9moc7FIyd8UMNO2PM3NzvS+0wM40vEoHAl8FU4beUWn5hHhVQSQVKHV8SeulFHPF/EFWD2FcgUUK4zYLEotAmKBuae04MyZWS+HQiCzNx5vY5jPSiVbRG7+MlmwgoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASpH7qPP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASpH7qPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4F61F000FF;
	Mon, 21 Sep 2026 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789985597;
	bh=9Rd+85j6CuD62dyo96+UrdAXD5luxshPvjCZWTr5trY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ASpH7qPP/U3YdeehQrxqnSZ4t+LxPfzbCFbJl3Y2jRS4mCEzjmrEcZsNr0xx5ONdJ
	 m24esz4FIKdxRnbMR4GbMotwYssxje27KKc63XHY5gyTiwo3ZTsXAsCRy2AABmLNRc
	 8dDQzSjOyJlBfyqcK0SdpBUxf+v/OOGinpJwa9bVaRL7T7U+XmjdYaFoYSNBxzvd2P
	 ChdMg8LN2PePHdaQoLRtEZFNM8GOXb+AYXEelPR9RxFXkeE0G8SyW7Y+YAOTjimOyn
	 JLrugXRJM4iyWixjoPitQP162kb9L4ZA4tc739HV5NmoupjCnheApJirajss9z3UNW
	 SENWfgLGxZjvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] leds: trigger: netdev: Serialize mode/interval
 stores with trigger lock
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921093249.3481413-5-alexander.sverdlin@siemens.com>
References: <20260921093249.3481413-1-alexander.sverdlin@siemens.com>
 <20260921093249.3481413-5-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 10:13:17 +0000
Message-Id: <20260921101317.9E4F61F000FF@smtp.kernel.org>
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
> Take trigger_data->lock in both stores.  netdev_trig_work() also holds it,
> so use the async cancel_delayed_work() (a sync cancel would deadlock).
>=20
> Cc: stable@vger.kernel.org
> Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link=
 speed mode")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921093249.3481=
413-1-alexander.sverdlin@siemens.com?part=3D4

