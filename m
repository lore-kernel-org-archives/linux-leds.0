Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053953;
	b=GNKyuciqC51yNXIF4V3yx/eMiegfJOdPwkxzHWoP87J6jbYnKj5Go+H/1W4F1EVBnxe1
	 ppWwINOS8lu9MOJGl9YT2YtRb7AxbZ8xNmnUlQyKjJT5e837uScb4GTOP/m9u2R0f2vGh
	 SLIRowS0Mei2DvwNV8jYWnvpenHfDPxvlTjRddh0NAtmsNvvS6QdE7TkM9NQkgbnXqtIe
	 tq+EYyAXo4bBLLNMnkVsQ0/7vZ3KWk2oSyRRGeORC8bQNQ73c+cn0zqgBAlOByiEa9xYM
	 OErvb/zoapkOKq6OiDbSzA6xk6ysA7A9sbfj4A55/8BFUW3orWDfKOaVc98Gtrizv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053953;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LnmtoxaVxMG2bLc8Y/hRTvAEHe36KUYczSo+42EyxSk=;
	b=2IdEgOyo7U6CsK2VOf0tt5LtbBoWCyPp83LTRJMUMvLgcieW5d/thmN9COtRau1J4Ix6
	 2lq8KBox3nwcbYwCBb2lja1Pk5T9BZg2TOUDGWd/mbhuZ1ZkGojiu+gYA4ncS/6tA7CYA
	 m5fHJ/H9aZ+2rvIDeqZ4y319XHnHlL0SYCwC8A5qyBqYROI17ZKlmqfgPYq/GKeJce8dJ
	 SK2N+iFFwKGfoV3+8ru0Iqcaq07AcbrouboY22RtA7cO+SnIXiK+U5gWNfb/hD2wBRqky
	 2VF2lo1t+92XpVmJ3GjoXh8S7p6VkxbqFOJY0fhBy0VqDPRW+XUd+Fxh/pUYuvNt4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d1kRwqqk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF50606A326
	for <linux-leds@vger.kernel.org>; Sat,  7 Nov 2026 12:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d1kRwqqk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332891F0089F;
	Sat,  7 Nov 2026 12:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794053952;
	bh=LnmtoxaVxMG2bLc8Y/hRTvAEHe36KUYczSo+42EyxSk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d1kRwqqkd7eX6xvUnqDJq4XxzcIkxGWbPiiVTVAF77K8FJZVB04HXK5XRWaxZJtWH
	 j4hzNQzMIkgjuVB4vUtO+2eRUY1IqNq62ARiSFEFObaKaCPJxaQ/080T/X5UNQuqsq
	 kfNn6sVTIBqKU1+oXNb3vImutJdlZI64PhazZz6vmTW4UH04n13lNbLJVWakS6IS/J
	 V/Hwt9pUcvTeFN6vckHPzS+0Op3BbBqLVrVNp5MR5fiXf2y+W3ekwRntvMrHbZ9jqO
	 mLMJGYlVo+UD1XpgjF5dQHBuzKo1K+YfnMgPre7agOzHKnqw3+y1KXNl/OZSrRUyMK
	 QWSIL+qHGqKYw==
Message-ID: <sashiko-outbox-202885@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] backlight: lm3630a: Allow setting the full-scale
 current per bank
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michiel van Beers" <michielvanbeers@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261107-lm3630a-led-max-microamp-v1-2-ec9e441d9b2c@gmail.com>
References: <20261107-lm3630a-led-max-microamp-v1-0-ec9e441d9b2c@gmail.com>
 <20261107-lm3630a-led-max-microamp-v1-2-ec9e441d9b2c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 12:19:11 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> From: Michiel van Beers <michielvanbeers@gmail.com>
>=20
> The driver always programs the full-scale current of both control banks
> to the maximum of 28.25 mA (code 0x1F). Boards whose LED strings are
> rated for less have no way to lower it.
>=20
> Read the optional led-max-microamp property of each led@ node and
> program the full-scale current register of that bank with the matching
> code, I_FS =3D 5 mA + code * 0.75 mA (datasheet SNVS974B, 7.3.1.11). The
> code is rounded down, so the current never exceeds the requested value.
> Values outside 5000 to 28250 uA are rejected with -EINVAL.
>=20
> Without the property the driver still programs 0x1F, so existing boards
> are unaffected.
>=20
> Signed-off-by: Michiel van Beers <michielvanbeers@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-lm3630a-le=
d-max-microamp-v1-0-ec9e441d9b2c@gmail.com?part=3D2

