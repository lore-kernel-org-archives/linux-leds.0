Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715E43546C8;
	Wed, 12 Aug 2026 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535143; cv=none; b=iVV6RP1iuvsU+QKtCO7Q6IMbnLfHZj8i+E4UPNoEJUedhmzSragMCRtHA3oMWZU5CE26I6TsBfhD7ZShUcU1IvFUXCSEodFjbmrOIlsAYsvAUwQVCJeRPrH4zYDsPXBjKQZW1ubWcLDzpLd54+K/vtbmzVkzGjkeAYqTP81xdQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535143; c=relaxed/simple;
	bh=GZBL5/bgeBQFsjp9hz/VX7w6Aovjg41EqOkwrm068dQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pZXyA5wWgDMoVBeMM7Z6UvZOV61xoaCNuKYqToWo35zPHCeK7A3EbGsUlN5bX1xQx3+wAHHbvFU5Cqb88k5/wRwAhOYQGYWdPRvDEqm3/sw/4+0+dENMy/L/rmho2NSXVUcYAV3SlxrUnGhtWpJJULtjbtCSmD57qUS9xSR9rFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW4XXSH+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW4XXSH+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0231F000E9;
	Wed, 12 Aug 2026 11:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786535142;
	bh=0/qSu2DnkkjFscp7xsrTyHppxdS0+/8FKbOOaaY+BIc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QW4XXSH+YwKSMcr+k2KUmjC4abBhhWuR8+Bg1XZPTzJKrifA84J1j/oU2HKe5Za4W
	 kYkeWRwSWDZeapQjKlxJV1gB2MkpKXUOoQjqm/H2J27xRTwPCFhVrKjqbp4S4YWmpx
	 84NlaUSt5VWAf5gJME10TEv81MmtT51JJ5/tWJ4akH/IvKkhz41Vfe93pN2fqkuWy3
	 IIJ/BiCsfdOfT+VQ8SDab7ZQTNFZkzOnVgIs4DCIUiPvoxXhhzXsppa3Hi8uwo8umU
	 ybMo5WbVPpFB94dpLOomzYVldCMdH9RfOQv7zj30ZDanLPeF/0l1AfsPGMtTMM+oi0
	 234C1RMwZiPrA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: linux-leds@vger.kernel.org, hns@goldelico.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260806-led-modern-v4-1-eed715baab2e@kemnade.info>
References: <20260806-led-modern-v4-1-eed715baab2e@kemnade.info>
Subject: Re: (subset) [PATCH v4] leds: is31fl319x: Modernize registration
Message-Id: <178653514058.1374220.7564592974597001751.b4-ty@b4>
Date: Wed, 12 Aug 2026 12:45:40 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 06 Aug 2026 13:51:36 +0200, Andreas Kemnade wrote:
> Use _ext version to have properties parsed to avoid needing to parse
> them in the driver itself. More modern properties are recognized and
> the leds can be referenced via phandle.
> Due to the maximum current mechanics, leds are not registered right
> in the first iteration over the nodes.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: is31fl319x: Modernize registration
      commit: f8cca63a0a4f3475199d9ab7f86782bdfeb0744d

--
Lee Jones [李琼斯]

