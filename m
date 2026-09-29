Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ACA51DB05
	for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684233; cv=none; b=KgD+KDZc5bnaZN7KYH7NBagby/9iDuZV0FDVJs34dxug+0pdTPtmNVRElNocnEI9qxA9igYlLpqj6sFdudEb+KLRdNCQQHyoB2QtRMapdEE1TYtQsJk/HXdQsF25Zv4CsAqPajlKvEp7o1ioJlUWTN7AfgMDaClsVz6kqbAeF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684233; c=relaxed/simple;
	bh=4ROXFWI+TIALAo8IGZUrfBD1wnORCMk51XixTu+cJF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XzZML3c+CN0IhGehQzuiYbtMevaKASrZ2NQ+7V/e+fwUdmNCcgWw6MhKDXyL/tundgHdmkexNZe6qkk+jkkSqSUmlJQKHffhSN2HvcNXnY2SlQTEnr1Z/lhhBmEex5HzmCQLQfCHQbj6dhlMV+oZR48l3X5mW1vMagu70g1S8IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkrM+kSO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkrM+kSO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D7A1F000FF;
	Tue, 29 Sep 2026 12:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790684232;
	bh=4ROXFWI+TIALAo8IGZUrfBD1wnORCMk51XixTu+cJF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AkrM+kSOSXJLCi6iOW5fWa5Tsz0Jd0EOfY5UpHtgavIG5RGul6UEdauy4TkY29im+
	 /CSvKBSwcnsyyaI/9nVkXCMgTEWbaPH9pxUzjLqbkPQPj58yDIvFrKbIy5b4gDJ+O2
	 MITux5xu1P9c+NcrSvVIdlS18a4uXAF/797L6Djy1SIlMhOT02FUAJ8vUPQcbgS7Al
	 wI5N+sszMB4rGe2r5qvXPdYNP9NPwu1se7SCKsKbCN2BRcTMm8GNC1vHfFGvSfkF76
	 9Tep0Vax8iljKS9m2d04qQ0K+nbqqHiYP6HvJqSo6lR0J1K9HbIMDhYrvvH99vfX8W
	 XD59cRmElEpqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] leds: trigger: netdev: Put netdev on activate
 error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260929120902.2793138-2-alexander.sverdlin@siemens.com>
References: <20260929120902.2793138-1-alexander.sverdlin@siemens.com>
 <20260929120902.2793138-2-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 12:17:11 +0000
Message-Id: <20260929121711.C9D7A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>=20
> When hw control is active, set_device_name() takes a reference on the
> netdev via dev_get_by_name(). The register_netdevice_notifier() failure
> path frees trigger_data without dropping it, leaking the netdev.
>=20
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/20260914140045.B8F4C1F000FF@smtp.kern=
el.org/
> Fixes: 0316cc5629d1 ("leds: trigger: netdev: init mode if hw control alre=
ady active")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929120902.2793=
138-1-alexander.sverdlin@siemens.com?part=3D1

