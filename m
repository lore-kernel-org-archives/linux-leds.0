Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031632;
	b=A7svBr63bDcDw9OY9KTjl0V30i+zZsQwwEmPpNXYVuVLgykbLYRbW/G3G71koWQ7YeFY
	 sxqiOaTdTatyLSY5mVxaZBqIawxysI2JHX1nqjOUayzcJVDYK02gqspxL5x26s5pVBQ77
	 mN4ALXiyQWgChOFam/hJ5Luk6OoHzp5q1yK1imlJ0WkkQmLpN3iDxJYjw30qVWWVgI1sO
	 Hh9JR6s9u8ezyEPRHwZXImbVjV0w55jn/sJ/H5GETeNI+X8IYUdDB+WOua8RYgthTdr0S
	 HlFZaZ3IvurkPRDFJGqC1jSymDPRgKFDt056yZeOZGPdWVs9/jsKF6clQf6Gvj2GXdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031632;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=L8aeIn77kmUyIOS+jkSoBrVDylUSGYP6BjjCfuAAKC4=;
	b=lQ9ySPGbYPAH0szEmemXVLNcWI8P5bv9h5h9itoyVNIqi29FWUKwqwNLmNkauWBLytXf
	 e6FF0Ta/38jdUYJefuKyqqQnaT5r9tkoj7p5hzoBqjEcjoWhzBN/1mjKhPgDpyW4m+Bqe
	 jQ782dJsQniqmzOnEg4s4Sjo7VAbvBwfqyOFxaSTmh20Z9mgkXGi9GGrTuVwwalg53WPz
	 iRdYKO/fnuWMkzV//yJuMLp9eVR+CHqwQQaypB0AAfcm+Xz9JEYb2p9dWIxI7OMOVD+kU
	 PokXNeBAyag7T4YTDXePzNIw4Eg8mjZysuT13sq4g2FHifEJmgQaDxGYcuBGIvu1VSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kd3l8iBn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81860606A31C;
	Wed, 18 Nov 2026 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kd3l8iBn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239C41F000C4;
	Wed, 18 Nov 2026 19:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795031632;
	bh=L8aeIn77kmUyIOS+jkSoBrVDylUSGYP6BjjCfuAAKC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kd3l8iBn5/QQQ6cLIUXbD9bvNgKiNtFRh8v9/5QKf3WnOyLfMAb/FKQoZPTY3THUd
	 yUAWA0Y+5nR/Cbah2LbGiKNv55Cj6/jghtCCU3P8QdTEcFJCYExvKxNqAV1SSVHoGI
	 q3nN3OhHSm9J2FEZaUbxJYFV/UOAgM6zx6FUC2UY1Z6EHEsgrnE+Op9uQKbRwjock2
	 gzNIu8rex+RYvt3z6HcOLkC+d3bQYhYoZoVQxUKe1VQ7Ags7Yndzg/3JD4W7baW/yo
	 kEUSaR6ayCiWD55yaB+LyHDdhqbUoEEy0iwBzgu/O3/vzgb/aqKQOiDEEJwKt3Cd/x
	 sY5lfMr83Sv3w==
Date: Wed, 18 Nov 2026 19:53:48 +0000
From: Lee Jones <lee@kernel.org>
To: Gu Bin <gubin@cmss.chinamobile.com>
Cc: pavel@kernel.org, david@lechnology.com, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/leds/uledmon: reject device names that are too
 long
Message-ID: <179442104215.44545.2144163087581820120@kernel.org>
References: <20261106100614.2312-1-gubin@cmss.chinamobile.com>
 <20261109070539.1922-1-gubin@cmss.chinamobile.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109070539.1922-1-gubin@cmss.chinamobile.com>
X-AI-Review-Draft: <20261109070539.1922-1-gubin@cmss.chinamobile.com>

On Mon, 09 Nov 2026, Gu Bin wrote:

> strncpy() does not NUL-terminate when the source is at least as long
> as the bound. uleds_dev.name is passed to the kernel with
> write(fd, &uleds_dev, sizeof(uleds_dev)), so a >= LED_MAX_NAME_SIZE
> byte argv[1] leaves name without a terminator and the write sends
> trailing bytes that are not part of a valid device name.
>
> Silently truncating such a name would create a device the user did
> not ask for, so error out instead, like the other argument checks
> already do.
>
> Fixes: fa7f32422ea1 ("tools/leds: Add uledmon program for monitoring userspace LEDs")
> Suggested-by: David Lechner <david@lechnology.com>
> Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
> ---
>
> Changes in v2: reject over-long names with an error instead of
> silently truncating them, as suggested by David Lechner.
>
>  tools/leds/uledmon.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tools/leds/uledmon.c b/tools/leds/uledmon.c
> index c15a39c1f271..d38f5716c7f7 100644
> --- a/tools/leds/uledmon.c
> +++ b/tools/leds/uledmon.c
> @@ -31,7 +31,13 @@ int main(int argc, char const *argv[])
>  		return 1;
>  	}
>
> -	strncpy(uleds_dev.name, argv[1], LED_MAX_NAME_SIZE);
> +	if (strlen(argv[1]) >= LED_MAX_NAME_SIZE) {
> +		fprintf(stderr, "Device name too long (max %d bytes)\n",
> +			LED_MAX_NAME_SIZE - 1);
> +		return 1;
> +	}
> +
> +	strcpy(uleds_dev.name, argv[1]);

Doesn't replacing strcpy() leave the remaining bytes of 'uleds_dev.name'
uninitialised on the stack?

Since 'uleds_dev' is passed to:

  write(fd, &uleds_dev, sizeof(uleds_dev))'

... why doesn't this leak uninitialised stack memory to the kernel?

Either zero-initialise 'uleds_dev' or keep strncpy() as it is.

>  	uleds_dev.max_brightness = 100;
>
>  	fd = open("/dev/uleds", O_RDWR);
> -- 
> 2.55.0.windows.3
>
>
>

-- 
Lee Jones
