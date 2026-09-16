Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61D7377EC3
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570882; cv=none; b=SRUHrXRe2RTw0sOtughcbx3imiQ7H1idAbCTrG3qclASeqF6RyMYA9qkSSOs0vNwijELnnvKf+TCy8xZ/e93RB9D3DB+7ncjpqrmwNNvLY50mgNMVKI86SHi6BFv/QeNhc4uZ3GaUEzRFFiCtcqXyam4FiejykpjX0gBWorhrI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570882; c=relaxed/simple;
	bh=OkB26v5MFFbbv1UHW//IEW2llz/TnRf+dZkbfsE8mRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkWN6RgHDbJaLwSd6MmJXImpmpnPuu78j7ZmIxVP8BIa/BOwguxsnNFMRmwzSdeyPaSaHNU7q8WjCHQMThFRwi32+0zOE6iSUTucyOQv9G8vRE3NeP2675Ny56/cBO+z/lDJbW+Al3teUZBTpJEHiuVieocVEm5Q9MBYdfKGUWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PRIuFRzW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PRIuFRzW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182CD1F000FF;
	Wed, 16 Sep 2026 15:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789570878;
	bh=BLQSPeNe5XXlvkf9wDBNhcXYFqUa4Hr+xwylBEOg8Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PRIuFRzWm08SohqyMWQvIPt2rjxK1bPGyLO1ELi5fGnNdeJ3q+fzXzdJXwPX6KEdY
	 WuLYHf5SyGAQnlZd9SIThOxT+/mtg6KU03K9IO1XCToYp5M8uH9160bHIaTZQ6Chnr
	 yFRdZrF2WYQQ2cT33VjG+HBURJ+xXTLSvC+9za/7WTE9Hu017mH4//HLgAUSzcfggG
	 f26ExumigNrSuXT7wTs1IZjrDRMgL0+OgBkjWNypx1qMGX5GyuxmZJ6BC5hPPUO4DG
	 23RmAEqPGsO1sYYmshgvN5YLK1qUr9sMYemjKIqDtFvKQYdQqwyj77cc7cpqmykdZw
	 Kiv4RgECx293w==
Date: Wed, 16 Sep 2026 16:01:15 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: flash: Simplify flash_fault_show()
Message-ID: <20260916150115.GE1605367@google.com>
References: <20260904070806.19125-1-dmantipov@yandex.ru>
 <20260904070806.19125-2-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904070806.19125-2-dmantipov@yandex.ru>

On Fri, 04 Sep 2026, Dmitry Antipov wrote:

> Do not emit extra trailing space and prefer direct pointer
> ops over strcat() and strlen() calls in flash_fault_show().
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: capitalize commit title
> ---
>  drivers/leds/led-class-flash.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 3bb90823de1a..d09c71fcd2b3 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -189,24 +189,22 @@ static ssize_t flash_fault_show(struct device *dev,
>  	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
>  	u32 fault = 0, mask = 0x1;
>  	char *pbuf = buf;
> -	int i, ret, buf_len;
> +	int i, ret;
>  
>  	ret = led_get_flash_fault(fled_cdev, &fault);
>  	if (ret < 0)
>  		return -EINVAL;
>  
> -	*buf = '\0';
> -
>  	for (i = 0; i < LED_NUM_FLASH_FAULTS; ++i) {
> -		if (fault & mask) {
> -			buf_len = sprintf(pbuf, "%s ",
> -					  led_flash_fault_names[i]);
> -			pbuf += buf_len;
> -		}
> +		if (fault & mask)
> +			pbuf += sprintf(pbuf, "%s%s",
> +					(pbuf == buf ? "" : " "),
> +					led_flash_fault_names[i]);

Shouldn't this be sysfs_emit_at() now?

>  		mask <<= 1;
>  	}
> -
> -	return strlen(strcat(buf, "\n"));
> +	*pbuf++ = '\n';
> +	*pbuf = '\0';
> +	return pbuf - buf;
>  }

sysfs_emit_at() would also avoid some of this dancing around, I think.

>  static DEVICE_ATTR_RO(flash_fault);
>  
> -- 
> 2.55.0
> 
> 

-- 
Lee Jones
