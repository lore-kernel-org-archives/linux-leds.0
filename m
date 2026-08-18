Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D949A47F796;
	Tue, 18 Aug 2026 16:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072219; cv=none; b=j8xlbN4V2SgqRlyBdF/L7lu2T39UeeD2IHrYYmsHO/YI9Au3zsGk6RjOYNgGrelYQAHFJrT+psqx8oj9vK6ptzkD+1Degire8ceaQSchk8XfqXgUOPcXdRY/e92EIDkwW1gujPi0ctC5khvvRhz6A5leDLnZhah/UjCn1RLOC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072219; c=relaxed/simple;
	bh=cw4r0wE2C7sW7yx+Q1t3J061c5kC++2F2mJ112kwpMw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lG6Nr9MMHMQQgnmbQdAm1mq5qmiQAePN1J2jSEMY74yT6m11uVtoZx+AqDDPEQr6Umbw+L7tLbNfzFm2KB50OP6QLpJnm/AD+hgsDxxSuNZPsurz5OqwxyHI61MTYvWR+cGmWHEO2Hd0uR0U/I31hCADEtDBwToFN2NTuGOXJ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvfmqAQI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvfmqAQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802FC1F000E9;
	Tue, 18 Aug 2026 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072216;
	bh=cw4r0wE2C7sW7yx+Q1t3J061c5kC++2F2mJ112kwpMw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YvfmqAQIRq9jEicUetKwQVWlMTw6El3up2n394Pmhz7edb+dMKaNTqZGKNZ2+DAkU
	 Vd9zksgNzKCLqsrQkOPnvStOAHcG9ANdgO2G0qSshXY6uWXYS7Bo94sug9vzEl5v5g
	 AqjL9hAoWdFAn9Ob/iqeusqX9Nx4M+KheX4znygDQhrYqmFrRzJaxGFPoW3CI2bEQA
	 /VMFIFMOEO8tP1x9/R5UhtCk75Hw9NKFiP+OL6oAc7XMKCUFnrsBRfNHwUc8QOynlH
	 hcJjn3sSdoufkVp+iex4ea3XkNRhhklNtEhzLfgQXFnOFYxm9rvjjJLqrvZod3/sY6
	 6HGJfTY/+XZPA==
Date: Tue, 18 Aug 2026 09:56:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ahmad Byagowi <ahmadexp@gmail.com>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek
 <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, Nam Tran
 <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/7] ptp: ocp: Add R4006 and V9 I2C
 peripheral support
Message-ID: <20260818095654.5357db1d@kernel.org>
In-Reply-To: <cover.1786746757.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Aug 2026 16:10:48 -0700 Ahmad Byagowi wrote:
> Add the generic LED and I2C-mux support needed to describe peripherals
> behind the FPGA I2C controller, then use it to instantiate the R4006 and
> Time Card V9 board topologies from software nodes.

Ahmad, could you explain why? What are you going to do with these LEDs
as a end user?

The influx of the LLM generated patches has a hugely negative impact on
the community.
