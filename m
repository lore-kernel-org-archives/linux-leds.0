Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286834A2E38;
	Mon,  5 Oct 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210110; cv=none; b=JKiMPsetxJOHpOVRm9rbsVpxpwZUJnzYzYjsqLxb3daIens1pAaz6xvDmDw/Nl2m3nuG9oEvoOxuJ5wtp/gw9JKmDmmsLzMhEC09zBR/OS3QfYxG2LybDhU10ZrHVdfr6XgphRo/aIe8ltyqXWqRNA+UtPm3/JC2RnOpJpN9QQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210110; c=relaxed/simple;
	bh=dsIxcJ9UBFFFGgtopeq/2dGqZPHlBu5f/hHrie7jwJ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FUTVZQj8Pu2CYAulb48b8/1TIbgTNsM7khQdHDX+PPh+zDGtUWt37VBcCVyWy9J3uUkFEcpH56FjlpndAqjK1TML4gQU5ZtqfppelyttsvzzfWoTdQqXD0LFOLoZ7uAhTs9FtrT748mF1cCFXkNyZ9R11752/ilYs6Ond2F/m/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMqHGauR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMqHGauR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADA31F000FF;
	Mon,  5 Oct 2026 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791210103;
	bh=dsIxcJ9UBFFFGgtopeq/2dGqZPHlBu5f/hHrie7jwJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LMqHGauR/UqoxNmDAFCld45SvZnTDO75VrOhnUN9wQe9ZzHCwP5TY3iSsi/VAFziL
	 8vdHSxn8MkaE/3d1HMkhXgYsBgPZg44TSM5pNtJP24DzhiYrtR6AVQP4JmoQJAFT3q
	 xDguAhnPIQ0nFEGIxk20tw/D91xpzO2r6OqNkLKsd1leY8/BwSP+fWNiFNFA+YUB9y
	 v7PHbs/gHrTtOtKb7gohkPcXco1gTDy+/Oz19M0wIhfWuIcdNK7tLtBMKP8hByYuqo
	 Te0uugNRz/RljZA585AM6dnPIHqbCqG7+xSVTdZvheIDKRhqdU1Y2JJoiGFbLJoawW
	 zG+69vnwGGP3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/11] dt-bindings: leds: pca995x: Describe
 reset-gpios property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: linux-leds@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
 <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1791207391.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 14:21:43 +0000
Message-Id: <20261005142143.6ADA31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> The PCA9952/PCA9955B/PCA9956B have a reset pin. Allow describing it in
> the Device Tree.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791207391.gi=
t.nora.schiffer@ew.tq-group.com?part=3D1

