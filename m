Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC934CFC3;
	Wed, 22 Jul 2026 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727451; cv=none; b=N5OgTUtoq9r+UlA0VJBBfifjXytpij7DPLHfyJ66qjqb/htxCst53mT+VGp4MN7FwtFtrtK0UqpYDT4+XVqr5wvs4wAnLQhNuWARtF4IOy5XXMdjy/kHBeNx785fTQXOqVhJUeMUCBzeR+KVSlV81ImDm9jCQS042xdXmhZ93wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727451; c=relaxed/simple;
	bh=r3VC1GSygiRSXu0beX5TP6n8xrX+7egHQdEPWcNoAwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DW/As0YG/B0PK874swqzY6vHmOEb0WA+F3nzDg3tBGA6LJobrBO8PmVQjfw/B0iiRBUbhI6glNx7M5QlK58Z/9VeUnBUKiauxVXije1bV12OcPF9LVjypvjTZ6oK5+LG7KRPHIc5Gk4EBLr0wgBq/5JGFSCKf7etDCkSzz32cnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjWvqyuM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjWvqyuM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9391F000E9;
	Wed, 22 Jul 2026 13:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784727450;
	bh=V6hTSTk75S8dOLUKHL7MYuvzuR3G2u+R/z+/rMPW3PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZjWvqyuMFE5v0Jc4S8c2rvwHNMoYZw7UBdD7bT9Twrtq1dbUtFWjodYqIaj2+q8Wu
	 PN2s4p60AAdznLpyDRGpXZNjCv7/fcxeVyGS0/AJDjYu4D/dn0PZXOcGbUu1DFdd9s
	 jUe/X7sVjqBJqdbk8iE4U4PbUa3pP+ikTOiVbCCEl97TUeeEgiYsBO62fBuARmIt4X
	 A6kS7gTAjzqO5GSDPYWZbBnw7dCOJOsB2IeYgyLEgWFzOButrHHBdcqDXLLDL3jERQ
	 NkX/WS65xCrPQlFkrCNvSfMWxJVp4dWardVFFcX4+GEqyatBl3JivPAYBxgGyHOIX1
	 KujJpw/aABwsw==
Date: Wed, 22 Jul 2026 08:37:29 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ninad Naik <ninadnaik07@gmail.com>, conor+dt@kernel.org,
	linux-leds@vger.kernel.org, lee@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT
 schema
Message-ID: <20260722133729.GA389001-robh@kernel.org>
References: <20260721192754.46344-1-ninadnaik07@gmail.com>
 <20260721193849.D2B0F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721193849.D2B0F1F00A3D@smtp.kernel.org>

On Tue, Jul 21, 2026 at 07:38:49PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] Using `additionalProperties` at the root level to define child nodes incorrectly restricts standard properties on the parent node, breaking device tree validation.
> - [Low] The schema omits the `num-modes` property, causing `dtbs_check` failures for existing in-tree device trees.
> --
> 
> --- Patch [1]: [PATCH v2] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema ---
> commit d6e2084ac319cdcc30d00614f66ec071bc9c5c1a
> Author: Ninad Naik <ninadnaik07@gmail.com>
> 
> dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
> 
> Convert the lacie,ns2-leds binding text document to a DT schema.
> 
> > diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> > new file mode 100644
> > index 0000000000000..1976669d2218c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> 
> [ ... ]
> 
> > +properties:
> > +  compatible:
> > +    const: lacie,ns2-leds
> > +
> > +additionalProperties:
> > +  type: object
> > +  $ref: common.yaml#
> > +  unevaluatedProperties: false
> 
> [Severity: Low]
> Does setting additionalProperties to type: object at the root level break
> standard parent device tree properties like status = "okay" or pinctrl-names?
> 
> By enforcing that any unlisted top-level property must be an object, standard
> properties (which are strings or arrays) will fail validation with type
> mismatch errors during make dtbs_check.
> 
> Is it better to use patternProperties: "^led(-[0-9a-f]+)?$": for the child
> nodes and set additionalProperties: false at the root instead?

No.

> 
> > +
> > +  description: Each child node represents a single LED
> > +
> > +  properties:
> > +    cmd-gpio:
> > +      maxItems: 1
> > +      description: GPIO connected to the command LED output
> 
> [Severity: Low]
> Will this schema omission cause dtbs_check failures for existing in-tree
> device trees?
> 
> The new schema strictly allows only documented properties via
> unevaluatedProperties: false on the child nodes. However, existing in-tree
> device trees contain an undocumented num-modes property:
> 
> arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts:white-sata2 {
>         ...
>         slow-gpio = <&pca9554 2 GPIO_ACTIVE_HIGH>;
>         num-modes = <4>;
>         modes-map = <NS_V2_LED_SATA 0 0
>         ...
> }
> 
> Since num-modes is omitted from this new schema, validation will fail when
> checking those boards. Should num-modes be added to the schema (perhaps with
> deprecated: true), or removed from the DTS files as part of this patch series?

This should be fixed.

Rob
