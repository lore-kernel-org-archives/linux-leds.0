Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA1F40DFC6;
	Tue, 21 Apr 2026 07:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776755262; cv=none; b=rNo9n6r7MTzHkYaBrOEiruZKv4Cvy+R5qoAogCZhGB8cSc7uygO6B8kO45Nypu3E5i/UIC7CA2s6mrENaiJ8izSu8xAMSrQTBTbKd4TVtpmj/XZReKi7WQm9ntckGbuuxJ1bcomtJufaNkzW39lUfOHuptZ3mmPdGacuXZSkk1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776755262; c=relaxed/simple;
	bh=m1ux5+g+loLvGVcL/xT/LLI9MeFo1pJsZ88/ku9jdtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT5QsNPqcV/RA3sWDZ8+m5Cqt1mfPsp+oeCdD3eyfN1MM30FjSM66VV856SVa7ScOySH3AF/8rnlWuk8K+RNoV3EyrRPj5ajEiA5RqxvSBNWR2iiQvXdtRuqu6NipqJYhQnG9MWDhfU/J+5N1eb5op1gxJs/bdXmAxxQarZGWZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll1GuxNM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll1GuxNM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57088C2BCB5;
	Tue, 21 Apr 2026 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776755261;
	bh=m1ux5+g+loLvGVcL/xT/LLI9MeFo1pJsZ88/ku9jdtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ll1GuxNMU9FnNu+sH5ZQ4RXzQKGNsSkJZz+3gScEZAFRF1xDQsLOidnCHgWs96q9x
	 rqNRv6U8I0Fef/qyskEKNbfIUg1dG+ZveiucDR6gL69W+OF+9i9VqJJxrSyC3r5WmL
	 uQYPv40J0wIIqejJkMv/dC9FpkZRdztfOq2kSJXPVv1bF3HsbGyG4ac+/HjbJSYz6H
	 xbT0kqC/Du4wosOjFG6pEVYl/+H5GgYpSXpoMCI6Rr6sVHaE7AVFjZ7c19sYg8+p7Q
	 LIP1ciP9Od7rMjFZLNQpY2jdpTEL0jEwVClF80CgaGyNedtlOomg3FyYFZgUW2wtaj
	 ZAhvGRpNmGBkw==
Date: Tue, 21 Apr 2026 09:07:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Message-ID: <20260421-just-benevolent-dormouse-2c35ed@quoll>
References: <20260420-synology_microp_initial-v8-0-7946a9124491@posteo.de>
 <20260420-synology_microp_initial-v8-1-7946a9124491@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260420-synology_microp_initial-v8-1-7946a9124491@posteo.de>

On Mon, Apr 20, 2026 at 02:24:20PM +0000, Markus Probst wrote:
> Add the Synology Microp devicetree bindings. Those devices are
> microcontrollers found on Synology NAS devices. They are connected to a
> serial port on the host device.
> 
> Those devices are used to control certain LEDs, fan speeds, a beeper, to
> handle buttons, fan failures and to properly shutdown and reboot the
> device.
> 
> The device has a different feature set depending on the Synology NAS
> model, like having different number of fans, buttons and leds. Depending
> on the architecture of the model, they also need a different system
> shutdown behaviour.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../synology,ds1825p-microp.yaml                   | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds1825p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds1825p-microp.yaml
> new file mode 100644
> index 000000000000..76c671a42fbf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds1825p-microp.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/embedded-controller/synology,ds1825p-microp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synology NAS on-board Microcontroller
> +
> +maintainers:
> +  - Markus Probst <markus.probst@posteo.de>
> +
> +description: |
> +  Synology Microp is a microcontroller found in Synology NAS devices.
> +  It is connected to a serial port on the host device.
> +
> +  It is necessary to properly shutdown and reboot the NAS device and
> +  provides additional functionality such as led control, fan speed control,
> +  a beeper and buttons on the NAS device.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: synology,ds223-microp
> +      - const: synology,ds411p-microp
> +      - const: synology,ds1010p-microp
> +      - const: synology,ds710p-microp
> +      - const: synology,ds723p-microp
> +      - const: synology,ds225p-microp
> +      - const: synology,rs422p-microp

That's one enum.

> +      - maxItems: 2
> +        minItems: 2

There is no such syntax foro compatibles. Please use any existing file
as example or look at example-schema.

> +        items:
> +          enum:

No, why the list is randomly ordered.

> +            - synology,ds923p-microp
> +            - synology,ds1522p-microp

And fallback, whichever is that, is not documented alone.

> +      - minItems: 4
> +        maxItems: 4

Best regards,
Krzysztof

