Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A26E30D3E5
	for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2026 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789934260; cv=none; b=VkhRXu20+T/bLhJiRosyzsxXy02lfqri03AcRXexlVdmCwMoZKIt0anGNf3BtzqhP/2YT0ENZw8PRGlEX3NANB2bdQ+h761Zn7f28tSTUxuhzlR+BVqkbU85us4Xfx38vSq9AQle4Nn6aofYNn6ILBKTiJMVhi1rrBuVFQVt5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789934260; c=relaxed/simple;
	bh=ItaHGJKSiBA+9ZmE+jjjt37fuyKsVwwlXCvtTqquT2M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pQYORlVi1g5Y7lBkNa/vNe2aMYk1+Xi1+VxLgLUAKV2OP2uyCVk8DQFBhBFGCKCZnoptCK9YzxSEoHFsa4imGC3nutMAeTpemIDt3n6WAp2ciIvRAXecWDP6zl8WVKRXRqC8IFZbDFx4jk/pTWKpqosSR4xq8HP8kk6VyGAxLXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtwT0L88; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtwT0L88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4D01F000FF;
	Sun, 20 Sep 2026 19:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789934259;
	bh=ItaHGJKSiBA+9ZmE+jjjt37fuyKsVwwlXCvtTqquT2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TtwT0L88BKTNqTb1DcTcQSNdctENUDSGilw2I1jBQP8wPA4GIEWXqS3W1CH5vsUD3
	 SNPwM7BqXJhibgAeFYHDMWLmK3OGvj+XK1w1c1PpNmJtOJYFxeAY3/4QpjplON8oDb
	 CMgZrInnUtBrxJ+wFWE0gYhRA+oSycAd66MBxYwKSyuKaGYw2SM+fs06NJ3gTabVYm
	 e8TS2al4PmatyOWNVRL/+cmXlGFbw/cemeOEbHEvFo7r7EwSxuaxM6SO8Moe8GeMk6
	 HxjKxCrb5p4qJajtuJx4cDZw5OKR1aCCF3o+d+FHsYpW6Om0j+rs3sCISBrK6oVTgh
	 jzqg+tcL4ycfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/13] leds: trigger: Enforce strict checks in
 led_trigger_is_hw_controlled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260921-leds-trigger-hw-changed-v7-9-fe3cdb6dec51@rong.moe>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe>
 <20260921-leds-trigger-hw-changed-v7-9-fe3cdb6dec51@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 19:57:38 +0000
Message-Id: <20260920195739.1D4D01F000FF@smtp.kernel.org>
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
> - Implement hw_offloaded() callback to indicate hardware control
> - Associate with the LED classdev's hw_control_trigger string
>=20
> The fallback path is kept, but a warning message is emitted when it
> reaches there.
>=20
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-leds-trigg=
er-hw-changed-v7-0-fe3cdb6dec51@rong.moe?part=3D9

