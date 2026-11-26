Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696917;
	b=DzLUgDfjngZyOCEi7MNMX+8SMFwcUJ1j1MD90xXMJUMoEJVvT/x0Hg2RfltU5IueaMDo
	 W+BKw+8SkvTRyaEoKS8aAqeeRTXA8skq0S1Iu66QpWCrN/0Kzg19srNyP9nuSA1iYyKs7
	 ShIBgYYksR0AUOijkGDVB59liw0uqR0f6e4Hj5huefAVR2Lt0ZrqfRowxm+MLSbavKWvC
	 Fp01TtiW3nFOsf30f6u4pTyjK+8JobKcQMPEe8AlM33hh+bg7MSaBj750G5zTa57+xlk6
	 mChsOsEGhoQOb/nEICnXQxh1YE2gtdS9Z1yLdNE8WTeQsOOlXM6dMp1TOruq3YJZQUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696917;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=y4zjyNTjY2qTmxQ5HfZW1+rmv9vECf+ZECWU3/8S8p4=;
	b=ebJzHSskqr5oPFhfEymjlgNrxZNyrolp4mhsXkZqlDWcsPXDwYuhHbpV6PHAdnPmFlk/
	 nnqJ7ypM+a5jXpFLBqdKAfvlS6mIWq65g8548VE85+0y4yr9Xc8DUCEoGVo+cS2XkCaT+
	 EeShN5j+AJ+AWEnQ5v0B4diZYuZWPRNgVCv8IhiFr0+ZtpQS/VGoffM+qu9Rw4+TV1o9w
	 zcaM4ntkmLWMzx218C2PTRMxEsaj1fBqqxPlT2FVNQ0Xz8JsLR+11nMTnzmOh9ubbZjZ7
	 j0EhcpYCajY31WrC9KoYEOsyB/740O936oCqSOhiArC4DrRL5UNwOpfhEP/9uGOjnfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2rnUYif;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1CE606A31C;
	Thu, 26 Nov 2026 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2rnUYif
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7070A1F000D0;
	Thu, 26 Nov 2026 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696916;
	bh=y4zjyNTjY2qTmxQ5HfZW1+rmv9vECf+ZECWU3/8S8p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2rnUYif5/0cFADqIvBr4XJEzEB9DNsd//dPtz7xIn77OWl8ljKgavbAz6DMBmm8S
	 QHsSgCHw1Y5LID9ZUPi9w51oQ0Hu6UQN/6eHqZ7cfJT75VKVCpfiGb5LBCO9iDehVk
	 KMB8IaCSGJSSPeAuzfQWhBUwfE1XurcdYfjCvTQyR7RWL6a6PJsApYQPKP6Q0Sgciw
	 V8X/G1TkAbSwTfk8PAcHOMNrgwKpeS8jB07fR82XnogwwjbasJ7FhOdRs5V5/Aj8Rj
	 aFnJQom/pU8jwMCaOCCx8/EAddfQkOXgNjLBpFQTzFVNtHjtzNgldoKk1gPPy2DBEN
	 7/Xt85GDYAcPQ==
Date: Thu, 26 Nov 2026 12:41:52 +0000
From: Lee Jones <lee@kernel.org>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Pavel Machek <pavel@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: sgm3140: Put the child node reference on success
Message-ID: <179568529013.32537.1835646355373713109@kernel.org>
References: <20261125134013.2692510-1-congnt264@gmail.com>
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
In-Reply-To: <20261125134013.2692510-1-congnt264@gmail.com>
X-AI-Review-Draft: <20261125134013.2692510-1-congnt264@gmail.com>

On Wed, 25 Nov 2026, Cong Nguyen wrote:

> sgm3140_probe() gets the LED child node with device_get_next_child_node(),
> which returns it with its reference count raised. The error path puts the
> reference, but a successful probe returns before reaching that code, so the
> reference is never dropped. The v4l2 flash sub-device takes its own
> reference on the node, and the LED class device only stores the pointer,

As the commit message notes, devm_led_classdev_flash_register_ext()
stores 'init_data->fwnode' in 'led_cdev->dev->fwnode' without taking a
reference on it and led_classdev_unregister() subsequently calls
fwnode_handle_put(led_cdev->dev->fwnode) when the device is removed.

So 'led_cdev->dev->fwnode' takes ownership of the caller's 'child_node'
reference on successful registration.  Dropping 'child_node' here on the
success path causes a reference underflow / use-after-free while the LED
device is registered and a double-put on unbind.

In fact, there is already a bug on the error path if v4l2_flash_init()
fails after devm_led_classdev_flash_register_ext() has succeeded: 'goto
err' drops 'child_node' once, and then devres teardown calls
devm_led_classdev_release() -> led_classdev_unregister() which calls
fwnode_handle_put() a second time!

> so nothing else needs the probe's reference after probe returns.
>
> Put the reference before returning success.
>
> Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> ---
>  drivers/leds/flash/leds-sgm3140.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
> index 107d02c3137f..5bc21b192d74 100644
> --- a/drivers/leds/flash/leds-sgm3140.c
> +++ b/drivers/leds/flash/leds-sgm3140.c
> @@ -273,7 +273,8 @@ static int sgm3140_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>
> -	return ret;
> +	fwnode_handle_put(child_node);
> +	return 0;
>
>  err:
>  	fwnode_handle_put(child_node);
> -- 
> 2.25.1
>
>

-- 
Lee Jones
