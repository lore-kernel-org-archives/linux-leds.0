Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4647CC67;
	Wed, 23 Sep 2026 09:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157395; cv=none; b=SV4ZrtQTrL687oi1f5N38GPyoGsobJ0yiizXdtcgiF5UfJL3z/QocWlNLVQ6WQyXKCxGf2jHbpPW3eilVbTMDieohnYVESSQrPMbWVSKEKo7CplbrYT0odB26rL7JN0FrjA2dNOtQ0/HhWVZyS9geO1b/3494/4kN5b1ms3BgHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157395; c=relaxed/simple;
	bh=aVTlPx01tByufdSVRLp/Y9yPmfJJHuY8tXDiXV8al4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NtuUZMVKCmeQvhKwfsHxjhIWkFiJKbqjeHjt7cITYc6p2PgzZmpe2/8UyIj58429eO2zYxuw+9Z1VWxBUlqvEnsRzHzXSJfmWYpWSGQrcveKN3DXIGV+X8NZvPRSln56pb7XasQk+TeACQtfMKjGTl6FG+H3+Hjjq6g3XRB19Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIldd2pW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIldd2pW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA99A1F000FF;
	Wed, 23 Sep 2026 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790157393;
	bh=NZvlywcG1SoThIBEOBIqZgVKM9RI4yotHz7IpL6E7V0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BIldd2pWXdsX6Qt3GByrD25amS3sfVlSNWvs+Dn3GDEhhMGUbqoPsyRs9q7tmv0nl
	 8bQW4yFQ1BO6qj1CCCTHrPqBQYLUiijf19xNGI+JFtg16K69gi7P6MyXYKDlUL/dGD
	 llpZ5+PLzhK7Yg6j1jStkgRqq8WybDpb9sJirkORalnFs+GrOSWzuZnwpOxSetvQ6i
	 MXr63zXFUoGUSCZca6cLktJmgpcsgjsn/rmNF26bgBtBpsXpTee9/kuvkNr1ZbcJ3a
	 wtr72W93BWMHKueovbHI4HM4gwbErr9KEGeOZ9DMHxFtRiZvwkBSOH2utUdCGBoHld
	 UbEPFuSAzUyzQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20260917211357.i.412-kees@kernel.org>
References: <20260917211357.i.412-kees@kernel.org>
Subject: Re: (subset) [PATCH] leds: aat1290: Allocate mm_current_scale with
 ARRAY_SIZE()
Message-Id: <179015739164.3927348.13361753576512859316.b4-ty@b4>
Date: Wed, 23 Sep 2026 10:56:31 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 17 Sep 2026 14:13:58 -0700, Kees Cook wrote:
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> This allocates one int per entry of max_mm_current_percent, but the size
> was taken from the whole array, which would make the allocation type a
> pointer to the array rather than the "int *" being assigned. Allocate
> ARRAY_SIZE-many entries instead. The resulting allocation size is the
> same: AAT1290_MM_CURRENT_SCALE_SIZE and
> ARRAY_SIZE(max_mm_current_percent) are both 15.
> 
> [...]

Applied, thanks!

[1/1] leds: aat1290: Allocate mm_current_scale with ARRAY_SIZE()
      commit: 4893d51ed4d7f3c0254543c0b5f2b307c8728eff

--
Lee Jones [李琼斯]

