Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A36538F624;
	Mon, 28 Sep 2026 06:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576343; cv=none; b=B0lEx5x0Oo5cGmhP1Of9t6Kijso0AtMwgRLBvgkn+FyVXmBcICwfTbSBa3Fyd9kq2cdK0m98cnb3FPLUo2X5mwCifXdxAti2V9DTS5ieWLV//gyV1kGxAdiOy7z7cyi/PqWmLwpXPtyRLEqfrngS2ICEABjv1Gq00CkWcMC76lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576343; c=relaxed/simple;
	bh=WBoPDWVDL/gBHGItDHKxbRlJJolO/NR6aH1US9Af/6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOa6HY836QAruWpEx1W55nEiNMYNr4iWvOlAO2DfYbq5EGH8ZN/nGNtTig8SHlDCZkKQxV/p6CQ8Du9ZewI2VKqRwPiyD4fJPnLriFExRHLKalSAA01ovzo02aUooWSs9145b4tRlY4Awn/+7A8jIqs0ZJGJg15Mlx7OwK2Su4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgdO79uk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgdO79uk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C591F00893;
	Mon, 28 Sep 2026 06:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790576342;
	bh=pmMCxK5aRATey9e6Ws3o06FK77/2EVv4XDkxI4d8T+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JgdO79ukEpfimSw3nMlru8E4PJVFRO2utaKrjfGF3TWotnydmbUAqdLGRoz7arBcs
	 SH9UY5od1xK7YdQzWUFKiWjXZ4IOWA3DwZR0APXfnEUAI8Rt/yg7BfwA6j8mE41IWy
	 yR7C3xBtJ1LH5YYaBaLUcJeh13++iRU3DQmmrgSawhHQjykIZbuIzTAfKXREH0QV+G
	 pu0+9OSdz75fH5ZqzM6YcbZH7Rqy/iqAlVk8vx+bsH6jc2V0plA8oznxvo0TOQC86H
	 DdVR7EUjAy+aXaN3idLFA04pqT/PqVu92XTKEdo1yrqZK+ggdNL0jp3g2PLq6saiPH
	 gLng5BSHFiosA==
Date: Mon, 28 Sep 2026 08:18:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: dongsheng liu <2509730023@qq.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Mack <daniel@zonque.org>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Convert leds-lt3593.txt to yaml format
Message-ID: <20260928-voracious-shiny-swallow-2dbee5@quoll>
References: <tencent_67B8796B733C275D1EF565D0D2CDB9B48306@qq.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_67B8796B733C275D1EF565D0D2CDB9B48306@qq.com>

On Tue, Sep 22, 2026 at 01:00:12PM +0800, dongsheng liu wrote:
> Convert binding doc leds-lt3593.txt to yaml format, so that nodes using
> the "lltc,lt3593" compatible are no longer reported by dtbs_check as:
> 
>   failed to match any schema with compatible: ['lltc,lt3593']
> 
> Additional change:
> - reference common.yaml for the LED sub-node properties.
> - require the sub-node, matching the driver's check for exactly one child.
> 
> The schema was written with the help of an LLM coding assistant, based on
> the previous binding text and drivers/leds/leds-lt3593.c. It is validated
> with make dt_binding_check, and against the "lltc,lt3593" node in
> arch/arm/boot/dts/intel/pxa/pxa300-raumfeld-controller.dts.

Drop paragraph from commit msg.

> 
> Assisted-by: LLM dtschema yamllint

And dtschema and yamllint here. These are not LLM tools.

Regardless, I discourage usage of LLM for conversion by beginners - you
learn not much and you repeat what we already did (these files were
converted with LLM by Rob). If this is part of any mentorship or GSoC
program, then it is actually forbidden in these to use LLM for
conversions.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

