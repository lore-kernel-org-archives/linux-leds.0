Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922992BE056;
	Thu,  9 Apr 2026 15:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749956; cv=none; b=FFUzXvVY88IYPntNjRQGiWlx/BCstfJw6iC5pUj7BKZbqy39MtRspkGvYQKLSIqTLh3cEbTp64/31bi5ix9MOYKiPQDfjjQ9UMM8ACji1QjHKRacU9nFw678qIH8AunlaMa65LLkR2gjnSTZS3JPfgWc1XfHMPyY5KPZYEBmPfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749956; c=relaxed/simple;
	bh=wGT1HI733jY6F+RDw1kQe88NKg+6uso7DNz09334DHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjHClKcHP5e7UV6NN4bJIR2WFbnEvVeQzxcFseQ/efNO+FIp5SBRvDeqR6Ivw8XFbqDuZ/vYlgMlYELKLUvYVObuRYxJavuxlMBO8VznbB97ZJfDJA05tS26IZp3cXlwVtm+iHdZyj/fJqXOzzFvIXLIfiKQ4wmoX3J14Qa17nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pf3f19Yn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pf3f19Yn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581A5C4CEF7;
	Thu,  9 Apr 2026 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775749956;
	bh=wGT1HI733jY6F+RDw1kQe88NKg+6uso7DNz09334DHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pf3f19YnjtVVPKKJajbQzc17/cJVHJ9y49Q2YDth3KQULUtkvefStbkcKhxgQokhB
	 0ywXx6jp1nETs3vWNAxVLTqELKFCTXRiFLubl7wQCBpNkDGPvCumU/eX86SOGwDfof
	 rN3adwOs/Zo2OJM3LeAMHC03T6ZdMERewcw2k6l3kKSj9kWp9xw7+zcNj6/w8XBcY+
	 6VhvdDbDpiyYkKdllhLfobNS36GGXiL5+g9iyQJSkQ3RHTa+6ZWsMrKhmzL1INHvUx
	 4H12mEd9xgl7FFy44kCdA7FjhfS6gjkZK7hSqIxeSJsBW7oWTV/wlK1zcfHCtVyXtL
	 KpsfG6YxYKXeA==
Date: Thu, 9 Apr 2026 16:52:32 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>
Subject: Re: [PATCH v2 2/2] leds: class: Reinitialise list after dropping
 from lookup table
Message-ID: <20260409155232.GA3439476@google.com>
References: <20260331183055.1209526-1-andriy.shevchenko@linux.intel.com>
 <20260331183055.1209526-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331183055.1209526-3-andriy.shevchenko@linux.intel.com>

On Tue, 31 Mar 2026, Andy Shevchenko wrote:

> Currently the lookup table just removes the list entry and leaves
> the stale pointers in it. If the lookup is embedded in some data
> structure, the pointer to the lookup entry can't be NULL (always
> valid), but calling led_remove_lookup() on it twice will lead to
> the wrong behaviour. To avoid that the user has to track the state
> itself. With this change in place, the user may drop that approach
> and use something like
> 
>   probe:
> 	INIT_LIST_HEAD(&lookup.list);
> 	if (LED lookup is required)
> 		led_add_lookup(&lookup);
> 
>   remove:
> 	led_remove_lookup(&lookup);

How do we feel about a devm_led_add_lookup()?

> without any additional tracking kept over the device lifetime.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/led-class.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index b53ebe3a0faa..424c07e0ecce 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -425,7 +425,7 @@ void led_remove_lookup(struct led_lookup_data *led_lookup)
>  		return;
>  
>  	mutex_lock(&leds_lookup_lock);
> -	list_del(&led_lookup->list);
> +	list_del_init(&led_lookup->list);
>  	mutex_unlock(&leds_lookup_lock);
>  }
>  EXPORT_SYMBOL_GPL(led_remove_lookup);
> -- 
> 2.50.1
> 

-- 
Lee Jones [李琼斯]
