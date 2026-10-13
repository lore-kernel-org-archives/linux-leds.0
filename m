Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733233F4DDD
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885484; cv=none; b=dnjp4OYFqQAycMRIbU8YLhex9CeS5Odv6S8MlUmCkuS2YmZMSi3qT35yGJtaTxDpTkdK+Ejv+hsWYa6SNVeGo3SKAQMY7Z5daD1WEURocfio1MGZ/wNTz9K41Zg3mbcavwTNK52KgIbRvtl30LKNqwrRvtg5D8KSujgRJmsveHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885484; c=relaxed/simple;
	bh=qn1x3GJmCwIWRBGXbcIEbHT0yyEaFW2wxg0oZD0ov0Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=E4Gzk6BjnHJM3yBh20wqADNqKQv/dKq6ruJ6lKdzyhoGGhDl7U0TyWV2+QKcHY3mxytQA2mh6TXb6ztxGJmOAyCJ/hq6yi9+rUkiDwu0ISQQuhvZHCBtBK03++Wc+lL+tZVu4o/Hju0JckTHpTAKAR203zacR4miQKI4yMePUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGqCkNQx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGqCkNQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90E41F000FF;
	Tue, 13 Oct 2026 09:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885483;
	bh=qn1x3GJmCwIWRBGXbcIEbHT0yyEaFW2wxg0oZD0ov0Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NGqCkNQxhp3mSqBY/Inb8AXAgb6wKemQIt+dOD9EY9OrpIOKyyLsPHoJJMu2DN2JS
	 /XNnUPpXzhoEM05Y9a4qbokkg2Q+h1PxC31sbBQSrqPsRz9VL97G2Igw7xbjJiu3J8
	 WYL+aA9lIYXAR9mWwvZuaVyi0dms42kooGWC9S5Dn3C1BHvBn56r5ND2/heYToajow
	 2uIJb4SnLSNEN2Lb4ReRNVq6MyQdT2mUxsECQ700sqMEDb11cJuRzovvnytKAZqIGP
	 4Yyb9Z7MwX1iG2Qc4VS0CKQ3Hlex6yEDGVq0Ubb9Pb0LeUYlHXQST+T/l4Q22Opymp
	 6QiBrkpOnZ0mw==
Message-ID: <sashiko-outbox-169407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] leds: is31f132xx: Add support for is31fl3206
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flavio Amieiro" <flavio@amieiro.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261013-add-is31fl3206-support-v2-1-ca0d2bf5783f@amieiro.net>
References: <20261013-add-is31fl3206-support-v2-0-ca0d2bf5783f@amieiro.net>
 <20261013-add-is31fl3206-support-v2-1-ca0d2bf5783f@amieiro.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 09:58:02 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> This chip has a different layout for the LED Control Register when
> compared to the other variants. This register contains the enable bit
> (in the highest nibble) but also the current control.
>=20
> According to the datasheet, a value of 010000 (0x10) in the register
> enables an LED with the output current set to maximum.
>=20
> This commit adds support for this IC following the previous limitation
> of the other variants: all LEDs are enabled and set with maximum
> current, letting brightness be controlled by the PWM registers.
>=20
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-add-is31fl=
3206-support-v2-0-ca0d2bf5783f@amieiro.net?part=3D1

