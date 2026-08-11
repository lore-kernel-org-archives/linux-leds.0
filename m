Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FBA44BCAE;
	Tue, 11 Aug 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457008; cv=none; b=MGS2O+Gjt/R0T6GE+MB3poPzZl+taFFaA2KuRJ8YicEluD9q8zcF10yQTS7FJFeglcV3O+liZm+WkgqfhF9ctc2qljizVqGKhEfl6l2xUMk7WZ/s1Rr3DKg2iSbL0+nHYJPZTkfq0D5Mzq6Ye7WkWL0hCX8pZrdHLHjLPMuX+hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457008; c=relaxed/simple;
	bh=kRTdtn4Ai0nD+c49uHiqwPDxAdNfHrhs/Q+liCF89xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8O05mMqW+bRR+N5ivG5xBo1kAj9TcBjEB/yA53shvDX1ud8fRzfZptKt30U4Cvpp7BxV3D9EEUdGdXQ/iGs1Gxf/vpFma7W3NYHzkm8t/7iq2M+jGcg2VI4EZXeCG5VSp2zdd+5A64WcuIIbdS8G8BbhddXH5JgSu7O4QdGenI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESQHqoFO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESQHqoFO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F111F000E9;
	Tue, 11 Aug 2026 14:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786457006;
	bh=30bMBULCuIKt/CdCoc/d2OkweMwBRSaYGuhlCSiGzpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESQHqoFOi9XT7NwZhwxn9HrCqxt0MAkteU6JOiZ/ZKjelsIaKv2Qz8iYc56pj/b9t
	 Sp/vU19j0MjhuXaUS/+2AHtVicLOjyTr56t+TKbd0V4UKPq1KMzcrv6ExR3jJ3e6iG
	 hoMQ/3prXewIdal2p57/hSoIKwVlSBmaibILh+Gk5YIQ6JPjanrTKUmCUsmfddRBGM
	 IbHDxlfDTKO3QFF0NVx/+qaxypCyGpmWd2FFi+baS/z1UgVQeMG7L2aeNlFSdZwmUF
	 GGsf4dV2QYM3YZakoXYLBOIsF1IYEAYhd+CoGOg4ajuSeVwxpAQQQnxpJ5jltmn7/C
	 eaIBPj4G8QldA==
Date: Tue, 11 Aug 2026 09:03:23 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>,
	Jonas Rebmann <jre@pengutronix.de>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] dt-bindings: leds-group-multicolor: Enable
 default-intensity
Message-ID: <20260811140323.GA2080632-robh@kernel.org>
References: <20260802115727.50411-1-wahrenst@gmx.net>
 <20260802115727.50411-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802115727.50411-2-wahrenst@gmx.net>

On Sun, Aug 02, 2026 at 01:57:26PM +0200, Stefan Wahren wrote:
> Since commit 2ebd1cb772b0 ("dt-bindings: leds: Add default-intensity
> property") there is a property to specify the default color on
> multicolor LEDs.
> 
> This is also helpful for leds-group-multicolor, so enable it.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../devicetree/bindings/leds/leds-group-multicolor.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> index 5c9cfa39396b..1f308cdb71c8 100644
> --- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
> @@ -19,6 +19,8 @@ properties:
>  
>    leds: true
>  
> +  default-intensity: true
> +

Sashiko is correct. This is in the wrong place compared to other cases. 
It should be defined where there is a ref to common.yaml as that is 
where the property is defined.

Rob
