Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835CE38C2D1;
	Tue,  7 Apr 2026 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545090; cv=none; b=gWJZoYZH42iGohVqI6Hqm8tcGuStwrwUgKTIevo9pTpxXGzZ9BFjVtLADw4WYCgud8MYR/VIOreoOg5TrDQRhJo+Rn7ApeQ8+DGsziEDyPQnJZ4SiwTiIQBoLa4CyN5dg18VKPbZPPFPPZAuWbdY39nCw04tzQKouFvrfsl4rq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545090; c=relaxed/simple;
	bh=Q1EVqiFzLQWhtx3CgXKnHJgnO4sfqApqXVHbkrxtwQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKd9qCmIN90RWrkRR84Ovid4JNav0w49XjaVGvHds2/ddMkYK9W9t1Km4ugt6bTvES5NeHWWg6DPGof3uWCPBfYd030J7un40fvMnwDQV2ni1gV9FAOI1wDPtpzN/ASFhU/KRPlNVmqkzbb9L7+i2pbEpFMe8mnq6pXjU4v/q08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgOpbeWx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgOpbeWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C801C116C6;
	Tue,  7 Apr 2026 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775545090;
	bh=Q1EVqiFzLQWhtx3CgXKnHJgnO4sfqApqXVHbkrxtwQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgOpbeWxdAW5ztDLp8QxTv/ZMMwhz2q7Sqv1FmZqc9uGxWbZ4pnZOCC11hxtHiIeD
	 2O9IuscFQ736YUdf+UpjIkRC/aFo7CgjbEknmeW0xEDzGzAfrPeN6t3eOglUs/xQik
	 Zenaf6YL6rvVbkzoOH+5ATtbe7Pr/DYcsxvxMVkUqumVjo4WBDAZ2Qe7WEkaWX3RuS
	 J+xxPwE1qcWYrw+OX+ecBDTBTRCnf6XawOX4EgOdQZYmZ7AKQlZtUwEsAdA4Z+4zXI
	 vAc4rBMCmNQGPq2Jje7r16MHMNRLlN0CV9JMbzYWSWOAm8kqBIVHRY1kuOQOwTpLjP
	 932F8mQNV1G3A==
Date: Tue, 7 Apr 2026 08:58:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
Message-ID: <20260407-outstanding-sceptical-giraffe-3fd6bb@quoll>
References: <20260406-upstream-ltc3208-v3-0-7f0b1d20ee7a@analog.com>
 <20260406-upstream-ltc3208-v3-2-7f0b1d20ee7a@analog.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406-upstream-ltc3208-v3-2-7f0b1d20ee7a@analog.com>

On Mon, Apr 06, 2026 at 03:17:06PM +0800, Jan Carlo Roleda wrote:
> Add Documentation for LTC3208 Multidisplay LED Driver.
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---

Still incorrect order.

...

> +
> +      led-controller@1b {
> +        compatible = "adi,ltc3208";
> +        reg = <0x1b>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        adi,disable-camhl-pin;
> +        adi,cfg-enrgbs-pin;
> +        adi,disable-rgb-aux4-dropout;
> +
> +        led@0 {
> +          reg = <0>;

I still expect this to be complete, so at least function and color.

Best regards,
Krzysztof

