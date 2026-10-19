Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F424FB9D1;
	Mon, 19 Oct 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421552; cv=none; b=Z7fjr/2VS/vdYtRYVb3VJYrJfxW0aQcdFVp6lNAaNS8nMAWgR3OxTNijDBR/nq542xn1vvlLTNFdPy/zqQjE36ebuWpm8M6OdTpIwjwCs5PGmcsSVgcL12epwiAMP/yIvUPSJNvtOCI2o6KqG8BWtTtIlq3epu3l77eEZlBpXPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421552; c=relaxed/simple;
	bh=jbKChGGoekszrCStVVRyJ9zxg+J//bGgViZJIS5CyT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RCa9G2GjjNhnyz5i5GBiWYAU6GLbpv9ZBQTJe1T08isUdKVBejYI2oa7euqhlQKSauwEPANkBx9Nz5aXziPabXWzQZLfP35n+TwNi1ZibMFLMKUKxdGR6U2pYW4mn2h3r4UHQFZPW6Wpmo2k/lJIr/Vp5j46o7OWFBFCIkEviDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuqN/98G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuqN/98G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EC01F000C4;
	Mon, 19 Oct 2026 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792421550;
	bh=yl5NxpV3qhtDFSqHpsAuI8SmOIpcijjYdi5raaMOrlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JuqN/98GnVi9GPTKHHeS3PyF/YFglS79m2gP3Oqx3z7Wsz+K773raqauih4NT1LTq
	 kK9an1otIy5yhzDUBaNhtXsSeichOPK7WAgVCWSOKUatp89Arb8Mj3KA+2sHy1+5OE
	 Yk/YsP31OlMHxgcnpk6PgzYyfkRYF7w4jxVNxNYpRIL9I4G6Ybtvq3v7CDExEC7/6y
	 n/BLfEq/qK882dg3luWHblrugtg/F4ZREuiJOybtpuFBL8pUYXv6Ziqa3lYRNluGww
	 vBSZ9v0j8VdmpCJk6K4CvbCA7lg9r2TkUmLetEwvlRuEj8Wzayr8Xu96v7tS9wfGof
	 5W9Sp3vsKYFWg==
Date: Mon, 19 Oct 2026 15:52:24 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Message-ID: <179198322819.839288.5272985130898382430@kernel.org>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013180933.487013-2-clamor95@gmail.com>
X-AI-Review-Draft: <20261013180933.487013-2-clamor95@gmail.com>

Wrong subject line.

> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

[...]

-- 
Lee Jones
