Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FB490C16;
	Wed,  7 Oct 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363804; cv=none; b=INmL53t6FMZ6wrFYq4CmfZ0gYpDSWXAL2kqs2vHX/VfojEUt50BtkH8NegczX5BsizRdKKayEnDBmVadLrJUHnbTel5pa6FKmVbIJ7EQNnQ/j2u1588Wm2UP4hfcgD++z6ZS3y4+pfAjB+aWtIpfRb2w1omeWREy+GsKY1VzvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363804; c=relaxed/simple;
	bh=8NJGafQHLTZNhZ07KV2R0+YPJw7XonkNTymgSGL6Gd0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AR7p23vBN29vZj+BXsw6u+TtSlyUGgD6QXXxR5BkwSHfEQdBN8OjPSbJWSm1PKWrWFIZORdvbjxdTLE5dfrl9FuQXEKwrtCcuzjD9BOI4Z2fTJqi+NdISImb40BiZjIfPie09trlFj6R3w0K0ejPn+RINnC1VRHP89QONyL38A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oFcs3FbD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFcs3FbD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEBD1F00A0D;
	Wed,  7 Oct 2026 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791363770;
	bh=8NJGafQHLTZNhZ07KV2R0+YPJw7XonkNTymgSGL6Gd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oFcs3FbDnwYV1VPrZuruf6/DwsqTiP9yqMGjsWNtZCVv1Wa4ECCasx+XaERZoZeOR
	 61ex0naWgRTZwuKOJIInuKsxU4b7UNposQ+Gvod/cByUwD2ISjrIHjGucW1XJyivjs
	 RyUS9C6PgHAHfA0O4H7/s1QiajktNKleLC0ROQAmtNcfVL8oifGd9SSjie/+WEorUM
	 43lIl+t5jwNxD7Uly/GOJdqH9eeTvUvxf4JPpZAFCVnne4b2+6FAvyfWNbdk43bW6c
	 fFhRva0vN3aVdnpDfM2q7BXD1wLxAhqxZpyyVHqlqkYN8UdzUll52fd5Zr3dPzJmfB
	 wkmzORWJg4AGg==
Message-ID: <sashiko-outbox-162768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: leds: skyworks,aat1290: Document
 FLINH pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261007085457.98762-3-clamor95@gmail.com>
References: <20261007085457.98762-1-clamor95@gmail.com>
 <20261007085457.98762-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:02:49 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Both the AAT1270 and AAT1290 feature a FLINH pin used for mandatory Flash
> inhibition.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007085457.9876=
2-1-clamor95@gmail.com?part=3D2

