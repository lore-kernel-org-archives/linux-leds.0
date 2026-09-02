Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365A837EFE2
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372960; cv=none; b=WGOC3YjbIr6onVqane9/YQQLBVrYIw3D0uVF9A997a3Ar8wdoMmrMjNRRbqyRBM2819I1PnLAsurs9Tj57MwygEKmy1xLEmeX4nYC+JlDufvRRWulRxyJAlJWXz8mYVuYl3l4zhLMCbLfHX+JIMAGdqeoiYxLKT9+9pkrdI9UpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372960; c=relaxed/simple;
	bh=UDonXa6L5h9LD0yxQOb/Bz3vNB6ZVeOB+0TU0ywEBBI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mYzj+z8G/ui6mkiRRiL7rLci5pmE9PXlr6xLz8v1WOtMNEshByLXa9SkNF85KhvUWRvJrb5l2RTEVwm6rGdFwXh6Rr4pO84Eq5YHDlGi7ZPING+jIYj/CbIa9byPyEwvFVNIBGMsmT51a6snWOSHbgLbjmh9RwY+r0E7pQW/uUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYwhegPd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYwhegPd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865071F00A3D;
	Wed,  2 Sep 2026 18:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372957;
	bh=UDonXa6L5h9LD0yxQOb/Bz3vNB6ZVeOB+0TU0ywEBBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VYwhegPdspYNk7ICq//8zJ7POHoOqwNjpgjkpTsTbRZm923CNJdYp1pISKwYFLVab
	 ZJcnpRzahjTwhP3vIX1aRKxJaq//OPWihfSnIQmy5GyPLjeWBa17F/IlIb7dR+ESLv
	 aEai1KLbhns5r8osmM+Mywg3+/czONZScoIwUStYRyCl/f+P0p8maGx7df19fsCOrg
	 G+Zac4ofSY1+E3EfILUdAkzysgAAmsXUY9liM3u4xNIagCmmQhXlP7vorQVvMIjuHS
	 azlJ4QYyqpPGWRu41sNUF1MH4XeCAMbOQOwbC0X0mmHmvbB33NvxmDU0KYXCkHCZaW
	 +ikAQw8WuliNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/12] platform/x86: ideapad-laptop: Serialize
 keyboard backlight tracking
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-10-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-10-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:56 +0000
Message-Id: <20260902181557.865071F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> ACPI notifications are delivered in dedicated work contexts and may
> arrive simultaneously. In the following change, much work will be done
> while handling the notification, which could lead to potential race
> conditions.
>=20
> Introduce a new mutex to serialize keyboard backlight tracking to
> prevent potential race conditions.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D10

