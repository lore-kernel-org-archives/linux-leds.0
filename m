Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406DF2D738F
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 22:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363933; cv=none; b=onCLRDww9PzbwKBrijZJzHxZMgHAjae7HakCj8Pp+I/KT4LXx4PDQQdtbV8HDErJ/Emz+1ncnhsu5UJijGOlbh7MjdOjZLb2SRXg07lxTB7edgiORjBSjgnHE72uN+alTdTm/UhNSdgwJKvqJpBvT+Uu9u3RRN/C8mAGnsOO8jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363933; c=relaxed/simple;
	bh=z5SSfzdWUCzqcb6iZza7dJ0CL1hUsBWlDnzLCGLZ0jc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hk5K4cMggkyzKl+RFiAdyZQIALboZbABKE27jsKdDr/9LcfaVUTWJb6HMhE1mvjF837AUIPhWd7rNp/zf4wkVNQUM2M9a74lKRN3XdSj7YPruFjJj1OpUFpoUpCgBq7/6BMjNVfAeT7GXvfJIx+tUtyrR3EJOnbow8ie8F/SNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRA9aavx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRA9aavx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56A31F000C4;
	Sun, 18 Oct 2026 22:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792363932;
	bh=z5SSfzdWUCzqcb6iZza7dJ0CL1hUsBWlDnzLCGLZ0jc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VRA9aavxoA8aEOraDJ+7HkJk5psHRUQE6C6co9WqdCklA3u3OxQciGfrUjsnpKyUz
	 8+67TV5n1X+TBL8d1O18OC8MDGDREL7tabQgjS0J+8IyBIDRD1PXSbjHbGCwRqUdK9
	 3wcnGcETqYBF0LEKakFmfyzfqBkNzAUTDYJF/PioqcWZiCVUyI2q5GFKcKda4w4AdW
	 vtCkRF81QRwuVdMhbpKDHE0piLRpPbkExXmoiQFOv7ge6kSeFXzXAgmbE3C7FmgCk8
	 lYlJxXn5acYnkwR93ClPA14U5BqFWmJybrQ3zdyYWCgtdd9+YGrEtRnTwaydLs1cjS
	 IciueJAF+6SMw==
Message-ID: <sashiko-outbox-176435@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] leds: is31fl32xx: Fix NULL pointer dereference when
 binding via I2C ID table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>, linux-leds@vger.kernel.org
Cc: lee@kernel.org
In-Reply-To: <20261018225036.12000-1-rosenp@gmail.com>
References: <20261018225036.12000-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 22:52:11 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> If the device binds via the I2C ID table (e.g. sysfs new_device, a
> software node, or a firmware node without a matching compatible),
> device_get_match_data() in is31fl32xx_probe() returns NULL, since only
> the OF match table carries the chip definition. is31fl32xx_parse_dt()
> then dereferences cdef->output_frequency_setting_reg and
> is31fl32xx_parse_child_dt() dereferences cdef->channels, causing a
> kernel oops.
>=20
> Populate .driver_data in is31fl32xx_id with the same chip definitions
> as the OF table and use i2c_get_match_data(), which falls back to the
> I2C ID table when no firmware match data is available. Every entry
> now carries match data, so cdef can no longer be NULL.
>=20
> Drop the comment above the ID table, as the table is now used for
> matching data as well.
>=20
> Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018225036.1200=
0-1-rosenp@gmail.com?part=3D1

