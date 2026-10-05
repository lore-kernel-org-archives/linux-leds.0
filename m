Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F083F4A2633;
	Mon,  5 Oct 2026 14:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210514; cv=none; b=OrH44wzIaT+qrYzB8rXVN8AkMU8KbHRx9wFX3fRYBWFLHwYX1MgYweA5gjiqlQO4HyDwMIMM1eZQHiX4DsQFuXdTwFOgHfec586/zV5gReDO1kRN4eQQfO+n+tmAA4NLfYUbNAvOe3RJHTJxVfdJQFqC3eq9G7QZ+PhzlMzK18w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210514; c=relaxed/simple;
	bh=8n3IzfOf78h/kh4b3yypvDvGSVdXNkLCGrGo+E1Yh6Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NggecavcXWD/o9s0bdZELNkm84skZ39qTSfQFufy7UJvt0lz2PzxU/9Ea7xYy9qr+s5z2tWSMATT4SGqS8jb1FMv0e7ExCuWKekSlzwKa6eDTEGxV+qCjet7HggcuLIHba1slwb3AW00zMLX2iGvVOmmcPeCz8SmNIk6F4dI1lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyImkqBC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyImkqBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215061F000FF;
	Mon,  5 Oct 2026 14:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210499;
	bh=8n3IzfOf78h/kh4b3yypvDvGSVdXNkLCGrGo+E1Yh6Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kyImkqBC7RUBNsqc2QeoSfqtTtToKQKydrN7OcmmIQ4AkNcee73hQviRUge6euSX7
	 N8IMkr8XfUtTl4K+0GSyPlh3hrgXWaj0rJX6Mb//+MwoHvlvDSV+WpSHKmliId0N8O
	 enVfbwn81l3VjmEhVGeLVrBaRhKl2OWHIjROLpp8USXKCaOcrx1ehZ0Bvu+uJlIcbQ
	 OCeGeItOLX5IhX+GzYiUy2udq0chQvGdMuWJt9cJLO8GzBKOuF8/ldiIDyq8ffb6KN
	 zseJFlfiVUEPpFSQ7ssSfhIExMW3MdR2MwROqNSjttEOkd+4epBXHGIXP3L8S/Eq5d
	 S3eFfFyGwEL2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/11] leds: pca995x: Fix fwnode handle leaks in
 error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <b2fedfd41b25fb3b1b6eca231d009d5497b1e003.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <b2fedfd41b25fb3b1b6eca231d009d5497b1e003.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:28:18 +0000
Message-Id: <20261005142819.215061F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Each entry in led_fwnodes needs to be put as long as no LED device has
> been created for it yet - not just in the creation loop, but also in the
> first loop that iterates over the child nodes.
>=20
> By clearing entries in led_fwnodes once they have been used, the same
> cleanup loop can be used to handle errors in both loops.
>=20
> Fixes: 82c5ada1f9d0 ("leds: pca995x: Fix device child node usage in pca99=
5x_probe()")
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D4

