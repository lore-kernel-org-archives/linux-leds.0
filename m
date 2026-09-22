Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08AD306776;
	Tue, 22 Sep 2026 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088876; cv=none; b=Yun47d/vI1IMEVcr6e4LMO7lT52KV1cU0yvnxEBOKnRMwQrTEXOU/iWhv1wABP7d6Llgv8/DkIRrWtFRezJETIMPl+7kyvojQb0/qNFwUbaRZSIyjoucddVn+D/V2VYy22SyWedc1dXRJWTsicFnMwHAJ4x0mELwRuhfjQyJmNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088876; c=relaxed/simple;
	bh=YBY93fk8i5hMLKLtLLHxwSQqsTVGeWeKbLk48NbNxUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XbXcSsYblcI5jHXx0ABkfZF18E2+Z49anx0XiIrjMf7q9/Vyq2YRtEYIYnEN8HHfKkiwghbtUB+pLZq0+k2m0+JEmEsHq5UQhEqyXgrvcFpwOUTi6v2pqY+vuEimKIN2lxLTUNgognmLQeKrf+K43X/bVXa0PuRp02tnZIcfSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efwcQBVF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efwcQBVF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06A21F000FF;
	Tue, 22 Sep 2026 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790088875;
	bh=YBY93fk8i5hMLKLtLLHxwSQqsTVGeWeKbLk48NbNxUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=efwcQBVFXTrhAMyuhUqvd42XATjodas/mTQY0ZborTsixJm5AS/9P3sa4CPc5SLGy
	 J9X7GnVqFdtAUHAfXcOfVqW7YQ8VnK0kp2Euj4ksyLkHREJgTghv9NU3fU6+zOB3Ht
	 Nd74Yhq+c1BDO7GBctLVrOGK3PST4P6Ew2zKsUP2babKL3IkgMARGXniCuaSFWxHpz
	 R0wQfB9ecckzRSqxdKyuHw2AephY2EaQhOa8Do1FvIkJO9R5j9Uz7ioodqQKRWFMvg
	 ymipANL/j/vHo5nh+QAukj42OCrKYuvC2E8ln9XNRktoNu4LHYc1skuQ1EDuSuzfPA
	 EjkqvMifBXMpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: leds: pca995x: Describe
 nxp,output-gain property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nora Schiffer" <nora.schiffer@ew.tq-group.com>
Cc: conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <86db544bcf3413474bc3fac73e94bdc09af03867.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
 <86db544bcf3413474bc3fac73e94bdc09af03867.1790087890.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 14:54:34 +0000
Message-Id: <20260922145434.E06A21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

> Allow configuring the output current to adjust for different hardware
> designs.
>=20
> The output gain relates the output current with an external resistor
> connected to the LED driver. It does not directly correspond to a
> meaningful physical unit of measurement, so we refer to the datasheet
> for information on its calculation.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790087890.gi=
t.nora.schiffer@ew.tq-group.com?part=3D2

