Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3F4D0A05;
	Mon,  5 Oct 2026 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217899; cv=none; b=dnBp3EWfqshzwEqa9a3U/zQtzhDMVRvjFB3kBlzKknCAPwuuE61gkO/YbhULNa8EezxoH8ReJWZioOcgbZzdKiFbKyui4+s31+2kbeXIIUD3Ceknf0tq2WqSQYowQvXGKNeAofEPFyvd9XbGksyNp978td9xcOM8026gqQi5t5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217899; c=relaxed/simple;
	bh=rf80/niE8qLwq+55qi9hVBkMl37ZIOXVTrbMFLituNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lo54edXg2L3y9jxGvKbTnYcwHULWDif0zctqFJo1L6Qpqm+43B3BoVjQfMjchPwqyu4xdjO8+XH9q3smO3LJ9ISNZUn2cqZJGdRr5HkcoiP1WeZn8PZWzAVODF7/SnxN0uHngzjBfDxH57chS3AYORSL46/uUPShzeZTNs/QCek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7IqcPkZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7IqcPkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CD91F00893;
	Mon,  5 Oct 2026 16:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791217897;
	bh=w9KjakV6Ms9jin0wX9osmpzk77dx7kQIFeLApUKCnxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P7IqcPkZqOXmZp1QAhv6wsHZG7M8U/SR/dOIoI3eWTjJiCZuK/Y/G3sF5+NcNiyzP
	 mGwySL1nUlU6y2kbb4BrMGagAm02WFOjtrVMi5ThzENnVBNgXT7Aapr/RrMgIQmBof
	 fTGR/gcop636uC6n6dsjZyqdASXVPy4PPa38Pv0h7q5NCUz6ciqhq/Kv59CMFwlprg
	 s9LHxpGMDOB5JY9T2Qh2N9YxnMBhG2avB5bLay51hpVOx7swoi0Z7STXlwAkIoJKzb
	 73+Dt5M2ZwLxqbg44tCkKo1P5YiGCuDAxFLBkNPWd4BVsfR7nDw8+G2D2Wvnk7Q7hz
	 BcirUN376L+mQ==
Date: Mon, 5 Oct 2026 17:31:32 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: Document Skyworks AAT2870
Message-ID: <asPQ5FgHe87XQJBT@aspen.lan>
References: <20261004164121.193514-1-clamor95@gmail.com>
 <20261004164121.193514-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004164121.193514-2-clamor95@gmail.com>

On Sun, Oct 04, 2026 at 07:41:19PM +0300, Svyatoslav Ryhel wrote:
> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
>  1 file changed, 127 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
>
> diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> new file mode 100644
> index 0000000000000..014678616076f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml
> @@ -0,0 +1,127 @@
> [snip]
> +  backlight:
> +    $ref: /schemas/leds/backlight/common.yaml#
> +    unevaluatedProperties: false
> +
> +    properties:
> +      compatible:
> +        const: skyworks,aat2870-backlight
> +
> +      led-max-microamp:
> +        minimum: 450
> +        maximum: 27900
> +        default: 450
> +
> +      max-brightness:
> +        default: 255

Should there be a min/max here as well?


Daniel.
