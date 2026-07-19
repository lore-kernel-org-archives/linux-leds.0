Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814D3AC0FD
	for <linux-leds@vger.kernel.org>; Sun, 19 Jul 2026 17:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784481194; cv=none; b=XCkoSVpCpneMClw4wC0g1y2Y+FYvi8g8BgtcHXiHooNdVf8Dn7aAixTB5OjygNDq25sXZC8AZqW46CbqQgpaBDfSfYRA5CPcYB1a7ErSRcUZ+IyYDwerVx5TyiKHMVVPu2hJV1mED2MAWuKpIv4v5vFtP8I+giqgz7DPSq/lg+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784481194; c=relaxed/simple;
	bh=TEyoiT3aiWS2umPfx1pXo1Yl1uUiXUU0TvmKEnHIQIY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oPHDFGBGRzHzCuoPBegyBfzF1Rdrxi2kz6Rub1ikqNMoWRsKJDiKSSrmx3UffwbWJMniqeqxdjMVa/cC+vr+pyTM+tuCq8aFZ4ZmgcUyeyw19qQE8IOAOAKO38ZkbXT0AtLuDFo8Y+IFuLkEJiE+MxmPYCID7x1Jq8D/Juaa86I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQWncTTO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQWncTTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1941F000E9;
	Sun, 19 Jul 2026 17:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784481191;
	bh=TEyoiT3aiWS2umPfx1pXo1Yl1uUiXUU0TvmKEnHIQIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cQWncTTO7zG5M+cYGdG7E3xfNi7ck3Z5kHtwrnANGdhzUt+S1BjaBeFI2/hbU5GSp
	 1YafwqL9itwQcGHN7O7F9bhKBszhLh1oA8rWjhQrnppf/lUvBVJCJg0cC6W3+GQnjw
	 U980kutKrdcijrHJ/zjd3t71CyjqZfqCfdZgY3Hsyo47LyWUgS/aVQ9nmOdgU1c8ZR
	 GGJ+KC0biWS4O4lVBhWSwcv79G1LuJLs/+WOzxYC86kmDjLq5hEnrQKiuzenvwag0I
	 +Ji3Zocv54hDsPjVsNbMJVuwYQaMH6BZUGBPw9FT9V2U+j8FGnX1HfP+rD+rYiw2i5
	 IDDRGQ9ywXt5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v3 07/11] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260719-leds-trigger-hw-changed-v3-7-5fb55722e36e@rong.moe>
References: <20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe>
 <20260719-leds-trigger-hw-changed-v3-7-5fb55722e36e@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 19 Jul 2026 17:13:10 +0000
Message-Id: <20260719171311.4C1941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> With all existing triggers adopting the new interface, strict checks
> could be enforced to make the semantics of hardware control triggers
> clearer.
>=20
> In detail, a hardware control trigger should:
>=20
> - Implement offloaded() callback to indicate hardware control
> - Associate with the LED classdev's hw_control_trigger string
>=20
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-leds-trigg=
er-hw-changed-v3-0-5fb55722e36e@rong.moe?part=3D7

