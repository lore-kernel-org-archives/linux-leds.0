Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E728388869
	for <linux-leds@vger.kernel.org>; Thu, 15 Oct 2026 19:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094011; cv=none; b=k68kFB0WuMR01PFNxjCy625jfX7whu0UxUAzow69BUO95Tpi8oiMIx36fIU7CuWhB+BY7LgHRre6bKICtTrv/toYzIB2NQ5QWG8LN9wx9UEK2qAKL9xZjgcqLOwZV9u5Wk/fRO8Aj1PwRQQJ+7CXhYA+nuifzLS4+1sSh1Jf4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094011; c=relaxed/simple;
	bh=ro5z7Sse3v2d3Sa7WXmDn1hXb6lGvpuzIPKl+Ocd9zM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hfz0vEl0ko/keKw54qP7amv7InKedIco9NqeGAyfWBhAfnifMwSnE4BoD8ZUtxlGPKOhtzO+S+ubfEHC9xEhkO8VadGkUEiDxTiUdw8kXvrPf/lUMTL9CqD33zaxyIq81pL0Yjix3p261V/qS/LWlI6Dh9C8jkZKH2AcUMqQkxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgE2zc09; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgE2zc09"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE01F1F000C4;
	Thu, 15 Oct 2026 19:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094009;
	bh=ro5z7Sse3v2d3Sa7WXmDn1hXb6lGvpuzIPKl+Ocd9zM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WgE2zc09dnqWefXIBVLY/zj7nbxeopCMiLvzykLeLXEkqcG2AkDfMtWMYmZOuocdQ
	 QvhPI/URoCsehd7KbNYb+NBOpEAy5O/7i7aGEKvawjysUKCD34NppBfoPJirUAQI9U
	 YCudPv8FtFi3jp6fuxy2ZtpHM7q6rKOIWyLe12pS0Ux+2kmDgzHYdi8Uafiz66pm1y
	 +KZxhCLDRnJj1/cD4NOzyEJWLsMJ+rjKy4Brz0YBoIvBdQMTx82m24TgW07vmXG01e
	 THJq0j+PgQ/etBaIwUPtPrTWSFNdq1nOQFQPiFDJU2GWwDtw1N1hRhjENDGN1tuHKk
	 obiNTzvnK8lZA==
Message-ID: <sashiko-outbox-173369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pmk8850: add PWM node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 19:53:28 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Describe the LPG/PWM block on the PMK8850 sleep-clock PMIC. Left
> disabled at the SoC level; boards enable it and reference the channel
> that drives their backlight or LED.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015194732.6442=
8-1-srinivas.kandagatla@oss.qualcomm.com?part=3D3

