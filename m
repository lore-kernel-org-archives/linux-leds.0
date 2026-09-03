Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82F4AA566;
	Thu,  3 Sep 2026 13:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440981; cv=none; b=KWe5ha57aSbZIy8FI+Foo6RW7Qkg5HS5OAV4YoMGFF+SfWwGc8d/eJvBoA8iCvZTrTHJrAS6pi4rzSrW0+uMoTL+djjtw+bgeoYamJdVEzRFT8ptPP5vCorDPJ6WGGraFZ4KU/qlkr0uPvOqaETqyNRliSF8rc8XgeU9H8BrO2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440981; c=relaxed/simple;
	bh=kAzcWLIzftjj+SeWxJIzZXzVOsm/ZJynNgb7w/QL3us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQCWUL/+hiEmVmWGH6SOkh8rI2aDPpc7UVJEhwvlH/P5Dty1+7s728jcwTzdlcfEWMKUBMxuIupD0ko+2xCUWPwrXdk+OPmOkJdn6Ew1NqyneBC1IgwUtKuYB21KcJLjN3d9xGFH4mHY77EiGQ1G9ZHBaKq1I3at3AgxD+3RDbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHShkFti; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHShkFti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469351F00A3A;
	Thu,  3 Sep 2026 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788440966;
	bh=l2JKlIYo5o71cBsDXRR7VNRfkfhQ9nOLIyCR1viShQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PHShkFtizo/0fdwAdKMS96eU+6CGM8sQLMMKPgCT5CMP4mHx5NDUGY2WCOEKZKuZM
	 LDB3MTVEgX/3IWmi2FIUwltMrGlSDJmTLGVUgcpvwBbYQA6IimrUgfonLYX2sqwexx
	 O7fBPf6Lgw+ZOFr5bCw3zS7Wqg0qRJpD6v+jZr0Z1okOHodh+6nJ+D8WGve3qiYRdK
	 c8n2XWeDN4xaiWz/k64UC+Z0gcZrTILwHDiuEBNB/DXelCILrI50HRW25D0h2aSguO
	 7//l6TirdI6ddOdcluxQhRsqW2a51/43ZxoYOzYwsFbiHRASWc2s5MGdHSTvqepaKz
	 OTVoVTYVkvjuA==
Date: Thu, 3 Sep 2026 15:09:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: sashiko-reviews@lists.linux.dev, linux-leds@vger.kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: leds: pca995x: describe output-gain
 property
Message-ID: <20260903-sophisticated-magic-fennec-7c8aeb@quoll>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <630889485b7be21875c858c705e1c9d828973c67.camel@ew.tq-group.com>

On Wed, Sep 02, 2026 at 03:10:09PM +0200, Nora Schiffer wrote:
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

Output current is already there, no? led-max-microamp? So basically you
would be re-describing it... although I understand that for your case
you need two properties (also the resistor) to calculate the value to program.

Best regards,
Krzysztof

