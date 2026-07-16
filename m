Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B140A921;
	Thu, 16 Jul 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198123; cv=none; b=shG3dOSTPaJMQwz1aLma650oVLxPxADqjGsLwhvygEs2m7L51wuONWxgQ5Q0PBaXj1PXUQOF7CKE+X+kj40iGJ2hKN2O2xGMK+MXrzdIGiuW8j1BKvtDJiwh5IvtAvaXolZhhAYiGySBz6YCAMRXyPxkSvB6CeQaKPoW2OycdkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198123; c=relaxed/simple;
	bh=hUroAI7GheNlg8RWiCs/o6Z4/UdR+8GSiqoSQs1gvcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6n6c/re1MgBzbZl2+QdDDjqPjbF7xJ7CuRQ8reha7Uo9MpeCCbR+vje25g66jhkQfuJ2/tKamLSYFiHCUrFQyFp4XeK86mceNT/ZghIi4JQb5m8jDXjEJFNNiO/4U5oc8imqEgok2UbEBRyn3ugucSH45Vnnf4qsrAnElPyrnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BkpHrTRT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BkpHrTRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257321F000E9;
	Thu, 16 Jul 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784198122;
	bh=XZ9neGSTZv0tRZ93sQ9W4RHlZGFSNmTmyLUpPYeswWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BkpHrTRTQT75v0uMFSewydd/owJ6qBCoAG5UY1ioioKVsH5yQth9Bxoh4lAkzkHRc
	 NJA14urfKi711qp5hkcEZt4Ng+7oeOXrLAonuzhVVqAmWJK5dzAq1jae5v0+pK/Opp
	 xahRoQrykXPo7nAMmlwsNq/g9LJW+TplC3EkGQd+P7ZijU25AZCIsYIB4ufX1a0Da9
	 xor42r0e/e/X/SAuW4HNVBoa7qLXRI09/+nEnlxrx6+2KNyVcDY5xyFLfHMLeq1GYS
	 MDM76mBUU8A6gxO193nizg30o+pNhbDC84KUGp3jBXxnHJLC7IV6OHsc882KzNt586
	 D+gbeD4t6lThw==
Date: Thu, 16 Jul 2026 11:35:17 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	Pavel Machek <pavel@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Message-ID: <20260716103517.GA1260374@google.com>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
 <5188715.0VBMTVartN@phil>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5188715.0VBMTVartN@phil>

On Wed, 15 Jul 2026, Heiko Stuebner wrote:

> Hi Samuel,
> 
> Am Samstag, 11. Juli 2026, 21:28:25 Mitteleuropäische Sommerzeit schrieb Samuel Holland:
> > The "gpio" trigger is used to control LEDs by the level of a GPIO input
> > referenced by the trigger-sources property. This is already documented
> > in the trigger-sources property description and is used in at least one
> > devicetree (am335x-regor.dtsi). Document it so validation of those and
> > future DTs will pass.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> having Lee only in Cc in a longer patch series might make it difficult
> to notice this change.

It's okay.  I don't pay any attention to To:, Cc:, or Bcc.

> I guess this patch needs to be applied or at least "Acked-by" by them.

Applied.

-- 
Lee Jones
