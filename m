Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C7537649D;
	Mon, 17 Aug 2026 06:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786948930; cv=none; b=RKnC1bhIbwBUP8B1lmguclykO351t32xy/rBVdlJV7zOtgPRMAbJWdvan0eMlpSzeU0/DF2IicbOFUmL70o7Aiz13lSK+777ty+OiPbt5b/lSUhgnhYu53Yzs8DV752uKTWk8ejQxFwDM8ee31XodQhL5IUw3s3JA5nrMIyKdWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786948930; c=relaxed/simple;
	bh=lfM9pOhBetJPYYK4qYrHW9wRll5A1BHJeYt3jkfBYwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qExWKssTgkC926jGq3A3EMwzFX22XKJedIxsuJTlml4C78F3w+hYVmGPtZMEkHTndyttGcaWZO+oqGW0QHr4FDnLUFkb7u0Swma0r1y8OmQ6xw9aRAQhdKB4WdkVMB/qO62JYQ121vFffett1WCCwxebKAPL9RfFVYKo06U5JA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H3jfklVL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3jfklVL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0355C1F000E9;
	Mon, 17 Aug 2026 06:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786948928;
	bh=oywaUON15WdihKMJCP++sVdkvh89c+odYunDFRYVzhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H3jfklVLwyT6/xF3w7S1fNnK/K8UZDmaIyMRW0RQhLfMiz+frpcg0qz1AtkL/h2KH
	 6qu2ZopqnqHycrgKodisx3WxfXSq6Yx4EWjaDm8hJCpbjhXXC6g1cDesl0N95DMWxi
	 G+tinzQQpSOQM2ddT85MkJhmAzpyD1iUzP0n0dOEazg+Dyey6vcRIQumpQchOjiAQT
	 gVq+gEVar9Pa/Q6jHmIB9bMwxGJdE3p1p5lUFVNiVNKtfBDomhbBlISV2OjJ+5Mmo8
	 1GQ1QNbVm/UoKDqvshTwzoeOQn7x2j5Tcudgb0VSCyjH1DZ4tVImGfb55MwtLRk6lc
	 U0T7a5bsLzrJw==
Date: Mon, 17 Aug 2026 08:41:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Byagowi <ahmadexp@gmail.com>
Cc: netdev@vger.kernel.org, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Nam Tran <trannamatk@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 1/7] dt-bindings: leds: Add IS32FL3207
 controller
Message-ID: <20260817-invaluable-hog-of-current-b0d0bd@quoll>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d5df0bb5c312478279f0d2fd5ec6305e41add5ae.1786747084.git.ahmadexp@gmail.com>

On Fri, Aug 14, 2026 at 04:10:49PM -0700, Ahmad Byagowi wrote:
> The IS32FL3207 is an 18-channel constant-current LED controller with
> per-output PWM and current scaling.
> 
> Describe I2C addressing, power and shutdown controls, RISET, and
> individual or multicolor output groupings. Require board current limits
> for each output and document their relationship to the RISET-derived full
> scale.
> 
> Allow dash-suffixed multicolor group names when a group begins at channel
> 16 or 17, which cannot be represented by the common schema unit-address
> form.
> 
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>  .../bindings/leds/issi,is32fl3207.yaml        | 281 ++++++++++++++++++

I do not see any explanation why you dropped review.

We have enough of other patches to review, so if you ask us to do the
same work twice, it's only fair if we just skip your patches.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state in the patch changelog
or cover letter why and what changed.
</form letter>

Best regards,
Krzysztof

