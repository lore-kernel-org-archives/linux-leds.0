Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5143C9EF3;
	Wed, 15 Jul 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784144390; cv=none; b=YQ16DgNsA1I5enZPyaGyfDJj7c3vGHUSXx/4yCunpQT3uGDvl571fsa2bQnG+T9hvKhC+CAmfj9MHGjlZP3rtjHPRu8mVxK+StEhh09PHK1PC5Dq+3MW/bwaJt/AQHHhZU3SYlUOHazHVnj2nQby3d8yREgD/NX/5CHk4t7DN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784144390; c=relaxed/simple;
	bh=pSagzAX8TaM8JIR0ogC7aJiQTGit49snLSxZlQJswK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oEEaCd+FsV0g93tPUpn2O11hlB6dlXKrSir+Sb5UEQxfYNxHlPQfOZNbK5NeqT5Nv63mZN5RGRc4bENJuamTyR7M4SXkUcRUjPjYH0USMCHyw9cXaRu0uZmnahmqAyXR76FAt8S1bQpX1MzdtLTTg9KCTcwjuGSkbYIxXywt8aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CGcQHJzn; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CGcQHJzn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=j+6+H0npw2UjZHclxHO/x3Tf61uejqeU1dWQ47818Ho=; b=CGcQHJzn/z84paToQNvEkEm1xB
	UYrz08wsSopEY5sWUeO/VYpZRuVHC/WUY9pRsu3gWbhwW1dmwdgH1HWw+AkwKWzbpKzKgaZZ4Iwmv
	dTgY+mSo9HHUtMsV6itBqfCiBb76a+82fNCA4qWJNwCDEeXx7zHkB/TEXCceh9svmaeQGueJY8CsH
	FzGzCDpnBrSUouY3mLQ/u1dSyjlZrpt6wOvb7q32L+UWlP2/9We0NS5z0nf9f60GS42Przdv9sim7
	RketPXqv+Df4gaJJtP29tX1RfPEfU4apka4d+f9RlOMicQAGahOxayBgOnSlN4jLCd6PV6WWNK/pZ
	IaC8N1Bw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Date: Wed, 15 Jul 2026 21:39:43 +0200
Message-ID: <5188715.0VBMTVartN@phil>
In-Reply-To: <20260711192842.845048-2-samuel@sholland.org>
References:
 <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Samuel,

Am Samstag, 11. Juli 2026, 21:28:25 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Samuel Holland:
> The "gpio" trigger is used to control LEDs by the level of a GPIO input
> referenced by the trigger-sources property. This is already documented
> in the trigger-sources property description and is used in at least one
> devicetree (am335x-regor.dtsi). Document it so validation of those and
> future DTs will pass.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

having Lee only in Cc in a longer patch series might make it difficult
to notice this change.

I guess this patch needs to be applied or at least "Acked-by" by them.


Heiko

> ---
>=20
>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documen=
tation/devicetree/bindings/leds/common.yaml
> index f4e44b33f56d..e148b4277a6f 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -106,6 +106,8 @@ properties:
>            - bluetooth-power
>              # LED indicates camera flash state
>            - flash
> +            # LED indicates level of GPIO input referenced by trigger-so=
urces
> +          - gpio
>              # LED indicated keyboard capslock
>            - kbd-capslock
>              # LED indicates MTD memory activity
>=20




