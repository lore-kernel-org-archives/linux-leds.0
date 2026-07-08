Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3013E7BCB;
	Wed,  8 Jul 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783493548; cv=none; b=e05ozmrQyOr2bWveCtRMS49HURHoBs7h6oeT4oaR/NJa2X5K1WxbS/8693rqNWZ8XV5Ym8DHEaE9FxnB+K8myNPCRedFooMxmmdr7THuGBXYg4hZAWPC9J8lZz3Hbed1eNLPEckw+gCt3krtC81/rAyJS9WbhqOjQOPIPi6su1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783493548; c=relaxed/simple;
	bh=3djQ3tHcVyYzfieWjRAjEiyq6obB7OXt9YpcPbqNfT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sjym0a/zljWYiwVnX1WUaVmhlj0h8BWlYaHmogZHxUEVB8qPvn5QjSLU0MY7ksI5m/lmOBDmmAEams3RLHoirYgwxFlQObILIZzFq+gT+A3phOC4yqzh7P8sAck8WM60jJrMNIYHZfhI2vGoXWEfZYCik4KdhhR0vC94723SgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hY8HVSvH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hY8HVSvH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A20811F000E9;
	Wed,  8 Jul 2026 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783493534;
	bh=3mw2lzxSV792arv0MrgHyA7IiA/oQXRXMEHzQXGYThk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hY8HVSvHcaceE8FIKY+0wtHjKKT7Ct9mD64D1cee/1GQ3LSMMJLaIjTmX00f0fz+4
	 2XoZ/MMngoXER0qa+84aD7DX+6futRQLof8DrQtPA/F6QROyAKGeAcqsyUhg43RfW0
	 dVOUxXnL82zT1Btha/gTLl6FuvCqqZ5XshyOLYEqlIyQhwrvYcEhyuY/w57ZlV/4p+
	 GDW9G8SFvT/R7mYwn0dNUIJa4ws/WWQqahfRnbJAb1n38TB6dCCvUiHVutlbA8/29D
	 djiptmDm5x2q5+4Yiw45zVpJw78Bf4BKnyAPogK1HYoWug1wce5poDfGhbRvkmQo8N
	 9jgVD1ZzyGHfg==
Date: Wed, 8 Jul 2026 08:52:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, noltari@gmail.com, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH v3] dt-bindings: leds: bcm6358: Convert to DT schema
Message-ID: <20260708-diligent-optimistic-locust-ef1e4c@quoll>
References: <20260707184437.500278-1-ninadnaik07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707184437.500278-1-ninadnaik07@gmail.com>

On Wed, Jul 08, 2026 at 12:14:28AM +0530, Ninad Naik wrote:
> Convert the brcm,bcm6358 to DT schema.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
> Changes in v3:
> - Revert to unevaluatedProperties: false and drop explicitly listed
> standard LED properties.
> - Simplify regex by removing redundant 0| condition.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

