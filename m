Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36C3A9639;
	Mon, 10 Aug 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357931; cv=none; b=c1BA2MOK4WwqcWzUZl2cnaVxSWdO/4SjzfZagVWhC9RvyX0FS0Eo/GEek8Q5bNGF0bs1ssKvuuu9yK9K4WZplApLuqX0OcIV8fuX86Nso5AXrPET7bmvzlO6b88GJHgYlgLU8vXuuNWe6pgGaT+stpXDsIN8sk3ykamS+wVyd0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357931; c=relaxed/simple;
	bh=WrRJUK9pSo1FHli+5/hD0ukGvlWes/MfgeuFvY35wI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N48LN26gseXiOarDDHbJgNxmISblfFFEruWNgJE302IgQzx5M9cQ30CsBlXAjUcTR+TLMlix+ZHfv1DcNO88qVK3IeeDb5aDaYGGV3tj6PFbyXYjsujqX1FiEP9K2PXGvlRMeecq4Pgq3IX2Z5yJdZrUyjrSLRGnpf/pPJZs0QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwKMO36K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwKMO36K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F341F000E9;
	Mon, 10 Aug 2026 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357930;
	bh=WrRJUK9pSo1FHli+5/hD0ukGvlWes/MfgeuFvY35wI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KwKMO36KrAdAkcBdOtCdtshwrkLhIYglkYRcVbZ8DxeYlsxVIHCod4Go7PZJA0DBP
	 Qncj/GT5J1yiB4gmip7siP93DGwY2kVpYzZd0mkoyoxslETLkAd7Xa2ZtVJfbDSCyR
	 FCnJxERkDEBmFKi1HdyGzKIDJKumB0E5kGhMMc/4uA/3ovxnr4cYSh2dfdJMJ9FzuQ
	 QlO6D/LEHPPDXPQ9qUhVC879WJxs7ip9ATN0QlKGthTNsr3GESBB/bkfH8aqcSynbE
	 cQ+zVKInebcN/wbb9kaVsQ2TSl4v++V1TvuCcvYxsXAlIWx7bAjGdnEZMbSuJLXrX2
	 zcgQLZ7adrHvA==
Date: Mon, 10 Aug 2026 11:32:05 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>,
	Junjie Cao <junjie.cao@linux.dev>
Subject: Re: [PATCH v3 2/3] backlight: aw99706: Validate all DT property
 values consistently
Message-ID: <anmopWozGMDKXAyq@aspen.lan>
References: <20260804030255.1934470-1-junjie.cao@intel.com>
 <20260804030255.1934470-3-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804030255.1934470-3-junjie.cao@intel.com>

On Tue, Aug 04, 2026 at 11:02:54AM +0800, Junjie Cao wrote:
> From: Junjie Cao <junjie.cao@linux.dev>
>
> The lookup helpers for dim-mode and ramp-ctl take a shortcut when
> lookup_tbl is NULL: they accept any u32 value without range-checking
> and return success unconditionally. Out-of-range values get silently
> truncated by regmap_update_bits instead of triggering the dev_warn +
> default-fallback path that the other properties use.
>
> Add a field-width check for the NULL-table case so that values
> exceeding the register field maximum are rejected the same way a
> table-lookup miss is.
>
> The switching frequency table has a second hole: reserved slots use 0
> as their marker, so "awinic,sw-freq-hz = <0>" matches slot 0 and
> programs a reserved encoding. Make the reserved marker U32_MAX and
> skip such slots during lookup.
>
> While here, also switch the error returns to -EINVAL for consistency.
>
> Fixes: 147b38a5ad06 ("backlight: aw99706: Add support for Awinic AW99706 backlight")
> Signed-off-by: Junjie Cao <junjie.cao@linux.dev>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
