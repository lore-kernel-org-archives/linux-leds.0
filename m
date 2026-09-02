Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225F43D47A9
	for <linux-leds@vger.kernel.org>; Wed,  2 Sep 2026 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372953; cv=none; b=QXrqE5xG2JwjXaGGzvXg5L3F6rtonqGoW2n+J6h43k9JXHivh3ItUulb6gRsh5nh3ROB/FA2Fy9qcvMLSryf7a5xeVNTxrkWyLJc/ANlMA09EZ2OE5zfyQ1cR8cQLsxqJu4t4OzpImnaOxgN0DW6VZ4BBCCpFkIjbujOcQgQi80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372953; c=relaxed/simple;
	bh=7/foRiOE2c5PqWBI9TeEluXVd1rq69wwghodHjghk68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CqNwLaHuu4n4ayS+UFGuFipTsKTTES5DE+IQKJBB7DlZmvaDYMC61uJI03f+0EM1o38OGcGI4ElEMbP992Pd+BX1Z5uJUFaLaug9JkmPCSHPdsoxXcIcXyxfGPIt+IKyry3ywRIkox1alnnvxx+3u5xvVAdhmCtPDtuAAP1tASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBGxgHV3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBGxgHV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9054F1F00A3A;
	Wed,  2 Sep 2026 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788372951;
	bh=7r7aBDqWdItHQHhSqyPRZoxaP4suJO8P1pK7z2div9Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hBGxgHV31DBcj/I+H+W8vkWvZqLZSB/KjQ7Jg6sIVi6bP5s0DFFQKN3gXpWkzh52u
	 LMkxC3pLqVKeOlR7ex4RcWJ1qRrzhBJzUIOzIlLK74R5qO6DdVZmUIPzMYS4fyDFXZ
	 B5u6F3YeEj8H/vr5rVxGvPiGgjwbAe2tICptTg8TmCJYnzAi3F1moZsbmf2lC10UXh
	 OdSpbpG8OP9GkevNH8c40fs9kGqxoFLxnY1BmThozQBg5JiauCH6FlkfSFi51T/OkC
	 uJsr3Wx80cF9xQNN7QBRYS/rt+Tz1U8im116+lLyiQkVRhFMo3mbVIEehBAxSfQ0eL
	 6zbCBFOyvn/oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/12] leds: class: Remove hardware control trigger
 when writing brightness
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rong Zhang" <i@rong.moe>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260902-leds-trigger-hw-changed-v6-3-55693cd78877@rong.moe>
References: <20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe>
 <20260902-leds-trigger-hw-changed-v6-3-55693cd78877@rong.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 18:15:51 +0000
Message-Id: <20260902181551.9054F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Since commit b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of
> hardware controlled LED"), the brightness attribute becomes write-only
> when the LED is controlled fully by the hardware. A write-only attribute
> is very confusing.
>=20
> Moreover, most LED drivers set hardware brightness innocently with the
> side effect of disabling hardware control, but the hardware control
> trigger remains active, resulting in the software and hardware being out
> of sync.
>=20
> Fix it by removing the hardware control trigger when writing the
> brightness attribute.
>=20
> This should also match the semantics of hardware control:
>=20
>     When the LED is in hw control, no software blink is possible and
>     doing so will effectively disable hw control.
>=20
> Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardwa=
re controlled LED")
> Acked-by: Ike Panhc <ikepanhc@gmail.com>
> Signed-off-by: Rong Zhang <i@rong.moe>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-leds-trigg=
er-hw-changed-v6-0-55693cd78877@rong.moe?part=3D3

