Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDB343553D;
	Thu,  3 Sep 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424499; cv=none; b=axmIvNP0cnnDCC89LS8uIAcWAVnIGPcQ4CRoDl5KX8pw29oIeoFkJ3YcFVpXK69xxKlSRVqChA8ALc9x8xvf+S4J1vntaDINCKJLjdyBZgX0zK47WiQH2bBjVol1Vevk760JiQ4mOcbYZYR/uGGMkSoSBZl7dar13OCT2G3m/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424499; c=relaxed/simple;
	bh=IS0qM7SRLYGmpAXx9rsOdk39Qp7s4xjKONJApQFx/iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpziRaeyTa55g6x97dJhXiH4Qe3ynP+KgzJdWCOhelWn3cCVnxCZFk54ehcdsKSkuoS3P0UlRAFHO6FjFWJfk8TuShzdZR9XVMVydUMEYrQbafckk/EMRCl1xEg9yBo6E4fQHmEGwcTtTaff2rrBdjTnKmQVVq43uCG23w2gFKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NCZvOKZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NCZvOKZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74EB1F000E9;
	Thu,  3 Sep 2026 08:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788424498;
	bh=FduSwPEq84FSvyKlNcI/Nau7FfT3CQG/m1qnHpNK+BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NCZvOKZtfhWhYkGXSKE/kD78wSsAb+CH9ybxDnoCDmb5RD7FUE+3LSGtVAXeXU1rG
	 iyZRdwqXck2C6s5G+jWGOo5iaH7eUQmS65Y4K/uR9ktBHTNXZmJ3PAhlrZU46imwW3
	 O+zPSQNN58hsiTLQfKRv+MvtMhU/L6QgzLpMcV80b8ohznVozfGjvUU2PH7dWQyNad
	 Wi6A4st4YQCJHGzHi7FFm1F+T8jeuwWy7o1tJYnWDj/npe/QQZGDVkOeKRjZ3wiy7i
	 /xKKzJYranloZj269oilLcjl1iwtSMG9a+hoA5rwuhBOCWMalKvO1ydtwLgHbItySD
	 VFbVdJuGWiW3w==
Date: Thu, 3 Sep 2026 09:34:53 +0100
From: Lee Jones <lee@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: leds: pca995x: describe output-gain
 property
Message-ID: <20260903083453.GD2133376@google.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <7f61e7e8781292450f920c49ef8853b802d76ecc.1788350618.git.nora.schiffer@ew.tq-group.com>
 <20260902123105.11B171F000E9@smtp.kernel.org>
 <630889485b7be21875c858c705e1c9d828973c67.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <630889485b7be21875c858c705e1c9d828973c67.camel@ew.tq-group.com>

DT folks,

> On Wed, 2026-09-02 at 12:31 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [Low] The custom, device-specific property `output-gain` lacks a mandatory vendor prefix.
> 
> Probably makes sense to add the vendor prefix, will do in v2.
> 
> > - [Low] The `output-gain` property incorrectly exposes a raw hardware register value directly to the Device Tree instead of describing physical units.
> 
> According to the datasheet, the LED current is calculated as follows:
> 
>     Iled = output_gain * 900mV / Rext / 4
> 
> If we want to fully describe the output gain using physical units, something
> like output-current-microamps and external-resistor-ohms would work. There
> wouldn't be a meaningful default for these properties to describe in the binding
> docs however, which is possible for "output-gain" (as the driver just sets that
> to 127.)

This is a question for the Device Tree side.

-- 
Lee Jones
