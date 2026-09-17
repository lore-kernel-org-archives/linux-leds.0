Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A472D25B0A3;
	Thu, 17 Sep 2026 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640226; cv=none; b=GTC0Q8O6GGyt63NmH1Y7HAvZXSFTsKbxZ/vzX2Xaz337Yzpjr1U8wscagE/P1lSsEM/ykyxtZ15fu0TveCnrOE3WLD5Ut+he74gPaoGPNKmSTgNGAXFll8HUUNmAEQBYHPFwrr24CkNxQ/PQhH/eg08+yMsumqMHawzZcloUag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640226; c=relaxed/simple;
	bh=t3JnnHLgny51wFml2Oi9xqMLbvaBwfjSdK/rVL/7+BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LD1pjenihDiDJkvr2V0IWbaFEB9VMqxxf2MFGWcG9q+R+rtze5yn3jwqzo+G6a55fPKGNUsy+rV3Pu/no2cqXf0Gzs2F2+hAI4+mJCguJ9kAlDavF15Egf3YH3NBrEEMLrwSfcUbQ48Tu5YRK7bQGdYo7YjxcTiKqNuWHmGRwRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jrr4Yiha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jrr4Yiha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 822751F00898;
	Thu, 17 Sep 2026 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789640216;
	bh=k8H0Lw5lqzbid1qmcwMidGQgQDk62MPihMmbOqYsvMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jrr4YihabCGvlcHWfdLNuflx/B+cfn6IKSsxOqJX69Cmy69CJAvN7xUeYXuRO33B0
	 hMwwT7hBxmKSu/5hBOWS7iXX4q7jhXgNTDOnr69WP1Dr03qHX2MkL+e0f/Es1++FPY
	 C/wkfwPmN1D489kfFYl/AQGgba7eAFtTSs92UEdN076SjzPTDv9ayDQSstj8diOSa+
	 yrbgKGRuqPW2IxtelhEyF19wuAuXA5NUcYuLjJn9wqc0W5Bar9CIxdXTbVjr6LI7S/
	 W6y7cdtcNCiOJIP9fETiejmOkWICpXLYIoLrkE/3Ewwz+W0GHb0bpujFHiZQztOpjH
	 L/RdR0QmeHzzg==
Date: Thu, 17 Sep 2026 12:16:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>, linux@ew.tq-group.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: leds: pca995x: Describe
 nxp,output-gain property
Message-ID: <20260917-striped-gharial-of-priority-c4ec4f@quoll>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
 <0eb2e22d54062bf4d6e50e18a27063529510b9ce.1789477502.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0eb2e22d54062bf4d6e50e18a27063529510b9ce.1789477502.git.nora.schiffer@ew.tq-group.com>

On Tue, Sep 15, 2026 at 03:43:50PM +0200, Nora Schiffer wrote:
> Allow configuring the output current to adjust for different hardware
> designs.
> 
> The output gain relates the output current with an external resistor
> connected to the LED driver. It does not directly correspond to a
> meaningful physical unit of measurement, so we refer to the datasheet
> for information on its calculation.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

