Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CD42E1EFC;
	Wed, 12 Aug 2026 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532375; cv=none; b=EsaR+LBlwzTRWWcX63yPf3fal36FuMcpyWBlMqD+difxvcGRQr4a0dU0nas00YvR3Z1wFAzW+LN3fJu/U6HqPGoRLEfROtPxtw8ebZ2tylbn6r2Uk+36XZExBOFwHAumPrQe3+ffPqjTjn/o/gb6rfN5CRojK/o+kA1NHQ1nEhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532375; c=relaxed/simple;
	bh=0I5NcifvyQ1oB4jlZEhqxspv+AIuCpoAxxtWoftZbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVfCYSFcVFxcM4/LxwW3E2gg+lHO1hqVXdX3Yj4zwNWnKLCyGwUW8+gnwN73DTM0Hm+FOfggu6kmTi/pTV8xLL5JdS9xNAXl5VluOhBQDKeVwq+Apk3C7hq3W+88PgRQ77kVAQURkWQ0SYL/a4Vm3qoSv2U0QUIo/j+XiXMrqBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKoiwmi0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKoiwmi0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70691F000E9;
	Wed, 12 Aug 2026 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786532374;
	bh=hn1kprPcAzP8EIoW0GPrd+Vk4wEbkTG+Kuje9Tcs1MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mKoiwmi0rUFIA6erdPXVN1jX6nrjoQU38/rd8DvZe6W/YJG4I7Zf+tgXcFLyoAolx
	 dlKqgDHADGcN8lWdduTfGHaSZEbVPfsdZO+FDgT0U32IQHmigx3qL/RFVr1YfHpAqO
	 jy4s1FRWa+CR96VrWyBXK3X2HQ+u/5qCQMsxgl/U6bYYI8L908esvdCYzmpJdoUPsG
	 4m8LSsVuxbDQooXPZ33ZWihNOn4fsLhqo/j8UGghrXDk0zE/1i60QfL7Y4hs0uklTa
	 F/xtkIJEMpWP/x+jM2lBldJTjLCgkCgYJ4pW3I0QdulEi1/A48nsF4CdcIAja3dElP
	 p5kMAnwJpU1Kw==
Date: Wed, 12 Aug 2026 12:59:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Byagowi <ahmadexp@gmail.com>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nam Tran <trannamatk@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Andi Shyti <andi.shyti@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/5] dt-bindings: leds: Add IS32FL3207
 controller
Message-ID: <20260812-cute-inscrutable-mamba-6e9cfc@quoll>
References: <cover.1786423898.git.ahmadexp@gmail.com>
 <8088c3333f464545297a642816316a090dcd3099.1786423898.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8088c3333f464545297a642816316a090dcd3099.1786423898.git.ahmadexp@gmail.com>

On Mon, Aug 10, 2026 at 10:02:40PM -0700, Ahmad Byagowi wrote:
> The IS32FL3207 is an 18-channel constant-current LED controller
> with per-output PWM and current scaling.
> 
> Describe I2C addressing, power and shutdown controls, RISET, and
> individual or multicolor output groupings. Require board current limits
> for each output.
> 
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>  .../bindings/leds/issi,is32fl3207.yaml        | 251 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 257 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

