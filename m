Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B04D9F83;
	Fri, 16 Oct 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164222; cv=none; b=rqdQYaa48e8UJc0cB9t4yZfUdHsqfCh255IVfXta3McjPAa+czS5z/a5HNfL62fx+42gRtD/3WkXLUcP/OiMQq6LwEzVf2NbKrj2uKLPqsUCthrOHbqgR3Ge+ckk/yCaAufcFS/65utA8lQyQ4TJzwVbp+d/HQztzQvexjDYcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164222; c=relaxed/simple;
	bh=LzyfTfIddXTn2NFuv/gPTyuWRXFNmc0OZFCdBmjP2dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwxQSraJ7g/YK16maxXfHmQbaodINEdHATg0F5WAihDjob8RqAQMTjrv/a9K1gTNCKjxVH1+SlM1Et1NWzqiy6hk8SGTEGK7pxHx3YT4DhmxuulrycDrvdNM5orkZ2E1zaKwOq+hUFdewvfMDwisYNi2eQyMuKHNu9xh2Y4gpl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZtKhpDC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZtKhpDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC3B1F000C4;
	Fri, 16 Oct 2026 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164218;
	bh=LzyfTfIddXTn2NFuv/gPTyuWRXFNmc0OZFCdBmjP2dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gZtKhpDCZ2Fi9hIsiQX27oP5QUKUT4JkTvVlj4N2NmBLVs0mBENKZoGwTlsnVKgFn
	 8RU5cEsv19+b4MS/PwxvyvbmxdX8yGY6meGJFWevYu1XB04vQV2qlKjDAlxFJ84kcO
	 V3IFGDy6oOmcnRMg3YllGVSG8w/TOxTtSLl004dtvqwfiyrgZR8VeYyBq8SZOsKgkG
	 b567GHYYHOjJNoYW2ghhgGne/YrN7CmkSGqhG5uJndXR0qtg8LUHErdMg88gWnjvt0
	 mJjxm8rTtUxnYg8UF6haJA5Wr+cgIbSxcvZp7DFy3uns/gc91uPrdX56YRAEYFjbct
	 0O5XoJ+1kBYig==
Date: Fri, 16 Oct 2026 16:23:31 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mfd: Document Skyworks AAT2870
Message-ID: <atJBc2Bx_UkQl5Oh@aspen.lan>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013180933.487013-2-clamor95@gmail.com>

On Tue, Oct 13, 2026 at 09:09:30PM +0300, Svyatoslav Ryhel wrote:
> Document Skyworks AAT2870 LED Backlight Driver and Multiple LDO Lighting
> Management Unit.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>


For backlight:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.
