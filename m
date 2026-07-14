Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC13F0A87;
	Tue, 14 Jul 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014825; cv=none; b=j0xHlEpeiPUNh3XUj296+MHYzczL/hvLS6S2HiMF+bdw2IL0jZ5EuN+dP+PC1p8bfQvNJWVpFUooFpOv9l4aUuzknVdg0fs67ciU6e/BubvJmtTQcSj1LIvhz+os2V0hpJYzF/YZTgIChEqsmWpXV8oaFu0JUZ9D7yOLwdHiqXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014825; c=relaxed/simple;
	bh=CSLB7OceZ4CS65riZ0IP71V/R7k3hpwJEqPZaBXDeZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gE8GhiKGdm6HRHODh5d827lxm0QoMgqwdAvb2hHr5KrtoXoKf0jzuDbGF+VXzXjsfYRDOKRBsPCsBxuuI51Z1754zcIUEBJNTx1J3CY8/YmQs3RQOr/tdXIYUfF9LKh41CVe500zof37xZe4P4ncKdES4SN8wiP+sVbFAf88dcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShSw1eFa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShSw1eFa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54BF1F000E9;
	Tue, 14 Jul 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784014824;
	bh=CSLB7OceZ4CS65riZ0IP71V/R7k3hpwJEqPZaBXDeZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ShSw1eFaK27d+8047aGGSIQbU5mey2SvbULw0gTrdTC9WUp8THl/Bqax1K314TyIf
	 gDOxFdphY2ajeOYiEI4Yu/7NwuLtytj0TxXy3ffTbjHNK7cG0MxYlLZ8DGO8E6+jpY
	 rVShX8E26HD8Zw9ypXfB039FydmjGQ+jvhi1ikjpbEBbRZQGG2K1mFECluVyln5tAb
	 FJIOisPwyWvTil2CzrMMO63JvZg8+u6JFYu7X7/4NwgMGk+jXTYlAyLTqWcIO6gw0h
	 0qxgEeE8VjI/pasax/lw+FOdcggAk4CMjYJEoXk3x0+YMViwdd3qTENtGGY7GCAHHj
	 LZ9VDEh2Jec3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] dt-bindings: leds: Add default-intensity property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Rebmann" <jre@pengutronix.de>
Cc: lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
References: <20260714-multicolor-default-v4-1-c2335b32bc39@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 07:40:23 +0000
Message-Id: <20260714074023.C54BF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Document the default-intensity property to set a default color on
> multicolor LEDs.
>=20
> Update pwm-multicolor to support it and update the example to turn the
> LED red on boot.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-multicolor=
-default-v4-1-c2335b32bc39@pengutronix.de?part=3D1

