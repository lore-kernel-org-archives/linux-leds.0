Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9625827FB25
	for <linux-leds@vger.kernel.org>; Thu,  9 Apr 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741256; cv=none; b=FNlSZyUE8bMR/GL7+aQ+uYrDldI3d9zYiZJ4SvuBDU4c59vk4hteyEEWQXmVxcfn1+FQmmneTMKVHgX7E6Ctgq8ldg/ug2umdLAgnHZIkG5KfvxGrAMCXa7kdWq2SHKFlJkyKlTjhARe37fhzFfJxso+x5X1ztXdZmcAP9D6WUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741256; c=relaxed/simple;
	bh=YgzNoq1K/H2JVGXwjL9Mni5u7r7PATdAbnc3z9vPRvY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HkjPco1Ksk62p4Z1jmMofmUN8ZiLWjhjrfuLREtHHXVvjazkyeKJVYt3KjRnI/P4GPQQAleLVUYZHyJiwpOLanldN/ZeczDpjlJ/wYpmPOBzcnBM+Ty45D1XiS2PLAqs7t+CVFSsiz5tKm7MS+fjUm+yBKQiPt6z2vmAFKaHaCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAjtmMvF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAjtmMvF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49B23C2BC87;
	Thu,  9 Apr 2026 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775741256;
	bh=YgzNoq1K/H2JVGXwjL9Mni5u7r7PATdAbnc3z9vPRvY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iAjtmMvFi9CtYQazRID/m8MFcgpJ6dih9WHr6xSE32tcTqQf7GG4jc3jA+Gsd2Bt1
	 YcmCfdh8sdlMV745854+65vTA3H6lQuFeniYbc+ILXJtGLqlTMAS+UyBtU8gV8vms0
	 bM04jlU0o7+4VfBP/0pRO4AmGVTlR9DxzZxNq3mcRbaLgHhjvy9IhVHpQxi91PLkcx
	 7bSoM92W0nFuERJ/x+d49FxYN1DHhuawQ/8q8/1Y0d7XDDlrsf92hUMUnOl7dUr+gi
	 rS0NfYesgmwWmm7LMQoTviCY2cqVbxQEbVVvpIRXAKC9JpNr0SJ0Y823mVRj0m7unq
	 k9prITtH2Fi/g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <20260327-leds-st1202-v1-1-15c107cc9fb9@kernel.org>
References: <20260327-leds-st1202-v1-1-15c107cc9fb9@kernel.org>
Subject: Re: (subset) [PATCH] leds: st1202: Drop unused include
Message-Id: <177574125501.3348011.13634063607430524583.b4-ty@b4>
Date: Thu, 09 Apr 2026 14:27:35 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 27 Mar 2026 13:58:41 +0100, Linus Walleij wrote:
> The driver includes the legacy GPIO header <linux/gpio.h> but does
> not use any symbols from it so drop the include.

Applied, thanks!

[1/1] leds: st1202: Drop unused include
      commit: 99797963208111f3c3a21adf738771dc8e015705

--
Lee Jones [李琼斯]

