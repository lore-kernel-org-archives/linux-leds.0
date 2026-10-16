Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D264E0204;
	Fri, 16 Oct 2026 15:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164637; cv=none; b=liCoDMDi9d+cWE5doAnLMdU0UAJLsuTiDp2leb3MBiqSWOVCJ7Qk0OYCUVzhQmz5XTT/W9IJeG3l1Zwjf38m63QjES5vO852a/1ZOh4WoEGXNJr6uYO8aH7ge957Xzz3qbZiZ+ZJghE2cTjI++aw4CGfyB+LBLtHBXJno7rJlvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164637; c=relaxed/simple;
	bh=FzI8vJ5grhl7Rllz+2JzPBQSiceg+hyrHQbOw1fIsZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdUh33CLuOV/2dWKS8pr82ulIrV7/77I4NsCAYJwnfN3gmdyllsCA4L9bffrkt/ZVYytsdgvxnjncr5fYUmN36BoLUx4aC7ynLPee2ZM3EhnFPPJI/bi3ctau6EkRbxfYHq5Gl69PDXRHdcQzjDVTeYm5Yv2g0aJf/SYpjH9+wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcLRy/Rm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcLRy/Rm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EC91F000C4;
	Fri, 16 Oct 2026 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164635;
	bh=JFnTmB5sqjLGfShmwLVzlOKzOTcZuvQ7gf3RXCL4J3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JcLRy/Rm/2DMz4qjjhdXHf9s68mYAtR2uy2vuhfNFlhyEJtkbPTtDU0mdeevOYRJD
	 bza2+kjMy4GlPfOq+qBbl0feC0zqQ30CwfyNKQETV017PKAugC/Pl4cptp8MzwrdVM
	 7O/27HbwPuBx26OiVdonFrBY03Ex4V9q6hwoQAA+qjUeTtH5c48YrcrUrcyGMWnAz3
	 LJWBomm7Sj5TVX1ASkwSl9V1ZhScjO/bo4jvueMYLk5NlrO0BP6bIhqJvUocX0+h7B
	 zvcdMeJ0FD6PCKuaMrtgxXl95U5Y12dulFXutJaHErk7X3OV6hMtPbpyGPVlduZqLI
	 vdjbFyxvk7S/w==
Date: Fri, 16 Oct 2026 16:30:29 +0100
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
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max
 current
Message-ID: <atJDFRXmgZ37GrCE@aspen.lan>
References: <20261013180933.487013-1-clamor95@gmail.com>
 <20261013180933.487013-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013180933.487013-3-clamor95@gmail.com>

On Tue, Oct 13, 2026 at 09:09:31PM +0300, Svyatoslav Ryhel wrote:
> @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backlight_device *bd)
>  	dev_dbg(&bd->dev, "brightness=%d, power=%d, state=%d\n",
>  		 bd->props.brightness, bd->props.power, bd->props.state);
>
> -	ret = aat2870->write(aat2870, AAT2870_BLM,
> -			     (u8)aat2870_brightness(aat2870_bl, brightness));
> -	if (ret < 0)
> -		return ret;
> +	if (brightness) {
> +		ret = aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
> +		if (ret < 0)
> +			return ret;
> +	}
>
>  	if (brightness == 0) {

I think this could be spelled "else" ;-)

However, other than this this looks good. With that change applied:
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel
