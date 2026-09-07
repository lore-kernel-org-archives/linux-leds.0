Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D94418A23;
	Mon,  7 Sep 2026 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766868; cv=none; b=ZcgFqC6cHmTqH/bfBb2UaqSA4w6u03p79aFm8hNZhPABkP+WDPASzHCEBcgQVFMoLzOQyggLyzKwK4uNOz/Q2KMH2MkB3r3AOrTaVClvIiIFHhYJHxzff3kRZ+79J2sdIZOrFpePm0pUTrjwW//NhmqoYrEH6wzALNWzl3rZOdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766868; c=relaxed/simple;
	bh=vv6Ql03rya1MAjaT72TuzBntfpJfKIUTQe47zAfOIk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B32VZtpIk3Z89ddB+m/CdQzch6Y6T4mXKBRQ/9Q10MNKTJoATJnMXZOLPZ54Y++e1X/ECwmHiKnj8m32su9h6YsYt3XGX0KRb0d8Kw7HfQAWUg6hQRnmd2lE4HiWAi8lWb0b4VOvU8Grq/I3nmeC0fhYqMLea4vJtIDGu0j/bI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqkmxNBZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqkmxNBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA931F00A3A;
	Mon,  7 Sep 2026 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788766866;
	bh=vv6Ql03rya1MAjaT72TuzBntfpJfKIUTQe47zAfOIk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TqkmxNBZ9MmzD/Rn/FXVYVsknCA6p61cQyS8Lx1Ai6lNf0bQ+4niz91xDV8NUo4S/
	 1ePLXuYvrreijgpGFPe+PHQqtuX7iSwMyMnRi1RqVi/UXNdN2ueu8oK/9PIDgY9WGB
	 XxCqw0jJ8z9axEayHNyhwcAx7jmpF6Mt3IUffaMOdFN4qeMncX7L3mEkr0ozBwcooT
	 ngLlMO4fTAUcgo3wcvKCGnDZa32QcjO8vA5RJctpMwLYjjbnletgDLWKhqYCbCaxZC
	 gPY7I1xWYBTT5VyjuAc37ZKixmH0/oeZed6Kj8AXLtaALZa+mM3DTS17VN+ZkDpe2V
	 JiSZUL2C15D5w==
Date: Mon, 7 Sep 2026 09:41:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Isai Gaspar <isaiezequiel.gaspar@nxp.com>, linux@ew.tq-group.com, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: leds: pca995x: describe reset-gpios
 property
Message-ID: <20260907-aardvark-of-uplifting-camouflage-e8fabd@quoll>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>

On Wed, Sep 02, 2026 at 02:22:09PM +0200, Nora Schiffer wrote:
> The PCA995x has a reset pin. Allow describing it in the Device Tree.

Use specific model numbers, so it is easier to verify.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

