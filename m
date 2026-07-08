Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F3115FA81;
	Wed,  8 Jul 2026 14:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521524; cv=none; b=T/7pOz4TgBzaMSCfSQacI+MSgz0ngttLMDLekhZQHVg82IIBz8/8peqk/qTfSqM/6+X3NVgiGXmk4cZm83Ei639ds39ZXhq7oJnMyNDBshL29BydcEiUXvJZH1MuDv3R3120Rl1am99ZwX20RfuFyvp+LIWnN7xWdZxjfG85B8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521524; c=relaxed/simple;
	bh=VNTy+Qh/ByqakEyAd9A3bdOISd5gs3E6eRwXTemwRqM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UkaWRwSebzTd46v90YHE3xvdGL0ToA8rYrAAAN/f0GQkECgU7yGAQcLeeqqT/hWkXybqMnN/eU7+3xQK1oltsFfuLiULI5GJXORxNWycZqH+MlAim7O/0HTWDTTAXeN0FRfYDHkbUuYQtoT4+bDuVz7maPbjudl2WbYyQFsfBpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sl5Xg1Vt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sl5Xg1Vt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1222B1F000E9;
	Wed,  8 Jul 2026 14:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783521523;
	bh=VNTy+Qh/ByqakEyAd9A3bdOISd5gs3E6eRwXTemwRqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sl5Xg1Vt7O16NtCRu5EwWRblLjcZ02M30GyjxgalxvmJQf/0IK3mqcwzehYejHaUc
	 HGNVgVaQZXstuQ6LJs1Go9D0aZONJwfu6UVxM6PGbxrT33Qsm9ukrqm39bNXItLVJ3
	 vi12sCZx9gzWn5AER5SPgytxu7MEwTEifJwrPA5MzBxaXfSWcZgN9+BL4ApjYOUDwz
	 FHTGNJQSnLo4iekeTyN73ZUmcbXGFFmEoQvCxjdaWyfxzEe0i3xW56DHVCuJPRMauC
	 v+pyGBjBVxNfOU4eWe9sQqyYSWdej2HxVMJUR1U2UPLKik1iAyRG63MCviGI2E+UUz
	 L9cQ491QtDdyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] leds: pca963x: add multicolor LED class support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708-monza-leds-v4-3-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
 <20260708-monza-leds-v4-3-a7acfc524c0b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 14:38:42 +0000
Message-Id: <20260708143843.1222B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Allow grouping of individual PCA963x PWM channels into a single
> multicolor LED device by adding support for the LED multicolor class.
>=20
> A child node with sub-children is treated as a multicolor group,
> others are treated as single leds, keeping full backwards compatibility.
>=20
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-monza-leds=
-v4-0-a7acfc524c0b@oss.qualcomm.com?part=3D3

