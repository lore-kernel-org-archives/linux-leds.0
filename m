Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCC4F55B5;
	Wed, 30 Sep 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781868; cv=none; b=gSD5XtNbHBGoMLlR+SM0e9E7crrTAe/nbHv7VQLVChGKq1iX3OIOj2fcLIE/f5x7Q9sFvrf9hY2E8nNJM+9Azqt3nFFJTmsZm8VuhW8D+DVH7aGFiLg87CaOK6ufRSzjvgmG/68dfAeKKgsbnm7DtUzXe3QoMdIE0KglUJJvSdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781868; c=relaxed/simple;
	bh=rW6sO09SZvd/sv9CaoH4393gbu8zz/MMBDEZKdRpKDA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AkjEXvN8tGNi6MoDn2UlMqyt40jQ2UB4GckfZaVnS8fcoTZuUs7z/P1UCR9cr2C7uK5BArmR95JT9DREA4kfvmyf8YVNhi1P3dGfm/Q2wg/iGj2kfDSrbwx5fkAD9h427RHYRH6jAGB2jbbSWLrZXseAKmqcVj5B9b4mGMiX194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L3Uuw/Nq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L3Uuw/Nq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3452A1F000FF;
	Wed, 30 Sep 2026 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790781859;
	bh=rW6sO09SZvd/sv9CaoH4393gbu8zz/MMBDEZKdRpKDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L3Uuw/Nq6QAdkzhDh28IUNeP/zabvPwcZiEzXCyAwExavR12baMQ7xXK02X+Uuh4U
	 vBAFGi9pVKMNRji95s1SlcGl6itR9l7CY6Um7G2MLtn0yM4FLw8FZ11SQf5PLjUT/C
	 k2xbioGaORXcnG06TzNx7x0dXkMk+IUpm4v/6z9dgUBZGs6BVIueHg0Y386yOhThVj
	 zf6xqjYMbgOwpMPIpSj9rOY0dqJ6VQ3sajz69V5aQcXF/m15rnhs1/9tgf/VwfzcQP
	 3rPZrusfRqP/7ZNua/YVnX0US2+e8jSEkGVkO4iyUKkLNpBE5v/BWTGA8ofshK3AUx
	 QCSQ+Nil1e62A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/10] leds: pca995x: Fix fwnode handle leaks in
 error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <b2fedfd41b25fb3b1b6eca231d009d5497b1e003.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
 <b2fedfd41b25fb3b1b6eca231d009d5497b1e003.1790684839.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 15:24:18 +0000
Message-Id: <20260930152419.3452A1F000FF@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790684839.gi=
t.nora.schiffer@ew.tq-group.com?part=3D4

