Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439C13C3C0F;
	Thu, 16 Jul 2026 17:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223581; cv=none; b=ImSl0sPhwAMXoprdbIuxLruGS0RS7Lf+nOS31lL8Hq3X3ftfAdyWn8iVU4B/oucIC96II+8LdiAQj483GA7rmQ+a+ArdWXSOujHgUa3LjIgo6X2en2PPvKoLuFdeqBJZctkVd8yGGviFATmLvPLbPfgJvOCLsZmeL4WOO9erojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223581; c=relaxed/simple;
	bh=2ZQxHGI3ZTnozlapTPfdKcy3pnbyBmszrXFLoYK6gZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyfL31/HjVtIj8zRH5rNLh99+KgXTqPKfNcPPYDvuQloqUg5OOXwbdW1tlM/4e5pf/0+Hld0q9ucdElwTkJ5K2RYgjKQ6BPYcBdoGScWi0VvLP7lHl90G/MDE8LDxqdYLQz1sD4Iob/anByNxOVuPAzv2smsdd4UTgrg9v6MG8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miHnslRW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miHnslRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E921F000E9;
	Thu, 16 Jul 2026 17:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223580;
	bh=sOkF0YsuKhatqPg7tJVAjGsXGNTKUWD80Uui3C5Yd5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=miHnslRW7RSNpdZihkob+Dw2cCKrUhW8wSdg/ZhDBegMtyqb6aDuAYDxFTxRWMRfp
	 Lak8pBJ6GeaONU3mI95fLu3Tf6t7KXrRYwHVFjB6G9HC3t/TYRlbDSKIYENH/QPwmj
	 FLx8KnHJTrexvFm3ekOQnZzqn/3j4NOjG3mIxjfkJDBT4NuthxUkL/1zSHC+ehvvzS
	 x2cv/+v0rJqxvlm4SX6kbyMEJJpLJzaZXGjEzP6qBxEjz0G0o5SPqSoBZGUvEpnRPj
	 BaJAvmFVf7MxlPSAJBjLGJz8hsAz9pecXPwKG8fKQxBnPoxUeX7z4V6syTmY8NZWWc
	 U0rr3CMiXy6Kw==
Date: Thu, 16 Jul 2026 12:39:39 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ninad Naik <ninadnaik07@gmail.com>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
Message-ID: <20260716173939.GB534222-robh@kernel.org>
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
 <20260701180553.473121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701180553.473121F000E9@smtp.kernel.org>

On Wed, Jul 01, 2026 at 06:05:52PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The schema conversion incorrectly restricts LED child node names to `^led(-[0-9a-z]+)?$`, which breaks `dtbs_check` validation for all existing upstream device trees using this binding.
> --
> 
> commit 6c59295f22b17d02a2b26847db54458f820fa4f3
> Author: Ninad Naik <ninadnaik07@gmail.com>
> 
> dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
> 
> Convert lacie,ns2-leds to DT schema.
> 
> > diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> > new file mode 100644
> > index 0000000000000..679a618906d80
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
> > @@ -0,0 +1,87 @@
> [ ... ]
> > +properties:
> > +  compatible:
> > +    const: lacie,ns2-leds
> > +
> > +patternProperties:
> > +  "^led(-[0-9a-z]+)?$":
> 
> [Severity: Low]
> Will this restrictive regex cause existing device trees to fail dtbs_check?
> 
> The old text binding example used a child node named blue-sata, which does
> not match this pattern. Since additionalProperties is set to false below,
> nodes in existing device trees that don't start with led will be rejected
> during validation.
> 
> Should this regex be relaxed to allow existing node names, or should those
> device tree files be updated alongside this conversion?

While yes we prefer what you did, it's perhaps not worth changing these 
old .dts files to match the preference.

Rob
