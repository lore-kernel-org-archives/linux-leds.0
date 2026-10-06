Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220252F8E99;
	Tue,  6 Oct 2026 04:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791259272; cv=none; b=QsG840+6DvZ+Y6Ct5Ho4oBHbUIhkSvO6C55aJ+72mLBbVLyjjdrHwfTKwHu15dQnn6sbrRXV++rBJcL/yfvORMrt/E+deZPfVeKbV577EFphCPb7/eVF7RpPIxd+TyjhwfWbkDH1UVsIen7xQ/ljI2g99rvudUoKUIqYiPYJGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791259272; c=relaxed/simple;
	bh=MwRKj1rFoT6XyZlInET+SK6LrUxN2Ere0pjzT8Mq5cE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XdF0tUScIrKveIjYdqxkKRjqIHlUA7nN2JMYyt23yo0QJU+ao+rTYPdpFu71ypKkrROCSD7i1yf3uUq7Y+/vtovjE7cHDvvMgrNYHXzHrS/pDr3NDJnwWodWbNaCrXFFV/k2GeqPMR6NXNgfPLoFlZNKpbZ5WVJGGH/aWcUDc/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT45BYI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT45BYI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC391F000FF;
	Tue,  6 Oct 2026 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791259270;
	bh=MwRKj1rFoT6XyZlInET+SK6LrUxN2Ere0pjzT8Mq5cE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IT45BYI8eskOzLP8ykMPoF7djsYJDHQrmpQj3M1oUuPTALAiKGdGrBYsfVtQcm9u4
	 1NbdLw2mH1PsrDpatG0XS+sFkqlGyu50p/ZM7HxxQD+Dn8FTlzTXIhQ05i/QeyZbg0
	 Qh41HAv8PSddnEG7LULSICVtjg/YjFX1HWtPnSBLy6irT9W9lcm+FvpiVybGvjCSco
	 9Abxs2wXu0qkeoe1yrf8T//5NJP8s1iMkGfBbOOLQ1TQs/bz75H9nN89OU5F1ZSQEv
	 PGHFW8WGiCqgPqXIA1vlB83uzCDGU95IxWzPwvY5KeP7kCWf827nca4aHqyn6gI1QU
	 pgAbdiOD3jX/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] leds: aw2013: Move assignment of chip->num_leds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-5-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-5-108ecbdf2775@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 04:01:10 +0000
Message-Id: <20261006040110.6BC391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> devm_led_classdev_register_ext() executes default triggers
> synchronously, which call aw20xx_brightness_set().
> aw20xx_chip_in_use() silently returns false, skipping chip enablement and
> causing unbalanced regulator disables while probe is still running.
>=20
> Increment chip->num_leds inside the loop, so that each call gets the
> correct value for it's default trigger.
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-aw2013-aw2=
0xx-rename-v2-0-108ecbdf2775@postmarketos.org?part=3D5

