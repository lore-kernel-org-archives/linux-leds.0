Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733412;
	b=D78/oihx8LWf81xkM3AkmqXmE+/07k26nN8WJ2mmohQ77FELp0HfSGzuxlS27s0QGSI2
	 msdg4RFGd3a2ime3SPWeUTjjpYWun2fQGUuWqXJcfLjlL1yV2x/nHAzXdeMhS52Z7brL/
	 Z/TM5i/LzdW/FjrYHBkUxQf6qbYPZVprr/WwYdfi8QBj4e3gQqX0PABSYqTV4MQUkdUdv
	 n5LU3/puJmOXpQVsqGdwvdC4iWbimEex/0jTmUlef8AdixP4jMyg83t7Y172Y+HtSd3SG
	 Cn97ZNVls4DzD2RGr7Vthn5clcSFWLIOPD31gXARQwZqZwCn/6TgoQgp+vSmiQEWxOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733412;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=usQ8YUdmj42/ST11D8NsarnPk8mxtMRv4pLLyUaWqhA=;
	b=kdVdyen7Re9Vv9fRN8WlLfqhuVKdFCN2yRuUZKDZVz4fx/70Bm76f83fM0lhfI2wQjWa
	 yyqz59/AENLFK0KGNNTRJ+NloofGOuTDUxLLtY/UazCtcK3Yokj7Gf+Rn+g5dkRrVnk+6
	 WPZ2a5WOR70f1eBBrWCxa0JKYW3cAN2AafNP9CBsYdhc9G0jXKgZkN449Fej97SgQuRKN
	 Ae65D8jQZ0ry/P3uRUKQsJFgxLNTuJ8YDub1WIuZiRrvK0/PVTl7ifNdS+7wy3zf0633w
	 y7307UxUOnPY0hxDJBc7TnfnstE3b+Fjm1Gz/+kaI6A1wEJbUn8iAFMQrc4RGN4mMkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKdveXcl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC72D606A31D;
	Sun, 15 Nov 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKdveXcl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CA81F000C5;
	Sun, 15 Nov 2026 09:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733412;
	bh=usQ8YUdmj42/ST11D8NsarnPk8mxtMRv4pLLyUaWqhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kKdveXclmQpOF+WlZN3cU4KfsWw/8GFB39fR/XrQ1/9e0OpiNTNSJkPzGx2nQznkR
	 7sIXFauusJ+J12OgllAq/oRoBKRFtJONUE3+qP3Q3Bs0qJ+Mba43kUE5ZzdHBqkqma
	 zcH6rERHdvvdhrid7btCkgD0nB4jbzffG2SrdMGkAWiDnx+iJXETu1TrHDWSlnxobb
	 8rtsd1sGr6YiBPmcj8dwTnaN8sKIJRcMz3xtd7sgLuqXg/CeiI1AAuFECF8dvkoMII
	 581Icx9JoVxrxOrRFqdG2ASfIiVj9zBAMs6YshT7c2JM03Sn1RketKotPauD1PEiAO
	 Kjzf2sAdLbtvw==
Message-ID: <sashiko-outbox-215322@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] backlight: aat2870: Derive brightness steps from
 max current
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115085826.89641-3-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
 <20261115085826.89641-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:03:31 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The AAT2870 allows only 32 steps of brightness, with this amount defined
> by the maximum supported current. Remove the need for max_brightness by
> calculating the allowed number of steps from the maximum current.
>=20
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115085826.8964=
1-1-clamor95@gmail.com?part=3D2

