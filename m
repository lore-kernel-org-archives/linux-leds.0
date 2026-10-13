Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1C40DB4C;
	Tue, 13 Oct 2026 09:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884294; cv=none; b=bfypJf8SQLMDePLWMPtYjb+DRYtNgcsNwl+f2z4LOQAI0DZqjuDvVSpFRL8jyba6Ol1ceZff9xDKQOtsAxK3qu4+p7ytoGiwhnbE9dzXDvLUcdsssqjzvx97xxUJMDLAlNmNxbev5R2reTkZWgut6MYZDIFgikn8kTKXCYq8PVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884294; c=relaxed/simple;
	bh=pNLUX+EwoepwGy4HMtejobUFPjDxtUSiP83hyj/KWqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrSf3aMADswXApjiCdXm3JHUr5XaVSiICqIFA9JocKflXrTlso1gmEwJ8kOCq3HAkXoiaX9tShF+eyYW0p7MENOQ3eQSDGfH/mrZ/p2fmG75IhqOEnWYJ0yV1MRwaGRubBe0pDXBcqGfqfqCV462+/XLc0G0QfRtCx+JlCvGyrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpx2wPuq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpx2wPuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCCE1F000FF;
	Tue, 13 Oct 2026 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884293;
	bh=rlbjW3ggeHW0MZdayGQEpHc37s5W0df1XkT+FURjegI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dpx2wPuqmKyJRoUw/jFn/4Q6JVP9ewKbwquJBAbgvy3BX1PC6EPTz2pMkYVthUWmn
	 nPTgavYfMZDOa/DJtmIcIX2oJc7sNwJNItfYl+WKFqb1dnkE9uCm3bz9eJEISj7zRA
	 mOMnJtAND2LiaOi9+86SVnFh9kq18C8IwTTHiU4pCADW/Y2cEP3De7U+a5WJTVN2ta
	 tHFp59g5c2+1QBj4fhpgAys1qh+MTf+130StwVJ5yGfjsJ3Vmad8mb9qHHvF858fIL
	 fyA4XnKqR/SXM9wFs9+P05ZqVKenZK+QYfKNDKUvxx6UIHv4bvDFMwCzLoLg7MwPQ6
	 myirCrnebp24g==
Date: Tue, 13 Oct 2026 11:38:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Flavio Amieiro <flavio@amieiro.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Message-ID: <20261013-jolly-salamander-of-tact-7cf46e@quoll>
References: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
 <20261013-add-is31fl3206-support-v1-2-08c066cc241d@amieiro.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013-add-is31fl3206-support-v1-2-08c066cc241d@amieiro.net>

On Tue, Oct 13, 2026 at 12:33:15AM -0300, Flavio Amieiro wrote:
> This is a 12 channel variant of the is31fl32xx led driver series.
> 
> Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
> ---
>  Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 1 +
>  1 file changed, 1 insertion(+)

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

