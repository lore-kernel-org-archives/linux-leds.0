Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E9493633
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 17:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787333258; cv=none; b=E4I5v1RzZgnASr7NW+nAeEoS0ji/mEPrljco6YBiWYA6kl2492Xmp9t4P2g+4xGxJ7ylxtL7F8q1IUMAwP12ZWYMUPNRd+TAyTqI6cq77H1ZHXaXat6ch4VuVUQjTi8UzFxOmBlelJENBnFh2C9NFOmeg2lAw6OzzQ8A+uqMmxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787333258; c=relaxed/simple;
	bh=KrNWeQtRuGjVGRXba6Eio+H9hyRDu3PzxWHeFcTGqSw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=akcaj30PnPEpVkHe3PohNDb6lQjK24H1xwGOgABvXCiTpRvaXTksQJBjtoQ0Z7ydDB5LzuVTZ4ZBJpceYP4GhJlVzVCzg4EhN0XGKXwO6IraQyU10yIQcXx9M+lwbq1mHognfC0nREdJGRVfubsINxmig07nBxHG1z/EAv9WIPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=crt7UW1O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="crt7UW1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688191F000E9;
	Fri, 21 Aug 2026 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787333256;
	bh=KrNWeQtRuGjVGRXba6Eio+H9hyRDu3PzxWHeFcTGqSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crt7UW1Ox5Ua5yuxqp3/qE1X4NVvkrQc20jiMvXrcqFnX4MdbmABCbGnhM0pPBHoo
	 gAibvYNz8+wniasFmyAVuO+0wa/buOM7fRhSKAQR3I4apgZCSkJvbmsbdL9jP+KPJq
	 ZHf4bfkohpPVfSiDjyqmYnIKJSd2D8VVer5ojmBhThSPtSBK3AZIdvxWApmQQojn8r
	 kh9EKdjTZBGWBd6wsOldeVp4Pe4PaaZOcRBit+2aWeJlZGsSo7DEOdfNVDPM0sbUKX
	 5cSeTDMERaevn+azLb3zV+8ytOiv1BCrrQmTb6R/sLLnRzzg15Klq+8jx5mqHN1ekz
	 +wrOg5emsa7Hw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/12] leds: Move led_trigger_is_hw_controlled() to
 the right place
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260821-leds-trigger-hw-changed-v5-1-3e00d6c4a936@rong.moe>
References: <20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe>
 <20260821-leds-trigger-hw-changed-v5-1-3e00d6c4a936@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 17:27:35 +0000
Message-Id: <20260821172736.688191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Currently led_trigger_is_hw_controlled() is placed at led-class.c, which
> is not an right place as it falls into the triggers namespace and does
> triggers stuff.
>=20
> Move it into led-triggers.c, and split it into locked and unlocked
> variant for convenience.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-leds-trigg=
er-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=3D1

