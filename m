Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B498218A6D4;
	Mon,  5 Oct 2026 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210452; cv=none; b=LXbJmK+XKdyHZ3Rrk3Z+LhxHJOgUBJSm+UPvoChpYCeHFZFNSfXg7RlS0xjteDoQd1fPAbFSpW2wwXvjaWNNeOCh5rXnRIiRx4FeL78/DgLkWUhGhQfxvIXCXJlp2RmQL4GViGiT017jY72p0yitzPgXqOukDHAOycM2OhvOdlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210452; c=relaxed/simple;
	bh=QWFoNgEeHa95SdUBfoK32CTM5tZbUWhWmxKOXFjfgLA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tdLFRo0h/ry2eiNCPNzrCwuLzyPM0W4C9bPYEkGd2excIm3XIcJnyGDiJjUcM5Yw4Gh2LKQ9Pz7pJxOOEfP96Hk4Ruo4XNOnPHP4dnGapvIicl3aK6xUWntaaRS/V1X3KnA49/Fipnf3m1dsPMK48dTDnk27jyxC8ydzL97Q56o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liI2PK+o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liI2PK+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6847A1F000FF;
	Mon,  5 Oct 2026 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210443;
	bh=QWFoNgEeHa95SdUBfoK32CTM5tZbUWhWmxKOXFjfgLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=liI2PK+oHa0mpLYITyUtAHh4HSTJhk7nqakqbw9DKIuXgAQuJeBmH6ZZ4usYS/F9d
	 pU8DHw8uzGcvBjnrN23MtatvEsb6YWGtNuyxAtQHbIsYQJxLzSLXo8NpTZslT0/IRE
	 nLMhEex15eDSEc7+qlJ95P1VZSrUSvEIQ2yVI9pKg2MPv4Vmi/CyVXlO7dC99fytrE
	 tVLiK5X1rYUf391j57jfVTcfGaq6jvD+oVe9FhYPV5hOfl/peN4HqsAYXitARtgHbQ
	 Uihlpk3fxSzqWV7v5CzZXuRzVAGMo/crLfCJmug/ALsdWwlUrjrQ208Ne9T4b17S43
	 T4/ySLWQ2xikw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/11] leds: pca995x: Add support for group
 brightness control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <268cf89c02f166a012802cdae0c187566b903309.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <268cf89c02f166a012802cdae0c187566b903309.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:27:23 +0000
Message-Id: <20261005142723.6847A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> When LEDs are set to PWM mode with group control enabled, their
> brightness can control using a global "group PWM" setting, modulating
> the individual LEDs' brightness with a second PWM running at a different
> frequency. This lowers the minimum duty cycle from 1/256 to 1/65536
> (averaged over the modulated signal). Group brightness control is
> particularly useful to adjust for different levels of ambient light.
>=20
> For simplicity, group PWM mode is always enabled, with the reset default
> of 255 as group brightness. This reduces the effective duty cycle by
> 1/256 at all individual brightness levels (the individual PWM signals
> are modulated with the 255/256 duty cycle group PWM), which should be
> imperceptible.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D11

