Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885423A59BA;
	Thu, 18 Jun 2026 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781824; cv=none; b=H6jN37wGArgNrVMCNAuEqxz9f8G5cZbyxfy6CvNm1BWn8jjubq77WmME6mgZXsSe99U2pQsZ0ntpxllqKGHYy0EUAvNr4/9lno4l838sBS0zWyIlCHaxnq32gVLU2dApgp0N2F1vRab6rkHWKcerEZV5pYX9OB3rw0yllQ3lREY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781824; c=relaxed/simple;
	bh=zNOSefeKgRb/HstojgvgFCWfOMsSEcuVsdYwuzHmfHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY0O3uVqQCZTtQcrPQIRAC17526vDh4mOAZiJnX7NrXBqWEFCzBaOw94dX4Smz4RlyaC62meXu5pPfj1PC1yUBKUmG5WbPZwckG29WeWcGaryASJC2K9aDaohbig0KRg8cwVr+hK7jPdU/ICBbtGwAGMxODsGpc2K4hfR903lEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+KPWYQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+KPWYQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3D01F000E9;
	Thu, 18 Jun 2026 11:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781781823;
	bh=TmxT4Ovrq5S5b7W9Zv77t7dMKEnC1KysSV5nOxhS89M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j+KPWYQ8ep94TNz22JU5qHo2ol44ol6avwnBTDtjmtJqg3kaDguyhtxlyZigUSOqt
	 pMFShgCHTvnyUAxhII+NSfJJtHidJhWxXBaHh4FeHmPMYrQ7m7/bBx+qGMVhR8MFHm
	 FALGSD8Tly2UHSk7BB5TBTQ/o3XbK8Sr9QIklv8fw/YoYJHByDi3X+8Jdmlt6srHx3
	 cyk/ot4fRxtk+Dhi9pImYObMQRFeXP54o5R+MTnglAclNzlAkVx+0Ygy2Jkx5ZuSv8
	 j7PaIwRbLgzWQLOYPhv5c/bJxCVYNusSpZWKbxAQqacfGuaaqg+ZhlcU5Pt0AE4O+L
	 +U3v4yW57Q+7g==
Date: Thu, 18 Jun 2026 12:23:38 +0100
From: Lee Jones <lee@kernel.org>
To: Shardul Deshpande <iamsharduld@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: leds: fix broken reference to the
 multicolor LED ABI
Message-ID: <20260618112338.GF1672911@google.com>
References: <20260612171528.728111-1-iamsharduld@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612171528.728111-1-iamsharduld@gmail.com>

On Fri, 12 Jun 2026, Shardul Deshpande wrote:

> The reference pointed to a non-existent .rst file.  The ABI file is named
> sysfs-class-led-multicolor (without extension), so fix the reference to
> match the actual file and resolve the warning from
> tools/docs/documentation-file-ref-check.
> 
> Signed-off-by: Shardul Deshpande <iamsharduld@gmail.com>
> ---
>  Documentation/leds/leds-lp5812.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
> index c2a6368d5..12e757d45 100644
> --- a/Documentation/leds/leds-lp5812.rst
> +++ b/Documentation/leds/leds-lp5812.rst
> @@ -20,7 +20,7 @@ Sysfs Interface
>  ===============
>  
>  This driver uses the standard multicolor LED class interfaces defined
> -in Documentation/ABI/testing/sysfs-class-led-multicolor.rst.
> +in Documentation/ABI/testing/sysfs-class-led-multicolor.
>  
>  Each LP5812 LED output appears under ``/sys/class/leds/`` with its
>  assigned label (for example ``LED_A``).

Sorry, Xinhong Hu beat you to it.

-- 
Lee Jones
