Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F43148CF;
	Sat, 25 Apr 2026 09:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777109500; cv=none; b=m1ilaV0elAkNQvVUyS/X4laNHT3QeEE2sW2rznCNy2BiqJ9rtLjher9Z3vQz0ysu//j5HWZsMDXLSAb8OhKwEC+q+bwetvhl0QfKRvpfnpo2DRwBsvrktXbYuIzAhSTukQDXqhzEeDA7Nhw5U6dRGDwVTD+vBxXkkleSUSGXP7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777109500; c=relaxed/simple;
	bh=Qq7avJMvasBMNlPnF8cO4yWDfOgPmCMEF2uXJ3grCwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Io9elCvnuWAvuXLrDohy1Gi9ghQ4GiCXOU2bDRdzMZH3Rg7nw/K+BZUBLv7WFx4bBueE3wo6gpYlSK6l98ykKnpTtSVVQWEl5JXHB/DLYplFFwCcSmKvgxcb0cU+NteEvEI0gnPNlutQ5DfjofD9++gxrgpo5HD12A7a8KjmQ7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zbcvsu/O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zbcvsu/O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC407C2BCB0;
	Sat, 25 Apr 2026 09:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777109499;
	bh=Qq7avJMvasBMNlPnF8cO4yWDfOgPmCMEF2uXJ3grCwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zbcvsu/OwyipzSKOX2Ob0bkcF7US47TuNdCUSXTc44r/6zFoQPjEwtRBBwjkjxpu2
	 zllIZt7lqPtOrMF6ERWJqzUMb/S7SFIhv183y/vILhExXdSs0gL+GXBXFYSNYxANPX
	 0I9x449/w5/U+KrZp1bgLrWkPMsbd9sPsvHIMIKuX2KBtG+RyPAQ1Ow/xsMH/UEx/U
	 IZJZKO9lNELA2hSi5oYQujkavLdB+1E0UutjaJ79PECpeJ4pQv7AdtCuPWqGeLcsWn
	 Ibcx5xUETiPfzM56+tRlVx6eVoAPvcYs+beTMlAUiJ5cY0x7QIVNsQvlhcqkJOUCor
	 xeYj/tguD2Hnw==
Date: Sat, 25 Apr 2026 11:31:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Message-ID: <20260425-rugged-unyielding-peccary-81020b@quoll>
References: <20260424-synology_microp_initial-v10-0-e852d2f3eba1@posteo.de>
 <20260424-synology_microp_initial-v10-1-e852d2f3eba1@posteo.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-synology_microp_initial-v10-1-e852d2f3eba1@posteo.de>

On Fri, Apr 24, 2026 at 12:22:40PM +0000, Markus Probst wrote:
> Add the Synology Microp devicetree bindings. Those devices are
> microcontrollers found on Synology NAS devices. They are connected to a
> serial port on the host device.
> 
> Those devices are used to control certain LEDs, fan speeds, a beeper, to
> handle buttons, fan failures and to properly shutdown and reboot the
> device.
> 
> The device has a different feature set depending on the Synology NAS
> model, like having different number of fans, buttons and leds. Depending
> on the architecture of the model, they also need a different system
> shutdown behaviour.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../synology,ds918p-microp.yaml                    | 100 +++++++++++++++++++++
>  1 file changed, 100 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

