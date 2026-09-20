Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60038DC51
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934259; cv=none; b=WFsT27K0JVkpor+qfDipSdvaEeoTKvMY6L+Gpb3lanaK9heYtkRs9IDjA7nvDABMCMxP4qLFa/pio9NeIvtQgo4pbyjq9s6ec9cyHcBi5MR8HsnnVEeo6sQthwki8pNv2UdkutmaApRzjyIHoyKiK1YmfjrEtpL3wqgymEcWf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934259; c=relaxed/simple;
	bh=wLGMMdBCGaQSHddGZSz8d2/MrXjvjrkzahiGYfyzBsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R7USYUuSMql9mH5lgWhsrdRNPF4hgSixg45+ir+MZdrBJLjPR5Y9HuxxIAOcK9peoS82uoKuaWTVKrnxeBUAZM7/Cv+mGHB8o0ERaMvQxTvDkqGwMlTN1VDKgNhGRnPQi6/xzKvbjZs6c4oWcSSqLdZl8gffv3RICsUf2jBE1Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKgsiSfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKgsiSfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE491F000FF;
	Sun, 20 Sep 2026 19:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934257;
	bh=wLGMMdBCGaQSHddGZSz8d2/MrXjvjrkzahiGYfyzBsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QKgsiSfFdKUKd8Q+sZPD7fYl/1BTi/ZoSo5l+u/d+Z9pZMdhEISTsDAvbClMROf56
	 Lq9KLwmE49xP58jfVi3eZSmP8xjwqSf1HSgswS+vsujhvIPYFO8gyypsZBh+Xy5Ydm
	 Wb3CG8ouaXS9VfTv6j5pwIXgJXUs8CdlByDscjMOOAc+udaGw9ZmPSfLHA9c6XkmC6
	 FVbEiZTeSbJF6QqbIuNehlrrk8D3PY4Zgtb3buk1l2Qej10U/BGFxzGLl5ij8AKOsX
	 brUd8VqN2VKi3eT9ldDxNRrR74U1CBiAMPZcwZla5VuK405vSry9hUON16eThnTA5A
	 RESGJI9jmck0g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/13] leds: class: Always protect brightness_show()
 with led_access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-1-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-1-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:37 +0000
Message-Id: <20260920195737.9EE491F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The led_classdev_register_ext() protects transient states when
> registering with the led_access mutex and relies on all sensitive sysfs
> attribute callbacks holding the mutex to prevent exposing transient
> states.
>=20
> The Fixes: commit broke this as it accessed trigger_lock without holding
> led_access. Fix it by protecting brightness_show() with led_access in
> all code paths.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D1

