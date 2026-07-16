Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A39374195;
	Thu, 16 Jul 2026 17:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223340; cv=none; b=ajaagccvnzybsPnvD6YsrLV5f86Cu6r7ThvOKNJFP+89OMWfw01F0deCqCoZgHwCbOIEQDuj2YMzcaC7zoY41bTpEn0b2k/87aHiWdGg34roYxcI84QTkKXZ6Jn9fLk3Z3yhjb0hNrJqNRO0Hczr4SHRBq0uinD4nZ7eaIjSfWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223340; c=relaxed/simple;
	bh=YwRmOEFI3f5URqYYo+eCqCa+D+XclSkaQGeBK/jZVos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=foo/zPctJVBAlxsQpTyOauePO+QxO98SJPYTqBksz6vkeiWIkunAuQyJ/C6s7XMJ6K4QFfcLncKVe9+XyoAUoee8l4h645nFJhM4zd65YOQ6OcTNiZK2z8Gc9+jcWxYS6IBcjzz8DZ4puqJ7AkZZEnuridHQKvc7lMZ6J5z1/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZgEcGcA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZgEcGcA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242D81F000E9;
	Thu, 16 Jul 2026 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223339;
	bh=yf2oHsNRk8ZDkNH1BFO0UXsDSvAMijvnvwM4EvDInNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gZgEcGcABnGq3/tGZdLO4OlHyEubpxJf+OSCy0W6hvuvPeaL8h7GVKJK+5kyI0g7A
	 zXXERFQi4Q6wEOfnEt+2G5FN3Fdx42fgzGmY/Z7C1m8HL9Y9tthuQoIpc3nBBnkie4
	 9uowZVlTFc1k93B78AX8eAy19kH1ukCcplGj/MaoSHye+PmwEipzBnzhZ9O5N3wzu+
	 iniEbbhoJaEFbieehJeW+ef+iyV1UmjhaUYLfdZDELdQYagbdwo9MlPndwx5+yZ5pT
	 xO8hjIiEBrxjRRO/FZzIqSmzZhDZkkfN57WjYuB1RbXxt0Vz2TJ4htHEp9kcZ5TRXf
	 /0c9ZoY2Fdhiw==
Date: Thu, 16 Jul 2026 12:35:38 -0500
From: Rob Herring <robh@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Message-ID: <20260716173538.GA534222-robh@kernel.org>
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701175330.1645927-1-ninadnaik07@gmail.com>

On Wed, Jul 01, 2026 at 11:23:30PM +0530, Ninad Naik wrote:
> Convert lacie,ns2-leds to DT schema.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
>  .../bindings/leds/lacie,ns2-leds.yaml         | 87 +++++++++++++++++++
>  .../devicetree/bindings/leds/leds-ns2.txt     | 35 --------
>  2 files changed, 87 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-ns2.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> new file mode 100644
> index 000000000000..679a618906d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/lacie,ns2-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dual-GPIO LEDs found on Network Space v2 (and parents)
> +
> +maintainers:
> +  - Lee Jones <lee@kernel.org>
> +  - Pavel Machek <pavel@kernel.org>

This should be someone with the h/w, not subsystem maintainers.

> +
> +description: |

Dont need '|'.

> +  The Network Space v2 dual-GPIO LED is wired to a CPLD. Three different LED
> +  modes are available: off, on and SATA activity blinking. The LED modes are
> +  controlled through two GPIOs (command and slow): each combination of values
> +  for the command/slow GPIOs corresponds to a LED mode.

Rest looks fine.

Rob
