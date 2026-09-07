Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A502D3EEB
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813041; cv=none; b=lb9TIAW4OwU2T+aqlX1/Z7tO72JHLGxHde9PPix98mSeNgOVZP4zjQnh7JPCeDY4DopJCFeQVROOgD1hEua7qF0qMVens1p9cwoI//oP4Szbff9t/PQ6Ez9JyjGUapTbxOSwhfNMDgxrsCk2cyqRTA+01cXGkTXFWXJ34HCQdx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813041; c=relaxed/simple;
	bh=Iy3GKbo8x5ZWdZucviVty6OG7ZpQh31r2B2D4WV414Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JMm+syy3ZBkrr4ELVczNuZobiJpsn/9CyWspv1bymXsj/6YREISvxlb8PsGxFp1atkM4JFb79uSkcaGl0dIY3V9fUofoxuux+JxcPNFBqGF1MIAAYEQAozHSwySYwVl8gtaYdxsMQ4iRovHKAM7XHRn2cygVMq2ro1fDnJsLS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtssUOxM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtssUOxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA081F00A3A;
	Mon,  7 Sep 2026 20:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788813040;
	bh=Iy3GKbo8x5ZWdZucviVty6OG7ZpQh31r2B2D4WV414Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WtssUOxMdM5U27FLoDe82Ke6z06KkHXIjDhdQJkEWGP1hfe5HHjiZRLWPS5YLoQXQ
	 Oh1Oql+j7o3T0YrdU0LVKFWGP+8SDw1SfVMijLvh++NU+BwMYLc2NlDG6uRXsJTrFA
	 +lz1Ros4y+Lg9G5+SugpNQITlh7Z6CJZm9/H0Yb24IFG8CDEFrZ3pzhu/wkMAJl3zh
	 5bRbtU6y8ZP+BCjlWkAp1ZrIjfC780TEl7APysLfVH39G3R/QW7Kat/iIDA7hWIDlc
	 xxdWhj0llunAn0EuPo5S7rkA0vm4deECCu/ww9O4D5l1VRCcEcIboOE2+mRnE8SsES
	 7kMGQWKazzTnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: syscon: Use device property API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260907202436.42304-1-rosenp@gmail.com>
References: <20260907202436.42304-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 20:30:39 +0000
Message-Id: <20260907203039.DBA081F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Replace the DT-specific of_property_read_u32() calls and the
> dev_of_node()/of_fwnode_handle() roundtrip with their
> device/fwnode equivalents. Behaviour is unchanged for device
> tree: device_property_read_u32() and dev_fwnode() operate on the
> same node, and the fallback from "reg" to "offset" is preserved.
>=20
> Use dev_fwnode() for init_data.fwnode; unlike a child node from
> a scoped iterator, the platform device's own node is held by the
> driver core for the device lifetime.
>=20
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907202436.4230=
4-1-rosenp@gmail.com?part=3D1

