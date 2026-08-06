Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7090138F934;
	Thu,  6 Aug 2026 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024413; cv=none; b=tkdlyANmnh5SHvZp2fOSlOAJyI5Yj28hhdc+jvIRSnMRU5vtH5/fDTWnXlmOzrXy/ZXsjYl3W2PhcMbP8JVpqsfNtyDUeSCP6I5OQwnWzeVcl7UVIu9HBH9EvGfDWH/uZ3zT4t8Yz3+9jPY2oxNR3M01V/u/DIbEXTZ4LWgAO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024413; c=relaxed/simple;
	bh=VcD1Y+S5aFQLK0xswWSpRJnXpIAJ4rKBxJ07N2W3AxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBDpuFRTw9j8CQWrYvfJhv6IJJR8xIXzkPOBcLd7yWbAPb4ybQiWWZAEtjRx26Y1/Y/XkGCoaTL9T7BW086Id4h2FvZZUfMxhUr/ajPsFVGdsN6VIw++GOP3S+6h6WMPa6mBZRB1crZtuIz68I3ykPBefXmbqBI2FfyjSSMm73s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5mB1b9T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5mB1b9T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111DC1F000E9;
	Thu,  6 Aug 2026 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024412;
	bh=QI2TOSLBkIUBkwtSr4K+9uTEgjvPoDph+fYa3Ykui98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L5mB1b9T8xrzhG7VBYHLkWNG5C1JYvTf1OVgqeCK8R53TNC+4WI+fq5xeXkqeNzKL
	 5QCHQe3RrTs7sPTUq2G1oBeDi6ytYuEgtNwPsYYNtXVZDffT+0S1edWym8kZr22lE+
	 pl0nIP3f3tKmXohZRTBwQhHpRh+PK+EF/3MYjrNWfjFczam6Wc6ly9WLyBPG9sedOd
	 755rBR7mj+bX8cjJJLqCx/qabWqmmoMZiRQHtIHSbsRC1NcjYtTqDTx4u/tOfVQexm
	 t2Beoippxvhkd8+yGXYH5aoO3zvry3WlieFyHs8qvsHNJFi4cKoub4JZEZELafNPrI
	 ltgs+zpnAxI8g==
Date: Thu, 6 Aug 2026 14:53:28 +0100
From: Lee Jones <lee@kernel.org>
To: Arunachalam <arun07172003@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] leds: cobalt-raq: Add missing MODULE_DESCRIPTION
Message-ID: <20260806135328.GI2869284@google.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
 <20260806135301.GH2869284@google.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806135301.GH2869284@google.com>

On Thu, 06 Aug 2026, Lee Jones wrote:

> On Sat, 25 Jul 2026, Arunachalam wrote:
> 
> > Add the missing MODULE_DESCRIPTION() macro, which is required by
> > modpost and was missing from this driver.
> > 
> > Signed-off-by: Arunachalam <arun07172003@gmail.com>
> 
> This set is un-reviewable.
> 
> Please submit both sets again separately.

Also, you should use your full name for submissions.

-- 
Lee Jones
