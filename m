Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ABE2D23A6;
	Thu, 23 Jul 2026 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822379; cv=none; b=GEKp3P4Q/lAm8RFEt3qtslP4cW6MDOqry2zEIl/X7DVXFmwTTk+SDStYhjLwZ4swcDoYQbW5P3zgU/MDXzg1tbyVWPAkSqjkuTJkMMuD76f7crBvghRfVpW1u3ETxvDJqjyKSqARqn0y2Uuz753Eq/oLIE+BhrgbjuV6eVkSQWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822379; c=relaxed/simple;
	bh=DVkSF2Va+ukhFJBE9eiE9CpP5ma8lbYozXumo5BXNvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+TtYsHtaTKYMxML9gLHWPqfuocWKjWuA+UTghbLfZUKftbU/8HyHIt9V86I8BInev5bG2XbwnHOl6MYlhzPwX88U/kZXXXIcUnEMaqEpWGyEwoVKJuO+jJPxWeGgXFxQ2hz/dz1x6MtfnAcUuDxeI/oQFpvcGp824iOSTPHHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKlb1pTv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKlb1pTv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EB71F000E9;
	Thu, 23 Jul 2026 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822378;
	bh=++2aFYP4r0J7XODbY7UiD9jjGBDnXuiYCSosLglhpNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eKlb1pTv+VMRvr3PlI/6NGwb7I9UkdYKqn6byAgQXvK/ZtnBC+mqqyT2HPQizNmZx
	 W5/WdOuG2noKKgwj56w+/aAP+ISKnLKd0DfrK9jJQfFVdALDIWt9ojnbB/CtqlQRn9
	 MjH48ebG0LYtIFwWZSTz2JWz7W7H5PTa+dS2ZGOhwxo3+2zymuT1iJat7NYgNSJAf2
	 8Jl9q2M8TVjl1Zci7g1jC79JVnw/VARDKQlXbjhOCfBCPNHhRZ/lFtYuW8PHRIKzWr
	 DWyzJUWgLSkVmjHtYCRecYACYrqQud6dFkQly+v0P1chcSmjDjk3/xFUFkL2z8aEhr
	 ULm1Ghx3/NCuQ==
Date: Thu, 23 Jul 2026 16:59:32 +0100
From: Lee Jones <lee@kernel.org>
To: Arunachalam <arun07172003@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] leds: cobalt-raq: add missing MODULE_DESCRIPTION
Message-ID: <20260723155932.GA3526803@google.com>
References: <20260716182100.9335-1-arun07172003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716182100.9335-1-arun07172003@gmail.com>

Unfortunately, you've submitted this set un-threaded, so I cannot apply
it as a set.  Please resubmit ensuring that you send them as threaded
next time.

On Thu, 16 Jul 2026, Arunachalam wrote:

> Add the missing MODULE_DESCRIPTION() macro, which is required by
> modpost and was missing from this driver.
> 
> Signed-off-by: Arunachalam <arun07172003@gmail.com>
> ---
>  drivers/leds/leds-cobalt-raq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-cobalt-raq.c b/drivers/leds/leds-cobalt-raq.c
> index 045c239c7..5b5acaa8c 100644
> --- a/drivers/leds/leds-cobalt-raq.c
> +++ b/drivers/leds/leds-cobalt-raq.c
> @@ -101,5 +101,5 @@ static struct platform_driver cobalt_raq_led_driver = {
>  		.name	= "cobalt-raq-leds",
>  	},
>  };
> -
> +MODULE_DESCRIPTION("LEDs driver for the Cobalt Raq series");
>  builtin_platform_driver(cobalt_raq_led_driver);
> -- 
> 2.39.5
> 

-- 
Lee Jones
